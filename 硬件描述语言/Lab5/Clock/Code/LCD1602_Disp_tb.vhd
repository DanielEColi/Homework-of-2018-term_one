LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY LCD1602_Disp_tb IS
END LCD1602_Disp_tb;
 
ARCHITECTURE behavior OF LCD1602_Disp_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LCD1602_Disp
    PORT(
         clk_50mhz_i : IN  std_logic;
         rst_n_i : IN  std_logic;
         disp_hour_h_i : IN  std_logic_vector(3 downto 0);
         disp_hour_l_i : IN  std_logic_vector(3 downto 0);
         disp_min_h_i : IN  std_logic_vector(3 downto 0);
         disp_min_l_i : IN  std_logic_vector(3 downto 0);
         disp_sec_h_i : IN  std_logic_vector(3 downto 0);
         disp_sec_l_i : IN  std_logic_vector(3 downto 0);
         lcd_rs_o : OUT  std_logic;
         lcd_wr_o : OUT  std_logic;
         lcd_en_o : OUT  std_logic;
         lcd_data_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_50mhz_i : std_logic := '0';
   signal rst_n_i : std_logic := '0';
   signal disp_hour_h_i : std_logic_vector(3 downto 0) := (others => '0');
   signal disp_hour_l_i : std_logic_vector(3 downto 0) := (others => '0');
   signal disp_min_h_i : std_logic_vector(3 downto 0) := (others => '0');
   signal disp_min_l_i : std_logic_vector(3 downto 0) := (others => '0');
   signal disp_sec_h_i : std_logic_vector(3 downto 0) := (others => '0');
   signal disp_sec_l_i : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal lcd_rs_o : std_logic;
   signal lcd_wr_o : std_logic;
   signal lcd_en_o : std_logic;
   signal lcd_data_o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_50mhz_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LCD1602_Disp PORT MAP (
          clk_50mhz_i => clk_50mhz_i,
          rst_n_i => rst_n_i,
          disp_hour_h_i => disp_hour_h_i,
          disp_hour_l_i => disp_hour_l_i,
          disp_min_h_i => disp_min_h_i,
          disp_min_l_i => disp_min_l_i,
          disp_sec_h_i => disp_sec_h_i,
          disp_sec_l_i => disp_sec_l_i,
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
		
		rst_n_i <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
