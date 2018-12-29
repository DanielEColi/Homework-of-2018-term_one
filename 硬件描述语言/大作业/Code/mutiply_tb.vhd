LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mutiply_tb IS
END mutiply_tb;
 
ARCHITECTURE behavior OF mutiply_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mutiply
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Prod : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := "00111000";
   signal B : std_logic_vector(7 downto 0) := "01010101";

 	--Outputs
   signal Prod : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mutiply PORT MAP (
          A => A,
          B => B,
          Prod => Prod
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
