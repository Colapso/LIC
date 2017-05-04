----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:48:22 03/26/2017 
-- Design Name: 
-- Module Name:    Contador4bit - Structural 
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

entity Contador2bit is
	Port ( CLK : in  STD_LOGIC;
	       CE  : in  STD_LOGIC;
		    Q   : out STD_LOGIC_VECTOR (1 downto 0)
		  );
end Contador2bit;

architecture Structural of Contador2bit is
component Somador2bits is
	Port ( A    : in  STD_LOGIC_VECTOR (1 downto 0);
          B    : in  STD_LOGIC_VECTOR (1 downto 0);
          Cin  : in  STD_LOGIC;
          S    : out STD_LOGIC_VECTOR (1 downto 0);
          Cout : out STD_LOGIC
		  );

end component;
component register_D_E is
	generic (WIDTH : POSITIVE :=2);
   port ( CLK : in  STD_LOGIC;
          EN  : in  STD_LOGIC;
			 D   : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
          Q   : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
		  );
end component;

	signal nxt_cnt_value : STD_LOGIC_VECTOR (1 downto 0);
	signal cnt_value : STD_LOGIC_VECTOR (1 downto 0);
	signal increment : STD_LOGIC_VECTOR (1 downto 0);
	
begin

	increment <= "01";

	U1: Somador2bits
			Port map ( A    => cnt_value,
						  B    => increment,
						  Cin  => '0',
						  S    => nxt_cnt_value,
						  Cout => open
						);
						
	U2: register_D_E
			generic map (WIDTH => 2)
			Port map ( CLK	=> CLK,
			           EN  => CE,
						  D	=> nxt_cnt_value,
						  Q	=> cnt_value
						);

	Q <= cnt_value;

end Structural;