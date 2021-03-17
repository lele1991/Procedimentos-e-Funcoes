-------------------------------------------------------------------
-- Name        : de0_lite.vhd
-- Author      : 
-- Version     : 0.1
-- Copyright   : Departamento de Eletrônica, Florianópolis, IFSC
-- Description : Projeto base DE10-Lite
-------------------------------------------------------------------
LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;

USE WORK.proc_func.ALL;

entity de10_lite is 
	port (
		---------- CLOCK ----------
		ADC_CLK_10:		in std_logic;
		MAX10_CLK1_50: in std_logic;
		MAX10_CLK2_50: in std_logic;
		
		----------- SDRAM ------------
		DRAM_ADDR: 	out std_logic_vector (12 downto 0);
		DRAM_BA: 	out std_logic_vector (1 downto 0);
		DRAM_CAS_N: out std_logic;
		DRAM_CKE: 	out std_logic;
		DRAM_CLK: 	out std_logic;
		DRAM_CS_N: 	out std_logic;		
		DRAM_DQ: 	inout std_logic_vector(15 downto 0);
		DRAM_LDQM: 	out std_logic;
		DRAM_RAS_N: out std_logic;
		DRAM_UDQM: 	out std_logic;
		DRAM_WE_N: 	out std_logic;
		
		----------- SEG7 ------------
		HEX0: out std_logic_vector(7 downto 0);
		HEX1: out std_logic_vector(7 downto 0);
		HEX2: out std_logic_vector(7 downto 0);
		HEX3: out std_logic_vector(7 downto 0);
		HEX4: out std_logic_vector(7 downto 0);
		HEX5: out std_logic_vector(7 downto 0);

		----------- KEY ------------
		KEY: in std_logic_vector(1 downto 0);

		----------- LED ------------
		LEDR: out std_logic_vector(9 downto 0);

		----------- SW ------------
		SW: in std_logic_vector(9 downto 0);

		----------- VGA ------------
		VGA_B: 	out std_logic_vector(3 downto 0);
		VGA_G: 	out std_logic_vector(3 downto 0);
		VGA_HS: 	out std_logic;
		VGA_R: 	out std_logic_vector(3 downto 0);
		VGA_VS: 	out std_logic;
	
		----------- Accelerometer ------------
		GSENSOR_CS_N: 	out std_logic;
		GSENSOR_INT: 	in std_logic_vector(2 downto 1);
		GSENSOR_SCLK: 	out std_logic;
		GSENSOR_SDI: 	inout std_logic;
		GSENSOR_SDO: 	inout std_logic;
	
		----------- Arduino ------------
		ARDUINO_IO: 		inout std_logic_vector(15 downto 0);
		ARDUINO_RESET_N: 	inout std_logic
	);
end entity;


architecture rtl of de10_lite is
	
	-- ipcatalog->library-> basic-> simul-> debug-> intel = *** 
	-- declaração implicita
	component funcproc is
		port (
			source : out std_logic_vector(79 downto 0);                   
			probe  : in  std_logic_vector(39 downto 0) := (others => 'X')  
		);
	end component funcproc;
	
	signal source: 	signed(79 downto 0);
	signal probe: 		signed(39 downto 0);
	
	signal a :         signed (7 downto 0);
	signal b :         signed (7 downto 0);
	signal c :         signed (7 downto 0);
	signal d :         signed (7 downto 0);
	signal e :         signed (7 downto 0);
	signal f :         signed (7 downto 0);
	signal g :         signed (7 downto 0);
	signal h :         signed (7 downto 0);

	signal max :       signed (7 downto 0);
	signal min :       signed (7 downto 0);
	signal ave :       signed (7 downto 0);

	signal dividendo : signed (7 downto 0); 
	signal divisor :   signed (7 downto 0);
	signal tipo :      natural;
   signal res :       signed (7 downto 0);
	

begin

	u0 : component funcproc
	port map (
		signed(source) => source, 				-- sources.source
		probe  => std_logic_vector(probe)   --  probes.probe
	);
		--n utilizar ctte
		--probe(7 downto 0)  <= div(source(7 downto 0), source(15 downto 8), SW(5));
		probe(15 downto 8) <= div(source(7 downto 0), source(15 downto 8), sw(1));
		
		media(source(23 downto 16), source(31 downto 24), source(39 downto 32), 
				source(47 downto 40), source(55 downto 48), source(63 downto 56),
				source(71 downto 64), source(79 downto 72), probe(23 downto 16), 
				probe(31 downto 24),  probe(39 downto 32));	
end;