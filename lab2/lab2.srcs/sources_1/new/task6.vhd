----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.09.2023 16:47:01
-- Design Name: 
-- Module Name: task6 - Behavioral
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

entity task6 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           PI : in STD_LOGIC;
           S : out STD_LOGIC;
           PO : out STD_LOGIC);
end task6;

architecture Structural of task6 is
Component INV
    Port (
    I: in std_logic;
    O: out std_logic
    );
End Component;

Component AND3
    Port (
    I0, I1, I2: in std_logic;
    O: out std_logic
    );
End Component;

Component OR4 
    Port (
    I0, I1, I2, I3: in std_logic;
    O: out std_logic
    );
End Component;

Component OR3
    Port (
    I0, I1, I2: in std_logic;
    O: out std_logic
    );
End Component;

Component AND2
    Port (
    I0, I1: in std_logic;
    O: out std_logic
    );
End Component;

signal A_inv, B_inv, PI_inv: std_logic;
signal s_and00, s_and01, s_and02, s_and03: std_logic;
signal s_and10, s_and11, s_and12: std_logic;
begin
    U1: INV port map (I => A, O => A_inv);
    U2: INV port map (I => B, O => B_inv);
    U3: INV port map (I => PI, O => PI_inv);
    
    U4: AND3 port map (I0 => PI_inv, I1 => A_inv, I2 => B, O => s_and00);
    U5: AND3 port map (I0 => PI_inv, I1 => A, I2 => B_inv, O => s_and01);
    U6: AND3 port map (I0 => PI, I1 => A_inv, I2 => B_inv, O => s_and02);
    U7: AND3 port map (I0 => PI, I1 => A, I2 => B, O => s_and03);
    U8: OR4 port map (I0 => s_and00, I1 => s_and01, I2 => s_and02, I3 => s_and03, O => S);
    
    U9: AND3 port map (I0 => PI, I1 => A_inv, I2 => B, O => s_and10);
    U10: AND3 port map (I0 => PI_inv, I1 => A, I2 => B, O => s_and11);
    U11: AND2 port map (I0 => PI, I1 => A, O => s_and12);
    U12: OR3 port map (I0 => s_and10, I1 => s_and11, I2 => s_and12, O => PO);
end Structural;
