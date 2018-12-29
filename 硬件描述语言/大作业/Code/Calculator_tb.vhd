LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY Calculator_tb IS
END Calculator_tb;
 
ARCHITECTURE behavior OF Calculator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Calculator
    PORT(
         rst_n_i : IN  std_logic;
         clk_50mhz_i : IN  std_logic;
         col_i : IN  std_logic_vector(3 downto 0);
         row_o : OUT  std_logic_vector(3 downto 0);
         Beep_o : OUT  std_logic;
         lcd_rs_o : OUT  std_logic;
         lcd_wr_o : OUT  std_logic;
         lcd_en_o : OUT  std_logic;
         lcd_data_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst_n_i : std_logic := '0';
   signal clk_50mhz_i : std_logic := '0';
   signal col_i : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal row_o : std_logic_vector(3 downto 0);
   signal Beep_o : std_logic;
   signal lcd_rs_o : std_logic;
   signal lcd_wr_o : std_logic;
   signal lcd_en_o : std_logic;
   signal lcd_data_o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_50mhz_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Calculator PORT MAP (
          rst_n_i => rst_n_i,
          clk_50mhz_i => clk_50mhz_i,
          col_i => col_i,
          row_o => row_o,
          Beep_o => Beep_o,
          lcd_rs_o => lcd_rs_o,
          lcd_wr_o => lcd_wr_o,
          lcd_en_o => lcd_en_o,
          lcd_data_o => lcd_data_o
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

      wait;
   end process;

END;
