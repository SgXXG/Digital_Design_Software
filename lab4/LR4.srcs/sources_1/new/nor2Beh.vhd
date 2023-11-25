library ieee;
use ieee.std_logic_1164.all;

entity nor2Beh is
	port(
		A, B: in std_logic;
		R: out std_logic
		);
end nor2Beh;

architecture beh of nor2Beh is	
begin
	R <= A nor B;		
end;