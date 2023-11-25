library ieee;
use ieee.std_logic_1164.all;	

entity ShiftRegister_tb is	
	generic(
		N : INTEGER := 3 );
end ShiftRegister_tb;

architecture TB_ARCHITECTURE of ShiftRegister_tb is	
	component ShiftRegisterBeh
		generic(
			N : INTEGER := 3 );
		port(
			Sin : in STD_LOGIC;
			SE : in STD_LOGIC;
			CLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			Dout : out STD_LOGIC_VECTOR(0 to N-1) );
	end component;
	
	component ShiftRegisterStruct
        generic(
            N : INTEGER := 3 );
        port(
            Sin : in STD_LOGIC;
            SE : in STD_LOGIC;
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            Dout : out STD_LOGIC_VECTOR(0 to N-1) );
    end component;
	
	signal Sin : STD_LOGIC := '0';
	signal SE : STD_LOGIC := '1';
	signal CLK : STD_LOGIC := '0';
	signal RST : STD_LOGIC;
	
	signal Dout_beh : STD_LOGIC_VECTOR(0 to N-1);
	signal Dout_struct : STD_LOGIC_VECTOR(0 to N-1);
	
	constant clock_period : time := 10 ns;
begin
	beh : ShiftRegisterBeh
	generic map (
		N => N
		)
	
	port map (
		Sin => Sin,
		SE => SE,
		CLK => CLK,
		RST => RST,
		Dout => Dout_beh
		);
		
	struct : ShiftRegisterStruct
	generic map (
		N => N
		)
	
	port map (
		Sin => Sin,
		SE => SE,
		CLK => CLK,
		RST => RST,
		Dout => Dout_struct
		);
	
	reset: process
	begin
		RST <= '1';
		wait for clock_period;
		RST <= '0';
		wait for clock_period * (N + 1) * 2;
	end process;
	
	CLK <= not CLK after clock_period;
	Sin <= not Sin after clock_period;
	SE <= not SE after clock_period * (N + 1) * 2;	
end TB_ARCHITECTURE;