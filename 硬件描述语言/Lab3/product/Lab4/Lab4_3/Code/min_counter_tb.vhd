LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY min_counter_tb IS
END min_counter_tb;
 
ARCHITECTURE behavior OF min_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT min_couter
    PORT(
         clk_i : IN  std_logic;
         rst_n_i : IN  std_logic;
         min_cnt_o : OUT  std_logic_vector(5 downto 0);
         hour_carry_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_n_i : std_logic := '0';

 	--Outputs
   signal min_cnt_o : std_logic_vector(5 downto 0);
   signal hour_carry_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: min_couter PORT MAP (
          clk_i => clk_i,
          rst_n_i => rst_n_i,
          min_cnt_o => min_cnt_o,
          hour_carry_o => hour_carry_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_i_period*10;

      -- insert stimulus here 
		rst_n_i <= '1';
		
      wait;
   end process;

END;
