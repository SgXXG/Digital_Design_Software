----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 18:09:45
-- Design Name: 
-- Module Name: tb_task6 - Behavioral
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

entity tb_task6 is
--  Port ( );
end tb_task6;

architecture Behavioral of tb_task6 is
Component task6
    Port (
    A0, A1, B0, B1: in std_logic;
    S0, S1, PO: out std_logic
    );
End Component;

Component task6_beh
    Port (
    A0, A1, B0, B1: in std_logic;
    S0, S1, PO: out std_logic
    );
End Component;

signal A0: std_logic := '0';
signal A1: std_logic := '0';
signal B0: std_logic := '0';
signal B1: std_logic := '0';
   
signal S0_str: std_logic;
signal S1_str: std_logic;
signal PO_str: std_logic;
    
signal S0_beh: std_logic;
signal S1_beh: std_logic;
signal PO_beh: std_logic;
    
signal error: std_logic;
constant period: time := 10ns;

begin
    uut_str: task6 port map (A0 => A0, A1 => A1, B0 => B0, B1 => B1, S0 => S0_str, S1 => S1_str, PO => PO_str);
    uut_beh: task6_beh port map (A0 => A0, A1 => A1, B0 => B0, B1 => B1, S0 => S0_beh, S1 => S1_beh, PO => PO_beh);
    
    A1 <= not A1 after period;
    B1 <= not B1 after 2*period;
    A0 <= not A0 after 4*period;
    B0 <= not B0 after 8*period;

    error <= (S0_str xor S0_beh) or (S1_str xor S1_beh) or (PO_str xor PO_beh);

end Behavioral;
