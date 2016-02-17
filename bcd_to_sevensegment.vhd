----------------------------------------------------------------------------------
-- Engineer: 		Mohammad H. Amir Amjadi
-- 
-- Create Date:		21:12:12 02/17/2016 
-- Module Name:		bcd_to_sevensegment - Dataflow 
-- Usage:				Assign BCD code in STD_LOGIC_VECTOR to the BCD_CODE vector.
--					Output will be available on SEVEN_SEGMENT. Output is not registered.
--					Hex numbers are assignable too.
-- License:			GNU LGPL Version 3
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_to_sevensegment is
    Port ( BCD_CODE : in  STD_LOGIC_VECTOR (3 downto 0);
           SEVEN_SEGMENT : out  STD_LOGIC_VECTOR (6 downto 0));
end bcd_to_sevensegment;

architecture Dataflow of bcd_to_sevensegment is
signal a,b,c,d: STD_LOGIC;
begin

d<=not BCD_CODE(0);
c<=not BCD_CODE(1);
b<=not BCD_CODE(2);
a<=not BCD_CODE(3);

SEVEN_SEGMENT(0) <= ((not c) and (not d) and (not a) and b) or ((not a) and (not b) and (not c) and d) or (a and b and (not c) and d) or (a and (not b) and c and d);
SEVEN_SEGMENT(1) <= ((not a) and b and (not c) and d) or (a and c and d) or (b and c and (not d)) or (a and b and (not d));
SEVEN_SEGMENT(2) <= (a and b and c) or (a and b and (not d)) or ((not a) and (not b) and c and (not d));
SEVEN_SEGMENT(3) <= (b and c and d) or ((not a) and (not b) and (not c) and d) or ((not a) and b and (not c) and (not d)) or (a and (not b) and c and (not d));
SEVEN_SEGMENT(4) <= ((not a) and d) or ((not a) and b and (not c)) or ((not b) and (not c) and d);
SEVEN_SEGMENT(5) <= (a and b and (not c) and d) or ((not a) and c and d) or ((not a) and (not b) and d) or ((not a) and (not b) and c);
SEVEN_SEGMENT(6) <= ((not a) and (not b) and (not c)) or (a and b and (not c) and (not d)) or ((not a) and b and c and d);

end Dataflow;

