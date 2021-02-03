library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity g22_lab2 is 
port(x: in std_logic_vector (9 downto 0); -- first input, you have to first calculate length
	y: in std_logic_vector (9 downto 0); -- second input,race ?? with your length
	N: in std_logic_vector (9 downto 0); -- total number of inputs
	clk: in std_logic; --clock
	rst: in std_logic; --async reset (active-high)
	mac: out std_logic_vector (19 downto 0); --output of MAC unit, replace the length
	ready: out std_logic); -- denotes the validity of the mac signal
end g22_lab2;

architecture MAC_unit of g22_lab2 is 
	signal product: std_logic_vector(19 downto 0) ; -- product of x and y
	signal count : std_logic_vector(9 downto 0); -- keeps count of how many MAC iterations
	begin
		process(clk)
		begin
		if rst ='1' then
			product <= (others => '0'); -- reset product
			count <= (others => '0'); -- reset counter 
		elsif rising_edge(clk) then
			if (count < N) then -- if counter < 1000, multiply x, y and add product
				product <= std_logic_vector(signed(x) * signed(y) + signed(product)); 
				count <= std_logic_vector(signed(count) + 1); --increment counter
			end if;
		end if;
		ready <= '1';
	end process;
	mac <= std_logic_vector(product);
	
end MAC_unit;
