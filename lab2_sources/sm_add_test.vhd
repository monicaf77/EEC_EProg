-- Listing 3.15
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sm_add_test is
   port(
      sel: in std_logic_vector(1 downto 0);
      ain: in std_logic_vector(3 downto 0);
	  bin: in std_logic_vector(3 downto 0);
      led0: out std_logic_vector(7 downto 0);
      led1: out std_logic_vector(7 downto 0)
   );
end sm_add_test;

architecture arch of sm_add_test is
   signal sum, mout, oct: std_logic_vector(3 downto 0);
begin
   -- instantiate adder
   sm_adder_unit: entity work.sign_mag_add
      generic map(N=>4)
      port map(a=>ain, b=>bin,
               sum=>sum);

   -- 3-to-1 mux to select a number to display
   with sel select
      mout <= ain when "00",  -- a
              bin when "01",  -- b
              sum when others;           -- sum

   -- magnitude displayed on rightmost 7-seg LED
   oct <= '0' & mout(2 downto 0);
   
   sseg_unit: entity work.hex_to_sseg
      port map(hex=>oct, dp=>'0', sseg=>led0);
	  
   -- sign displayed on 2nd 7-seg LED
   led1 <= "11111110" when mout(3)='1' else -- middle bar
           "11111111";                      -- blank



end arch;