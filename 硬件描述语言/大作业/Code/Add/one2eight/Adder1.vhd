library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder1 is
    Port ( 
		a : in  STD_LOGIC;
		b : in  STD_LOGIC;
		cin : in  STD_LOGIC;
		cout : out  STD_LOGIC;
		sum : out  STD_LOGIC
		);
end Adder1;

architecture rtl of Adder1 is
	
begin
	cout <= (a and b) or (a and cin) or (b and cin);
	sum  <= a xor b xor cin;

end rtl;

