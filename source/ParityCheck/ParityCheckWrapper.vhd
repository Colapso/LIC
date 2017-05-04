----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:59:50 04/29/2017 
-- Design Name: 
-- Module Name:    ParityCheckWrapper - Behavioral 
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

entity ParityCheckWrapper is
    Port ( J1_5 : in  STD_LOGIC;
           J1_6 : in  STD_LOGIC;
           J1_7 : in  STD_LOGIC;
           LED_D1 : out  STD_LOGIC);
end ParityCheckWrapper;

architecture Behavioral of ParityCheckWrapper is

component ParityCheck is
	Port(data : in  STD_LOGIC;
           init : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           err : out  STD_LOGIC);
end component;

begin

 pc: ParityCheck
	Port map(data => J1_5,
				init => J1_6,
				clk => J1_7,
				err => LED_D1
	);

end Behavioral;

