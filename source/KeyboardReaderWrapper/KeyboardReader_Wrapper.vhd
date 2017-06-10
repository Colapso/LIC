----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:23:47 05/25/2017 
-- Design Name: 
-- Module Name:    KeyboardReader_Wrapper - Structural 
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

entity KeyboardReader_Wrapper is
    Port (  CLK : in STD_LOGIC;
			   OUTPORT_7: in STD_LOGIC;
				J2_15 : in STD_LOGIC; 
				J2_14 : in STD_LOGIC;
				J2_13 : in STD_LOGIC;
				J2_12 : in STD_LOGIC;
			   J2_11 : out STD_LOGIC;
				J2_10 : out STD_LOGIC;
				J2_9  : out STD_LOGIC;
						
				LED_D5 : out STD_LOGIC;
    			LED_D4 : out STD_LOGIC;
				LED_D3 : out STD_LOGIC;
				LED_D2 : out STD_LOGIC;
				LED_D1 : out STD_LOGIC;
				
				LED_D6 : out STD_LOGIC;
				LED_D7 : out STD_LOGIC;
				LED_D8 : out STD_LOGIC
			  );
end KeyboardReader_Wrapper;

architecture Structural of KeyboardReader_Wrapper is
component KeyboardReader is
    Port ( CLK : in STD_LOGIC;
			  Kline : in  STD_LOGIC_VECTOR (3 downto 0);
			  ACK : in  STD_LOGIC;
			  Kcol : out STD_LOGIC_VECTOR(2 downto 0);
           D : out  STD_LOGIC_VECTOR (3 downto 0);
           Dval : out  STD_LOGIC;
			  STATE: out STD_LOGIC_VECTOR(2 downto 0)
           );
end component;

begin
		KR: KeyboardReader
			Port map(CLK 		=> CLK,
						ACK		=>	OUTPORT_7,
						
						Kline(0) => J2_15, 
						Kline(1) => J2_14 ,
						Kline(2) => J2_13,
						Kline(3) => J2_12,
			         Kcol(0) 	=> J2_11,
						Kcol(1) 	=> J2_10,
						Kcol(2) 	=> J2_9,
						
						Dval		=>	LED_D5,
					
    					D(3) 		=> LED_D4,
						D(2) 		=> LED_D3,
						D(1) 		=> LED_D2,
						D(0) 		=> LED_D1,
						STATE(0)	=> LED_D6,
						STATE(1)	=> LED_D7,
						STATE(2)	=> LED_D8
			);

end Structural;

