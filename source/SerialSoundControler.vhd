----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:15:24 05/11/2017 
-- Design Name: 
-- Module Name:    SerialSoundControler - Behavioral 
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

entity SerialSoundController is
	Port ( CLK    : in  STD_LOGIC;
			 Ssel   : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
          
			 Play   : out STD_LOGIC;
          sid    : out STD_LOGIC_VECTOR (1 downto 0);
			 vol    : out STD_LOGIC_VECTOR (1 downto 0)
		  );
end SerialSoundController;

architecture Behavioral of SerialSoundControler is
	signal sDval   : STD_LOGIC;
	signal saccept : STD_LOGIC;
	signal sD 	   : STD_LOGIC_VECTOR (3 downto 0);

component SerialReceiverSound is
	Port ( CLK   : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
          notSS  : in  STD_LOGIC;
			 accept : in  STD_LOGIC;
          D      : out STD_LOGIC_VECTOR (3 downto 0);
          DXval  : out STD_LOGIC
		  );
end component;

component SoundController is
	Port ( CLK  : in STD_LOGIC;
			 Dval : in  STD_LOGIC;
          Din  : in  STD_LOGIC_VECTOR (3 downto 0);
			 Play	: out STD_LOGIC;
          sid  : out STD_LOGIC_VECTOR (1 downto 0);
          vol  : out STD_LOGIC_VECTOR (1 downto 0);
          done : out STD_LOGIC
		  );
end component;


Begin
	SC0 : SerialReceiverSound
	port map ( CLK		=> CLK,
				  SCLK   => SCLK,
				  SDX    => SDX,
              notSS  => Ssel,
			     accept => saccept,
              D      => sD,
              DXval  => sDval
	         );

	SC1 : SoundController
	port map ( CLK    => CLK,
			     Dval 	=> sDval,
			     Din  	=> sD,
			     Play 	=> Play,
			     sid    => sid,
			     vol    => vol,
			     done   => saccept
	         );
				
end Behavioral;


