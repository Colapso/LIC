----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:49:26 03/26/2017 
-- Design Name: 
-- Module Name:    Multiplexer4x1 - Structural 
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

entity Multiplexer4x1 is
    Port ( MUX    : in  STD_LOGIC_VECTOR (3 downto 0);
           MUXSel : in  STD_LOGIC_VECTOR (1 downto 0);
			  Kpress : out STD_LOGIC
			 );
end Multiplexer4x1;

architecture Structural of Multiplexer4x1 is
	
	signal Y : STD_LOGIC;

begin

	Y		<=	(MUX(0) and not MUXSel(0) and not MUXSel(1)) or
				(MUX(1) and     MUXSel(0) and not MUXSel(1)) or
				(MUX(2) and not MUXSel(0) and	    MUXSel(1)) or
				(MUX(3) and     MUXSel(0) and     MUXSel(1));
			
	Kpress <= not Y;
end Structural;