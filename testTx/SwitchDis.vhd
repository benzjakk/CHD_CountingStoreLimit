----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:18:34 05/27/2021 
-- Design Name: 
-- Module Name:    SwitchDis - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SwitchDis is
	port(D1,D2,D3,D4 : in std_logic_vector(7 downto 0);
			DO : out std_logic_vector(7 downto 0);
			S : in std_logic_vector(3 downto 0));
end SwitchDis;
	
architecture Behavioral of SwitchDis is

begin
DO <= D1 when (S="0001") else
		D2 when (S="0010") else
		D3 when (S="0100") else
		D4 when (S="1000") else D1;
		

end Behavioral;

