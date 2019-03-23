// Create Date:    2019.2.18
// Created by:     Group Divvy
// Design name:    CSE141L
// Module Name:    DataMem_tb 

// testbench for DataMem_tb
module DataMem_tb();
  logic CLK;                  	// clock
  logic	[7:0] DataAddress;		// pointer
  logic [1:0] MemStatus;			
  logic [7:0] DataIn;	      	// data to store (write into memory)
  wire 	[7:0] DataOut;		

DataMem i1(		  
  CLK,		 
  DataAddress,
  MemStatus,
  DataIn,
  DataOut
);

always begin
  #5ns CLK = 1;
  #5ns CLK = 0;
end

initial begin
  #10ns
  #10ns
  MemStatus = 2'b10; // store the value into memory
  DataAddress = 'b0;
  DataIn = 8'hff;
  
  #10ns 
  MemStatus = 2'b01;
  DataAddress = 'b0;
  // we should get 16'hffff here
  
  #10ns
  MemStatus = 2'b01;
  DataAddress = 1'd1;
  
  #10ns
  MemStatus = 2'b00;
  DataAddress = 'b0;
  
  #10ns
  MemStatus = 2'b10; //store the value into memory
  DataAddress = 'b10;
  DataIn = 8'h01;
  
  

end
endmodule