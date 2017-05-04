----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:03:22 03/26/2017 
-- Design Name: 
-- Module Name:    KeyScan_wrapper - Behavioral 
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

entity KeyScan_wrapper is
    Port ( LED_D1 : out STD_LOGIC;
			  LED_D2 : out STD_LOGIC;
			  LED_D3 : out STD_LOGIC;
	        LED_D4 : out STD_LOGIC;
	        LED_D5 : out STD_LOGIC;
			  J4_1   : in  STD_LOGIC;
			  J1_6   : in  STD_LOGIC;
			  LED_D9 : out STD_LOGIC;
			  LED_D10: out STD_LOGIC;
			  LED_D11: out STD_LOGIC;
			  J1_10  : in  STD_LOGIC;
			  J1_11  : in  STD_LOGIC;
			  J1_12  : in  STD_LOGIC;
			  J1_13  : in  STD_LOGIC
			);
end KeyScan_wrapper;

architecture Structural of KeyScan_wrapper is
component KeyScan is
    Port ( CLK    : in STD_LOGIC;
	        Kline  : in  STD_LOGIC_VECTOR (3 downto 0);
           Kscan  : in  STD_LOGIC;
			  Kcol   : out  STD_LOGIC_VECTOR( 2 downto 0);
           K      : out  STD_LOGIC_VECTOR (3 downto 0);
           Kpress : out  STD_LOGIC
			  );
end component;

begin
	KSv1 : KeyScan
		Port map ( CLK      => J4_1,
					  Kscan    => J1_6,
					  Kline(0) => J1_10, 
					  Kline(1) => J1_11 ,
					  Kline(2) => J1_12,
					  Kline(3) => J1_13,
					  Kcol(0)  => LED_D11,
					  Kcol(1)  => LED_D10,
					  Kcol(2)  => LED_D9,
					  K(3)     => LED_D4,
					  K(2)     => LED_D3,
					  K(1)     => LED_D2 ,
					  K(0)     => LED_D1,
					  Kpress   => LED_D5
					);

end Structural;

