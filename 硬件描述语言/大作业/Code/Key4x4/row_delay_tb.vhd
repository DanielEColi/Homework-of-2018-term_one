LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY row_delay_tb IS
END row_delay_tb;
 
ARCHITECTURE behavior OF row_delay_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT row_delay
    PORT(
         clk_i : IN  std_logic;
         rst_n_i : IN  std_logic;
         row_i : IN  std_logic_vector(3 downto 0);
         row_reg_o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_n_i : std_logic := '0';
   signal row_i : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal row_reg_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: row_delay PORT MAP (
          clk_i => clk_i,
          rst_n_i => rst_n_i,
          row_i => row_i,
          row_reg_o => row_reg_o
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
		rst_n_i <= '1';
      wait for clk_i_period*1000000;
		row_i <= "0111";
      wait for clk_i_period*1000000;
		row_i <= "1011";
      wait for clk_i_period*1000000;
		row_i <= "1101";
      wait for clk_i_period*1000000;
		row_i <= "1110";	
      wait for clk_i_period*1000000;
		row_i <= "0111";		
      wait for clk_i_period*1000000;
		row_i <= "1011";		

      -- insert stimulus here 

      wait;
   end process;

END;
