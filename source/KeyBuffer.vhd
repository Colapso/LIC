----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:28:33 05/18/2017 
-- Design Name: 
-- Module Name:    KeyBuffer - Structural 
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

entity KeyBuffer is
    Port ( DAV : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           ACK : in  STD_LOGIC;
           Dval : out  STD_LOGIC;
           DAC : out  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end KeyBuffer;

architecture Structural of KeyBuffer is
signal swreg: STD_LOGIC;
component register_D_E_R is
	generic ( WIDTH : POSITIVE :=4);
   port ( CLK : in  STD_LOGIC;
			 RST : in  STD_LOGIC;
          EN  : in  STD_LOGIC;
			 D   : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
          Q   : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
			 );
end component;
component KeyBufferControl is
Port ( DAV : in  STD_LOGIC;
           ACK : in  STD_LOGIC;
           Wreg : out  STD_LOGIC;
           DAC : out  STD_LOGIC;
           Dval : out  STD_LOGIC);
end component;
begin

	U0: register_D_E_R
		generic map (WIDTH =>4)
		Port map(CLK	=>	swreg,
					RST	=>	'0',
					EN		=> '1',
					D		=> D,
					Q		=> Q  	
		);
	U1: KeyBufferControl
		Port map(DAV=>DAV,
           ACK => ACK,
           Wreg =>swreg,
           DAC => DAC,
           Dval=> Dval);
end Structural;

