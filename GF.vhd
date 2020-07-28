-- ENTITY           : GF
-- DESCRIPTION      : Two Galois multiplication(by 2 and 3) functions 


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_ARITH.ALL;
USE IEEE.std_logic_UNSIGNED.ALL;


PACKAGE GF IS
  FUNCTION GFmult2 (
     I : std_logic_vector(7 DOWNTO 0))
    RETURN std_logic_vector;
  
  FUNCTION GFmult3 (
     I : std_logic_vector(7 DOWNTO 0))
    RETURN std_logic_vector;
	 
END GF;


PACKAGE BODY GF IS

    FUNCTION GFmult2 (
     I : std_logic_vector(7 DOWNTO 0))
    RETURN std_logic_vector IS
      VARIABLE  result : std_logic_vector(7 DOWNTO 0);      
    BEGIN

      result := (I(6 DOWNTO 0) & '0') xor (x"1B" and ("000" & I(7)& I(7) & "0" & I(7)& I(7)));
      RETURN result;
    END GFmult2;

    FUNCTION GFmult3 (
     I : std_logic_vector(7 DOWNTO 0))
    RETURN std_logic_vector IS
      VARIABLE result : std_logic_vector(7 DOWNTO 0);   
    BEGIN
      result := GFmult2(I) xor I;
      RETURN result;
    END GFmult3;
	 
END GF;
