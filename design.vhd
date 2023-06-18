library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity Int_SQRT_Calculator is
port( CLK, RESET, S : in std_logic;
	   X : in std_logic_vector(7 downto 0);
 	   Sqrt : out std_logic_vector(7 downto 0));
end ;


architecture CCT of Int_SQRT_Calculator is

type state is(T0,T1,T2,T3,T4);
signal currentS,nextS : state;
signal a,q,d: std_logic_vector(7 downto 0);
begin

process(CLK, RESET)
begin 
		if RESET ='0' then
        	currentS <=T0;
            
        elsif (CLK'event and CLK ='1') then
            currentS<=nextS;
        end if;
end process;

process (currentS,s)
begin
case currentS is 
			when T0 =>
            		if s='0' then
            			 nextS<=T0; 
                    else nextS<=T1;
                    end if;
			when T1 =>
            			nextS<=T2; 
			when T2 =>
                    if q>a then
            			nextS<=T3;
                     else nextS<=T1;
                     end if;
			when T3 =>
            			nextS<=T4;
			when T4 =>
            			nextS<=T0;
                        
end case;
end process;
 
 
 
process(currentS , CLK,X)
begin 

if(CLK'event and CLK ='1') then 
		if (currentS =T0 and s='1')then
           a <=X;
		   q <= "00000001";
           d <= "00000011";
           
        elsif(currentS =T1) then
           q <= q+d;
        elsif(currentS =T2) then
           d <=d+2;
        elsif(currentS =T3) then
           d<= d srl 1;
         elsif(currentS =T4) then
           Sqrt <=d-1;
           
        end if;
        
        end if;
end process;
end cct;

        
        
        
        
        
        