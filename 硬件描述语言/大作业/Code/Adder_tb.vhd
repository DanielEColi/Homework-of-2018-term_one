LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY Adder_tb IS
END Adder_tb;
 
ARCHITECTURE behavior OF Adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Sum : OUT  std_logic_vector(7 downto 0);
         Carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := "10101010";
   signal B : std_logic_vector(7 downto 0) := "00000001";

 	--Outputs
   signal Sum : std_logic_vector(7 downto 0);
   signal Carry : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          A => A,
          B => B,
          Sum => Sum,
          Carry => Carry
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
