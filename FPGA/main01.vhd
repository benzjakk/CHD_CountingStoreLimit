----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:59:59 05/27/2021 
-- Design Name: 
-- Module Name:    main01 - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main01 is
	port(tx: out std_logic;
		CLK : in std_logic;
		but1 : in std_logic;
		rx : in std_logic;
		sw1 : in std_logic;
		Data7 : out  STD_LOGIC_VECTOR (6 downto 0);
      seg : out  STD_LOGIC_VECTOR (1 downto 0);
		comm: out STD_logic_vector(1 downto 0);
		led1,led2 : out std_logic
		);
end main01;

architecture Behavioral of main01 is
	component UART_TX 
	port(i_Clk       : in  std_logic;
    i_TX_DV     : in  std_logic;
    i_TX_Byte   : in  std_logic_vector(7 downto 0);
    o_TX_Active : out std_logic;
    o_TX_Serial : out std_logic;
    o_TX_Done   : out std_logic);
	 end component;
	component Decoder1to4
	port( CLK : in std_logic;
			O : out std_logic_vector(3 downto 0));
	end component;
	component SwitchDis
	port(D1,D2,D3,D4 : in std_logic_vector(7 downto 0);
			DO : out std_logic_vector(7 downto 0);
			S : in std_logic_vector(3 downto 0));
	end component;
	component ClockDivider2M
	port ( clk,reset: in std_logic;
	clock_out: out std_logic);
	end component;
	component ClockDivider200K
	port ( clk,reset: in std_logic;
	clock_out: out std_logic);
	end component;
	component CountCurrent
	Port ( data : in  STD_LOGIC_vector( 7 downto 0);
				Max : in std_logic_vector( 7 downto 0);
           Trigger : in  STD_LOGIC;
			  Output : out std_logic_vector(7 downto 0));
	end component;
	component CountMax
	Port ( sw : in  STD_LOGIC;
				Current : in std_logic_vector( 7 downto 0);
           but : in  STD_LOGIC;
			  Output : out std_logic_vector(7 downto 0));
	end component;
	component UART_RX
	port (
    i_Clk       : in  std_logic;
    i_RX_Serial : in  std_logic;
    o_RX_DV     : out std_logic;
    o_RX_Byte   : out std_logic_vector(7 downto 0)
    );
	end component;
	component bin2bcd
	port (bin :in std_logic_vector (7 downto 0);
        bcd1 : out std_logic_vector (3 downto 0);
        bcd2 : out std_logic_vector (3 downto 0));
	end component;
	component Display
		port(D1,D10 : in std_logic_vector(3 downto 0);
		s:in std_logic;
		D0:out std_logic_vector(6 downto 0));
	end component;
	component Decoder1to2
		port(I : in std_logic;
		O:out std_logic_vector(1 downto 0));
	end component;

	signal A : std_logic_vector( 3 downto 0);
	signal B : std_logic_vector(7 downto 0);
	signal newCLK,newCLK2,Trigger : std_logic;
	signal Current,Max,Data_rx:std_logic_vector(7 downto 0);
	signal bcd1,bcd2:std_logic_vector(3 downto 0);
	
begin
	IC1: UART_TX port map(i_Clk =>CLK,i_TX_DV=>'1',i_TX_Byte=>B,o_TX_Active=>led1,o_TX_Serial =>tx,o_TX_Done=>led2);
	IC2: Decoder1to4 port map(newCLK,A);
	IC3: SwitchDis port map("01111110",Current,"01111111",Max,B,A);
	IC4: ClockDivider2M port map( CLK , '0',newCLK);
	IC5: CountCurrent port map(Data_rx,Max,Trigger,Current);
	IC6: CountMax port map(sw1,Current,but1,Max);
	IC7: UART_RX port map(CLK,rx,Trigger,Data_rx);
	IC8: bin2bcd port map(Max,bcd1,bcd2);
	IC9: Display port map(bcd1,bcd2,newCLK2,Data7);
	IC10: Decoder1to2 port map(newCLK2,seg);
	IC11: ClockDivider200K port map(CLK,'0',newCLK2);
	comm <= "11";
end Behavioral;

