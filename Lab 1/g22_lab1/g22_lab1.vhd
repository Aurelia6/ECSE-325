library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity g22_lab1 is
	Port(	clk 			: in	std_logic;
			countbytwo	: in	std_logic;
			rst			: in	std_logic;
			enable		: in	std_logic;
			output		: out	std_logic_vector(7 downto 0)); -- 8 bit counter
end g22_lab1;

-- creation of architecture for synchronous 8-bit counter
architecture counter of g22_lab1 is
-- internal variable for counter
signal counter : 	std_logic_vector(7 downto 0);

begin

	output <= counter; -- store counter result in output

	count_process: process(clk) begin
		if rising_edge(clk) then
			if (rst='1') then counter <= "00000000"; -- reset counter to 0
			elsif (countbytwo='1' and enable='1') then
				-- countbytwo is true and enable is ON, increase counter by +2
				counter <= counter + 2;
			elsif (countbytwo='0' and enable='1') then
				-- countbytwo is FALSE and enable is ON, increase counter by +1 only
				counter <= counter + 1;
			end if;
		end if;
	end process;
end counter;
				