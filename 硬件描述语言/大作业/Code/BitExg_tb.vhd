LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY BitExg_tb IS
END BitExg_tb;
 
ARCHITECTURE behavior OF BitExg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BitExg
    PORT(
         din : in integer range 0 to 25535;
         bit_5 : OUT  std_logic_vector(7 downto 0);
         bit_4 : OUT  std_logic_vector(7 downto 0);
         bit_3 : OUT  std_logic_vector(7 downto 0);
         bit_2 : OUT  std_logic_vector(7 downto 0);
         bit_1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal din : integer range 0 to 25535 := 25111;

 	--Outputs
   signal bit_5 : std_logic_vector(7 downto 0);
   signal bit_4 : std_logic_vector(7 downto 0);
   signal bit_3 : std_logic_vector(7 downto 0);
   signal bit_2 : std_logic_vector(7 downto 0);
   signal bit_1 : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BitExg PORT MAP (
          din => din,
          bit_5 => bit_5,
          bit_4 => bit_4,
          bit_3 => bit_3,
          bit_2 => bit_2,
          bit_1 => bit_1
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
