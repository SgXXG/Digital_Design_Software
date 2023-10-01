----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 16:10:51
-- Design Name: 
-- Module Name: task4 - Behavioral
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

entity task4 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC);
end task4;

architecture Structural of task4 is

component inv is
port (
    I : in std_logic;
    O : out std_logic
);
end component;

component and3 is
port (
  I0, I1, I2 : in std_logic;
  O : out std_logic
);
end component;

signal AN, BN : std_logic;

begin
  U1: INV port map (I=>A, O=>AN);
  U2: INV port map (I=>B, O=>BN);
   
  U3: AND3 port map(I0=>AN, I1=>BN, I2=>S, O=>Q0);
  U4: AND3 port map(I0=>AN, I1=>B, I2=>S, O=>Q1);
  U5: AND3 port map(I0=>A, I1=>BN, I2=>S, O=>Q2);
  U6: AND3 port map(I0=>A, I1=>B, I2=>S, O=>Q3);

end Structural;
