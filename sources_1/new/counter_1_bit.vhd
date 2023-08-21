----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 03:37:06 PM
-- Design Name: 
-- Module Name: counter_1_bit - Behavioral
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

entity counter_1_bit is
--  Port ( );
  port( 
    count, clk, reset : in std_logic;
    value, Qout, Sout : out std_logic);
end entity counter_1_bit;


architecture Behavioral of counter_1_bit is

component flip_flop is
  port (
    D, clk, reset : in  std_logic;
    Q, Qbar : out std_logic);
end component flip_flop;

signal S, Q, Qbar: std_logic;

begin


U1 : flip_flop port map(S, clk, reset, Q, Qbar);
S <= count xor Qbar;
value <= Qbar;
Qout <= Q;
Sout <= S;


end Behavioral;
