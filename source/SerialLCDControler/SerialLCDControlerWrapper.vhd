----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:52:40 04/28/2017 
-- Design Name: 
-- Module Name:    SerialLCDControlerWrapper - Structural 
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
			  J3_6    : out STD_LOGIC;
			  J3_7    : out STD_LOGIC;
			  J3_8    : out STD_LOGIC;
			  J3_9    : out STD_LOGIC;
			  J3_10   : out STD_LOGIC;
			  J3_11   : out STD_LOGIC;
			  J3_12   : out STD_LOGIC;
			  J3_13   : out STD_LOGIC;
			  J3_14   : out STD_LOGIC;
			  J3_15   : out STD_LOGIC
			 );
end SerialLCDControlerWrapper;

architecture Structural of SerialLCDControlerWrapper is

component SerialLCDControler is
	Port ( CLK    : in  STD_LOGIC;
			 LCDsel : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
          
			 E      : out STD_LOGIC;
			 RS     : out STD_LOGIC;
          D      : out STD_LOGIC_VECTOR (7 downto 0)
		  );
end component;

begin
	SLCDC : SerialLCDControler
		port map ( CLK    => CLK,
		           SCLK   => OUTPORT_1,
					  SDX    => OUTPORT_0,
                 LCDsel => OUTPORT_3,
					  RS		=> J3_6,
					  E		=> J3_7,
                 D(0)   => J3_8,
                 D(1)   => J3_9,
			        D(2)   => J3_10,
			        D(3)   => J3_11,
			        D(4)   => J3_12,
			        D(5)   => J3_13,
			        D(6)   => J3_14,
			        D(7)   => J3_15
			      );
end Structural;

