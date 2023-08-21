----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2022 02:57:00 PM
-- Design Name: 
-- Module Name: fsm - Behavioral
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

entity fsm_real is
--  Port ( );
    port (
        clk, S, R, E, T, M : in std_logic;
        --N, L, P_in, S_in : in std_logic;
        result : out std_logic;
        compare_1, compare_0, reset_count, count_up: out std_logic;
        P_en, S_en, check_en, reset_P, reset_S, reset_check, check_in : out std_logic
        );
        
end fsm_real;

architecture Behavioral of fsm_real is
    type state_type is (S0, S1, S2, S3, S4, S5, S6);
    signal present_state, next_state : state_type;
    constant bit_width : integer := 5;
    signal count_value : std_logic_vector( (bit_width -1 ) downto 0 );

    
    
begin

stateTrans: process(clk, R)
begin
    if ( R = '1' ) then
        present_state <= S0;
        count_up <= '0';
        P_en <= '0';
        S_en <= '0';
        check_en <= '0';
        check_in <= '0';
        reset_count <='1';
        compare_1 <= '-';
        compare_0 <= '-';
        reset_P <= '1';
        reset_S <= '1';
        reset_check <= '1';
    elsif ( clk = '1' and clk'event) then 
        present_state <= next_state;
    end if;
end process;


logic : process(present_state, S, E, T, M)
begin
    next_state <= S0;
    case present_state is
        when S0 => 
            if ( S = '0') and ( T ='0') then
                next_state <= S0;
                count_up <= '0';
                P_en <= '0';
                S_en <= '0';
                check_en <= '0';
                check_in <= '0';
                reset_count <='1';
                compare_1 <= '-';
                compare_0 <= '-';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            elsif ( T = '1') then
                next_state <= S6;
                count_up <= '0';
                P_en <= '1';
                S_en <= '1';
                check_en <= '1';
                check_in <= '0';
                reset_count <='1';
                compare_1 <= '-';
                compare_0 <= '-';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            elsif (S = '1') and ( T = '0') then
                next_state <= S1;
                count_up <= '0';
                P_en <= '1';
                S_en <= '1';
                check_en <= '1';
                check_in <= '0';
                reset_count <='1';
                compare_1 <= '0';
                compare_0 <= '0';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            end if;
        when S1 => 
            if ( R = '0') and ( E ='0') then
                next_state <= S1;
                count_up <= '1';
                P_en <= '1';
                S_en <= '1';
                check_en <= '1';
                check_in <= '0';
                reset_count <='0';
                compare_1 <= '0';
                compare_0 <= '0';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            elsif ( R = '0') and ( E ='1') then
                next_state <= S2;
                count_up <= '0';
                P_en <= '0';
                S_en <= '1';
                check_en <= '1';
                check_in <= '1';
                reset_count <='1';
                compare_1 <= '0';
                compare_0 <= '1';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            end if;
    when S2 => 
            if ( R = '0') and ( E ='0') then
                next_state <= S2;
                count_up <= '1';
                P_en <= '0';
                S_en <= '1';
                check_en <= '1';
                check_in <= '1';
                reset_count <='0';
                compare_1 <= '0';
                compare_0 <= '1';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            elsif ( R = '0') and ( E ='1') then
                next_state <= S3;
                count_up <= '0';
                P_en <= '0';
                S_en <= '1';
                check_en <= '1';
                check_in <= '1';
                reset_count <='1';
                compare_1 <= '1';
                compare_0 <= '0';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            end if;
    when S3 => 
            if ( R = '0') and ( E ='0') and ( M = '0') then
                next_state <= S3;
                count_up <= '1';
                P_en <= '0';
                S_en <= '1';
                check_en <= '1';
                check_in <= '1';
                reset_count <='0';
                compare_1 <= '0';
                compare_0 <= '1';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            elsif ( R = '0') and (( E ='0') or (E ='1')) and ( M = '1') then
                next_state <= S4; result <= '1';
                count_up <= '0';
                P_en <= '0';
                S_en <= '0';
                check_en <= '0';
                check_in <= '-';
                reset_count <='0';
                compare_1 <= '1';
                compare_0 <= '0';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            elsif ( R = '0') and (E ='1') and ( M = '0') then
                next_state <= S5;
                count_up <= '0';
                P_en <= '0';
                S_en <= '0';
                check_en <= '0';
                check_in <= '-';
                reset_count <='0';
                compare_1 <= '1';
                compare_0 <= '0';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            end if;
    when S4 => 
            if ( R = '0') then
                next_state <= S4; result <= '1';
                count_up <= '0';
                P_en <= '0';
                S_en <= '0';
                check_en <= '0';
                check_in <= '0';
                reset_count <='0';
                compare_1 <= '-';
                compare_0 <= '-';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            end if;
    when S5 => 
            if ( R = '0') then
                next_state <= S5;
                count_up <= '0';
                P_en <= '0';
                S_en <= '0';
                check_en <= '0';
                check_in <= '0';
                reset_count <='0';
                compare_1 <= '-';
                compare_0 <= '-';
                reset_P <= '0';
                reset_S <= '0';
                reset_check <= '0';
            end if;
    when others =>
            next_state <= S0;
   end case;
            
            
end process;


end Behavioral;
