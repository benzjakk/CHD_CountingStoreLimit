----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:34:06 05/26/2021 
-- Design Name: 
-- Module Name:    UP_DOWNCOUNT15 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UP_DOWNCOUNT15 is
    Port ( Sen : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           D1 : out  STD_LOGIC_VECTOR (3 downto 0);
           D10 : out  STD_LOGIC_VECTOR (3 downto 0));
end UP_DOWNCOUNT15;

architecture Behavioral of UP_DOWNCOUNT15 is
	signal D1tmp : STD_LOGIC_VECTOR(3 downto 0) := "0000" ;
	signal D10tmp : STD_logic_vector(3 downto 0) := "0000";
	
begin
	process(Sen,CLK)
	begin
	if( CLK 'Event and CLK = '1')then
		if Sen ='1' then
			if(D10tmp = 1) then 
				if(D1tmp =0) then
					D10tmp <= "0000";
					D1tmp <= "1001";
				else
					D1tmp <= D1tmp-1;
				end if;
			elsif(D10tmp = 0) then
				if(D1tmp > 0)then
					D1tmp <= D1tmp - 1;
				end if;
			end if;
		elsif Sen='0' then
			
			if (D10tmp = 0) then
				if(D1tmp = 9)then
					D1tmp <= "0000";
					D10tmp<="0001";
				else
					D1tmp <= D1tmp+1 ;		
					end if;
			elsif(D10tmp =1) then
				if(D1tmp < 5)then
					D1tmp<=D1tmp+1;
					end if;
			end if;
		end if;
	end if;
	end process;
	D1 <=D1tmp;
	D10 <= D10tmp;
			


end Behavioral;

