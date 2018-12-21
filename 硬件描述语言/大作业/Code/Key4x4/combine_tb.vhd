LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY combine_tb IS
END combine_tb;
 
ARCHITECTURE behavior OF combine_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT combine
    PORT(
         row_i : IN  std_logic_vector(3 downto 0);
         col_i : IN  std_logic_vector(3 downto 0);
         row_col_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal row_i : std_logic_vector(3 downto 0) := (others => '0');
   signal col_i : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal row_col_o : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: combine PORT MAP (
          row_i => row_i,
          col_i => col_i,
          row_col_o => row_col_o
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		row_i <= "0111";
		col_i <= "1011";
		
      -- insert stimulus here 

      wait;
   end process;

END;
