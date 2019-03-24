Summary:
-when running the test_bench_all
-program 1 works for all cases
-program 2 works but fail some cases. 
-program 2 works for number divided by zero and for some number
-program 3 runs but fail to get the right answer

Instruction:
1. start a new project in Modelsim
2. add the module and testbenches (systemVerilog file) into a new project
3. change the absolute/relative path directory of the lut.txt and machine_code.txt in LUTPC.sv and InstRom.sv
4. compile all the file in Modelsim
5. start simulation and select test_bench_all.sv
5. change the input for program 1/2/3 when necessary in test_bench_all.sv

Changes made to Original testbench:
-changes the name DUT to use our own Top module - Top d1(.CLK(clk), .START(start), .DONE(done))
-changes the name of the memory to MyDataMem.MyMemory
-changes to the dataMem[address] for program 3 according to the lab1 specification

Others:
-assembler.py is used to generated machine code from programAll assembly code
-Program Counter has to be updated manually when the machine code get updated

File included:
ALU.sv				
ALU_tb.sv			
Ctr.sv				
Ctr_tb.sv			
DataMem.sv			
DataMem_tb.sv		
InstROM.sv			
InstROM_tb.sv		
LUTPC.sv			
PC.sv				
PC_tb.sv			
RegFile.sv			
RegFile_tb.sv		
Top.sv				
Top_tb.sv			
assembler.py		
lut.txt				
machine_code.txt	
programAll.txt		
test_bench_all.sv	
top level schematic.pdf

