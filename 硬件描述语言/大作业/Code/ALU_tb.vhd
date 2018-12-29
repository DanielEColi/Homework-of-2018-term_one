LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         clk_i : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Sel : IN  std_logic_vector(1 downto 0);
         Div : IN  std_logic;
         Result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Sel : std_logic_vector(1 downto 0) := (others => '0');
   signal Div : std_logic := '1';

 	--Outputs
   signal Result : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          clk_i => clk_i,
          A => A,
          B => B,
          Sel => Sel,
          Div => Div,
          Result => Result
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
		A <= "00000110";
		wait for clk_i_period*10;
		Sel <= "11";
		Div <= '0';
		wait for clk_i_period*100;
		B <= "00000101";
		

		

      -- insert stimulus here 

      wait;
   end process;

END;
