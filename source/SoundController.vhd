----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:27:03 05/18/2017 
-- Design Name: 
-- Module Name:    SoundController - Behavioral 
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

entity SoundController is
    Port ( CLK : in STD_LOGIC;
			  Dval : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (3 downto 0);
           Play : out  STD_LOGIC;
           sid : out  STD_LOGIC_VECTOR (1 downto 0);
           vol : out  STD_LOGIC_VECTOR (1 downto 0);
           done : out  STD_LOGIC);
end SoundController;

architecture Structural of SoundController is
signal data : STD_LOGIC_VECTOR(1 downto 0);
signal enable : STD_LOGIC_VECTOR(1 downto 0);
signal PEN : STD_LOGIC;
signal PCLR : STD_LOGIC;
component SoundControl is
	Port(	 CLK  : in STD_LOGIC;
			 Dval : in  STD_LOGIC;
          Din  : in  STD_LOGIC_VECTOR(3 downto 0);
			 Play	: out STD_LOGIC;
			 Stop : out STD_LOGIC;
			 ENsid  : out STD_LOGIC;
          ENvol  : out STD_LOGIC;
			 d		: out STD_LOGIC_VECTOR(1 downto 0);
          done : out STD_LOGIC
			 );
end component;

component Register_2bit is
	Port( 	CLK: in STD_LOGIC;
			  D : in  STD_LOGIC_VECTOR (1 downto 0);
           Q : out  STD_LOGIC_VECTOR (1 downto 0);
           EN : in  STD_LOGIC
			  );
end component;
component register_D_E_R is
	generic ( WIDTH : POSITIVE :=1);
   port ( CLK : in  STD_LOGIC;
			 RST : in  STD_LOGIC;
          EN  : in  STD_LOGIC;
			 D   : in  STD_LOGIC_VECTOR (WIDTH-1 downto 0);
          Q   : out STD_LOGIC_VECTOR (WIDTH-1 downto 0)
			 );
end component;

begin

	SC: SoundControl
		Port map(CLK => CLK,
			 Dval => Dval,
          Din => Din,
			 Play	=> PEN,
			 Stop => PCLR,
			 ENsid => enable(0),
			 ENvol => enable(1),
			 d	=> data,
          done => done);
	Rsid: Register_2bit
		Port map(CLK	=>	CLK,
					EN		=> enable(0),
					D		=> data,
					Q	=> sid);
	Rvol: Register_2bit
		Port map(CLK	=>	CLK,
					EN		=> enable(1),
					D		=> data,
					Q	=> vol);
	Rplay: register_D_E_R
		Port map(CLK => CLK,
					RST => PCLR,
					EN	 => PEN,
					D(0)	 => '1',
					Q(0)	 => Play		
		);
end Structural;

