-- Listing 3.20
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity fp_adder_test is
   port(
      sw: in std_logic_vector(15 downto 0);
      btn: in std_logic_vector(1 downto 0);
      led: out std_logic_vector(15 downto 0)
   );
end fp_adder_test;

architecture arch of fp_adder_test is
   signal sign1, sign2: std_logic;
   signal exp1, exp2: std_logic_vector(3 downto 0);
   signal frac1, frac2: std_logic_vector(7 downto 0);
   signal sign_out: std_logic;
   signal exp_out: std_logic_vector(3 downto 0);
   signal frac_out: std_logic_vector(7 downto 0);
  
begin
   -- set up the fp adder input signals
   sign1 <= btn(0);
   exp1 <= sw(15 downto 12);
   frac1<= sw(11 downto 8) & "0000";
   sign2 <= btn(1);
   exp2 <= sw(7 downto 4);
   frac2 <= sw(3 downto 0) & "0000";

   -- instantiate fp adder
   fp_add_unit: entity work.fp_adder
      port map(
         sign1=>sign1, sign2=>sign2, exp1=>exp1, exp2=>exp2,
         frac1=>frac1, frac2=>frac2,
         sign_out=>sign_out, exp_out=>exp_out,
         frac_out=>frac_out
      );

    led<= sign_out & "000" & exp_out & frac_out;
   
end arch;
