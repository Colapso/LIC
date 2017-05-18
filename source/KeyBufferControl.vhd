----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:29:54 05/18/2017 
-- Design Name: 
-- Module Name:    KeyBufferControl - Behavioral 
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

entity KeyBufferControl is
    Port ( CLK : in STD_LOGIC;
			  DAV : in  STD_LOGIC;
           ACK : in  STD_LOGIC;
           Wreg : out  STD_LOGIC;
           DAC : out  STD_LOGIC;
           Dval : out  STD_LOGIC);
end KeyBufferControl;

architecture Behavioral of KeyBufferControl is


type STATE_TYPE is (STATE_INIT, STATE_WRITE, STATE_DAC, STATE_DVAL);

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
	
	Next_State_Eval : process (Current, DAV,ACK)
	begin
		case (Current) is
		--
		when STATE_INIT		=> if DAV='1' then
										NS<= STATE_WRITE;
										else NS<= STATE_INIT;
										end if;
										
		when STATE_WRITE	=> NS<= STATE_DAC;
		
		when STATE_DAC		=> if DAV='0' then
									NS<= STATE_DVAL;
									else NS<=STATE_DAC;
									end if;
		when STATE_DVAL	=> if ACK='1' then
									NS<= STATE_INIT;
									else NS<=STATE_DVAL;
									end if;
		when others				=> NS <= STATE_init;
		end case;
	end process;
		-- sinais de saida--
	Wreg	<='1' when current = STATE_WRITE
				else '0';
	DAC	<='1' when current = STATE_DAC
				else '0';
	Dval	<='1' when current = STATE_DVAL
				else '0';
				
end Behavioral;

