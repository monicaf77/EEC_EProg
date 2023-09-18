--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:04:11 09/01/2011
-- Design Name:   
-- Module Name:   C:/Xilinx/PSE1112/monica_tutorial/eq2/eq2_test.vhd
-- Project Name:  eq2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: eq2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY eq2_test IS
END eq2_test;
 
ARCHITECTURE behavior OF eq2_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT eq2
    PORT(
         a : IN  std_logic_vector(1 downto 0);
         b : IN  std_logic_vector(1 downto 0);
         aeqb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal test_in0 : std_logic_vector(1 downto 0) := (others => '0');
   signal test_in1 : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal test_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: eq2 PORT MAP (
          a => test_in0,
          b => test_in1,
          aeqb => test_out
        );


   -- Stimulus process
   stim_proc: process
   begin
      -- test vector 1
      test_in0 <= "00";
      test_in1 <= "00";
      wait for 200 ns;
      -- test vector 2
      test_in0 <= "01";
      test_in1 <= "00";
      wait for 200 ns;
      -- test vector 3
      test_in0 <= "01";
      test_in1 <= "11";
      wait for 200 ns;
      -- test vector 4
      test_in0 <= "10";
      test_in1 <= "10";
      wait for 200 ns;
      -- test vector 5
      test_in0 <= "10";
      test_in1 <= "00";
      wait for 200 ns;
      -- test vector 6
      test_in0 <= "11";
      test_in1 <= "11";
      wait for 200 ns;
      -- test vector 7
      test_in0 <= "11";
      test_in1 <= "01";
      wait for 200 ns;
      -- terminate simulation
      assert false
         report "Simulation Completed"
         severity failure;
   end process;
END;