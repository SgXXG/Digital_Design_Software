library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegisterStruct is
	generic (N: integer:= 3);
	port(
		Sin, 
		SE, 
		CLK, 
		RST: in std_logic;
		Dout: out std_logic_vector(0 to N-1)
		);
end ShiftRegisterStruct;				  

architecture struct of ShiftRegisterStruct is
	component FDCE is
		port (
			CLK: in std_logic;
			E: in std_logic;
			CLR: in std_logic;
			D: in std_logic;
			Q: out std_logic
			);
	end component;	  					   
	signal outS: std_logic_vector(0 to N-1);
begin			   
	U_0: FDCE 
	port map(
		CLK => CLK, 
		E => SE, 
		CLR => RST, 
		D => Sin,
		Q => outS(0)
		);
	reg: for I in 1 to N-1 generate			
		U_I: FDCE 
		port map (
			CLK => CLK,
			E => SE,
			CLR => RST,
			D => outS(I-1),
			Q => outS(I)
			);
	end generate;				 
	Dout <= outS;
end struct;