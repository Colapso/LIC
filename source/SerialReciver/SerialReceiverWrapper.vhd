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

entity SerialReceiverWrapper is
    Port ( CLK    : in  STD_LOGIC;
	        J1_6   : in  STD_LOGIC;
           J1_5   : in  STD_LOGIC;
           J1_7   : in  STD_LOGIC;
           J1_9   : in  STD_LOGIC;
           LED_D1 : out STD_LOGIC;
           LED_D2 : out STD_LOGIC;
           LED_D3 : out STD_LOGIC;
           LED_D4 : out STD_LOGIC;
           LED_D5 : out STD_LOGIC;
           LED_D6 : out STD_LOGIC;
           LED_D7 : out STD_LOGIC;
           LED_D8 : out STD_LOGIC;
           LED_D9 : out STD_LOGIC;
			  LED_D10: out STD_LOGIC;
			  LED_D12: out STD_LOGIC;
			  LED_D13: out STD_LOGIC;
			  LED_D14: out STD_LOGIC;
			  LED_D15: out STD_LOGIC;
			  LED_D16: out STD_LOGIC
			 );
end SerialReceiverWrapper;

architecture Structural of SerialReceiverWrapper is

component SerialReceiver is
	Port ( CLK   : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
          notSS  : in  STD_LOGIC;
			 accept : in  STD_LOGIC;
			 Counter: out STD_LOGIC_VECTOR (3 downto 0);
			 Sinit  :out STD_LOGIC;
          D      : out STD_LOGIC_VECTOR (8 downto 0);
          DXval  : out STD_LOGIC
		  );
end component;

begin
	SR : SerialReceiver
		port map ( CLK    => CLK,
		           SCLK   => J1_6,
					  SDX    => J1_5,
                 notSS  => J1_7,
			        accept => J1_9,
                 D(0)   => LED_D1,
                 D(1)   => LED_D2,
			        D(2)   => LED_D3,
			        D(3)   => LED_D4,
			        D(4)   => LED_D5,
			        D(5)   => LED_D6,
			        D(6)   => LED_D7,
			        D(7)   => LED_D8,
			        D(8)   => LED_D9,
			        DXval  => LED_D10,
					  Sinit  => LED_D12,
					  Counter(0) => LED_D13,
					  Counter(1) => LED_D14,
					  Counter(2) => LED_D15,
					  Counter(3) => LED_D16
			      );
end Structural;

