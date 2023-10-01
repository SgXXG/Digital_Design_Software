----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 18:09:45
-- Design Name: 
-- Module Name: tb_task1 - Behavioral
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

entity tb_task1 is
--  Port ( );
end tb_task1;

architecture Behavioral of tb_task1 is
Component task1_beh
    Port (
    A, B, S: in std_logic;
    Z: out std_logic
    );
End Component;

Component task1 
    Port (
    A, B, S: in std_logic;
    Z: out std_logic
    );
End Component;
signal a: std_logic := '0';
signal b: std_logic := '0';
signal s: std_logic := '0';

signal z_beh: std_logic;
signal z_str: std_logic;
signal error: std_logic;

constant period: time := 10ns;
begin
    uut_beh: task1_beh port map (A => a, B => b, S => s, Z => z_beh);
    uut_str: task1 port map (A => a, B => b, S => s, Z => z_str);
    
    a <= (not a) after period;
    b <= (not b) after 2*period;
    s <= (not s) after 4*period;
    
    error <= z_beh xor z_str;
end Behavioral;
