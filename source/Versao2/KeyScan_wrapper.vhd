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
	        LED_D6 : out STD_LOGIC;
			  J4_1 : in STD_LOGIC;
			  J1_6 : in STD_LOGIC;
			  J1_7 : in STD_LOGIC;
			  J2_9 : out STD_LOGIC;
			  J2_10: out STD_LOGIC;
			  J2_11: out STD_LOGIC;
			  J2_15: in STD_LOGIC;
			  J2_14: in STD_LOGIC;
			  J2_13: in STD_LOGIC;
			  J2_12: in STD_LOGIC
			);
end KeyScan_wrapper;

architecture Structural of KeyScan_wrapper is
component KeyScan is
   Port ( CLK    : in  STD_LOGIC;
	       Kline  : in  STD_LOGIC_VECTOR(3 downto 0);
          Kscan  : in  STD_LOGIC_VECTOR(1 downto 0);
		    Kcol   : out STD_LOGIC_VECTOR(2 downto 0);
          K      : out STD_LOGIC_VECTOR(3 downto 0);
          Kpress : out STD_LOGIC_VECTOR(1 downto 0)
	     );
end component;

begin
	KSv1 : KeyScan
		Port map ( CLK =>J4_1,
					  Kscan(0) => J1_6,
					  Kscan(1) => J1_7,
					  Kline(0) => J2_15, 
					  Kline(1) => J2_14 ,
					  Kline(2) => J2_13,
					  Kline(3) => J2_12,
			        Kcol(0) =>  J2_11,
					  Kcol(1) =>  J2_10,
					  Kcol(2) =>  J2_9,
					  K(3) => LED_D4,
					  K(2) => LED_D3,
					  K(1) => LED_D2 ,
					  K(0) => LED_D1,
                 Kpress(0) => LED_D5,
                 Kpress(1) => LED_D6
               );

end Structural;

