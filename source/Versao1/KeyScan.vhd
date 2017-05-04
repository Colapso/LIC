----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:53:08 03/26/2017 
-- Design Name: 
-- Module Name:    KeyScanv1 - Structural 
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

entity KeyScan is
    Port ( CLK    : in STD_LOGIC;
	        Kline  : in  STD_LOGIC_VECTOR (3 downto 0);
           Kscan  : in  STD_LOGIC;
			  Kcol   : out  STD_LOGIC_VECTOR( 2 downto 0);
           K      : out  STD_LOGIC_VECTOR (3 downto 0);
           Kpress : out  STD_LOGIC
			  );
end KeyScan;

architecture Structural of KeyScan is

component Contador4bit is
	Port ( CLK : in  STD_LOGIC;
			 RST : in  STD_LOGIC;
	       CE  : in  STD_LOGIC;
			 Q   : out STD_LOGIC_VECTOR (3 downto 0)
			);
end component;

component Decoder is
	port ( DecoderSel : in  STD_LOGIC_VECTOR (1 downto 0);
			 DEC        : out STD_LOGIC_VECTOR (2 downto 0)
	     );
end component;

component Multiplexer4x1 is
	port ( MUX    : in  STD_LOGIC_VECTOR (3 downto 0);
			 MUXSel : in  STD_LOGIC_VECTOR (1 downto 0);
			 Kpress : out STD_LOGIC
	     );
end component;

	signal CountD : STD_LOGIC_VECTOR (1 downto 0);
	signal CountM : STD_LOGIC_VECTOR (1 downto 0);
	
begin
	
	KS0: Contador4bit
		Port map ( CLK => CLK,
		           RST => '0',
					  CE  => Kscan,
					  Q(0)=> CountM(0),
					  Q(1)=> CountM(1),
					  Q(2)=> CountD(0),
					  Q(3)=> CountD(1)
		         );

	KS1: Decoder
		Port map ( DecoderSel => CountD,
					  DEC => Kcol
		         );
	
	KS2: Multiplexer4x1
		Port map ( MUXSel => CountM,
					  Kpress => Kpress,
					  MUX => Kline
		         );		
 
	K(0) <= CountM(0);
	K(1) <= CountM(1);
	K(2) <= CountD(0);
	K(3) <= CountD(1);

end Structural;