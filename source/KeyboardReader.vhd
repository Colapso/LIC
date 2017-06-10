----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:21 05/25/2017 
-- Design Name: 
-- Module Name:    KeyboardReader - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity KeyboardReader is
    Port ( CLK : in STD_LOGIC;
			  Kline : in  STD_LOGIC_VECTOR (3 downto 0);
			  ACK : in  STD_LOGIC;
			  Kcol : out STD_LOGIC_VECTOR(2 downto 0);
           D : out  STD_LOGIC_VECTOR (3 downto 0);
           Dval : out  STD_LOGIC;
			  STATE: out STD_LOGIC_VECTOR(2 downto 0)
           );
end KeyboardReader;

architecture Structural of KeyboardReader is

signal skval : STD_LOGIC;
signal sdac : STD_LOGIC;
signal sack : STD_LOGIC;
signal sk	: STD_LOGIC_VECTOR(3 downto 0);
signal sout : STD_LOGIC_VECTOR(3 downto 0);

component KeyBuffer is
		Port(CLK : in STD_LOGIC;
			  DAV : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           ACK : in  STD_LOGIC;
           Dval : out  STD_LOGIC;
           DAC : out  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component KeyDecode is
		Port( CLK 	 : in	 STD_LOGIC;
				Kack  : in  STD_LOGIC;
				Kline : in  STD_LOGIC_VECTOR (3 downto 0);
				Kval  : out STD_LOGIC;
				Kcol	 : out STD_LOGIC_VECTOR (2 downto 0);
				K 	 : out STD_LOGIC_VECTOR (3 downto 0);
				STATE : out STD_LOGIC_VECTOR (2 downto 0)
			 );
end component;

begin

	kbuffer: KeyBuffer
		Port map(CLK	=> not CLK,
					DAV	=> skval,
					D 		=> sk,
					ACK 	=> sack,
					Dval	=>Dval,
					DAC 	=> sdac,
					Q => sout
		);
	kdecode: KeyDecode
		Port map(CLK	=> CLK,
					Kack 	=> sdac,
					Kline => Kline,
					Kval	=> skval	,
					Kcol	=> Kcol,
					K 		=> sk,
					STATE	=> STATE
		);
	sack <=	ACK;
	D <= sout;
end Structural;

