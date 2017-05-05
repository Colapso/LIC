----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:21:20 04/27/2017 
-- Design Name: 
-- Module Name:    ShieftRegister_Wraper - Behavioral 
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

entity ShiftRegister_Wraper is
    Port ( J4_1	: in STD_LOGIC;
	 		  J1_5   : in STD_LOGIC;
			  J1_7   : in STD_LOGIC;
			  J1_9   : out STD_LOGIC;

			  LED_D1 : out STD_LOGIC;
			  LED_D2 : out STD_LOGIC;
			  LED_D3 : out STD_LOGIC;
	        LED_D4 : out STD_LOGIC;
	        LED_D5 : out STD_LOGIC;
	        LED_D6 : out STD_LOGIC;
	        LED_D7 : out STD_LOGIC;
	        LED_D8 : out STD_LOGIC
			);
end ShiftRegister_Wraper;

architecture Structural  of ShiftRegister_Wraper is
component ShiftRegister is
    Port ( Data 			: in  STD_LOGIC;
			  SCLK         : in  STD_LOGIC;
			  enableShift	: in  STD_LOGIC;
			  D            : out STD_LOGIC_VECTOR (8 downto 0)
			);
end component;

begin

		SR1 : ShiftRegister
			Port map(SCLK 		=> J4_1,
						Data		=> J1_5,
						enableShift => J1_7,
						D(0) 		=> LED_D1,
						D(1) 		=> LED_D2,
						D(2) 		=> LED_D3,
						D(3) 		=> LED_D4,
						D(4) 		=> LED_D5,
						D(5) 		=> LED_D6,
						D(6) 		=> LED_D7,
						D(7) 		=> LED_D8,
						D(8)		=> J1_9
);

end Structural ;