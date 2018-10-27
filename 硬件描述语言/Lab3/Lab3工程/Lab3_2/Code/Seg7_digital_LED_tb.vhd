LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Seg7_digital_LED_tb IS
END Seg7_digital_LED_tb;
 
ARCHITECTURE behavior OF Seg7_digital_LED_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Seg7_digital_LED
    PORT(
         clk_50mhz_i : IN  std_logic;
         rst_n_i : IN  std_logic;
         seg7_sel_o : OUT  std_logic_vector(7 downto 0);
         seg7_decode_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_50mhz_i : std_logic := '0';
   signal rst_n_i : std_logic := '0';

 	--Outputs
   signal seg7_sel_o : std_logic_vector(7 downto 0);
   signal seg7_decode_o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_50mhz_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Seg7_digital_LED PORT MAP (
          clk_50mhz_i => clk_50mhz_i,
          rst_n_i => rst_n_i,
          seg7_sel_o => seg7_sel_o,
          seg7_decode_o => seg7_decode_o
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
