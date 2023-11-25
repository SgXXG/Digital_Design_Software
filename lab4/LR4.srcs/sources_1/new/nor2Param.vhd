library ieee;
use ieee.std_logic_1164.all;

entity nor2Param is
	port(
		A, B: in std_logic;
		R: out std_logic
		);
end nor2Param;

architecture param of nor2Param is	
begin
	R <= A nor B after 4 ns;		
end;