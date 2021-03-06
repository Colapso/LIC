----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:48:22 03/26/2017 
-- Design Name: 
-- Module Name:    Contador4bit - Structural 
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

entity ShiftRegisterSound is
   Port ( SCLK        : in  STD_LOGIC;
	       enableShift : in  STD_LOGIC;
	       Data 		 : in  STD_LOGIC;
			 D           : out STD_LOGIC_VECTOR (3 downto 0)
		  );
end ShiftRegisterSound;

architecture Structural of ShiftRegisterSound is

component register_D_E is
	generic (WIDTH : POSITIVE :=1);
   port ( CLK : in  STD_LOGIC;
          EN  : in  STD_LOGIC;
			 D   : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
          Q   : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
		  );
end component;

	signal register_value :	STD_LOGIC_VECTOR (3 downto 0);

begin

	R0: Register_D_E
			generic map (WIDTH => 1)
			Port map ( CLK	 => SCLK,
						  EN 	 => enableShift,
						  D(0) => Data,
						  Q(0) => Register_value(0)
						);
	
	R1: Register_D_E
			generic map (WIDTH => 1)
			Port map ( CLK	 => SCLK,
						  EN 	 => enableShift,
                    D(0) => Register_value(0),
						  Q(0) => Register_value(1)
						);						
	
	R2: Register_D_E
			generic map (WIDTH => 1)
			Port map ( CLK	 => SCLK,
						  EN 	 => enableShift,
                    D(0) => Register_value(1),
						  Q(0) => Register_value(2)
						);						
	
	R3: Register_D_E
			generic map (WIDTH => 1)
			Port map ( CLK	 => SCLK,
						  EN 	 => enableShift,
						  D(0) => Register_value(2),
						  Q(0) => Register_value(3)
						);						

	D <= register_value;

end Structural;