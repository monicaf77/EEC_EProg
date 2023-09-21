----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2023 05:16:05 PM
-- Design Name: 
-- Module Name: barrel_shifter_tb - Behavioral
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

entity barrel_shifter_tb is
end barrel_shifter_tb;

architecture Behavioral of barrel_shifter_tb is

component barrel_shifter is
   port(
      a: in std_logic_vector(7 downto 0);
      amt: in std_logic_vector(2 downto 0);
      y: out std_logic_vector(7 downto 0)
   );
end component;

-- input test vectors
signal test_a: std_logic_vector(7 downto 0) := (others => '0');
signal test_amt: std_logic_vector(2 downto 0) := (others => '0');

-- output test vectors
signal test_y: std_logic_vector(7 downto 0);

begin

 -- Instantiate the Unit Under Test (UUT)
    uut: barrel_shifter PORT MAP (
        a => test_a,
        amt => test_amt,
        y => test_y
        );
    
    
   -- Stimulus process
   stim_proc: process
   begin
      -- test vector 1
      test_a <= "00101110";
      test_amt <= "000";
      wait for 100ns;
      -- test vector 2
      -- Complete o restante!
	  
	  

-- terminate simulation
      assert false
         report "Simulation Completed"
         severity failure;
   end process;
   

end Behavioral;
