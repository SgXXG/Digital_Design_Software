----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 18:09:45
-- Design Name: 
-- Module Name: tb_task4 - Behavioral
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

entity tb_task4 is
--  Port ( );
end tb_task4;

architecture Behavioral of tb_task4 is
Component task4_beh
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC);
end COMPONENT;

Component task4 
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC);
end COMPONENT;
signal a: std_logic := '0';
signal b: std_logic := '0';
signal s: std_logic := '0';

signal z_beh: std_logic;
signal z_str: std_logic;
signal z1_beh: std_logic;
signal z1_str: std_logic;
signal z2_beh: std_logic;
signal z2_str: std_logic;
signal z3_beh: std_logic;
signal z3_str: std_logic;
signal error: std_logic;

constant period: time := 10ns;
begin
    uut_beh: task4_beh port map (A => a, B => b, S => s, Q0 => z_beh);
    uut_str: task4 port map (A => a, B => b, S => s, Q0 => z_str);
    
    uut_beh1: task4_beh port map (A => a, B => b, S => s, Q1 => z1_beh);
    uut_str1: task4 port map (A => a, B => b, S => s, Q1 => z1_str);
        
    uut_beh2: task4_beh port map (A => a, B => b, S => s, Q2 => z2_beh);
    uut_str2: task4 port map (A => a, B => b, S => s, Q2 => z2_str);
    
    uut_beh3: task4_beh port map (A => a, B => b, S => s, Q3 => z3_beh);
    uut_str3: task4 port map (A => a, B => b, S => s, Q3 => z3_str);
    
    
    a <= (not a) after period;
    b <= (not b) after 2*period;
    s <= (not s) after 4*period;
    
    error <= (z_beh xor z_str) or (z1_beh xor z1_str) or (z2_beh xor z2_str) or (z3_beh xor z3_str);
end Behavioral;
