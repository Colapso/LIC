----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:02:38 04/06/2017 
-- Design Name: 
-- Module Name:    KeyControl - Behavioral 
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

entity KeyControl is
   Port ( CLK 	  : in  STD_LOGIC;
	       Kack   : in  STD_LOGIC;
          Kpress : in  STD_LOGIC_VECTOR (1 downto 0);
          KScan  : out STD_LOGIC_VECTOR (1 downto 0);
          Kval   : out STD_LOGIC;
		    STATE  : out STD_LOGIC_VECTOR (2 downto 0)
		  );
end KeyControl;

architecture Behavioral of KeyControl is

	type STATE_TYPE is ( STATE_SCAN, STATE_AVAL, STATE_KVAL);

	Signal Current, NS: STATE_TYPE;
begin

	State_transitions: process (Clk)
	begin
--		if(AR= '1') then
--			CS <= STATE_KVAL;
--		els
		if rising_edge(CLK) then
			Current<= NS;
		end if;
	end process;
	
	Next_State_Eval : process (Current, Kpress, Kack)
	begin
		case (Current) is
		--
		when STATE_SCAN		=> NS <=STATE_AVAL;
										
		when STATE_AVAL		=> if (Kpress(0) = '1' and Kpress(1) = '1') 
										then NS <= STATE_KVAL;
										else NS <= STATE_AVAL;
										end if;

		when STATE_KVAL		=> if (Kack ='1') 
										then NS <= STATE_SCAN;
										else NS <= STATE_KVAL;
										end if;
		when others				=> NS <= STATE_SCAN;
		end case;
		end process;
		-- sinais de saida--
		Kscan(0)	<='1' when (current = STATE_SCAN or (current = STATE_AVAL and Kpress(0)='0'))
							else '0';
		Kscan(1)	<='1' when (current = STATE_SCAN or (current = STATE_AVAL and Kpress(1)='0'))
							else '0';
		Kval 		<='1' when (Current = STATE_KVAL)
							else '0';
		STATE(0) <='1' when (Current = STATE_SCAN) 
							else '0';
		STATE(1) <='1' when (Current = STATE_AVAL) 
							else '0';
		STATE(2) <='1' when (Current = STATE_KVAL) 
							else '0';
		
end Behavioral;

