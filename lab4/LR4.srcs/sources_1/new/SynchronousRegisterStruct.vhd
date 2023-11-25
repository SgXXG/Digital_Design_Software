library ieee;
use ieee.std_logic_1164.all;

entity SynchronousRegisterStruct is
	generic (n: integer := 4);
	port (
		Din : in std_logic_vector(n-1 downto 0);
		EN: in std_logic;						   
		CLK : in std_logic;
		Dout: out std_logic_vector(n-1 downto 0)
		);
end SynchronousRegisterStruct;

architecture struct of SynchronousRegisterStruct is
	component D_FlipFlop
		port (
			D, E, CLK : in std_logic;
			Q : out std_logic
			);
	end component;	
Begin
	reg: for i in n-1 downto 0 generate
		U_J: D_FlipFlop port map(
			D => Din(i),
			E => EN,
			CLK => CLK,
			Q => Dout(i)
			);
	end generate;	
End struct;