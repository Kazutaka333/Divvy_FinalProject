// Create Date:    2019.2.18
// Latest rev:     2019.2.18
// Created by:     Group Divvy
// Design Name:    CSE141L
// Module Name:    Data Mem

// data memory design for CSE141L projects
// width = 8 bits (per assignment spec.)
// depth = 2**W (default value of W = 8, may be changed)

// MemStatus
// 00 disabled  
// 01 load from memory
// 10 store into memory
module DataMem #(parameter W=8)(
  input         CLK,                  // clock
  input			[W-1:0] DataAddress,	// pointer
  input         [1:0] MemStatus,			
  input       	[7:0] DataIn,	      	// data to store (write into memory)
  output logic	[7:0] DataOut					// data to load (read from memory)
 
 );			 
	
	logic [7:0] MyMemory [2**W]; 		 // create array of 2**W elements (default = 256)
	
	// optional initialization of memory, e.g. seeding with constants
	//  initial 
	//    $readmemh("dataram_init.list", my_memory);
	
	// read from memory, e.g. on load instruction
always_comb begin							 // reads are immediate/combinational
    if(MemStatus == 2'b01) begin
      DataOut = MyMemory[DataAddress];
		// optional diagnostic print statement:
		//	  $display("Memory read M[%d] = %d",DataAddress,DataOut);
	  end 
		else 
			DataOut = 8'bZ;			         // z denotes high-impedance/undriven
end	

// write to memory, e.g. on store instruction
always_ff @ (posedge CLK)
begin             // writes are clocked / sequential
	if(MemStatus == 2'b10) begin
	      MyMemory[DataAddress] <= DataIn;
			//	  $display("Memory write M[%d] = %d",DataAddress,DataIn);
	end
	
end

endmodule
