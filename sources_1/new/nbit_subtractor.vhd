----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2022 12:07:41 AM
-- Design Name: 
-- Module Name: nbit_subtractor - Behavioral
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

entity nbit_subtractor is
--  Port ( );
  generic (
    width : integer := 5);
  port (
    A, B : in std_logic_vector( (width -1) downto 0 );
    S: out std_logic_vector( (width -1) downto 0 );
    COUT : out std_logic
    );
end nbit_subtractor;

architecture Behavioral of nbit_subtractor is

component full_subtractor
    port (
      A, B, Cin : in  std_logic;
      DIFF, Borrow : out std_logic);
  end component;

signal comp_B : std_logic_vector( (width -1) downto 0 );
signal carry : std_logic_vector((width) downto 0);
signal temp : std_logic_vector( (width -1) downto 0);


begin


subtractor_gen : for i in 0 to (width-1) generate
   begin
    full_subtractor_i : full_subtractor port map (
      A           => A(i),
      B           => B(i),
      DIFF           => S(i),
      Cin         => carry(i),
      Borrow        => carry(i+1));   
   end generate subtractor_gen;  -- i

   carry(carry'low) <= '0'; 
   
   COUT <= carry(width);


end Behavioral;
