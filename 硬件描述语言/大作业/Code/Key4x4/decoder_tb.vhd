LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY decoder_tb IS
END decoder_tb;
 
ARCHITECTURE behavior OF decoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder
    PORT(
         clk_i : IN  std_logic;
         rst_n_i : IN  std_logic;
         row_col_i : IN  std_logic_vector(7 downto 0);
         led_o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal rst_n_i : std_logic := '0';
   signal row_col_i : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal led_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder PORT MAP (
          clk_i => clk_i,
          rst_n_i => rst_n_i,
          row_col_i => row_col_i,
          led_o => led_o
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
		row_col_i <= "01110111";
		wait for clk_i_period*1000000;
		row_col_i <= "01111011";
      wait for clk_i_period*1000000;
		row_col_i <= "10110111";
      wait for clk_i_period*1000000;
		row_col_i <= "10111110";
      wait for clk_i_period*1000000;
		row_col_i <= "11011011";	
      wait for clk_i_period*1000000;
		row_col_i <= "11100111";		
      wait for clk_i_period*1000000;
		row_col_i <= "11101011";	
      -- insert stimulus here 

      wait;
   end process;

END;
