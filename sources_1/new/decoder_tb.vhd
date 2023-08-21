----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2022 06:58:22 PM
-- Design Name: 
-- Module Name: decoder_tb - Behavioral
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

entity decoder_tb is
--  Port ( );
end decoder_tb;

architecture Behavioral of decoder_tb is
component decoder_3to8 is
--  Port ( );
    port (
        Q0, Q1, Q2 : in std_logic;
        S0, S1, S2, S3, S4, S5, S6, S7 : out std_logic);
        --result : out std_logic_vector( 7 downto 0)) ;
        
end component;

signal Q0, Q1, Q2, S0, S1, S2, S3, S4, S5, S6, S7 : std_logic;

begin
U : decoder_3to8 port map (Q0, Q1, Q2, S0, S1, S2, S3, S4, S5, S6, S7);

p1 : process
begin
Q2 <= '0';
Q1 <= '0';
Q0 <= '0';

wait for 15 ns;

Q2 <= '0';
Q1 <= '0';
Q0 <= '1';

wait for 15 ns;

Q2 <= '0';
Q1 <= '1';
Q0 <= '0';

wait for 15 ns;

Q2 <= '0';
Q1 <= '1';
Q0 <= '1';

wait for 15 ns;

Q2 <= '1';
Q1 <= '0';
Q0 <= '0';

wait for 15 ns;

wait;

end process;


end Behavioral;
