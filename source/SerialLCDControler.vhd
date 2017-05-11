----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:51 05/06/2017 
-- Design Name: 
-- Module Name:    SerialLCDControler - Behavioral 
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

entity SerialLCDControler is
	Port ( CLK    : in  STD_LOGIC;
			 LCDsel : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
          
			 E      : out STD_LOGIC;
			 RS     : out STD_LOGIC;
          D      : out STD_LOGIC_VECTOR (7 downto 0)
		  );
end SerialLCDControler;

architecture Behavioral of SerialLCDControler is
	signal sDval   : STD_LOGIC;
	signal saccept : STD_LOGIC;
	signal sD 	   : STD_LOGIC_VECTOR (8 downto 0);

component SerialReceiver is
	Port ( CLK   : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
          notSS  : in  STD_LOGIC;
			 accept : in  STD_LOGIC;
          D      : out STD_LOGIC_VECTOR (8 downto 0);
          DXval  : out STD_LOGIC
		  );
end component SerialReceiver;

component LCDDispatcher is
	Port ( CLK  : in STD_LOGIC;
			 Dval : in  STD_LOGIC;
          Din  : in  STD_LOGIC_VECTOR (8 downto 0);
			 Wrl	: out STD_LOGIC;
          Dout : out STD_LOGIC_VECTOR (8 downto 0);
          done : out STD_LOGIC
		  );
end component LCDDispatcher;


Begin
	SLCD0 : SerialReceiver
	port map ( CLK		=> CLK,
				  SCLK   => SCLK,
				  SDX    => SDX,
              notSS  => LCDsel,
			     accept => saccept,
              D      => sD,
              DXval  => sDval
	         );

	SLCD1 : LCDDispatcher
	port map ( CLK    => CLK,
			     Dval 	=> sDval,
			     Din  	=> sD,
			     Wrl 	=> E,
			     Dout(0)=> RS,
			     Dout(1)=> D(0),
			     Dout(2)=> D(1),
			     Dout(3)=> D(2),
			     Dout(4)=> D(3),
			     Dout(5)=> D(4),
			     Dout(6)=> D(5),
			     Dout(7)=> D(6),
			     Dout(8)=> D(7),
			     done   => saccept
	         );
				
end Behavioral;

