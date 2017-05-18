----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:18:38 05/18/2017 
-- Design Name: 
-- Module Name:    SoundControl - Structural 
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

entity SoundControl is
	Port(	 CLK  : in STD_LOGIC;
			 Dval : in  STD_LOGIC;
          din  : in  STD_LOGIC_VECTOR(3 downto 0);
			 Play	: out STD_LOGIC;
			 Stop : out STD_LOGIC;
			 ENsid  : out STD_LOGIC;
          ENvol  : out STD_LOGIC;
			 d		: out STD_LOGIC_VECTOR(1 downto 0);
          done : out STD_LOGIC
			 );
end SoundControl;
architecture Behavioral of SoundControl is

	type STATE_TYPE is (STATE_DVAL_OFF, STATE_DVAL_ON, STATE_DONE);

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
	
	Next_State_Eval : process (Current, Dval)
	begin
		case (Current) is
		--
		
		when STATE_DVAL_OFF		=> if Dval='1' then
										NS<= STATE_DVAL_ON;
										else NS<= STATE_DVAL_OFF;
										end if;
										
		when STATE_DVAL_ON	=> NS<= STATE_DONE;
		
		when STATE_DONE		=> if Dval='1' then
									NS <= STATE_DONE;
									else NS <= STATE_DVAL_OFF;
									end if;
		when others				=> NS <= STATE_DVAL_OFF;
		end case;
		end process;
		-- sinais de saida--
		Stop	<='1' when current = STATE_DVAL_ON and din(0)='0' and din(1)='0'
				else '0';
		Play	<='1' when current = STATE_DVAL_ON and din(0)='1' and din(1)='0'
				else '0';
		ENvol	<='1' when current = STATE_DVAL_ON and din(0)='1' and din(1)='1'
				else '0';
		ENsid	<='1' when current = STATE_DVAL_ON and din(0)='0' and din(1)='1'
				else '0';
		done	<='1' when current = STATE_DONE
				else '0';
		d(0)	<= din(2);
		d(1)	<= din(3);
end Behavioral;