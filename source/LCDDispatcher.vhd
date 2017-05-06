----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:22 05/06/2017 
-- Design Name: 
-- Module Name:    LCDDispatcher - Behavioral 
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

entity LCDDispatcher is
	Port ( CLK  : in STD_LOGIC;
			 Dval : in  STD_LOGIC;
          Din  : in  STD_LOGIC_VECTOR (8 downto 0);
			 Wrl	: out STD_LOGIC;
          Dout : out STD_LOGIC_VECTOR (8 downto 0);
          done : out STD_LOGIC
		  );
end LCDDispatcher;


architecture Behavioral of LCDDispatcher is
	type STATE_TYPE is (STATE_Dval_On, STATE_Dval_Off);
	Signal Current, NS: STATE_TYPE;
begin
	State_transitions: process (CLK)
	begin
		if rising_edge(CLK) then
			Current<= NS;
		end if;
	end process;
	
	Next_State_Eval : process (Dval)
	begin
		case (Current) is
		--
		
		when STATE_Dval_Off		=> 
										if Dval = '0' then
										NS <= STATE_Dval_Off;
										else NS <= STATE_Dval_On;
										end if;

		when STATE_Dval_On		=> 
										if Dval='1' then
										NS <= STATE_Dval_On;
										else NS <= STATE_Dval_Off;
										end if;


		when others				=> NS <= STATE_Dval_Off;
		end case;
		end process;
		-- sinais de saida--
		Wrl     <= '1' when current = STATE_Dval_On 
					else '0';
		done    <= '1' when current = STATE_Dval_On
					else '0';
		Dout(0) <= '1' when current = STATE_Dval_On and Din(0)='1'
					else '0';
		Dout(1) <= '1' when current = STATE_Dval_On and Din(1)='1'
					else '0';
		Dout(2) <= '1' when current = STATE_Dval_On and Din(2)='1'
					else '0';
		Dout(3) <= '1' when current = STATE_Dval_On and Din(3)='1'
					else '0';
		Dout(4) <= '1' when current = STATE_Dval_On and Din(4)='1'
					else '0';
		Dout(5) <= '1' when current = STATE_Dval_On and Din(5)='1'
					else '0';
		Dout(6) <= '1' when current = STATE_Dval_On and Din(6)='1'
					else '0';
		Dout(7) <= '1' when current = STATE_Dval_On and Din(7)='1'
					else '0';
		Dout(8) <= '1' when current = STATE_Dval_On and Din(8)='1'
					else '0';
end Behavioral;
