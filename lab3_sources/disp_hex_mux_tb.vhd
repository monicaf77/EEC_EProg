----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2023 10:51:51 AM
-- Design Name: 
-- Module Name: disp_hex_mux_tb - Behavioral
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

entity disp_hex_mux_tb is
--  Port ( );
end disp_hex_mux_tb;

architecture Behavioral of disp_hex_mux_tb is

 -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT disp_hex_mux
    PORT(
         clk, reset: in std_logic;
         hex3, hex2, hex1, hex0: in std_logic_vector(3 downto 0);
         dp_in: in std_logic_vector(3 downto 0);
         an: out std_logic_vector(3 downto 0);
         sseg: out std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal sw : std_logic_vector(15 downto 0) := (others => '0');
   signal dp : std_logic_vector(3 downto 0) := (others => '0');

   --Outputs
   signal an : std_logic_vector(3 downto 0);
   signal sseg : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 

begin

-- Instantiate the Unit Under Test (UUT)
   uut: disp_hex_mux PORT MAP (
          clk => clk,
          reset => rst,
          hex3 => sw (15 downto 12),
          hex2 => sw (11 downto 8),
          hex1 => sw (7 downto 4),
          hex0 => sw (3 downto 0),
          dp_in => dp,
          an => an,
          sseg => sseg
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
  -- hold reset state for 100 ns
   rst <= '1', '0' after clk_period;


   -- Stimulus process
   stim_proc: process
   begin		
    dp <= "1111";
	sw<="0011100101000111";
	wait for clk_period*4*4;
	sw<="0011000110000110";
	wait for clk_period*4*4;
	sw<="0010010100110011";
	wait for clk_period*4*4;
   -- insert stimulus here 
   assert false
	  report "Simulation Completed"
   severity failure;

   end process;

end Behavioral;