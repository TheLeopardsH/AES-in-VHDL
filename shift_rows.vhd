
-- ENTITY           : shift_rows
--
-- DESCRIPTION      : This module takes a 128 bit input and it is shifted as per specs
--  | 0 4  8 12 |          |  0  4  8 12 |    (no row shift)             
--  | 1 5  9 13 |   ==>    |  5  9 13  1 |    ( 1 left row shift)     
--  | 2 6 10 14 |          | 10 14  2  6 |    ( 2 left row shift)    
--  | 3 7 11 15 |          | 15  3  7 11 |    ( 3 left row shift)  
--                   
-- first row is not shifted
-- second row is shifted left by one
-- third row is shifted left by two
-- fourth row is shifted left by three


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY shift_rows IS
PORT(
    shiftrow_in     :   IN  std_logic_vector(127 downto 0);
    shiftrow_out    :   OUT std_logic_vector(127 downto 0)
    );
END shift_rows;

ARCHITECTURE shift_rows_arch OF shift_rows IS
		signal temp: std_logic_vector(127 downto 0);
		begin
		--ROW 1 (UNCHANGED)
		temp(127 downto 120) <= shiftrow_in(127 downto 120);
		temp(95 downto 88) <= shiftrow_in(95 downto 88);
		temp(63 downto 56) <= shiftrow_in(63 downto 56);
		temp(31 downto 24) <= shiftrow_in(31 downto 24);
		--ROW 2 (1 BYTE SHIFT LEFT)
		temp(119 downto 112) <= shiftrow_in(87 downto 80);
		temp(87 downto 80) <= shiftrow_in(55 downto 48);
		temp(55 downto 48) <= shiftrow_in(23 downto 16);
		temp(23 downto 16) <= shiftrow_in(119 downto 112);
		--ROW 3	(2 BYTE SHIFT LEFT) 
		temp(111 downto 104) <= shiftrow_in(47 downto 40);
		temp(79 downto 72) <= shiftrow_in(15 downto 8);
		temp(47 downto 40) <= shiftrow_in(111 downto 104);
		temp(15 downto 8) <= shiftrow_in(79 downto 72);
		--ROW 4	(3 BYTE SHIFT LEFT) 
		temp(103 downto 96) <= shiftrow_in(7 downto 0);
		temp(71 downto 64) <= shiftrow_in(103 downto 96);
		temp(39 downto 32) <= shiftrow_in(71 downto 64);
		temp(7 downto 0) <= shiftrow_in(39 downto 32);	
		shiftrow_out <= temp;
	
END shift_rows_arch;			    
