LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY Seg7_LED_tb IS
END Seg7_LED_tb;
 
ARCHITECTURE behavior OF Seg7_LED_tb IS 
 
 
    COMPONENT Seg7_LED
    PORT(
         seg7_decode_i : IN  std_logic_vector(4 downto 0);
         seg7_sel_o : OUT  std_logic_vector(7 downto 0);
         seg7_decode_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal seg7_decode_i : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal seg7_sel_o : std_logic_vector(7 downto 0);
   signal seg7_decode_o : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Seg7_LED PORT MAP (
          seg7_decode_i => seg7_decode_i,
          seg7_sel_o => seg7_sel_o,
          seg7_decode_o => seg7_decode_o
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		seg7_decode_i <= "00000";		
		wait for 100 ns;	
		seg7_decode_i <= "00001";
		wait for 100 ns;	
		seg7_decode_i <= "00010";
		wait for 100 ns;	
		seg7_decode_i <= "00011";
		wait for 100 ns;	
		seg7_decode_i <= "00100";
		wait for 100 ns;	
		seg7_decode_i <= "00101";
		wait for 100 ns;	
		seg7_decode_i <= "00110";
		wait for 100 ns;	
		seg7_decode_i <= "00111";
		wait for 100 ns;	
		seg7_decode_i <= "01000";
		wait for 100 ns;	
		seg7_decode_i <= "01001";
		wait for 100 ns;	
		seg7_decode_i <= "01010";
		wait for 100 ns;	
		seg7_decode_i <= "01011";
		wait for 100 ns;	
		seg7_decode_i <= "01100";
		wait for 100 ns;	
		seg7_decode_i <= "01101";
		wait for 100 ns;	
		seg7_decode_i <= "01110";
		wait for 100 ns;	
		seg7_decode_i <= "01111";
		wait for 100 ns;	
		seg7_decode_i <= "10000";
		wait for 100 ns;	
		seg7_decode_i <= "10001";
		wait for 100 ns;	
		seg7_decode_i <= "10010";
		wait for 100 ns;	
		seg7_decode_i <= "10011";

      -- insert stimulus here 

      wait;
   end process;

END;
