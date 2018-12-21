LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY subtractor_tb IS
END subtractor_tb;
 
ARCHITECTURE behavior OF subtractor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT subtractor
    PORT(
         cin1 : IN  std_logic;
         cin2 : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         S : OUT  std_logic_vector(7 downto 0);
         cout : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal cin1 : std_logic := '1';
   signal cin2 : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := "10111111";
   signal B : std_logic_vector(7 downto 0) := "01111111";

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: subtractor PORT MAP (
          cin1 => cin1,
          cin2 => cin2,
          A => A,
          B => B,
          S => S,
          cout => cout
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
