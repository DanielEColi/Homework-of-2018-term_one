LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Dividor16_tb IS
END Dividor16_tb;
 
ARCHITECTURE behavior OF Dividor16_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Dividor16
    PORT(
         clk_i : IN  std_logic;
		   start : in std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Fra : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
	signal start : std_logic := '1';
   signal A : std_logic_vector(7 downto 0) := "00000110";
   signal B : std_logic_vector(7 downto 0) := "00000010";

 	--Outputs
   signal Fra : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Dividor16 PORT MAP (
          clk_i => clk_i,
			 start => start,
          A => A,
          B => B,
          Fra => Fra
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
		start <= '0';
		wait for clk_i_period*10;
		start <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
