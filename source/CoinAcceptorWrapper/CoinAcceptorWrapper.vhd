----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:16 06/08/2017 
-- Design Name: 
-- Module Name:    CoinAcceptorWrapper - Strucutral 
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

entity CoinAcceptorWrapper is
    Port ( J1_10 : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OUTPORT_7 : in  STD_LOGIC;
           INPORT_7 : out  STD_LOGIC);
end CoinAcceptorWrapper;

architecture Strucutral of CoinAcceptorWrapper is

component CoinAcceptor is
	Port ( CLK : in STD_LOGIC;
			  CoinSense : in  STD_LOGIC;
           Accept : in  STD_LOGIC;
           Coin : out  STD_LOGIC
           );
end component;

begin
	CA:	CoinAcceptor
		Port map(CLK		=>CLK,
					CoinSense=>J1_10,
					Accept	=>OUTPORT_7,
					Coin		=>INPORT_7
		);

end Strucutral;


