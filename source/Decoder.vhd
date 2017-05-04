----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:49:48 03/26/2017 
-- Design Name: 
-- Module Name:    Decoder - Structural 
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

entity Decoder is
    Port ( DecoderSel : in  STD_LOGIC_VECTOR (1 downto 0);
           DEC        : out STD_LOGIC_VECTOR (2 downto 0)
			 );
end Decoder;

architecture Structural of Decoder is

begin
	DEC(0) <= not(not DecoderSel(0) and not DecoderSel(1));
	DEC(1) <= not(    DecoderSel(0) and not DecoderSel(1));
	DEC(2) <= not(not DecoderSel(0) and     DecoderSel(1));
	
end Structural;