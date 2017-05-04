----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:45 04/06/2017 
-- Design Name: 
-- Module Name:    KeyDecode - Behavioral 
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

entity KeyDecode is
   Port ( CLK 	 : in	 STD_LOGIC;
	       Kack  : in  STD_LOGIC;
			 Kline : in  STD_LOGIC_VECTOR (3 downto 0);
			 Kval  : out STD_LOGIC;
			 Kcol	 : out STD_LOGIC_VECTOR (2 downto 0);
			 K 	 : out STD_LOGIC_VECTOR (3 downto 0);
          STATE : out STD_LOGIC_VECTOR (2 downto 0)
		  );
end KeyDecode;

architecture Structural of KeyDecode is
component KeyScan is
   Port ( CLK	  : in  STD_LOGIC;
	       Kline  : in  STD_LOGIC_VECTOR (3 downto 0);
          Kscan  : in  STD_LOGIC_VECTOR (1 downto 0);
		    Kcol   : out STD_LOGIC_VECTOR (2 downto 0);
          K 	  : out STD_LOGIC_VECTOR (3 downto 0);
          Kpress : out STD_LOGIC_VECTOR (1 downto 0)
		  );
end component;

component KeyControl is
   Port ( CLK 	  : in  STD_LOGIC;
	       Kack   : in  STD_LOGIC;
          Kpress : in  STD_LOGIC_VECTOR (1 downto 0);
          KScan  : out STD_LOGIC_VECTOR (1 downto 0);
          Kval   : out STD_LOGIC;
		    STATE  : out STD_LOGIC_VECTOR (2 downto 0)
		  );
end component;

	signal KP : STD_LOGIC_VECTOR (1 downto 0);
	signal KS : STD_LOGIC_VECTOR (1 downto 0);

begin
	KD0: KeyControl
		Port map ( CLK	   =>	CLK,
		           Kack 	=> Kack,
					  Kpress => KP,
					  KScan  => KS,
					  Kval	=> Kval,
                 STATE	=>	STATE
		         );

	KD1: KeyScan
		Port map ( CLK	   =>	CLK,
		           Kline	=> Kline,
					  Kscan	=> KS,
					  Kcol 	=> Kcol,
					  K		=> K,
					  Kpress => KP
					);

end Structural;

