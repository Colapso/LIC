----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:35:30 04/28/2017 
-- Design Name: 
-- Module Name:    SerialControlWrapper - Structural 
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

entity SerialControlWrapper is
	Port ( LED_D5 : out STD_LOGIC;
		    LED_D6 : out STD_LOGIC;
		    LED_D7 : out STD_LOGIC;
		    J4_1   : in STD_LOGIC;
		    J1_6   : in STD_LOGIC;
		    J1_7   : in STD_LOGIC;
		    J1_8   : in STD_LOGIC;
		    J1_9   : in STD_LOGIC;
		    J1_10  : in STD_LOGIC
		  );
end SerialControlWrapper;

architecture Structural of SerialControlWrapper is

component SerialControl is
	Port ( CLK     : in  STD_LOGIC;
			 notenRx : in  STD_LOGIC;
			 accept  : in  STD_LOGIC;
			 pFlag   : in  STD_LOGIC;
			 dFlag   : in  STD_LOGIC;
			 RXerror : in  STD_LOGIC;
			 DXval   : out STD_LOGIC;
			 init    : out STD_LOGIC;
			 wr      : out STD_LOGIC
		  );
end component;

begin

	SC: SerialControl
		port map ( CLK      => J4_1,
			        notenRx  => J1_6,
			        accept   => J1_7,
			        pFlag    => J1_8,
			        dFlag    => J1_9,
			        RXerror  => J1_10,
			        DXval    => LED_D5,
			        init     => LED_D6,
			        wr       => LED_D7
			      );
end Structural;

