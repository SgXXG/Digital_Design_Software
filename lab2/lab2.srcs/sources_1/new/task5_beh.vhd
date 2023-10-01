----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 23:15:43
-- Design Name: 
-- Module Name: task5_beh - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity task5_beh is
    Port ( A : in STD_LOGIC_VECTOR(4 downto 0);
           Q : out STD_LOGIC);
end task5_beh;

architecture Behavioral of task5_beh is

begin
    Q<= A(0) and A(1) and A(2) and A(3) and A(4);

end Behavioral;
