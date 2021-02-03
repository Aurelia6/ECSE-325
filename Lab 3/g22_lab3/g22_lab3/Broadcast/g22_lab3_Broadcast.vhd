library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity g22_lab3_Broadcast is
port (
		x		: in std_logic_vector(15 downto 0); --input
		clk	: in std_logic;  -- clock
		rst	: in std_logic;  -- asynchronous active-high reset
		y 		: out std_logic_vector(16 downto 0));  -- output
end g22_lab3_Broadcast;

architecture Broadcast of g22_lab3_Broadcast is
	
	type multi_array is array(24 downto 0) of signed(15 downto 0);	-- creation of a multidimensional array for weights and inputs
	signal weights : multi_array;					-- Holds the 25 weights
	signal input_sig :multi_array;				-- Hold the inputs
	signal current_input_sig : multi_array;	-- Holds the x(N) term	
	-- sumXX are the temporary variables for incrementing
	signal sum1  : signed(31 downto 0);				
	signal sum2  : signed(31 downto 0);				
	signal sum3  : signed(31 downto 0);			
	signal sum4  : signed(31 downto 0);	
	signal sum5  : signed(31 downto 0);	
	signal sum6  : signed(31 downto 0);	
	signal sum7  : signed(31 downto 0);		
	signal sum8  : signed(31 downto 0);			
	signal sum9  : signed(31 downto 0);			
	signal sum10  : signed(31 downto 0);				
	signal sum11  : signed(31 downto 0);				
	signal sum12  : signed(31 downto 0);			
	signal sum13  : signed(31 downto 0);		
	signal sum14  : signed(31 downto 0);	
	signal sum15  : signed(31 downto 0);		
	signal sum16  : signed(31 downto 0);	
	signal sum17  : signed(31 downto 0);	
	signal sum18  : signed(31 downto 0);			
	signal sum19  : signed(31 downto 0);		
	signal sum20  : signed(31 downto 0);	
	signal sum21  : signed(31 downto 0);		
	signal sum22  : signed(31 downto 0);		
	signal sum23  : signed(31 downto 0);		
	signal sum24  : signed(31 downto 0);			
	signal sum25  : signed(31 downto 0);		
	
	signal sum : signed(31 downto 0);	-- sum total
	
	
	begin
		--Assign the weights, we use the values converted into binary from the given coef file 
		weights(0) <= "0000001001110011"; 
		weights(1) <= "0000000000010001"; 
		weights(2) <= "1111111111010010"; 
		weights(3) <= "1111111011011101"; 
		weights(4) <= "0000001100011010"; 
		weights(5) <= "1111110110100111"; 
		weights(6) <= "1111110000001101";
		weights(7) <= "0000110110111101";
		weights(8) <= "1110110001110010"; 
		weights(9) <= "0000110111111000";
		weights(10) <= "0000001100001000";
		weights(11) <= "1110101000001010"; 
		weights(12) <= "0001111000110100"; 
		weights(13) <= "1110101000001010"; 
		weights(14) <= "0000001100001000"; 
		weights(15) <= "0000110111111000";
		weights(16) <= "1110110001110010"; 
		weights(17) <= "0000110110111101";
		weights(18) <= "1111110000001101"; 
		weights(19) <= "1111110110100111";  
		weights(20) <= "0000001100011010"; 
		weights(21) <= "1111111011011101"; 
		weights(22) <= "1111111111010010"; 
		weights(23) <= "0000000000010001"; 
		weights(24) <= "0000001001110011"; 
		
		-- We perform convolution
		convolution : process(rst, clk)
		begin
			if rst = '1' then
				-- Reset input array values to 0
				input_sig <= (others => (others =>'0'));
				 sum1 <= (others => '0');
				 sum2 <= (others => '0');
				 sum3 <= (others => '0');
				 sum4 <= (others => '0');
				 sum5 <= (others => '0');
				 sum6 <= (others => '0');
				 sum7 <= (others => '0');
				 sum8 <= (others => '0');
				 sum9 <= (others => '0');
				 sum10 <= (others => '0');
				 sum11 <= (others => '0');
				 sum12 <= (others => '0');
				 sum13 <= (others => '0');
				 sum14 <= (others => '0');
				 sum15 <= (others => '0');
				 sum16 <= (others => '0');
				 sum17 <= (others => '0');
				 sum18 <= (others => '0');
				 sum19 <= (others => '0');
				 sum20 <= (others => '0');
				 sum21 <= (others => '0');
				 sum22 <= (others => '0');
				 sum23 <= (others => '0');
				 sum24 <= (others => '0');
				 sum25 <= (others => '0');
				 
		
			elsif(rising_edge(clk)) then
				sum <= (others=>'0'); -- Reset the temp sum
				input_sig(24) <= signed(x);		
				-- Assign each sumXX
				sum1 <= input_sig(24) * weights(24) + sum2;
				sum2 <= input_sig(24) * weights(23) + sum3;
				sum3 <= input_sig(24) * weights(22) + sum4;
				sum4 <= input_sig(24) * weights(21) + sum5;
				sum5 <= input_sig(24) * weights(20) + sum6;
				sum6 <= input_sig(24) * weights(19) + sum7;
				sum7 <= input_sig(24) * weights(18) + sum8;
				sum8 <= input_sig(24) * weights(17) + sum9;
				sum9 <= input_sig(24) * weights(16) + sum10;
				sum10 <= input_sig(24) * weights(15) + sum11;
				sum11 <= input_sig(24) * weights(14) + sum12;
				sum12 <= input_sig(24) * weights(13) + sum13;
				sum13 <= input_sig(24) * weights(12) + sum14;
				sum14 <= input_sig(24) * weights(11) + sum15;
				sum15 <= input_sig(24) * weights(10) + sum16;
				sum16 <= input_sig(24) * weights(9) + sum17;
				sum17 <= input_sig(24) * weights(8) + sum18;
				sum18 <= input_sig(24) * weights(7) + sum19;
				sum19 <= input_sig(24) * weights(6) + sum20;
				sum20 <= input_sig(24) * weights(5) + sum21;
				sum21 <= input_sig(24) * weights(4) + sum22;
				sum22 <= input_sig(24) * weights(3) + sum23;
				sum23 <= input_sig(24) * weights(2) + sum24;
				sum24 <= input_sig(24) * weights(1) + sum25;
				sum25 <= input_sig(24) * weights(0);
			end if;
		end process convolution;
	y <= std_logic_vector(sum1(31 downto 15));
end Broadcast;