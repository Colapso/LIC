----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:46:52 04/06/2017 
-- Design Name: 
-- Module Name:    KeyDecode_Wrapper - Behavioral 
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

entity KeyDecode_Wrapper is
    Port ( LED_D1 : out STD_LOGIC;
			  LED_D2 : out STD_LOGIC;
			  LED_D3 : out STD_LOGIC;
	        LED_D4 : out STD_LOGIC;
	        LED_D5 : out STD_LOGIC;
	        LED_D6 : out STD_LOGIC;
	        LED_D7 : out STD_LOGIC;
	        LED_D8 : out STD_LOGIC;
			  
			  J4_1 : in STD_LOGIC;
			  INPORT_7 : in STD_LOGIC;
			  
			  J2_9 : out STD_LOGIC;
			  J2_10: out STD_LOGIC;
			  J2_11: out STD_LOGIC;
			  J2_15: in STD_LOGIC;
			  J2_14: in STD_LOGIC;
			  J2_13: in STD_LOGIC;
			  J2_12: in STD_LOGIC
			);
end KeyDecode_Wrapper;

architecture Structural  of KeyDecode_Wrapper is
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

	KD1 : KeyDecode
			Port map(CLK 		=> J4_1,
						Kack		=>	INPORT_7,
						Kval		=>	LED_D5,
						Kline(0) => J2_15, 
						Kline(1) => J2_14 ,
						Kline(2) => J2_13,
						Kline(3) => J2_12,
			         Kcol(0) 	=> J2_11,
						Kcol(1) 	=> J2_10,
						Kcol(2) 	=> J2_9,
						K(3) 		=> LED_D4,
						K(2) 		=> LED_D3,
						K(1) 		=> LED_D2,
						K(0) 		=> LED_D1,
						STATE(0)	=> LED_D6,
						STATE(1)	=> LED_D7,
						STATE(2)	=> LED_D8
                );

end Structural ;

