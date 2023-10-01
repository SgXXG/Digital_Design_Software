----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.09.2023 16:47:01
-- Design Name: 
-- Module Name: task6_beh - Behavioral
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

entity task6_beh is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           PO : out STD_LOGIC);
end task6_beh;

architecture Behavioral of task6_beh is

signal sum_carry: std_logic;

begin
    S0 <= A0 xor B0;
    sum_carry <= A0 and B0;
    
    S1 <= ((A1 xor B1) and (not sum_carry)) or (sum_carry and (not A1) and (not B1)) or (sum_carry and A1 and B1);
    PO <= (sum_carry and A1) or (sum_carry and B1 and not A1) or (not sum_carry and A1 and B1);

end Behavioral;
