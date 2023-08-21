----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2022 06:19:16 PM
-- Design Name: 
-- Module Name: nbit_mux2to1_tb - Behavioral
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

entity nbit_mux2to1_tb is
--  Port ( );
end nbit_mux2to1_tb;

architecture Behavioral of nbit_mux2to1_tb is
component nbit_mux_2to1 is
--  Port ( );
    generic (
        width : integer := 5
        );
    port (
    
    A,B: in std_logic_vector( (width-1) downto 0);
    S: in std_logic;
    C: out std_logic_vector( (width-1) downto 0)
    );
    
end component;

constant bit_width : integer := 5;
signal A, B :  std_logic_vector( (bit_width-1) downto 0 );
signal S: std_logic;
signal C : std_logic_vector( (bit_width -1) downto 0 );
begin
U : nbit_mux_2to1 generic map(bit_width) port map (A, B, S, C);

test_process : process 
    begin
     
      A <= "00111";
      B <= "11001";
      
      S <= '1';

      wait for 80 ns;
      
      A <= "00111";
      B <= "11001";

      S <= '0';

      wait for 80 ns;
      
      A <= "00111";
      B <= "11001";

      S <= '1';

      wait for 80 ns;

      wait;

    end process;





end Behavioral;
