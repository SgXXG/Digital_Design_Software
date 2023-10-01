----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 18:09:45
-- Design Name: 
-- Module Name: tb_task5 - Behavioral
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

entity tb_task5 is
--  Port ( );
end tb_task5;

architecture Behavioral of tb_task5 is
Component task5_beh
    Port ( A : in STD_LOGIC_VECTOR(4 downto 0);
           Q : out STD_LOGIC);
end COMPONENT;

Component task5 
    Port ( A : in STD_LOGIC_VECTOR(4 downto 0);
           Q : out STD_LOGIC);
end COMPONENT;
signal A: std_logic_vector(4 downto 0) := "00000";

signal z_beh: std_logic;
signal z_str: std_logic;
signal error: std_logic;

constant period: time := 10ns;
begin
    uut_beh: task5_beh port map (A => A, Q => z_beh);
    uut_str: task5 port map (A => A, Q => z_str);    
    
    A(0) <= (not A(0)) after period;
    A(1) <= (not A(1)) after period;
    A(2) <= (not A(2)) after period;
    A(3) <= (not A(3)) after period;
    A(4) <= (not A(4)) after period;
    
    error <= z_beh xor z_str;
end Behavioral;
