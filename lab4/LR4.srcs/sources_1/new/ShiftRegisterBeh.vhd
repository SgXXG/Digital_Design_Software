library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegisterBeh is
	generic (N: integer:= 3);
	port(
		Sin, 
		SE, 
		CLK, 
		RST: in std_logic;
		Dout: out std_logic_vector(0 to N-1)
		);
end ShiftRegisterBeh;				  

architecture beh of ShiftRegisterBeh is
	signal register_state: std_logic_vector(0 to N-1);
begin
	main: process (CLK, RST, Sin, SE)
	begin
		if RST = '1' then
			register_state <= (others => '0');
		elsif rising_edge(CLK) then
			if SE = '1' then
				register_state <= Sin & register_state(0 to N-2);
			end if;
		end if;
	end process;	
	
	Dout <= register_state; 
end beh;