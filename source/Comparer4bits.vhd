----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:05:23 04/27/2017 
-- Design Name: 
-- Module Name:    Comparer4bits - Behavioral 
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

entity Comparer4bits is
   Port ( Ref    : in  STD_LOGIC_VECTOR (3 downto 0);
	       Comp   : in  STD_LOGIC_VECTOR (3 downto 0);
		    Equals : out STD_LOGIC
	     );
end Comparer4bits;

architecture Behavioral of Comparer4bits is

begin
	Equals <=       not(Ref(0) xor Comp(0))
					and not(Ref(1) xor Comp(1))
					and not(Ref(2) xor Comp(2))
					and not(Ref(3) xor Comp(3));

end Behavioral;

