LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Adder16_tb IS
END Adder16_tb;
 
ARCHITECTURE behavior OF Adder16_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder16
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Sum : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := "10101010";
   signal B : std_logic_vector(7 downto 0) := "00001111";

 	--Outputs
   signal Sum : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder16 PORT MAP (
          A => A,
          B => B,
          Sum => Sum
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
