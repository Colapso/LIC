----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:46:35 03/26/2017 
-- Design Name: 
-- Module Name:    register_D_E - Behavioral 
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

entity register_D_E is
	generic ( WIDTH : POSITIVE :=1);
   port ( CLK : in  STD_LOGIC;
          EN  : in  STD_LOGIC;
			 D   : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
          Q   : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
		  );
end register_D_E;

architecture Behavioral of register_D_E is

begin
		process (CLK, EN)
		begin
			if (rising_edge (CLK) and EN = '1') then
				Q <=D;
			end if;
		end process;

end Behavioral;