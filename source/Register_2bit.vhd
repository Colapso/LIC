----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:38 05/18/2017 
-- Design Name: 
-- Module Name:    Register_2bit - Behavioral 
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

entity Register_2bit is
    Port ( CLK: in STD_LOGIC;
			  D : in  STD_LOGIC_VECTOR (1 downto 0);
           Q : out  STD_LOGIC_VECTOR (1 downto 0);
           EN : in  STD_LOGIC);
end Register_2bit;

architecture Behavioral of Register_2bit is
component register_D_E_R is
	generic ( WIDTH : POSITIVE :=2);
   port ( CLK : in  STD_LOGIC;
			 RST : in  STD_LOGIC;
          EN  : in  STD_LOGIC;
			 D   : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
          Q   : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
			 );
end component;
begin

	U0: register_D_E_R
		generic map (WIDTH =>2)
		Port map(CLK	=>	CLK,
					RST	=>	'0',
					EN		=> EN,
					D		=> D,
					Q		=> Q  	
		);
end Behavioral;

