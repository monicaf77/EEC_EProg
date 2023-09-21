----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2023 02:40:48 PM
-- Design Name: 
-- Module Name: sm_add_test_tb - Behavioral
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

entity sm_add_test_tb is
end sm_add_test_tb;

architecture Behavioral of sm_add_test_tb is

-- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sm_add_test
    PORT(
        sel: in std_logic_vector(1 downto 0);
        ain: in std_logic_vector(3 downto 0);
	    bin: in std_logic_vector(3 downto 0);
        led0: out std_logic_vector(7 downto 0);
        led1: out std_logic_vector(7 downto 0)
        );
    END COMPONENT;

-- input test vectors
signal test_sel: std_logic_vector(1 downto 0) := (others => '0');
signal test_ain, test_bin: std_logic_vector(3 downto 0) := (others => '0');

-- output test vectors
signal test_led0, test_led1: std_logic_vector(7 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: sm_add_test PORT MAP (
        sel => test_sel,
        ain => test_ain,
        bin => test_bin,
        led0 => test_led0,
        led1 => test_led1
        );
    
    
   -- Stimulus process
   stim_proc: process
   begin
      -- test vector 2+3=5
      test_ain <= "0010";
      test_bin <= "0011";
      test_sel <= "00";
      wait for 50ns;
      test_sel <= "01";
      wait for 50ns;
      test_sel <= "10";
      wait for 100ns;
      
      -- test vector 2-3=-1
      -- for you to complete!
      
      -- test vector 7-3=4
      -- for you to complete!

      -- test vector -3-3=-6
      -- for you to complete!
     
      -- terminate simulation
      assert false
         report "Simulation Completed"
         severity failure;
   end process;
   

end Behavioral;