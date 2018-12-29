LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY complement_tb IS
END complement_tb;
 
ARCHITECTURE behavior OF complement_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT complement
    PORT(
         Data_i : IN  std_logic_vector(7 downto 0);
         Data_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Data_i : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Data_o : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: complement PORT MAP (
          Data_i => Data_i,
          Data_o => Data_o
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Data_i <= "10100000";
      -- insert stimulus here 

      wait;
   end process;

END;
