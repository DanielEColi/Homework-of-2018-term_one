LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY div_systhesis_tb IS
END div_systhesis_tb;
 
ARCHITECTURE behavior OF div_systhesis_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT div_systhesis
    PORT(
         clk : IN  std_logic;
         start : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         QL : OUT  std_logic_vector(7 downto 0);
         QH : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '1';
   signal A : std_logic_vector(7 downto 0) := "00000110";
   signal B : std_logic_vector(7 downto 0) := "00000010";

 	--Outputs
   signal QL : std_logic_vector(7 downto 0);
   signal QH : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: div_systhesis PORT MAP (
          clk => clk,
          start => start,
          A => A,
          B => B,
          QL => QL,
          QH => QH
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		start <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
