----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 06:47:25 PM
-- Design Name: 
-- Module Name: bit_slice_tb - Behavioral
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

entity bit_slice_tb is
--  Port ( );
end bit_slice_tb;

architecture Behavioral of bit_slice_tb is
component bit_slice is
--  Port ( );
  port (
    clk, P_in,S_in,check_in : in std_logic;
    P_en, S_en, check_en : in std_logic;
    P_reset, S_reset, check_reset : in std_logic;
    match, P_out, S_out, check_out : out std_logic );
    
end component;
signal clk, P_in,S_in,check_in, P_en, S_en, check_en, P_reset, S_reset, check_reset : std_logic;
signal match, P_out, S_out, check_out : std_logic;
begin

U : bit_slice port map(clk, P_in,S_in,check_in, P_en, S_en, check_en, P_reset, S_reset, check_reset, match, P_out, S_out, check_out);
c: process
begin
 clk <= '0';
 wait for 15ns;
 clk <= '1';
 wait for 15ns;
end process;

p: process
begin

wait for 15 ns;
P_reset <= '1'; S_reset <= '1'; check_reset <= '1';
wait for 30 ns;
P_reset <= '0'; S_reset <= '0'; check_reset <= '0';
P_en <= '1'; S_en <= '1'; check_en <= '1';
P_in <= '1';
S_in <= '1';
check_in <= '1';
wait for 30 ns;
P_in <= '1';
S_in <= '0';
check_in <= '1';

wait for 30 ns;
P_in <= '0';
S_in <= '0';
check_in <= '0';

wait for 30 ns;
P_in <= '1';
S_in <= '0';
check_in <= '1';

wait for 30 ns;
P_in <= '0';
S_in <= '0';
check_in <= '0';

wait;

end process;







end Behavioral;
