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

entity SerialControl is
    Port ( CLK : in STD_LOGIC;
			  notenRx 	: in  STD_LOGIC;
			  accept : in STD_LOGIC;
			  pFlag : in STD_LOGIC;
			  dFlag : in STD_LOGIC;
			  RXerror : in STD_LOGIC;
			  DXval : out STD_LOGIC;
			  init : out STD_LOGIC;
			  wr : out STD_LOGIC
			  );
end SerialControl;

architecture Behavioral of SerialControl is

	type STATE_TYPE is (STATE_INIT, STATE_RECEIVING, STATE_PARITY, STATE_ACCEPT);

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
	
	Next_State_Eval : process (Current, notenRX, accept, pFlag, dFlag, RXerror)
	begin
		case (Current) is
		--
		
		when STATE_INIT		=> --ativar init --
										if notenRX = '1' then
										NS <= STATE_INIT;
										else NS <= STATE_RECEIVING;
										end if;

		when STATE_RECEIVING		=> --ativar wr--
										if notenRX='1' then
										NS <= STATE_INIT;
										elsif (dFlag = '0') then
										NS <= STATE_RECEIVING;
										else NS <= STATE_PARITY;
										end if;
		when STATE_PARITY		=> if (notenRX='1') then
										NS <= STATE_INIT;
										elsif(dFlag='1') then
										NS <= STATE_PARITY;
										elsif(pFlag='0') then
										NS <= STATE_PARITY;
										elsif (RXerror ='1') then
										NS <= STATE_INIT;
										else NS <= STATE_ACCEPT;
										end if;
		when STATE_ACCEPT		=> --ativar DXval--
										if accept ='1' then
										NS <= STATE_INIT;
										else NS <= STATE_ACCEPT;
										end if;
		when others				=> NS <= STATE_INIT;
		end case;
		end process;
		-- sinais de saida--
		init <= '1' when current = STATE_INIT
					else '0';
		wr <= '1' when current = STATE_RECEIVING
					else '0';
		DXval	<='1' when current = STATE_ACCEPT
							else '0';
		
end Behavioral;

