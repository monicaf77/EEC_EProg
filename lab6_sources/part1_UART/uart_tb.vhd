--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:07:29 11/12/2019
-- Design Name:   
-- Module Name:   C:/Xilinx/EProg/HO6/uart_tb.vhd
-- Project Name:  HO6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: uart
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
USE ieee.numeric_std.ALL;
 
ENTITY uart_tb IS
END uart_tb;
 
ARCHITECTURE behavior OF uart_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         rd_uart : IN  std_logic;
         wr_uart : IN  std_logic;
         rx : IN  std_logic;
         w_data : IN  std_logic_vector(7 downto 0);
         rx_full : OUT  std_logic;
         rx_empty : OUT  std_logic;
         r_data : OUT  std_logic_vector(7 downto 0);
         tx : OUT  std_logic
        );
    END COMPONENT;
    
	

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal rd_uart : std_logic := '0';
   signal wr_uart : std_logic := '0';
   signal rx : std_logic := '0';
   signal w_data : std_logic_vector(7 downto 0) := (others => '0');
	
	--internal signal
	signal data_received : std_logic_vector(9 downto 0);
	signal counter : unsigned(3 downto 0);

 	--Outputs
   signal rx_full : std_logic;
   signal rx_empty : std_logic;
   signal r_data : std_logic_vector(7 downto 0);
   signal tx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1628 ns; --for a 614,4kHz input clock frequency
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart PORT MAP (
          clk => clk,
          reset => reset,
          rd_uart => rd_uart,
          wr_uart => wr_uart,
          rx => rx,
          w_data => w_data,
          rx_full => rx_full,
          rx_empty => rx_empty,
          r_data => r_data,
          tx => tx
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	-- hold reset state for one clock period.
   reset <= '1', '0' after clk_period;
 
   -- Stimulus process
   stim_proc: process
   begin		
    
		-- initialize all input signals
		rd_uart <= '0';
		wr_uart <= '0';
		rx<='1';
		w_data<="00000000";
		data_received<="0000000000";
		counter<="0000";
		
		-- simulate a serial stream being transmitted		
        wait for clk_period*10;
		w_data<="10111100";
		wr_uart <= '1';
		wait for clk_period;
		wr_uart <= '0';
		wait for clk_period*16*2*10;
		
        wait for clk_period*10;
	
			
		-- simulate a serial stream being received
		data_received <= "0101011001"; -- start bit + data byte + stop bit
		while counter /= "1001" loop
			wait for clk_period*16*2;
			rx <= data_received(9);
			data_received <= data_received (8 downto 0) & '1';
			counter <= counter+1;
            end loop;  


		-- alternative code to simulate a serial stream being received		
		--		rx <= '0'; --start bit
		--		wait for clk_period*16*2;
		--		rx <= '1'; --1º bit
		--		wait for clk_period*16*2;
		--		rx <= '0'; --1º bit
		--		wait for clk_period*16*2;
		--		rx <= '1'; --1º bit
		--		wait for clk_period*16*2;
		--		rx <= '0'; --1º bit
		--		wait for clk_period*16*2;
		--		rx <= '1'; --1º bit
		--		wait for clk_period*16*2;
		--		rx <= '1'; --1º bit
		--		wait for clk_period*16*2;
		--		rx <= '0'; --1º bit
		--		wait for clk_period*16*2;
		--		rx <= '0'; --1º bit
		--		wait for clk_period*16*2;
		--		rx <= '1'; --stop bit
		--		wait for clk_period*16*2;
				
		

      wait;
   end process;

END;