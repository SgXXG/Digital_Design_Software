----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 23:15:43
-- Design Name: 
-- Module Name: task5 - Behavioral
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

entity task5 is
    Port ( A : in std_logic_vector(4 downto 0);
           Q : out STD_LOGIC);
end task5;

architecture Structural of task5 is

component and2 is
port (
  I0, I1 : in std_logic;
  O : out std_logic
);
end component;

signal X: std_logic_vector(3 downto 0);

begin
    GEN_0: AND2 port map (I0 => A(0), I1 => A(1), O => X(0));
    SCH: FOR J in 1 to 3 GENERATE
        GEN_J: AND2 port map (I0 => X(J-1), I1 => A(J+1), O => X(J));
    End GENERATE;
    Q<=X(3);    

end Structural;
