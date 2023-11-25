library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
use IEEE.NUMERIC_STD.all;

entity SynchronousRegister_tb is
	generic (n : integer := 4);
end SynchronousRegister_tb;

architecture TB_ARCHITECTURE of SynchronousRegister_tb is	
    component SynchronousRegisterStruct is
        generic (n: integer := 4);
        port (
            Din : in std_logic_vector(n-1 downto 0);
            EN: in std_logic;						   
            CLK : in std_logic;
            Dout: out std_logic_vector(n-1 downto 0)
            );
    end component;
    
    component SynchronousRegisterBeh is
        generic (n: integer := 4);
        port (
            Din : in std_logic_vector(n-1 downto 0);
            EN: in std_logic;                           
            CLK : in std_logic;
            Dout: out std_logic_vector(n-1 downto 0)
            );
    end component;
	
	signal Din : STD_LOGIC_VECTOR(n-1 downto 0) := (others => '0');
	signal EN : STD_LOGIC := '1';
	signal CLK : std_logic := '0';
	
	signal Dout_beh : STD_LOGIC_VECTOR(n-1 downto 0);
	signal Dout_struct : STD_LOGIC_VECTOR(n-1 downto 0);
	
	constant register_size : integer := 4;
	constant clock_period : time := 10 ns;
begin
	
	beh : SynchronousRegisterBeh
	generic map (n => register_size)
	
	port map (
		Din => Din,
		EN => EN,	 
		CLK => CLK,
		Dout => Dout_beh
		);	
	
	struct : SynchronousRegisterStruct
	generic map (n => register_size)
	
	port map (
		Din => Din,
		EN => EN,		   
		CLK => CLK,
		Dout => Dout_struct
		);

	CLK <= not CLK after clock_period;	
	Din <= Din + "1" after clock_period * 2;
	
	enable: process
	begin
		EN <= '1';
		wait for clock_period;
		EN <= '0';
		wait for clock_period * 4;
	end	process;

end TB_ARCHITECTURE;