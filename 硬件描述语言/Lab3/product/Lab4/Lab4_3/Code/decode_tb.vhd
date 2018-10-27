LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY decode_tb IS
END decode_tb;
 
ARCHITECTURE behavior OF decode_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decode
    PORT(
         seg7_BCDcode_i : IN  std_logic_vector(4 downto 0);
         seg7_decode_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal seg7_BCDcode_i : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal seg7_decode_o : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decode PORT MAP (
          seg7_BCDcode_i => seg7_BCDcode_i,
          seg7_decode_o => seg7_decode_o
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		seg7_BCDcode_i <= "10001";

      -- insert stimulus here 

      wait;
   end process;

END;
