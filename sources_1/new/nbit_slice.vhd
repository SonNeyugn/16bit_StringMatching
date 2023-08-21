----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 09:46:43 PM
-- Design Name: 
-- Module Name: nbit_slice - Behavioral
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

entity nbit_slice is
--  Port ( );
  generic (
    width : integer := 5
    );
  port (
    clk, P_in, S_in, check_in : in std_logic;
    P_en, S_en, check_en : in std_logic;
    P_reset, S_reset, check_reset : in std_logic;
    p_match : in std_logic;
    match: out std_logic;
    P_reg_out, S_reg_out, check_reg_out, match_reg_out : out std_logic_vector ( (width-1) downto 0 );
    P_port_out, S_port_out, check_port_out : out std_logic
    );
end nbit_slice;   

architecture Behavioral of nbit_slice is
component bit_slice is
--  Port ( );
  port (
    clk, P_in, S_in,check_in : in std_logic;
    P_en, S_en, check_en : in std_logic;
    P_reset, S_reset, check_reset : in std_logic;
    p_match: in std_logic;
    match, P_out, S_out, check_out : out std_logic );
    
end component;

signal P_reg, S_reg, check_reg, match_reg, p_match_reg : std_logic_vector ( (width-1) downto 0 );

begin
slice_0 : bit_slice port map(
  clk => clk,
  P_en => P_en,
  S_en => S_en,
  check_en => check_en,
  P_in => P_in,
  S_in => S_in,
  check_in => check_in,
  P_reset => P_reset,
  S_reset => S_reset,
  check_reset => check_reset,
  p_match => p_match,
  match => match_reg(0),
  P_out => P_reg(0),
  S_out => S_reg(0),
  check_out => check_reg(0)
  
  );
  

slice_gen : for i in 1 to (width - 1) generate
  begin
    slice_i : bit_slice port map (
      clk => clk,
      P_en => P_en,
      S_en => S_en,
      check_en => check_en,
      P_in => P_reg(i-1),
      S_in => S_reg(i-1),
      check_in => check_reg(i-1),
      P_reset => P_reset,
      S_reset => S_reset,
      check_reset => check_reset,
      p_match => match_reg(i-1),
      match => match_reg(i),
      P_out => P_reg(i),
      S_out => S_reg(i),
      check_out => check_reg(i)
      );
  end generate slice_gen;
  
  --match <= match_reg(0) and match_reg(1) and match_reg(2) and match_reg(3) and match_reg(4);
  P_reg_out <= P_reg;
  S_reg_out <= S_reg;
  check_reg_out <= check_reg;
  match_reg_out <= match_reg;
  match <= match_reg(width -1);
  P_port_out <= P_reg(width -1);
  S_port_out <= S_reg(width -1);
  check_port_out <= check_reg(width -1);


end Behavioral;
