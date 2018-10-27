LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY water_led_tb IS
END water_led_tb;
 
ARCHITECTURE behavior OF water_led_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT water_led
    PORT(
         clk_50mhz_i : IN  std_logic;
         rst_n_i : IN  std_logic;
         water_led_o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_50mhz_i : std_logic := '0';
   signal rst_n_i : std_logic := '0';

 	--Outputs
   signal water_led_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_50mhz_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: water_led PORT MAP (
          clk_50mhz_i => clk_50mhz_i,
          rst_n_i => rst_n_i,
          water_led_o => water_led_o
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

      wait for clk_50mhz_i_period*10;

      -- insert stimulus here 
		
		rst_n_i <= '1';
			
      wait;
   end process;

END;
