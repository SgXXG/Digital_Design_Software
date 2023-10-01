----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 18:09:45
-- Design Name: 
-- Module Name: tb_task3 - Behavioral
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

entity tb_task3 is
--  Port ( );
end tb_task3;

architecture Behavioral of tb_task3 is
Component task3_beh
    Port ( W : in STD_LOGIC;
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Z : in STD_LOGIC;
           G : out STD_LOGIC);
end COMPONENT;

Component task3 
    Port ( W : in STD_LOGIC;
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Z : in STD_LOGIC;
           G : out STD_LOGIC);
end COMPONENT;
signal w: std_logic := '0';
signal x: std_logic := '0';
signal y: std_logic := '0';
signal z: std_logic := '0';

signal z_beh: std_logic;
signal z_str: std_logic;
signal error: std_logic;

constant period: time := 10ns;
begin
    uut_beh: task3_beh port map (W => w, X => x, Y => y, Z => z, G => z_beh);
    uut_str: task3 port map (W => w, X => x, Y => y, Z => z, G => z_str);
    
    
    w <= (not w) after period;
    x <= (not x) after 2*period;
    y <= (not y) after 4*period;
    z <= (not z) after 8*period;
    
    error <= z_beh xor z_str;
end Behavioral;
