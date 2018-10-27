LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sec_counter_tb IS
END sec_counter_tb;
 
ARCHITECTURE behavior OF sec_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sec_counter
    PORT(
         clk_i : IN  std_logic;
         rst_n_i : IN  std_logic;
         sec_cnt_o : OUT  std_logic_vector(5 downto 0);
         min_carry_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_n_i : std_logic := '0';

 	--Outputs
   signal sec_cnt_o : std_logic_vector(5 downto 0);
   signal min_carry_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sec_counter PORT MAP (
          clk_i => clk_i,
          rst_n_i => rst_n_i,
          sec_cnt_o => sec_cnt_o,
          min_carry_o => min_carry_o
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
