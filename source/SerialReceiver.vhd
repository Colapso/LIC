----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:35:17 04/27/2017 
-- Design Name: 
-- Module Name:    SerialReceiver - Behavioral 
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

entity SerialReceiver is
	Port ( CLK   : in  STD_LOGIC;
	       SCLK   : in  STD_LOGIC;
	       SDX    : in  STD_LOGIC;
          notSS  : in  STD_LOGIC;
			 accept : in  STD_LOGIC;
          D      : out STD_LOGIC_VECTOR (8 downto 0);
          DXval  : out STD_LOGIC
		  );
end SerialReceiver;

architecture Behavioral of SerialReceiver is
	signal DataChannel : STD_LOGIC;
	signal SerialClock : STD_LOGIC;
	signal init        : STD_LOGIC;
	signal Count       : STD_LOGIC_VECTOR (3 downto 0);
	signal en          : STD_LOGIC;
	signal Flags       : STD_LOGIC_VECTOR (1 downto 0);
	signal Perror      : STD_LOGIC;
	
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

component ShiftRegister is
   Port ( SCLK        : in  STD_LOGIC;
	       enableShift : in  STD_LOGIC;
	       Data 		 : in  STD_LOGIC;
			 D           : out STD_LOGIC_VECTOR (8 downto 0)
		  );
end component;

component Contador4bit is
	Port ( CLK : in  STD_LOGIC;
			 RST : in  STD_LOGIC;
	       CE  : in  STD_LOGIC;
			 Q   : out STD_LOGIC_VECTOR (3 downto 0)
			);
end component;

component Comparer4bits is
   Port ( Ref    : in  STD_LOGIC_VECTOR (3 downto 0);
	       Comp   : in  STD_LOGIC_VECTOR (3 downto 0);
		    Equals : out STD_LOGIC
	     );
end component;

component ParityCheck is
   Port ( CLK  : in  STD_LOGIC;
	       init : in  STD_LOGIC;
			 data : in  STD_LOGIC;
          err  : out STD_LOGIC
		  );
end component;

begin

	U0 : SerialControl
	port map ( CLK     => CLK,
			     notenRx => notSS,
			     accept  => accept,
			     RXerror => Perror,
			     DXval   => DXval,
			     init    => init,
			     dFlag   => Flags(0),
			     pFlag   => Flags(1),
			     wr      => en
	         );
	
	U1 : ParityCheck 
   Port map ( CLK  => SerialClock,
	           init => init,
			     data => DataChannel,
              err  => Perror
		      );
	
	
	U2: ShiftRegister
	port map ( SCLK=> SerialClock,
	           enableShift => en,
				  Data => DataChannel,
				  D(0) => D(8),
				  D(1) => D(7),
				  D(2) => D(6),
				  D(3) => D(5),
				  D(4) => D(4),
				  D(5) => D(3),
				  D(6) => D(2),
				  D(7) => D(1),
				  D(8) => D(0) 
	         );
				
	U3: Contador4bit
	port map ( CLK => SerialClock,
	           CE  => '1',
				  RST => init,
				  Q   => Count
	         );
	U4: Comparer4bits 
	port map ( Ref    => "1001", --9
			     Comp   => Count,
			     Equals => Flags(0)
	         );
	U5: Comparer4bits
	port map ( Ref    => "1010", --10
			     Comp   => Count,
			     Equals => Flags(1)
	         );
	
	SerialClock <= SCLK;
	DataChannel <= SDX;
--	Counter     <= Count;
--	Sinit			<= init;       --teste
--	RXerror     <= Perror;     --teste
--	dFlag       <= Flags(0);   --teste
--	pFlag       <= Flags(1);   --teste
end Behavioral;

