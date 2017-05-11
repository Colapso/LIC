----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:47:26 03/26/2017 
-- Design Name: 
-- Module Name:    Somador4bits - Structural 
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

entity Somador4bits is
   Port ( A    : in  STD_LOGIC_VECTOR (3 downto 0);
          B    : in  STD_LOGIC_VECTOR (3 downto 0);
          Cin  : in  STD_LOGIC;
          S    : out STD_LOGIC_VECTOR (3 downto 0);
          Cout : out STD_LOGIC);
end Somador4bits;

architecture Structural of Somador4bits is
component FA is
	Port ( A    : in  STD_LOGIC;
          B    : in  STD_LOGIC;
          Cin  : in  STD_LOGIC;
          S    : out STD_LOGIC;
          Cout : out STD_LOGIC);
end component;

	signal carry : STD_LOGIC_VECTOR (3 downto 1);
	
begin
	U0: 	FA
			port map ( A    => A(0), 
			           B    => B(0), 
						  Cin  => Cin, 
						  S    => S(0), 
						  Cout => carry(1)
						 );
	U1: 	FA
			port map ( A    => A(1), 
			           B    => B(1), 
						  Cin  => carry(1), 
						  S    => S(1), 
						  Cout => carry(2)
						);
	U2: 	FA
			port map ( A    => A(2), 
			           B    => B(2), 
						  Cin  => carry(2), 
						  S    => S(2), 
						  Cout => carry(3)
						);
	U3: 	FA
			port map ( A    => A(3), 
			           B    => B(3), 
						  Cin  => carry(3), 
						  S    => S(3), 
						  Cout => Cout
						);
end Structural;