----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 03:33:49 PM
-- Design Name: 
-- Module Name: chip - Behavioral
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

entity chip is
--  Port ( );
    generic (
        width : integer := 16
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
end chip;

architecture Behavioral of chip is

    --Finite state machine
    component fsm_hc is
    --  Port ( );
        port (
            clk, S, R, E, T, M : in std_logic;
            --N, L, P_in, S_in : in std_logic;
            result : out std_logic;
            compare_1, compare_0, reset_count, count_up: out std_logic;
            P_en, S_en, check_en, reset_P, reset_S, reset_check, check_in : out std_logic;
            Q2_out , Q1_out, Q0_out : out std_logic
            
            );
            
    end component;
    
    --n-bit counter
    component counter_nbit is
      generic ( 
        width : integer := 5);
      port (
        count, clk, reset, en : in std_logic;
        value : out std_logic_vector( (width - 1) downto 0) );
    end component;
    
    --n-bit subtractor
    component nbit_subtractor is    
      generic (
        width : integer := 5);
      port (
        A, B : in std_logic_vector( (width -1) downto 0 );
        S: out std_logic_vector( (width -1) downto 0 );
        COUT : out std_logic
        );
    end component;
    
    --n-bit comparator
    component comparator is
    --  Port ( );
        generic (
            width : integer := 5
            );
            
        port (
            In1, In2: in std_logic_vector( (width-1) downto 0 );
            Equal : out std_logic
            --output : out std_logic_vector( (width-1) downto 0 )
            );
    end component;
    
    --n-bit 3to1 multiplexer
    component nbit_mux_3to1 is
    --  Port ( );
        generic (
            width : integer := 5
            );
        port (
        A, B, D : in std_logic_vector( (width-1) downto 0 );
        S1, S0 : in std_logic;
        C : out std_logic_vector ( (width -1) downto 0 )
        );
    end component;
    
    --n-bit slice function
    component nbit_slice is
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
        P_port_out, S_port_out, check_port_out: out std_logic
        );
    end component; 
    
    --5-bit 2 to 1 MUX
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
constant bit_width : integer := 16;
signal E : std_logic; --Equal
signal M : std_logic; --Match
signal compare_1, compare_0, reset_count, count_up, P_en, S_en, check_en, reset_P, reset_S, reset_check, check_in, temp_result : std_logic; -- Control Signals
signal diff_NL : std_logic_vector( (4) downto 0 );
signal compare_value, count_value : std_logic_vector( 4 downto 0 );
begin

FSM : fsm_hc 
    port map (
        clk => clk,
        S => S,
        R => R,
        E => E,
        M => M,
        T => T,
        result => temp_result,
        P_en => P_en,
        S_en => S_en,
        check_en => check_en,
        reset_P => reset_P,
        reset_S => reset_S,
        reset_check => reset_check, 
        reset_count => reset_count,
        check_in => check_in,
        compare_1 => compare_1,
        compare_0 => compare_0,
        count_up => count_up,
        Q2_out => Q2,
        Q1_out => Q1,
        Q0_out => Q0
        
        );

counter : counter_nbit 
    generic map (5)
    port map (
        count => count_up,
        clk => clk,
        reset => reset_count,
        en => '1',
        value => count_value
    );
subtractor : nbit_subtractor
    generic map (5)
    port map (
        A => N,
        B => L,
        S => diff_NL,
        COUT => open
    );
comparator_1 : comparator
    generic map (5)
    port map (
        In1 => compare_value,
        In2 => count_value,
        Equal => E
    );
mux_3to1 : nbit_mux_3to1
    generic map(5)
    port map (
        A => diff_NL,
        B => N,
        D => L,
        S1 => compare_1,
        S0 => compare_0,
        C => compare_value
    );
bit_slice_function : nbit_slice
    generic map (bit_width)
    port map (
        clk => clk,
        P_in => P_in,
        S_in => S_in,
        check_in => check_in,
        P_en => P_en,
        S_en => S_en,
        check_en => check_en,
        P_reset => reset_P,
        S_reset => reset_S,
        check_reset => reset_check,
        p_match => '1',
        match => M,
        P_reg_out => P_reg_out,
        S_reg_out => S_reg_out,
        check_reg_out => check_reg_out,
        P_port_out => P_port_out,
        S_port_out => s_port_out,
        check_port_out => check_port_out
        );
        
output_MUX : nbit_mux_2to1 
    generic map(5)
    port map (
    A => count_value, 
    B => "00000",
    S => temp_result, 
    C => index);
        
test_reg(0) <= compare_0;
test_reg(1) <= compare_1;
test_reg(3) <= M;
test_reg(2) <= E;
test_reg(4) <= check_in;
--test_reg(3) <= M;
--test_reg(0) <= count_up;
--test_reg(1) <= E;
--test_reg <= count_value;
--test_reg <= compare_value;
test_reg2 <= count_value;
result <= temp_result;
--out_process : process (temp_result)
--begin
--if (temp_result = '1') then
    --index <= count_value;
--else
--    index <= "00000";
--end if;    
--end process;
        
           
               


end Behavioral;
