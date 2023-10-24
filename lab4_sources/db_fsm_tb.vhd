----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2023 03:48:18 PM
-- Design Name: 
-- Module Name: db_fsm_tb - Behavioral
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

entity db_fsm_tb is
--  Port ( );
end db_fsm_tb;

architecture Behavioral of db_fsm_tb is

-- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT db_fsm
   generic (N: integer :=20);
    port(
      clk, reset: in std_logic;
      sw: in std_logic;
      db: out std_logic
     );
    END COMPONENT;

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal sw : std_logic := '0';

 	--Outputs
   signal db : std_logic;

   -- Clock period definitions
   constant clk_period : time := 100 ns; 

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: db_fsm 
   GENERIC MAP (N => 3)
   PORT MAP (
          clk => clk,
          reset => reset,
          sw => sw,
          db => db
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
   
   
   sw <= '0';
   wait for clk_period*8*20;
   sw<='1';
   wait for clk_period*8;
   sw<='0';
   wait for clk_period*8*2;
   sw<='1';
   wait for clk_period*8*2;
   sw<='0';
   wait for clk_period*8;
   sw<='1';
   wait for clk_period*8*20;
   sw <= '0';
   wait for clk_period*8*1;
   sw<='1';
   wait for clk_period*8;
   sw<='0';
   wait for clk_period*8*2;
   sw<='1';
   wait for clk_period*8*2;
   sw<='0';
   wait for clk_period*8*20;
   
   -- terminate simulation
   assert false
       report "Simulation Completed"
       severity failure;
   end process;

end Behavioral;
