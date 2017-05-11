----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:50:24 04/29/2017 
-- Design Name: 
-- Module Name:    ParityCheck - Behavioral 
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

entity ParityCheck is
   Port ( CLK  : in  STD_LOGIC;
	       init : in  STD_LOGIC;
			 data : in  STD_LOGIC;
          err  : out STD_LOGIC
		  );
end ParityCheck;

architecture Behavioral of ParityCheck is

signal last : STD_LOGIC;
signal nxt : STD_LOGIC;

component register_D_E_R is
	generic (WIDTH : POSITIVE :=1);
	Port ( CLK : in  STD_LOGIC;
			 RST : in  STD_LOGIC;
          EN  : in  STD_LOGIC;
			 D   : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
          Q   : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
		  );
end component;

begin
	nxt <= last xor data;
	
	TE: register_D_E_R
		generic map (WIDTH => 1)
			port map ( CLK => clk,
						  RST => init,
						  EN => '1',
						  D(0) => nxt,
						  Q(0) => last
						);
	err <= last;
end Behavioral;

