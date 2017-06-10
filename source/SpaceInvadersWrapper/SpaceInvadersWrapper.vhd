----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:59 05/25/2017 
-- Design Name: 
-- Module Name:    SpaceInvadersWrapper - Structural 
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

entity SpaceInvadersWrapper is
    Port ( CLK      : in STD_LOGIC;
			  OUTPORT_0 : in  STD_LOGIC;
           OUTPORT_1 : in  STD_LOGIC;
		--SerialSoundController--
           OUTPORT_2 : in  STD_LOGIC;
           J1_5 : out  STD_LOGIC;
           J1_6 : out  STD_LOGIC;
           J1_7 : out  STD_LOGIC;
           J1_8 : out  STD_LOGIC;
           J1_9 : out  STD_LOGIC;
	--serialLCDReceiver--
	        OUTPORT_3: in STD_LOGIC;
			  J3_6    : out STD_LOGIC;
			  J3_7    : out STD_LOGIC;
			  J3_8    : out STD_LOGIC;
			  J3_9    : out STD_LOGIC;
			  J3_10   : out STD_LOGIC;
			  J3_11   : out STD_LOGIC;
			  J3_12   : out STD_LOGIC;
			  J3_13   : out STD_LOGIC;
			  J3_14   : out STD_LOGIC;
			  J3_15   : out STD_LOGIC;
	 
	 --keyboard--
			  LED_D1 : out STD_LOGIC;
			  LED_D2 : out STD_LOGIC;
			  LED_D3 : out STD_LOGIC;
	        LED_D4 : out STD_LOGIC;
	        LED_D5 : out STD_LOGIC;
			  --LED_D6 : out STD_LOGIC;
			  J1_10	:in	STD_LOGIC;
			  J1_11	: in STD_LOGIC;
			  LED_D7 : out STD_LOGIC;
			  LED_D8 : out STD_LOGIC;
			  
			 
			  OUTPORT_7 : in STD_LOGIC;
			  J2_9 : out STD_LOGIC;
			  J2_10: out STD_LOGIC;
			  J2_11: out STD_LOGIC;
			  J2_15: in STD_LOGIC;
			  J2_14: in STD_LOGIC;
			  J2_13: in STD_LOGIC;
			  J2_12: in STD_LOGIC
			  );
end SpaceInvadersWrapper;

architecture Structural of SpaceInvadersWrapper is

component SpaceInvaders is
		Port(CLK : in  STD_LOGIC;
	 
           Sel : in  STD_LOGIC_VECTOR(1 downto 0);
           SCLK : in  STD_LOGIC;
           SDATA : in  STD_LOGIC;
			  
           E : out  STD_LOGIC;
			  RS : out STD_LOGIC;
			  LCDD : out STD_LOGIC_VECTOR(7 downto 0);
			  SID : out STD_LOGIC_VECTOR(1 downto 0);
			  VOL : out STD_LOGIC_VECTOR(1 downto 0);
			  Play : out STD_LOGIC;
			  
			  Kline : in STD_LOGIC_VECTOR(3 downto 0);
			  Kcol	: out STD_LOGIC_VECTOR(2 downto 0);
			  ACK		: in STD_LOGIC;
			  KeyD	: out STD_LOGIC_VECTOR(3 downto 0);
			  Dval	: out STD_LOGIC;
			  --STATEKBD : OUT STD_LOGIC_VECTOR(2 downto 0)
			  CoinAcceptor: in STD_LOGIC;
			  MaintenanceButton: in STD_LOGIC;
			  CA: out STD_LOGIC;
			  MB: out STD_LOGIC
			  );
end component;

begin
	si : SpaceInvaders
		port map(CLK 		=> CLK,
		
					Sel(0)	=> OUTPORT_2,
					Sel(1)	=> OUTPORT_3,
					SCLK		=> OUTPORT_1,
					SDATA 	=> OUTPORT_0,
					--sound--
					Play 		=> J1_5, 
					SID(0)	=> J1_6,
					SID(1)	=> J1_7,
					VOL(0)	=> J1_8,
					VOL(1)	=> J1_9,
					--lcd--
					RS			=> J3_6,
					E			=> J3_7,
               LCDD(0)	=> J3_8,
               LCDD(1)	=> J3_9,
			      LCDD(2)	=> J3_10,
			      LCDD(3)  => J3_11,
			      LCDD(4)  => J3_12,
			      LCDD(5)  => J3_13,
			      LCDD(6)  => J3_14,
			      LCDD(7)  => J3_15,
					--keyboard--
					Kline(0) => J2_15, 
					Kline(1) => J2_14,
					Kline(2) => J2_13,
					Kline(3) => J2_12,
			      Kcol(0) 	=> J2_11,
					Kcol(1) 	=> J2_10,
					Kcol(2) 	=> J2_9,
					ACK		=> OUTPORT_7,
					KeyD(3)	=> LED_D4,
					KeyD(2)	=> LED_D3,
					KeyD(1)	=> LED_D2,
					KeyD(0)	=> LED_D1,
					Dval		=>	LED_D5,
					CoinAcceptor	=>J1_10,
					MaintenanceButton=>J1_11,
					CA	=>LED_D8,
					MB	=>LED_D7
					--STATEKBD(0)=>LED_D6,
					--STATEKBD(1)=>LED_D7,
					--STATEKBD(2)=>LED_D8
		);
		
end Structural;

