library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity ClockDivider200K is
port ( clk,reset: in std_logic;
clock_out: out std_logic);
end ClockDivider200K;
  
architecture bhv of ClockDivider200K is
  
signal count: integer:=1;
signal tmp : std_logic := '0';
  
begin
  
process(clk,reset,tmp)
begin
if(reset='1') then
count<=1;
tmp<='0';
elsif(clk'event and clk='1') then
count <=count+1;
if (count = 100000) then
tmp <= NOT tmp;
count <= 1;
end if;
end if;
clock_out <= tmp;
end process;
  
end bhv;


