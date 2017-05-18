----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:19 05/18/2017 
-- Design Name: 
-- Module Name:    SpaceInvaders - Behavioral 
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

entity SpaceInvaders is
    Port ( D : in  STD_LOGIC;
           Q : in  STD_LOGIC;
           S : in  STD_LOGIC;
           T : in  STD_LOGIC;
           V : out  STD_LOGIC);
end SpaceInvaders;

architecture Structural of SpaceInvaders is
component SerialLCDController is
	Port ( CLK    : in  STD_LOGIC;
			 LCDsel : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
			 E      : out STD_LOGIC;
			 RS     : out STD_LOGIC;
          D      : out STD_LOGIC_VECTOR (7 downto 0)
		  );
end component;
component SerialSoundController is
	Port ( CLK    : in  STD_LOGIC;
			 Ssel   : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
          
			 Play   : out STD_LOGIC;
          sid    : out STD_LOGIC_VECTOR (1 downto 0);
			 vol    : out STD_LOGIC_VECTOR (1 downto 0)
		  );
end component;
component KeyDecode is
Port ( CLK 	 : in	 STD_LOGIC;
	       Kack  : in  STD_LOGIC;
			 Kline : in  STD_LOGIC_VECTOR (3 downto 0);
			 Kval  : out STD_LOGIC;
			 Kcol	 : out STD_LOGIC_VECTOR (2 downto 0);
			 K 	 : out STD_LOGIC_VECTOR (3 downto 0);
          STATE : out STD_LOGIC_VECTOR (2 downto 0)
		  );
end component;
begin


end Structural;

