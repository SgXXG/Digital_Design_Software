----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 13:53:54
-- Design Name: 
-- Module Name: task3 - Behavioral
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

entity task3 is
    Port ( W : in STD_LOGIC;
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Z : in STD_LOGIC;
           G : out STD_LOGIC);
end task3;

architecture Structural of task3 is

component and2 is
port (
  I0, I1 : in std_logic;
  O : out std_logic
);
end component;

component and3 is
port (
  I0, I1, I2 : in std_logic;
  O : out std_logic
);
end component;

component or2 is
port (
  I0, I1 : in std_logic;
  O : out std_logic
);
end component;

signal WXY, YZ  : std_logic;

begin
    U1: AND3 port map (I0=>W, I1=>X, I2=>Y, O=>WXY);
    U2: AND2 port map (I0=>Y, I1=>Z, O=>YZ);
    U3: OR2 port map (I0=>WXY, I1=>YZ, O=>G);

end Structural;
