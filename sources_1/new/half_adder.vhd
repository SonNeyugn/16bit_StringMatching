library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
  
  port (
    A, B : in  std_logic;
    S, C : out std_logic);

end entity half_adder;

architecture half_adder_behav of half_adder is

begin  -- half_adder_behav

 S <= A xor B after 10 ns; 
 
 C <= A and B after 5 ns;

end half_adder_behav;

