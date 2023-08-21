----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 03:50:37 PM
-- Design Name: 
-- Module Name: counter_nbit - Behavioral
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

entity counter_nbit is
  generic ( 
    width : integer := 5);
    
--  Port ( );
  port (
    count, clk, reset, en : in std_logic;
    value : out std_logic_vector( (width -1) downto 0) );
end counter_nbit;



architecture Behavioral of counter_nbit is


component flip_flop is
  port (
    D, clk, reset, D_en : in  std_logic;
    Q, Qbar : out std_logic);
end component flip_flop;

    
   SIGNAL Ds_out : STD_LOGIC_VECTOR((width-1) DOWNTO 0);
   SIGNAL Ds_in : STD_LOGIC_VECTOR( (width-1) DOWNTO 0);
   SIGNAL ands_out : STD_LOGIC_VECTOR( (width-1) DOWNTO 0);
   
begin
    ands_out(0) <= count AND Ds_out(0);
    ands_out(1) <= ands_out(0) AND Ds_out(1);
    ands_out(2) <= ands_out(1) AND Ds_out(2);
    ands_out(3) <= ands_out(2) AND Ds_out(3);

    Ds_in(0) <= count XOR Ds_out(0);
    Ds_in(1) <= ands_out(0) XOR Ds_out(1);
    Ds_in(2) <= ands_out(1) XOR Ds_out(2);
    Ds_in(3) <= ands_out(2) XOR Ds_out(3);  
    Ds_in(4) <= ands_out(3) XOR Ds_out(4); 
    
    --value_assign: process
    --begin
    --for j in 1 to 3 loop
    --  ands_out(j) <= ands_out(j-1) AND Ds_out(j);  
    --  Ds_in(j) <= ands_out(j-1) XOR Ds_out(j);
    --end loop;
    --wait for 10ns;
    --end process;
    value <= Ds_out;
    generate_slice : FOR i in 0 to (width-1) GENERATE
        Dff_i : flip_flop 
        PORT MAP
        (  
            D  => Ds_in(i),
            clk => clk,
            reset => reset,
            D_en => en,
            Q => Ds_out(i)     
        );
    END GENERATE;
 
  
 
        
        
        


end Behavioral;
