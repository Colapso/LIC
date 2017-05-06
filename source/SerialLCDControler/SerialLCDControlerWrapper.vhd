----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:52:40 04/28/2017 
-- Design Name: 
-- Module Name:    SerialReceiverWrapper - Structural 
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

entity SerialLCDControlerWrapper is
    Port ( CLK     : in  STD_LOGIC;
	        OUTPORT_0: in STD_LOGIC;
	        OUTPORT_1: in STD_LOGIC;
	        OUTPORT_3: in STD_LOGIC;
           J1_5    : in  STD_LOGIC;
--			  J1_6    : out STD_LOGIC;
--			  J1_7    : out STD_LOGIC;
--			  J1_8    : out STD_LOGIC;
--			  J1_9    : out STD_LOGIC;
--			  J1_10   : out STD_LOGIC;
--			  J1_11   : out STD_LOGIC;
--			  J1_12   : out STD_LOGIC;
           LED_D1  : out STD_LOGIC;
           LED_D2  : out STD_LOGIC;
           LED_D3  : out STD_LOGIC;
           LED_D4  : out STD_LOGIC;
			  LED_D5  : out STD_LOGIC;
			  LED_D6  : out STD_LOGIC;
			  LED_D7  : out STD_LOGIC;
			  LED_D8  : out STD_LOGIC;
--			  LED_D14 : out STD_LOGIC;
			  LED_D15 : out STD_LOGIC;
			  LED_D16 : out STD_LOGIC
			 );
end SerialReceiverWrapper;

architecture Structural of SerialReceiverWrapper is

component SerialReceiver is
	Port ( CLK   : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
          notSS  : in  STD_LOGIC;
			 accept : in  STD_LOGIC;
          D      : out STD_LOGIC_VECTOR (8 downto 0);
          DXval  : out STD_LOGIC
--			 Counter: out STD_LOGIC_VECTOR (3 downto 0);
--			 Sinit  : out STD_LOGIC;
--			 RXerror: out  STD_LOGIC;   --teste
--			 dFlag  : out  STD_LOGIC;   --teste
--			 pFlag  : out  STD_LOGIC   --teste
			);
end component;

begin
	SR : SerialReceiver
		port map ( CLK    => CLK,
		           SCLK   => OUTPORT_1,
					  SDX    => OUTPORT_0,
                 notSS  => OUTPORT_3,
                 D(0)   => LED_D1,
                 D(1)   => LED_D2,
			        D(2)   => LED_D3,
			        D(3)   => LED_D4,
			        D(4)   => LED_D5,
			        D(5)   => LED_D6,
			        D(6)   => LED_D7,
			        D(7)   => LED_D8,
			        D(8)   => LED_D16,
			        DXval  => LED_D15,
			        accept     => J1_5
--					  Sinit  => LED_D14,
--					  RXerror    => J1_7,
--					  dflag      => J1_9,
--					  pflag      => J1_11,
--					  Counter(0) => J1_6,
--					  Counter(1) => J1_8,
--					  Counter(2) => J1_10,
--					  Counter(3) => J1_12
			      );
end Structural;

