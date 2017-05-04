----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:51:23 03/26/2017 
-- Design Name: 
-- Module Name:    FA - Structural 
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

entity FA is
    Port ( A    : in  STD_LOGIC;
           B    : in  STD_LOGIC;
           Cin  : in  STD_LOGIC;
           S    : out STD_LOGIC;
           Cout : out STD_LOGIC
			 );
end FA;

architecture Structural of FA is

	signal xor_ab :std_logic;
	signal and_ab : std_logic;

begin
	xor_ab		 <= A xor B;
	and_ab		 <= A and B;
	
	S 				 <= xor_ab xor Cin;
	Cout			 <=  and_ab  or (Cin and xor_ab );

end Structural;