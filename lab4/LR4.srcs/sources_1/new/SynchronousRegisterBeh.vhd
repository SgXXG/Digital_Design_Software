library ieee;
use ieee.std_logic_1164.all;

entity SynchronousRegisterBeh is
	generic (n: integer := 4);
	port (
		Din : in std_logic_vector(n-1 downto 0);
		EN: in std_logic;						   
		CLK : in std_logic;
		Dout: out std_logic_vector(n-1 downto 0)
		);
end SynchronousRegisterBeh;

architecture beh of SynchronousRegisterBeh is
	signal result : std_logic_vector(n-1 downto 0);
Begin
	main : process(Din, EN, CLK)
	begin
		if EN = '1' then
			if rising_edge(CLK) then
				result <= Din;
			end if;
		end if;
	end process;
	
	Dout <= result;
End	beh;