library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D_Enable_LatchBeh is
	port (
		D, E : in std_logic;
		Q : out std_logic;
		nQ : out std_logic
		);
end D_Enable_LatchBeh;

architecture beh of D_Enable_LatchBeh is
	signal data : std_logic;
begin	
	data <= D when (E = '1');
	Q <= data;
	nQ <= not data;
end beh;