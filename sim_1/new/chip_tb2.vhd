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

entity chip_tb2 is
--  Port ( );
end chip_tb2;

architecture Behavioral of chip_tb2 is
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

constant bit_width : integer := 16;
signal clk, P_in, S_in,  T, R, S , result,  Q2, Q1, Q0, P_port_out, S_port_out, check_port_out: std_logic;
signal N, L: std_logic_vector( (4) downto 0);
signal index, test_reg, test_reg2 : std_logic_vector( 4 downto 0);
signal P_reg_out, S_reg_out, check_reg_out, P_vector, S_vector: std_logic_vector ( (bit_width-1) downto 0 );

begin

test_chip : chip
    generic map ( bit_width)
    port map 
    ( clk, P_in, S_in,  T, R, S, N, L, result, index,  Q2, Q1, Q0, test_reg, test_reg2, P_port_out, S_port_out, check_port_out, P_reg_out, S_reg_out, check_reg_out);

c: process
begin
 clk <= '0';
 wait for 5ns;
 clk <= '1';
 wait for 5ns;
end process;

p: process
begin


---Test Vect 1----
--P_vector <= "0000111110011111";
--S_vector <= "0000000000000011";

---Test Vect 2----
--P_vector <= "0000000000000001";
--S_vector <= "0000000000000001";

---Test Vect 3----
--P_vector <= "1001110101001101";
--S_vector <= "1001110101001101";

---Test Vect 4----
--P_vector <= "1001110101001101";
--S_vector <= "0001110101001001";

---Test Vect 5----
P_vector <= "1001110101001101";
S_vector <= "0000000000011111";

---Test Vect 6----
--P_vector <= "1001110101001101";
--S_vector <= "1001110101001101";


wait for 5 ns;
N <= "01111";
L <= "00100";
-- L is 00011, 00000, 01111, 01111, 00100 for test vector 1 to 5 respectively
T <= '0';
S <= '0';
R <= '1';

wait for 10 ns;
S <= '1'; R <= '0'; T <= '0';
wait for 10 ns;
for i in 0 to 15 loop
    P_in <= P_vector(i);
    S_in <= '0';
    wait for 10ns;
end loop;

P_in <= '0';


for i in 0 to 4 loop
   S_in <= S_vector(i);
   wait for 10ns;
end loop;

S_in <= '0';

----For test mode simulation-------------
--for i in 0 to 15 loop
--    P_in <= P_vector(i);
--   S_in <= S_vector(i);
--   wait for 10ns;
--end loop;



wait;

end process;

    
    

end Behavioral;
