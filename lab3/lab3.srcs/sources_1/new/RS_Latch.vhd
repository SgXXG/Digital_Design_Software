----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2023 11:57:14
-- Design Name: 
-- Module Name: RS_Latch - Behavioral
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

entity RS_Latch is
	port (
		R,S : in std_logic;
		Q, nQ : out std_logic
		);
end RS_Latch;

architecture struct of RS_Latch is
	component NOR2 is
		port(
			I0, I1: in std_logic;
			O: out std_logic
			);
	end component;
	signal t1, t2 : std_logic;
begin
	U2: NOR2 port map (I0 => R, I1 => t1, O => t2);
	U1: NOR2 port map (I0 => S, I1 => t2, O => t1);
	nQ <= t1;
	Q <= t2;
end struct;

architecture beh of RS_Latch is
	signal t1, t2: std_logic;
begin
	t2 <= R NOR t1;
	t1 <= S NOR t2;
	nQ <= t1;
	Q <= t2;
end beh;

architecture param of RS_Latch is
	signal t1, t2: std_logic;
begin
	t2 <= R NOR t1 after 3 ns;
	t1 <= S NOR t2 after 3 ns;
	nQ <= transport t1 after 2 ns;
	Q <= transport t2 after 3 ns;
end param;