----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 06:15:09 PM
-- Design Name: 
-- Module Name: bit_slice - Behavioral
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

entity bit_slice is
--  Port ( );
  port (
    clk, P_in, S_in,check_in : in std_logic;
    P_en, S_en, check_en : in std_logic;
    P_reset, S_reset, check_reset : in std_logic;
    p_match : in std_logic;
    match, P_out, S_out, check_out : out std_logic );
    
end bit_slice;

architecture Behavioral of bit_slice is
component flip_flop is
  port (
    D, clk, reset, D_en : in  std_logic;
    Q, Qbar : out std_logic); 
end component;

signal S0, S1, S2, S3, sP, sS, sCheck : std_logic;

begin

D1 : flip_flop port map (
  D => P_in, 
  clk => clk, 
  reset => P_reset, 
  D_en => P_en, 
  Q => sP,
  Qbar => open
  );
D2 : flip_flop port map (S_in, clk, S_reset, S_en, sS, open);
D3 : flip_flop port map (check_in, clk, check_reset, check_en, sCheck, open);

P_out <= sP;
S_out <= sS;
check_out <= sCheck;

S0 <= sP xnor sS after 0.2075 ns;
S1 <= S0 or (not sCheck) after 0.3995 ns;
match <= S1 and p_match after 0.2355 ns;




end Behavioral;
