----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:12:44 04/27/2017 
-- Design Name: 
-- Module Name:    Comparer4bits_wrapper - Behavioral 
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

entity Comparer4bits_wrapper is
    Port ( LED_D1 : out STD_LOGIC;
			  J1_5 : in STD_LOGIC;
			  J1_7 : in STD_LOGIC;
			  J1_9 : in STD_LOGIC;
			  J1_11 : in STD_LOGIC;
			  J1_6 : in STD_LOGIC;
			  J1_8 : in STD_LOGIC;
			  J1_10 : in STD_LOGIC;
			  J1_12 : in STD_LOGIC
			);
end Comparer4bits_wrapper;

architecture Behavioral of Comparer4bits_wrapper is
component Comparer4bits is
    Port ( Ref    : in  STD_LOGIC_VECTOR (3 downto 0);
			  Comp   : in  STD_LOGIC_VECTOR (3 downto 0);
			  Equals : out STD_LOGIC
			);
end component;

begin
		C1 : Comparer4bits
			Port map(Equals 	=> LED_D1,
						Comp(0)	=>	J1_6,
						Comp(1)	=>	J1_8,
						Comp(2)	=>	J1_10,
						Comp(3)	=>	J1_12,
						Ref(0)	=>	J1_5,
						Ref(1)	=>	J1_7,
						Ref(2)	=>	J1_9,
						Ref(3)	=>	J1_11
);


end Behavioral;

