LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY Adder1_tb IS
END Adder1_tb;
 
ARCHITECTURE behavior OF Adder1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder1
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         cout : OUT  std_logic;
         sum : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal cout : std_logic;
   signal sum : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder1 PORT MAP (
          a => a,
          b => b,
          cin => cin,
          cout => cout,
          sum => sum
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		a <= '1';
		b <= '0';
		cin <= '1';
		
      -- insert stimulus here 

      wait;
   end process;

END;
