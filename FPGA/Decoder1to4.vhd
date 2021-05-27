----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:23:27 05/27/2021 
-- Design Name: 
-- Module Name:    Decoder1to4 - Behavioral 
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

entity Decoder1to4 is
	port( CLK : in std_logic;
			O : out std_logic_vector(3 downto 0));
end Decoder1to4;

architecture Behavioral of Decoder1to4 is
	signal count : STD_LOGIC_VECTOR(1 downto 0) := "00";
	signal Otmp : std_logic_vector(3 downto 0);
begin
	process(CLK)
	begin
		if(CLK'Event and CLK = '1') then
			if(count < 3) then
				count <= count + '1';
			else
				count <= "00";
			end if;
			if(count = 0) then 
				Otmp <= "0001";
			elsif(count =1) then
				Otmp <= "0010";
			elsif(count =2) then
				Otmp <= "0100";
			else
				Otmp <="1000";
			end if;
		end if;
	end process;
	O <= Otmp;
end Behavioral;

