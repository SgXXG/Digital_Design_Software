----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2023 11:57:14
-- Design Name: 
-- Module Name: task1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity task1 is
	port(
		Q : out STD_LOGIC;
		nQ : out STD_LOGIC
		);
end task1;

architecture uninitialized of task1 is
component inv is
port (
    I: in std_logic;
	O: out std_logic
);
end component;

signal t1: std_logic;  
signal t2: std_logic;

begin	
	U1: inv port map (I => t2, O => t1);
	U2: inv port map (I => t1, O => t2);	  
	nQ <= t1;
	Q <= t2;
end uninitialized;

architecture initialized of task1 is
component INV is
port (
    I: in std_logic;
	O: out std_logic
);
end component;

	signal s1: std_logic;  
	signal s2: std_logic := '0';
begin	
	U1: INV port map (I => s2,O => s1);
	U2: INV port map (I => s1, O => Q);	  
	nQ <= s1;
end initialized;