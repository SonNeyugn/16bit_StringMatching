library ieee;
use ieee.std_logic_1164.all;

entity flip_flop is
  
  port (
    D, clk, reset, D_en : in  std_logic;
    Q, Qbar : out std_logic);

end entity flip_flop;

architecture flip_flop_behav of flip_flop is

  signal S1, C1, C2 : std_logic;

begin 

p: process(clk)
begin

if rising_edge(clk) 
 then
  if (D_en = '1')
    then 
    if (reset = '1') 
     then 
       --Q <= '0' after 5 ns;
       Q <= '0'  after 0.533 ns;
       --Qbar <= '1' after 5 ns;
       Qbar <= '1'   after 0.533 ns;
     else 
       --Q <= D after 5 ns;
       --Q <= D after 2.685 ns  ;
       Q <= D after 1 ns  ;
       --Qbar <= not D after 5 ns;
       --Qbar <= not D  after 2.685 ns;
       Qbar <= not D  after 1 ns;
   end if;
 end if;
end if;

end process;
  
end flip_flop_behav;

