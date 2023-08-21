----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2022 12:11:15 AM
-- Design Name: 
-- Module Name: comparator_tb - Behavioral
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

entity comparator_tb is
--  Port ( );
end comparator_tb;

architecture Behavioral of comparator_tb is
component comparator is
--  Port ( );
    generic (
        width : integer := 5
        );
        
    port (
        In1, In2 : in std_logic_vector( (width-1) downto 0 );
        Equal : out std_logic
        --output : out std_logic_vector( (width-1) downto 0 )
        );
end component;

constant bit_width : integer := 5;
signal In1, In2: std_logic_vector((bit_width-1) downto 0);
signal Equal : std_logic;
begin

U : comparator generic map(bit_width) port map(In1, In2, Equal);

test_process : process
    begin
     
      In1 <= "00000";
      In2 <= "00000";
      wait for 80 ns;

      In1 <= "00010";
      In2 <= "11110";
      wait for 80 ns;

      In1 <= "11100";
      In2 <= "11100";
      wait for 80 ns;

      In1 <= "00101";
      In2 <= "00101";
      wait for 80 ns;

      In1 <= "01010";
      In2 <= "01000";
      wait for 80 ns;

      In1 <= "11111";
      In2 <= "11111";
      wait for 80 ns;

      wait;

    end process;



end Behavioral;
