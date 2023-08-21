----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2022 04:56:11 PM
-- Design Name: 
-- Module Name: chip_tb - Behavioral
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

entity chip_tb is
--  Port ( );
end chip_tb;

architecture Behavioral of chip_tb is
component chip is
--  Port ( );
    generic (
        width : integer := 5
        );
    port (
        clk, P_in, S_in,  T, R, S : in std_logic;
        N, L: in std_logic_vector( (4) downto 0);
        result : out std_logic;
        index : out std_logic_vector( 4 downto 0);
        Q2, Q1, Q0 : out std_logic;
        test_reg : out std_logic_vector( 4 downto 0);
        test_reg2 : out std_logic_vector( 4 downto 0);
        P_port_out, S_port_out, check_port_out: out std_logic;
        P_reg_out, S_reg_out, check_reg_out: out std_logic_vector ( (width-1) downto 0 )
        
        );
end component;

constant bit_width : integer := 8;
signal clk, P_in, S_in,  T, R, S , result,  Q2, Q1, Q0, P_port_out, S_port_out, check_port_out: std_logic;
signal N, L: std_logic_vector( (4) downto 0);
signal index, test_reg, test_reg2 : std_logic_vector( 4 downto 0);
signal P_reg_out, S_reg_out, check_reg_out: std_logic_vector ( (bit_width-1) downto 0 );
begin

test_chip : chip
    generic map ( bit_width)
    port map 
    ( clk, P_in, S_in,  T, R, S, N, L, result, index,  Q2, Q1, Q0, test_reg, test_reg2, P_port_out, S_port_out, check_port_out, P_reg_out, S_reg_out, check_reg_out);

c: process
begin
 clk <= '0';
 wait for 30ns;
 clk <= '1';
 wait for 30ns;
end process;

p: process
begin

wait for 30 ns;
N <= "00111";
L <= "00011";
T <= '0';
S <= '0';
R <= '1';

wait for 60 ns;
S <= '1'; R <= '0'; T <= '0';
--1
wait for 60 ns;
P_in <= '1';
S_in <= '0';
--2
wait for 60 ns;
P_in <= '1';
S_in <= '0';
--3
wait for 60 ns;
P_in <= '0';
S_in <= '0';
--4
wait for 60 ns;
P_in <= '1';
S_in <= '0';
--5
wait for 60 ns;
P_in <= '0';
S_in <= '0';
--6
wait for 60 ns;
P_in <= '1';
S_in <= '0';
--7
wait for 60 ns;
P_in <= '1';
S_in <= '0';
--8
wait for 60 ns;
P_in <= '0';
S_in <= '0';

wait for 60 ns;
P_in <= '0';
S_in <= '1';

wait for 60 ns;
P_in <= '-';
S_in <= '1';

wait for 60 ns;
P_in <= '-';
S_in <= '0';

wait for 60 ns;
P_in <= '-';
S_in <= '1';

wait for 540 ns;
R <= '1';

N <= "00111";
L <= "00111";
T <= '0';
S <= '0';

wait for 120 ns;
S <= '1'; R <= '0'; T <= '0';

wait for 60 ns;
P_in <= '1';
S_in <= '0';

wait for 60 ns;
P_in <= '1';
S_in <= '0';

wait for 60 ns;
P_in <= '0';
S_in <= '0';

wait for 60 ns;
P_in <= '1';
S_in <= '0';

wait for 60 ns;
P_in <= '0';
S_in <= '0';

wait for 60 ns;
P_in <= '1';
S_in <= '1';

wait for 60 ns;
P_in <= '1';
S_in <= '1';

wait for 60 ns;
P_in <= '0';
S_in <= '0';

------S-----------
wait for 60 ns;
P_in <= '1';
S_in <= '1';

wait for 60 ns;
P_in <= '1';
S_in <= '1';

wait for 60 ns;
P_in <= '0';
S_in <= '0';

wait for 60 ns;
P_in <= '1';
S_in <= '1';

wait for 60 ns;
P_in <= '0';
S_in <= '0';

wait for 60 ns;
P_in <= '1';
S_in <= '1';

wait for 60 ns;
P_in <= '1';
S_in <= '1';

wait for 60 ns;
P_in <= '0';
S_in <= '0';

---------
wait for 120 ns;
R <= '1';

N <= "00111";
L <= "00010";
T <= '0';
S <= '0';

wait for 120 ns;
S <= '1'; R <= '0'; T <= '0';

wait for 60 ns;
P_in <= '1';
S_in <= '0';

wait for 60 ns;
P_in <= '1';
S_in <= '0';

wait for 60 ns;
P_in <= '0';
S_in <= '0';

wait for 60 ns;
P_in <= '1';
S_in <= '0';

wait for 60 ns;
P_in <= '0';
S_in <= '0';

wait for 60 ns;
P_in <= '1';
S_in <= '1';

wait for 60 ns;
P_in <= '1';
S_in <= '1';

wait for 60 ns;
P_in <= '0';
S_in <= '0';

------S-----------
wait for 60 ns;
P_in <= '1';
S_in <= '0';

wait for 60 ns;
P_in <= '1';
S_in <= '0';

wait for 60 ns;
P_in <= '0';
S_in <= '0';





wait;

end process;

    
    

end Behavioral;
