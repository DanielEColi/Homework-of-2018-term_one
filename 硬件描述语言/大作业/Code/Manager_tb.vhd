LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Manager_tb IS
END Manager_tb;
 
ARCHITECTURE behavior OF Manager_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Manager
    PORT(
         rst_n_i : IN  std_logic;
         wr_en : IN  std_logic;
         decode : IN  std_logic_vector(3 downto 0);
         set_rst : OUT  std_logic;
         clear : OUT  std_logic;
         div : OUT  std_logic;
         A : OUT  std_logic_vector(7 downto 0);
         B : OUT  std_logic_vector(7 downto 0);
         sel : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst_n_i : std_logic := '0';
   signal wr_en : std_logic := '0';
   signal decode : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal set_rst : std_logic;
   signal clear : std_logic;
   signal div : std_logic;
   signal A : std_logic_vector(7 downto 0);
   signal B : std_logic_vector(7 downto 0);
   signal sel : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Manager PORT MAP (
          rst_n_i => rst_n_i,
          wr_en => wr_en,
          decode => decode,
          set_rst => set_rst,
          clear => clear,
          div => div,
          A => A,
          B => B,
          sel => sel
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		rst_n_i <= '1';
		wait for 100 ns;
		decode <= "1000";
		wr_en <= '1';
		wait for 100 ns;
		wr_en <= '0';
		wait for 100 ns;
		wr_en <= '1';
		decode <= "1101";
		wait for 100 ns;
		wr_en <= '0';
		wait for 100 ns;
		wr_en <= '1';
		decode <= "0111";
		wait for 100 ns;
		wr_en <= '0';
		wait for 100 ns;
		wr_en <= '1';
		wait for 100 ns;
		wr_en <= '0';
		wait for 100 ns;
		wr_en <= '1';
		wait for 100 ns;
		wr_en <= '0';
		
      wait;
   end process;

END;
