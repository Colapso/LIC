----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:36 05/11/2017 
-- Design Name: 
-- Module Name:    SerialSoundControllerWrapper - Behavioral 
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

entity SoundControllerWrapper is
    Port (CLK: in STD_LOGIC;
			 J1_5: in STD_LOGIC;
			 J1_6: in STD_LOGIC;
			 J1_7: in STD_LOGIC;
			 J1_8: in STD_LOGIC;
			 J1_9: in STD_LOGIC;
			 LED_D1: out STD_LOGIC;
			 LED_D3: out STD_LOGIC;
			 LED_D4 : out STD_LOGIC;
			 LED_D6: out STD_LOGIC;
			 LED_D7 : out STD_LOGIC;
			 LED_D8: out STD_LOGIC
			 );
end SoundControllerWrapper;

architecture Structural of SoundControllerWrapper is

component SoundController is
	Port ( CLK : in STD_LOGIC;
			  Dval : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR(3 downto 0);
           Play : out  STD_LOGIC;
           sid : out  STD_LOGIC_VECTOR(1 downto 0);
           vol : out  STD_LOGIC_VECTOR(1 downto 0);
           done : out  STD_LOGIC);
end component;

begin
	SC0: SoundController
		Port map(CLK => CLK,
					Dval => J1_5,
					Din(0)  => J1_6,
					Din(1)  => J1_7,
					Din(2)  => J1_8,
					Din(3)  => J1_9,
					Play		=> LED_D1,
					sid(0) 	=> LED_D3,
					sid(1)	=> LED_D4,
					vol(0)	=>	LED_D6,
					vol(1)	=> LED_D7,
					done		=> LED_D8
		);
end Structural;

