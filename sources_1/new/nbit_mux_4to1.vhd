----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2022 01:03:48 AM
-- Design Name: 
-- Module Name: nbit_mux_4to1 - Behavioral
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

--Actually is a n-bit 3to 1 mux, using 2 2to1 mux
entity nbit_mux_4to1 is
--  Port ( );
    generic (
        width : integer := 5
        );
    port (
    A, B, D : in std_logic_vector( (width-1) downto 0 );
    S1, S0 : in std_logic;
    C : out std_logic_vector ( (width -1) downto 0 )
    );
end nbit_mux_4to1;

architecture Behavioral of nbit_mux_4to1 is

component mux_2to1 is
--  Port ( );
    port (
        A, B, S : in std_logic;
        C : out std_logic
        );
end component;

signal temp_C : std_logic_vector ( (width -1) downto 0 );


begin

mux_gen1: for i in 0 to (width -1) generate
        begin
            mux_2to1_i : mux_2to1 port map(
            A => A(i),
            B => B(i),
            S => S1,
            C => temp_C(i)
            );
        end generate mux_gen1;

mux_gen2: for i in 0 to (width -1) generate
        begin
            mux_2to1_i2 : mux_2to1 port map(
            A => D(i),
            B => temp_C(i),
            S => S0,
            C => C(i)
            );
        end generate mux_gen2;
        


end Behavioral;
