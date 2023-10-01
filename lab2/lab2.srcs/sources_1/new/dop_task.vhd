----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 23:56:52
-- Design Name: 
-- Module Name: dop_task - Behavioral
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

entity dop_task is
    Generic (N: integer:=5);
    Port ( A : in std_logic_vector(N-1 downto 0);
           Q : out STD_LOGIC);
end dop_task;

architecture Structural of dop_task is

component and2 is
port (
  I0, I1 : in std_logic;
  O : out std_logic
);
end component;

signal X: std_logic_vector(N-2 downto 0);

begin
    GEN_0: AND2 port map (I0 => A(0), I1 => A(1), O => X(0));
    SCH: FOR J in 1 to N-2 GENERATE
        GEN_J: AND2 port map (I0 => X(J-1), I1 => A(J+1), O => X(J));
    End GENERATE;
    Q<=X(N-2);

end Structural;
