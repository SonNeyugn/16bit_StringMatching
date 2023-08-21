----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2022 05:47:45 PM
-- Design Name: 
-- Module Name: decoder_3to8 - Behavioral
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

entity decoder_3to8 is
--  Port ( );
    port (
        Q0, Q1, Q2 : in std_logic;
        S0, S1, S2, S3, S4, S5, S6, S7: out std_logic);
        --result : out std_logic_vector( 7 downto 0)) ;
        
end decoder_3to8;

architecture Behavioral of decoder_3to8 is

signal temp : std_logic_vector( 7 downto 0);


begin
logic : process(Q0, Q1, Q2)
begin
    if (Q2 = '0' and Q1 = '0' and Q0 = '0') then
        temp <= "00000001";
    elsif (Q2 = '0' and Q1 = '0' and Q0 = '1') then
        temp <= "00000010";
    elsif (Q2 = '0' and Q1 = '1' and Q0 = '0') then
        temp <= "00000100";
    elsif (Q2 = '0' and Q1 = '1' and Q0 = '1') then
        temp <= "00001000";
    elsif (Q2 = '1' and Q1 = '0' and Q0 = '0') then
        temp <= "00010000";
    elsif (Q2 = '1' and Q1 = '0' and Q0 = '1') then
        temp <= "00100000";
    elsif (Q2 = '1' and Q1 = '1' and Q0 = '0') then
        temp <= "01000000";     
    elsif (Q2 = '1' and Q1 = '1' and Q0 = '1') then
        temp <= "10000000";         
    end if;
end process;
--result <= temp;
S0 <= temp(0) after 0.509 ns;
S1 <= temp(1) after 0.509 ns;
S2 <= temp(2) after 0.509 ns;
S3 <= temp(3) after 0.509 ns;
S4 <= temp(4) after 0.509 ns;
S5 <= temp(5) after 0.509 ns;
S6 <= temp(6) after 0.509 ns;
S7 <= temp(7) after 0.509 ns;




end Behavioral;
