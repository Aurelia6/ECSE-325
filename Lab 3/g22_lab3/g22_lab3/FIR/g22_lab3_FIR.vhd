library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g22_lab3_FIR is
port( 
	x : in std_logic_vector(15 downto 0); -- input
	clk : in std_logic; -- clock
	rst : in std_logic; -- asynchronous active-high reset
	y : out std_logic_vector(16 downto 0) -- output
	);
end g22_lab3_FIR;

architecture FIR of g22_lab3_FIR is
	type multi_array is array(24 downto 0) of signed(15 downto 0); -- creation of a multidimensional array for weights and input signals
	signal weights : multi_array; -- holds the 25 weights
	signal input_sig : multi_array; -- holds the input signals
	signal sum: signed(31 downto 0);

	begin
		-- Weights
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

		-- performing the convolution process
		convolution : process(rst, clk)
		variable sum1 : signed(31 downto 0);
		variable sum2 : signed(31 downto 0);
		variable sum3 : signed(31 downto 0);
		variable sum4 : signed(31 downto 0);
		variable sum5 : signed(31 downto 0);
		variable sum6 : signed(31 downto 0);
		variable sum7 : signed(31 downto 0);
		variable sum8 : signed(31 downto 0);
		variable sum9 : signed(31 downto 0);
		variable sum10 : signed(31 downto 0);
		variable sum11 : signed(31 downto 0);
		variable sum12 : signed(31 downto 0);
		variable sum13 : signed(31 downto 0);
		variable sum14 : signed(31 downto 0);
		variable sum15 : signed(31 downto 0);
		variable sum16 : signed(31 downto 0);
		variable sum17 : signed(31 downto 0);
		variable sum18 : signed(31 downto 0);
		variable sum19 : signed(31 downto 0);
		variable sum20 : signed(31 downto 0);
		variable sum21 : signed(31 downto 0);
		variable sum22 : signed(31 downto 0);
		variable sum23 : signed(31 downto 0);
		variable sum24 : signed(31 downto 0);
		variable sum25 : signed(31 downto 0);

		begin
			if rst = '1' then
			input_sig <= (others => (others => '0')); -- reset input array values to 0
			elsif(rising_edge(clk)) then
			sum <= "00000000000000000000000000000000";
			for i in 1 to 24 loop
				input_sig(i) <= input_sig(i-1);
			end loop;
			input_sig(0) <= signed(x);

			-- storing the sum
			sum1 := input_sig(24) * weights(0);
			sum2 := input_sig(23) * weights(1);
			sum3 := input_sig(22) * weights(2);
			sum4 := input_sig(21) * weights(3);
			sum5 := input_sig(20) * weights(4);
			sum6 := input_sig(19) * weights(5);
			sum7 := input_sig(18) * weights(6);
			sum8 := input_sig(17) * weights(7);
			sum9 := input_sig(16) * weights(8);
			sum10 := input_sig(15) * weights(9);
			sum11 := input_sig(14) * weights(10);
			sum12 := input_sig(13) * weights(11);
			sum13 := input_sig(12) * weights(12);
			sum14 := input_sig(11) * weights(13);
			sum15 := input_sig(10) * weights(14);
			sum16 := input_sig(9) * weights(15);
			sum17 := input_sig(8) * weights(16);
			sum18 := input_sig(7) * weights(17);
			sum19 := input_sig(6) * weights(18);
			sum20 := input_sig(5) * weights(19);
			sum21 := input_sig(4) * weights(20);
			sum22 := input_sig(3) * weights(21);
			sum23 := input_sig(2) * weights(22);
			sum24 := input_sig(1) * weights(23);
			sum25 := input_sig(0) * weights(24);

			sum <= sum1 + sum2 + sum3 + sum4 + sum5 + sum6 + sum7 + sum8 + sum9 + sum10 + sum11 + sum12 + sum13 + sum14 + sum15 + sum16 + sum17 + sum18 + sum19 + sum20 + sum21 + sum22 + sum23 + sum24 + sum25;
			end if;
		end process convolution;
		y <= std_logic_vector(sum(31 downto 15));
	end FIR;