library ieee;
use ieee.std_logic_1164.all;

entity AsynchronousRegisterBeh is
	generic (n: integer := 4);
	port (
		Din : in std_logic_vector(n-1 downto 0);
		EN: in std_logic;
		Dout: out std_logic_vector(n-1 downto 0)
		);
end AsynchronousRegisterBeh;

architecture beh of AsynchronousRegisterBeh is
Begin	
	Dout <= Din when EN = '1';
End	beh;