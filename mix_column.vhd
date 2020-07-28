-- ENTITY           : mix_column
-- DESCRIPTION      : This is the lookup table used in the Inverse SubByte.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.GF.ALL;


ENTITY mix_column IS
PORT(
    mixcolumn_in     :   IN  std_logic_vector(127 downto 0);
    mixcolumn_out    :   OUT std_logic_vector(127 downto 0)
    );
END mix_column;

ARCHITECTURE mix_column_arch OF mix_column IS
    
signal temp : std_logic_vector(127 downto 0) ; 

BEGIN
-- multiplication & mix column

                   temp(7 downto 0)  <= GFmult2(mixcolumn_in(7 downto 0)) xor GFmult3(mixcolumn_in(15 downto 8)) xor mixcolumn_in(23 downto 16) xor mixcolumn_in(31 downto 24);
	                temp(15 downto 8) <= mixcolumn_in(7 downto 0) xor GFmult2(mixcolumn_in(15 downto 8)) xor GFmult3(mixcolumn_in(23 downto 16)) xor mixcolumn_in(31 downto 24);
	                temp(23 downto 16) <= mixcolumn_in(7 downto 0) xor mixcolumn_in(15 downto 8) xor GFmult2(mixcolumn_in(23 downto 16)) xor GFmult3(mixcolumn_in(31 downto 24));
	                temp(31 downto 24) <= GFmult3(mixcolumn_in(7 downto 0)) xor mixcolumn_in(15 downto 8) xor mixcolumn_in(23 downto 16) xor GFmult2(mixcolumn_in(31 downto 24));
	        
	                temp(39 downto 32) <= GFmult2(mixcolumn_in(39 downto 32)) xor GFmult3(mixcolumn_in(47 downto 40)) xor mixcolumn_in(55 downto 48) xor mixcolumn_in(63 downto 56); 
	                temp(47 downto 40) <= mixcolumn_in(39 downto 32) xor GFmult2(mixcolumn_in(47 downto 40)) xor GFmult3(mixcolumn_in(55 downto 48)) xor mixcolumn_in(63 downto 56);
	                temp(55 downto 48) <= mixcolumn_in(39 downto 32) xor mixcolumn_in(47 downto 40) xor GFmult2(mixcolumn_in(55 downto 48)) xor GFmult3(mixcolumn_in(63 downto 56));
	                temp(63 downto 56) <= GFmult3(mixcolumn_in(39 downto 32)) xor mixcolumn_in(47 downto 40) xor mixcolumn_in(55 downto 48) xor GFmult2(mixcolumn_in(63 downto 56));
	        
	                temp(71 downto 64) <= GFmult2(mixcolumn_in(71 downto 64)) xor GFmult3(mixcolumn_in(79 downto 72)) xor mixcolumn_in(87 downto 80) xor mixcolumn_in(95 downto 88); 
	                temp(79 downto 72) <= mixcolumn_in(71 downto 64) xor GFmult2(mixcolumn_in(79 downto 72)) xor GFmult3(mixcolumn_in(87 downto 80)) xor mixcolumn_in(95 downto 88);
	                temp(87 downto 80) <= mixcolumn_in(71 downto 64) xor mixcolumn_in(79 downto 72) xor GFmult2(mixcolumn_in(87 downto 80)) xor GFmult3(mixcolumn_in(95 downto 88));
	                temp(95 downto 88) <= GFmult3(mixcolumn_in(71 downto 64)) xor mixcolumn_in(79 downto 72) xor mixcolumn_in(87 downto 80) xor GFmult2(mixcolumn_in(95 downto 88));
	        
	                temp(103 downto 96) <= GFmult2(mixcolumn_in(103 downto 96)) xor GFmult3(mixcolumn_in(111 downto 104)) xor mixcolumn_in(119 downto 112) xor mixcolumn_in(127 downto 120); 
	                temp(111 downto 104) <= mixcolumn_in(103 downto 96) xor GFmult2(mixcolumn_in(111 downto 104)) xor GFmult3(mixcolumn_in(119 downto 112)) xor mixcolumn_in(127 downto 120);
	                temp(119 downto 112) <= mixcolumn_in(103 downto 96) xor mixcolumn_in(111 downto 104) xor GFmult2(mixcolumn_in(119 downto 112)) xor GFmult3(mixcolumn_in(127 downto 120)); 
	                temp(127 downto 120) <= GFmult3(mixcolumn_in(103 downto 96)) xor mixcolumn_in(111 downto 104) xor mixcolumn_in(119 downto 112) xor GFmult2(mixcolumn_in(127 downto 120));
						 
						 mixcolumn_out <=temp;

END mix_column_arch;
