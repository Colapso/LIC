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

entity register_D_E_R is
	generic ( WIDTH : POSITIVE :=1);
   port ( CLK : in  STD_LOGIC;
			 RST : in  STD_LOGIC;
          EN  : in  STD_LOGIC;
			 D   : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
          Q   : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
			 );
end register_D_E_R;

architecture Behavioral of register_D_E_R is

begin
		process (RST,CLK, EN)
		begin
			if( RST ='1') then
				Q <= (others => '0');
			elsif (rising_edge (CLK) and EN = '1') then
				Q <=D;
			end if;
		end process;

end Behavioral;