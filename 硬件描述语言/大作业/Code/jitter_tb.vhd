LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY jitter_tb IS
END jitter_tb;
 
ARCHITECTURE behavior OF jitter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clr_jitter_with_reg
    PORT(
         clk_50mhz_i : IN  std_logic;
         rst_n_i : IN  std_logic;
         button_i : IN  std_logic;
         button_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_50mhz_i : std_logic := '0';
   signal rst_n_i : std_logic := '0';
   signal button_i : std_logic := '1';

 	--Outputs
   signal button_o : std_logic;

   -- Clock period definitions
   constant clk_50mhz_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clr_jitter_with_reg PORT MAP (
          clk_50mhz_i => clk_50mhz_i,
          rst_n_i => rst_n_i,
          button_i => button_i,
          button_o => button_o
        );

   -- Clock process definitions
   clk_50mhz_i_process :process
   begin
		clk_50mhz_i <= '0';
		wait for clk_50mhz_i_period/2;
		clk_50mhz_i <= '1';
		wait for clk_50mhz_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst_n_i <= '1';
--		button_i <= '1';
--		wait for 100 ns;
--		button_i <= '0';
--		button_i <= '1';
--		wait for 100 ns;
--		button_i <= '0';
--		button_i <= '1';
--		wait for 100 ns;
--		button_i <= '0';
--		button_i <= '1';
--		wait for 100 ns;
--		button_i <= '0';
--		button_i <= '1';
--		wait for 100 ns;
--		button_i <= '0';
--    wait for clk_50mhz_i_period*500000;
		button_i <= '1';
--		wait for 100 ns;
--		button_i <= '0';
--		button_i <= '1';
--		wait for 100 ns;
--		button_i <= '0';
--		button_i <= '1';
--		wait for 100 ns;
--		button_i <= '0';
--		button_i <= '1';
--		wait for 100 ns;
--		button_i <= '0';
--		button_i <= '1';
--		wait for 100 ns;
--		button_i <= '0';
--		wait for clk_50mhz_i_period*499990;
--		button_i <= '1';
		

      -- insert stimulus here 

      wait;
   end process;

END;
