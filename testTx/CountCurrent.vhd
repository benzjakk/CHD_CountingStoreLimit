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
	Port ( data : in  STD_LOGIC_vector( 7 downto 0);
				Max : in std_logic_vector( 7 downto 0);
           Trigger : in  STD_LOGIC;
			  Output : out std_logic_vector(7 downto 0));
end CountCurrent;

architecture Behavioral of CountCurrent is
	Signal tmp : std_logic_vector(7 downto 0):= "00000000";
	
begin
	process (Trigger)
	begin
	if(rising_edge(Trigger)) then
		if(data="01010101") then
			if(tmp < Max) then 
				tmp <= tmp + '1';
			end if;
		elsif(data = "01000100") then
			if(tmp > 0) then
				tmp <= tmp - '1';
			end if;
		end if;
	end if;
	end process;
	Output <= tmp;
end Behavioral;

