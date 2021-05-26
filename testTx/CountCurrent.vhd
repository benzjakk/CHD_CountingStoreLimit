----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:02:29 05/27/2021 
-- Design Name: 
-- Module Name:    CountCurrent - Behavioral 
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

entity CountCurrent is
	Port ( Sen : in  STD_LOGIC;
				Max : in std_logic_vector( 7 downto 0);
           CLK : in  STD_LOGIC;
			  Output : out std_logic_vector(7 downto 0));
end CountCurrent;

architecture Behavioral of CountCurrent is
	Signal tmp : std_logic_vector(7 downto 0):= "00000000";
	
begin
	process (CLK)
	begin
	if(CLK'Event and CLK ='1') then
		if( Sen = '1') then 
			if( tmp < Max ) then
				tmp <= tmp+'1';
			end if;
		else
			if(tmp > 0 ) then
				tmp <= tmp-'1';
			end if;
		end if;
	end if;
	end process;
	Output <= tmp;
end Behavioral;

