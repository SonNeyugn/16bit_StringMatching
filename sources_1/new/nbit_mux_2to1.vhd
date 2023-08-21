----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2022 06:13:25 PM
-- Design Name: 
-- Module Name: nbit_mux_2to1 - Behavioral
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

entity nbit_mux_2to1 is
--  Port ( );
    generic (
        width : integer := 5
        );
    port (
    
    A,B: in std_logic_vector( (width-1) downto 0);
    S: in std_logic;
    C: out std_logic_vector( (width-1) downto 0)
    );
    
end nbit_mux_2to1;

architecture Behavioral of nbit_mux_2to1 is
component mux_2to1 is
--  Port ( );
    port (
        A, B, S : in std_logic;
        C : out std_logic
        );
end component;

begin

mux_gen1: for i in 0 to (width -1) generate
        begin
            mux_2to1_i : mux_2to1 port map(
            A => A(i),
            B => B(i),
            S => S,
            C => C(i)
            );
        end generate mux_gen1;

end Behavioral;
