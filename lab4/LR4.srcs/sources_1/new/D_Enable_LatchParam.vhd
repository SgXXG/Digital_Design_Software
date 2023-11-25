library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D_Enable_LatchParam is
	port (
		D, E : in std_logic;
		Q : out std_logic;
		nQ : out std_logic
		);
end D_Enable_LatchParam;

architecture param of D_Enable_LatchParam is
	signal data : std_logic;
begin
	data <= D when (E = '1');
	Q <= data after 2 ns;
	nQ <= not data after 3 ns;
end param;