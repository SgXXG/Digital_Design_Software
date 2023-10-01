----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 12:26:02
-- Design Name: 
-- Module Name: task2 - Behavioral
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

entity task2 is
    Port ( A : in STD_LOGIC;
           A1 : in STD_LOGIC;
           B : in STD_LOGIC;
           B1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Z : out STD_LOGIC;
           Z1 : out STD_LOGIC);
end task2;

architecture Structural of task2 is

component inv is
port (
  I : in std_logic;
  O : out std_logic
);
end component;

component and2 is
port (
  I0, I1 : in std_logic;
  O : out std_logic
);
end component;

component or2 is
port (
  I0, I1 : in std_logic;
  O : out std_logic
);
end component;

signal SN, ASN, SB, SN1, ASN1, SB1  : std_logic;

begin
  U1: INV port map(I=>S, O=>SN);
  U2: AND2 port map(I0=>A, I1=>SN, O=>ASN);
  U3: AND2 port map(I0=>B, I1=>S, O=>SB);

  U5: AND2 port map(I0=>A1, I1=>SN, O=>ASN1);
  U6: AND2 port map(I0=>B1, I1=>S, O=>SB1);

  U7: OR2 port map (I0=>ASN, I1=>SB, O=>Z);
  U8: OR2 port map (I0=>ASN1, I1=>SB1, O=>Z1);

end Structural;
