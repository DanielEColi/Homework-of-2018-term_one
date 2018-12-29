LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY subtracter_tb IS
END subtracter_tb;
 
ARCHITECTURE behavior OF subtracter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Subtracter
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Dif : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := "10101010";
   signal B : std_logic_vector(7 downto 0) := "00000111";

 	--Outputs
   signal Dif : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Subtracter PORT MAP (
          A => A,
          B => B,
          Dif => Dif
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
