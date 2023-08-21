----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 04:33:53 PM
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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

entity counter_tb is
--  Port ( );
end counter_tb;



architecture Behavioral of counter_tb is

component counter_nbit is
  generic ( 
    width : integer := 5);
    
--  Port ( );
  port (
    count, clk, reset, en : in std_logic;
    value : out std_logic_vector( (width - 1) downto 0) );
end component;
constant bit_width : integer := 5;
signal t_count, t_clk, t_reset, t_en : std_logic;
signal t_value : std_logic_vector( (bit_width- 1) downto 0);

begin
U : counter_nbit port map(t_count, t_clk, t_reset,t_en, t_value);
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
t_en <= '1';
t_reset <= '1';
t_count <= '0';
wait for 30 ns;

t_reset <= '0';
t_count <= '1';

wait for 100 ns;
t_reset <= '0';
t_count <= '1';
t_en <= '1';

wait;

end process;







end Behavioral;
