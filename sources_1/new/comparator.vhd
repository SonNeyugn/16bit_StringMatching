----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2022 11:57:44 PM
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
--  Port ( );
    generic (
        width : integer := 5
        );
        
    port (
        In1, In2: in std_logic_vector( (width-1) downto 0 );
        Equal : out std_logic
        --output : out std_logic_vector( (width-1) downto 0 )
        );
end comparator;

architecture Behavioral of comparator is

component comparator_1bit is
--  Port ( );
    port (
        In1, In2, p_Equal : in std_logic;
        Equal : out std_logic
        );
end component;

signal eq : std_logic_vector( (width-1) downto 0 );
signal temp: std_logic;
begin
    temp <= In1(0) xnor In2(0);
    eq(0) <= temp and '1';
    --output(0) <= eq(0);
    p1: for i in 1 to (width -1) generate
        begin
            comparator_i : comparator_1bit port map(
            In1 => In1(i),
            In2 => In2(i),
            p_Equal => eq(i-1),
            Equal => eq(i)
            );
        end generate p1;
        
    --process is 
    --begin
    --    for i in 0 to (width-1) loop
    --        temp_result <= temp_result and eq(i);
    --    end loop;
    --    wait;
    --end process;
--Equal <= temp_result;
    Equal <= eq(width-1);
        

end Behavioral;
