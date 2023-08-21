----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2022 08:27:39 PM
-- Design Name: 
-- Module Name: nbit_subtractor_tb - Behavioral
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

entity nbit_subtractor_tb is
--  Port ( );
end nbit_subtractor_tb;

architecture Behavioral of nbit_subtractor_tb is
component nbit_subtractor
    generic (
    width : integer := 4);
  port (
    A, B : in std_logic_vector( (width -1) downto 0 );
    S: out std_logic_vector( (width -1) downto 0 );
    COUT : out std_logic
    );
  end component;
  
  constant bit_width : integer := 4;
  signal t_A, t_B, t_S : std_logic_vector((bit_width-1) downto 0);
  signal t_COUT : std_logic;

  begin

    U1 : nbit_subtractor
      generic map (bit_width)
      port map ( t_A, t_B, t_S, t_COUT );

    test_process : process
    begin
     
      t_A <= "0000";
      t_B <= "0000";
      wait for 80 ns;

      t_A <= "0001";
      t_B <= "1111";
      wait for 80 ns;

      t_A <= "1110";
      t_B <= "0001";
      wait for 80 ns;

      t_A <= "1000";
      t_B <= "0110";
      wait for 80 ns;

      t_A <= "0101";
      t_B <= "0100";
      wait for 80 ns;

      t_A <= "1111";
      t_B <= "1111";
      wait for 80 ns;

      wait;

    end process;


end Behavioral;
