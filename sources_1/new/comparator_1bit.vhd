----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2022 12:34:56 AM
-- Design Name: 
-- Module Name: comparator_1bit - Behavioral
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

entity comparator_1bit is
--  Port ( );
    port (
        In1, In2, p_Equal : in std_logic;
        Equal : out std_logic
        );
end comparator_1bit;

architecture Behavioral of comparator_1bit is

signal temp : std_logic;

begin

temp <= In1 xnor In2;
Equal <= temp and p_Equal after 0.492 ns;

end Behavioral;
