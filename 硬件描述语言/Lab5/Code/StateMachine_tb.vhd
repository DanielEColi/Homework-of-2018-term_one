LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY StateMachine_tb IS
END StateMachine_tb;
 
ARCHITECTURE behavior OF StateMachine_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT StateMachine
    PORT(
         clk_i : IN  std_logic;
         rst_n_i : IN  std_logic;
         DB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_n_i : std_logic := '0';

 	--Outputs
   signal DB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: StateMachine PORT MAP (
          clk_i => clk_i,
          rst_n_i => rst_n_i,
          DB => DB
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
