----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:00:52 06/08/2017 
-- Design Name: 
-- Module Name:    CoinAcceptor - Behavioral 
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

entity CoinAcceptor is
    Port ( CLK : in STD_LOGIC;
			  CoinSense : in  STD_LOGIC;
           Accept : in  STD_LOGIC;
           Coin : out  STD_LOGIC
           );
end CoinAcceptor;

architecture Behavioral of CoinAcceptor is


type STATE_TYPE is (STATE_IDDLE, STATE_COIN);

	Signal Current, NS: STATE_TYPE;
begin
	State_transitions: process (CLK)
	begin
--		if(AR= '1') then
--			CS <= STATE_KVAL;
--		els
		if rising_edge(CLK) then
			Current<= NS;
		end if;
	end process;
	
	Next_State_Eval : process (Current, Accept, CoinSense)
	begin
		case (Current) is
		--
		when STATE_IDDLE		=> if (CoinSense='1' and Accept='0') then
										NS<= STATE_COIN;
										else NS<= STATE_IDDLE;
										end if;
										
		when STATE_COIN	=> if Accept='1' then
									NS<= STATE_IDDLE;
									else NS<=STATE_COIN;
									end if;
		when others				=> NS <= STATE_IDDLE;
		end case;
	end process;
		-- sinais de saida--
	Coin	<='1' when current = STATE_COIN
				else '0';
end Behavioral;

