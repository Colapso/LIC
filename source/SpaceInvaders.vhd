----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:19 05/18/2017 
-- Design Name: 
-- Module Name:    SpaceInvaders - Behavioral 
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

entity SpaceInvaders is
    Port ( CLK : in  STD_LOGIC;
	 
           Sel : in  STD_LOGIC_VECTOR(1 downto 0);
           SCLK : in  STD_LOGIC;
           SDATA : in  STD_LOGIC;
			  
           E : out  STD_LOGIC;
			  RS : out STD_LOGIC;
			  LCDD : out STD_LOGIC_VECTOR(7 downto 0);
			  SID : out STD_LOGIC_VECTOR(1 downto 0);
			  VOL : out STD_LOGIC_VECTOR(1 downto 0);
			  Play : out STD_LOGIC;
			  
			  Kline : in STD_LOGIC_VECTOR(3 downto 0);
			  Kcol	: out STD_LOGIC_VECTOR(2 downto 0);
			  ACK		: in STD_LOGIC;
			  KeyD	: out STD_LOGIC_VECTOR(3 downto 0);
			  Dval	: out STD_LOGIC;
			  CoinAcceptor: in STD_LOGIC;
			  MaintenanceButton: in STD_LOGIC;
			  CA: out STD_LOGIC;
			  MB: out STD_LOGIC
			  --STATEKBD : out STD_LOGIC_VECTOR(2 downto 0)
			  
			  );
end SpaceInvaders;

architecture Structural of SpaceInvaders is

component SerialLCDController is
	Port ( CLK    : in  STD_LOGIC;
			 LCDsel : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
          
			 E      : out STD_LOGIC;
			 RS     : out STD_LOGIC;
          D      : out STD_LOGIC_VECTOR (7 downto 0)
		  );
end component;
component SerialSoundController is
	Port ( CLK    : in  STD_LOGIC;
			 Ssel   : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
          
			 Play   : out STD_LOGIC;
          sid    : out STD_LOGIC_VECTOR (1 downto 0);
			 vol    : out STD_LOGIC_VECTOR (1 downto 0)
		  );
end component;
component KeyboardReader is
	Port (  CLK : in STD_LOGIC;
			  Kline : in  STD_LOGIC_VECTOR (3 downto 0);
			  ACK : in  STD_LOGIC;
			  Kcol : out STD_LOGIC_VECTOR(2 downto 0);
           D : out  STD_LOGIC_VECTOR (3 downto 0);
           Dval : out  STD_LOGIC;
			  STATE: out STD_LOGIC_VECTOR(2 downto 0)
		  );
end component;
signal ssclk 	: STD_LOGIC;
signal ssdx		: STD_LOGIC;
begin

	SLCDC: SerialLCDController
		Port map(CLK	=> CLK,
					LCDsel=> Sel(1),
					SCLK	=> ssclk,
					SDX	=> ssdx,
          
					E		=> E,
					RS    => RS,
					D		=> LCDD
			 );
	SSC: SerialSoundController
		Port map(CLK 	=> CLK,
					Ssel	=> Sel(0),
					SCLK	=> ssclk  ,
					SDX	=> ssdx,
          
					Play	=> Play,
					sid	=> SID,
					vol	=> VOL
			 );
	KD: KeyboardReader
		Port map(CLK	=> CLK,
					Kline => Kline,
					ACK	=>	ACK,
					Kcol	=> Kcol,
					D 		=> KeyD,
					Dval	=> Dval
					--STATE	=> STATEKBD
					);
		
	ssclk <= SCLK;
	ssdx	<= SDATA;
	CA		<= CoinAcceptor;
	MB		<= MaintenanceButton;
end Structural;

