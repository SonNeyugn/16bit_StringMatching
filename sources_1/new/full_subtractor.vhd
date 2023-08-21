----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2022 12:27:20 AM
-- Design Name: 
-- Module Name: full_subtractor - Behavioral
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

entity full_subtractor is
--  Port ( );
port( A, B, Cin : in std_logic; 
DIFF, Borrow : out std_logic);

end full_subtractor;

architecture Behavioral of full_subtractor is

begin
DIFF <= (A xor B) xor Cin after 0.6315 ns; 
Borrow <= ((not A) and (B or Cin)) or (B and Cin) after 0.553 ns;

end Behavioral;
