library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity g22_lab3_FIR_tb is
end g22_lab3_FIR_tb;

architecture test of g22_lab3_FIR_tb is
-- Declare the component under test
component g22_lab3_FIR is
	port(
		x : in std_logic_vector(15 downto 0); -- input
		clk : in std_logic; -- clock
		rst : in std_logic; -- asynchronous active-high reset
		y : out std_logic_vector(16 downto 0) -- output
		);
end component g22_lab3_FIR;

--Testbench internal signals
file file_VECTORS_X : text;
file file_RESULTS : text;

constant clk_PERIOD : time := 100 ns;

signal x_in : std_logic_vector(15 downto 0); -- input
signal clk_in : std_logic; -- clock
signal rst_in : std_logic; -- asynchronous active-high reset
signal y_out : std_logic_vector(16 downto 0); -- output

begin
-- Instantiate FIR
	g22_lab3_FIR_INST : g22_lab3_FIR
	port map(
		 x => x_in, 
		  clk => clk_in, 
		  rst => rst_in, 
		  y => y_out
		);

-- Clock generation
	clock_generation : process
	begin
		clk_in <= '1';
		wait for clk_PERIOD / 2;
		clk_in <= '0';
		wait for clk_PERIOD / 2;
	end process clock_generation;

-- Feeding inputs
	feeding_instr : process is
		variable v_Iline1 : line;
		variable v_Oline : line;
		variable v_x_in : std_logic_vector(15 downto 0);

	begin
		rst_in <= '1';
		wait until rising_edge(clk_in);
		wait until rising_edge(clk_in);
		rst_in <= '0';

		file_open(file_VECTORS_X, "P:\g22_lab3\FIR\work\lab3-In-converted.txt", read_mode);
		file_open(file_RESULTS, "P:\g22_lab3\FIR\work\lab3-FIR-output.txt", write_mode);

		while not endfile(file_VECTORS_X) loop
			readline(file_VECTORS_X, v_Iline1);
			read(v_Iline1, v_x_in);

			x_in <= v_x_in;

			wait until rising_edge(clk_in);
			write(v_Oline, y_out);
			writeline(file_RESULTS, v_Oline);

		end loop;
		wait;
	end process;
end test;


