----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2022 06:03:03 PM
-- Design Name: 
-- Module Name: fsm_hc - Behavioral
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

entity fsm_hc is
--  Port ( );
    port (
        clk, S, R, E, T, M : in std_logic;
        --N, L, P_in, S_in : in std_logic;
        result : out std_logic;
        compare_1, compare_0, reset_count, count_up: out std_logic;
        P_en, S_en, check_en, reset_P, reset_S, reset_check, check_in : out std_logic;
        Q2_out, Q1_out, Q0_out : out std_logic
        );
end fsm_hc;

architecture Behavioral of fsm_hc is
component decoder_3to8 is
--  Port ( );
    port (
        Q0, Q1, Q2 : in std_logic;
        S0, S1, S2, S3, S4, S5, S6, S7 : out std_logic);
        
end component;

component flip_flop is
  port (
    D, clk, reset, D_en : in  std_logic;
    Q, Qbar : out std_logic); 
end component;

signal Q0, Q1, Q2, S0, S1, S2, S3, S4, S5, S6 : std_logic;
signal D0, D1, D2 : std_logic;

begin

decoder : decoder_3to8 port map ( Q0, Q1, Q2, S0, S1, S2, S3, S4, S5, S6, open);
FF0 : flip_flop port map(
    D => D0,
    clk => clk,
    reset => R,
    D_en => '1',
    Q => Q0,
    Qbar => open
    );
FF1 : flip_flop port map(
    D => D1,
    clk => clk,
    reset => R,
    D_en => '1',
    Q => Q1,
    Qbar => open
    );
FF2 : flip_flop port map(
    D => D2,
    clk => clk,
    reset => R,
    D_en => '1',
    Q => Q2,
    Qbar => open
    );

D2 <= (S0 and T) or (S3 and (not R) and (M or E)) or ( (not R) and (S4 or S5 or S6)) after 0.56 ns;
D1 <= (S0 and T ) or ((not R) and ((S1 and E) or S2 or  (S3 and (not E) and (not M)) or S6)) after 0.56 ns;
D0 <= (S0 and S and (not T)) or ( (not R) and ( (S1 and (not E)) or (S3 and ( not M)) or S5 or (S2 and E) )) after 0.56 ns;
compare_0 <= (not R) and (  S2 ) after 0.56 ns;
compare_1 <= S3  after 0.56 ns;
--reset_count <= ((S1 or S2) and (not R) and E) or (R) or (S0 and (not S) and (not T)) after 1 ns; temporarily
reset_count <= ((S1 or S2) and E) or (R) or (S0 and (not S) and (not T)) after 0.56 ns;

--count_up <= ((not R) and (not E) and ( S1 or S2 or S3 )) or ( S0 and S and (not T)) after 1 ns; First report
count_up <= ((not R) and (not E) and ( S1 or S2 or (S3 and (not M) ) )) or ( S0 and S and (not T)) after 0.56 ns; -- Updated

result <= S4;
--P_en <= (S0 and S  ) or ( (not R) and ( (S1) or (S6 and (not R)))) or T after 1 ns;
P_en <= (S0 and S  ) or ( (not R) and ( (S1) or S6)) or T after 0.56 ns;
--S_en <= (S0 and S  ) or (not(R) and ( (S1 and (not E)) or (S2 and (not E)) or (S3 and (not E) and (not M)) or S6)) or T after 1 ns;
S_en <= (S0 and S  ) or (not(R) and ( S1 or S2 or (S3 and (not E) and (not M)) or S6)) or T after 0.56 ns;
--check_en <= (S0 and S  ) or (not(R) and ((S1 and (not E)) or (S2 and (not E)) or (S3 and (not E) and (not M)) or S6)) or T after 1 ns;
check_en <= (S0 and S  ) or (not(R) and ( (S1 or S2) or (S3 and (not E) and (not M)) or S6)) or T after 0.56 ns;
reset_P <= R and ( S1 or S2 or S3 or S4 or S5 or S6) after 0.56 ns;
reset_S <= R and ( S1 or S2 or S3 or S4 or S5 or S6) after 0.56 ns;
reset_check <= R and ( S1 or S2 or S3 or S4 or S5 or S6) after 0.56 ns;
check_in <= (not R) and ( (S2 ) or S6) after 0.56 ns;
Q2_out <= Q2;
Q1_out <= Q1;
Q0_out <= Q0;


--count_out <= S4 or S6;





end Behavioral;
