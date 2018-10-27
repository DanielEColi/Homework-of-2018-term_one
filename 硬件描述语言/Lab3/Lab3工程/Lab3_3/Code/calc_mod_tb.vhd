LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY calc_mod_tb IS
END calc_mod_tb;
 
ARCHITECTURE behavior OF calc_mod_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT calc_mod
    PORT(
         data_i : IN  std_logic_vector(5 downto 0);
         data_o : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_i : std_logic_vector(5 downto 0) := "011001";

 	--Outputs
   signal data_o : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: calc_mod PORT MAP (
          data_i => data_i,
          data_o => data_o
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
      -- insert stimulus here 

      wait;
   end process;

END;
