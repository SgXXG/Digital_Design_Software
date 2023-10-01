----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 18:09:45
-- Design Name: 
-- Module Name: tb_task2 - Behavioral
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

entity tb_task2 is
--  Port ( );
end tb_task2;

architecture Behavioral of tb_task2 is
Component task2_beh
    Port (
    A, A1, B, B1, S: in std_logic;
    Z, Z1: out std_logic
    );
End Component;

Component task2 
    Port (
    A, A1, B, B1, S: in std_logic;
    Z, Z1: out std_logic
    );
End Component;
signal a: std_logic := '0';
signal b: std_logic := '0';
signal a1: std_logic := '0';
signal b1: std_logic := '0';
signal s: std_logic := '0';

signal z_beh: std_logic;
signal z_str: std_logic;
signal z1_beh: std_logic;
signal z1_str: std_logic;
signal error: std_logic;

constant period: time := 10ns;
begin
    uut_beh: task2_beh port map (A => a, A1 => a1, B => b, B1 => b1, S => s, Z => z_beh);
    uut_str: task2 port map (A => a, A1 => a1, B => b, B1 => b1, S => s, Z => z_str);
    
    uut_beh1: task2_beh port map (A => a, A1 => a1, B => b, B1 => b1, S => s, Z1 => z1_beh);
    uut_str1: task2 port map (A => a, A1 => a1, B => b, B1 => b1, S => s, Z1 => z1_str);
    
    a <= (not a) after period;
    a1 <= (not a1) after 2*period;
    b <= (not b) after 4*period;
    b1 <= (not b1) after 8*period;
    s <= (not s) after 16*period;
    
    error <= (z_beh xor z_str) or (z1_beh xor z1_str);
end Behavioral;
