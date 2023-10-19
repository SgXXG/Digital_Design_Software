----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2023 12:15:25
-- Design Name: 
-- Module Name: tb_task1 - Behavioral
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

entity tb_task1 is
end tb_task1;

architecture TB_ARCHITECTURE of tb_task1 is	
Component task1
port(
    Q : out STD_LOGIC;
	nQ : out STD_LOGIC);
end Component;
		
signal initialized_Q : STD_LOGIC;
signal initialized_nQ : STD_LOGIC;
	
signal uninitialized_Q : STD_LOGIC;
signal uninitizlied_nQ : STD_LOGIC;

begin	
	initialized : entity task1(initialized)
	port map (
		Q => initialized_Q,
		nQ => initialized_nQ
		);	 
		
	uninitialized : entity task1(uninitialized)
	port map (
		Q => uninitialized_Q,
		nQ => uninitizlied_nQ
		);	
end TB_ARCHITECTURE;
