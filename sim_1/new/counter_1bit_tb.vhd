----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 05:14:31 PM
-- Design Name: 
-- Module Name: counter_1bit_tb - Behavioral
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

entity counter_1bit_tb is
--  Port ( );
end counter_1bit_tb;

architecture Behavioral of counter_1bit_tb is

component counter_1_bit is
--  Port ( );
  port( 
    count, clk, reset : in std_logic;
    value, Qout, Sout : out std_logic);
end component;

signal t_count, t_clk, t_reset : std_logic;
signal t_value, t_Qout, t_Sout : std_logic;

begin
U : counter_1_bit port map(t_count, t_clk, t_reset, t_value, t_Qout);
c: process
begin
 t_clk <= '0';
 wait for 15ns;
 t_clk <= '1';
 wait for 15ns;
end process;

p: process
begin

wait for 15 ns;
t_reset <= '1';
t_count <= '0';
wait for 30 ns;

t_reset <= '0';
t_count <= '1';

wait;

end process;



end Behavioral;
