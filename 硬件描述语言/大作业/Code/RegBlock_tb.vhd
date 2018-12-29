LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.mypackage.all;

ENTITY RegBlock_tb IS
END RegBlock_tb;
 
ARCHITECTURE behavior OF RegBlock_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegBlock
    PORT(
         clk_i : IN  std_logic;
         clear : IN  std_logic;
         wr_en : IN  std_logic;
         get_rst : IN  std_logic;
         input : IN  std_logic_vector(3 downto 0);
         rst : IN  std_logic_vector(15 downto 0);
         row1_o : OUT  row(15 downto 0);
         row2_o : OUT  row(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal clear : std_logic := '1';
   signal wr_en : std_logic := '0';
   signal get_rst : std_logic := '0';
   signal input : std_logic_vector(3 downto 0) := "1001";
   signal rst : std_logic_vector(15 downto 0) := "1010101010101010";

 	--Outputs
   signal row1_o : row(15 downto 0);
   signal row2_o : row(15 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegBlock PORT MAP (
          clk_i => clk_i,
          clear => clear,
          wr_en => wr_en,
          get_rst => get_rst,
          input => input,
          rst => rst,
          row1_o => row1_o,
          row2_o => row2_o
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
      clear <= '0';
		wait for clk_i_period*10;
		wr_en <= '1';
		wait for clk_i_period*20;
		wr_en <= '0';
		wait for clk_i_period*5;
		input <= "1000";
		wait for clk_i_period*10;
		wr_en <= '1';
		wait for clk_i_period*20;
		wr_en <= '0';
		wait for clk_i_period*5;
		get_rst <= '1';
		wait for clk_i_period*10;
		wr_en <= '1';
		wait for clk_i_period*20;
		wr_en <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
