----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:52:26 05/13/2017 
-- Design Name: 
-- Module Name:    SerialSoundControllerWrapper - Structural 
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

entity SerialSoundControllerWrapper is
    Port ( CLK : in  STD_LOGIC;
           OUTPORT_0 : in  STD_LOGIC;
           OUTPORT_1 : in  STD_LOGIC;
           OUTPORT_2 : in  STD_LOGIC;
           J1_5 : out  STD_LOGIC;
           J1_6 : out  STD_LOGIC;
           J1_7 : out  STD_LOGIC;
           J1_8 : out  STD_LOGIC;
           J1_9 : out  STD_LOGIC);
end SerialSoundControllerWrapper;

architecture Structural of SerialSoundControllerWrapper is
component SerialSoundController is
	Port(		CLK : in STD_LOGIC;
				notSSCsel : in  STD_LOGIC;
				SCLK : in  STD_LOGIC;
				SDX : in  STD_LOGIC;
				Play : out  STD_LOGIC;
				sid : out  STD_LOGIC_VECTOR (1 downto 0);
				vol : out  STD_LOGIC_VECTOR (1 downto 0)
	);
end component;

begin
	SSC: SerialSoundController
		Port map(CLK	=> CLK,
				notSSCsel=> OUTPORT_2,
				SCLK 		=> OUTPORT_1,
				SDX		=> OUTPORT_0,
				Play		=>	J1_5,
				sid(0)	=> J1_6,
				sid(1)	=> J1_7,
				vol(0)	=> J1_8,
				vol(1)	=> J1_9
		);
		

end Structural;

