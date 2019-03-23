// Create Date:    2019.2.18
// Created by:     Group Divvy
// Design name:    CSE141L
// Module Name:    RegFile_tb 

// testbench for RegFile
module RegFile_tb();
 logic CLK;    			// clock (for writes only
 logic [4-1:0] ReadAddr;	  	// read pointer 
 logic [4-1:0] RegWriteAddr;// RegAddr to be written into the RF	
 logic ReadRegEn;
 logic WriteRegEn;	// write register enable
 logic WriteACCEn;  		// write acc enable
 logic [7:0] ACCWrite;  		// ACC to be written/loaded 
 wire	[7:0] ACCRead;  		// value of the ACC reg
 wire	[7:0] ReadDataOut;  	// data read out of reg file	

RegFile r1(		  
	CLK,
	ReadAddr,
	RegWriteAddr,
	ReadRegEn,
	WriteRegEn,
	WriteACCEn,
	ACCWrite,
	ACCRead,
	ReadDataOut  
);

always begin
  #5ns CLK = 1;
  #5ns CLK = 0;
end

initial begin

  #10ns
  // Read a register at 1001
  ReadAddr = 4'b1001;
  ReadRegEn = 1'b1;
  WriteRegEn = 0;
  WriteACCEn = 0;
  ACCWrite = 0;
  // ReadDataOut is xxxx
  
  #10ns 
  // Send 00000001 to ReadDataOut
  ReadAddr = 8'b00000001;
  RegWriteAddr = 8'bx;
  ReadRegEn = 1'b0;
  WriteRegEn = 0;
  WriteACCEn = 0;
    
  #10ns
  // Recieve 00000001 in ACCWrite
  ACCWrite = 8'b00000111;
  WriteACCEn = 1;
  
  #10ns
  // store the value in acc into a register at 0001
  RegWriteAddr = 0001;
  WriteRegEn = 1;
  ReadRegEn = 1'b0;
  WriteACCEn = 0;
  
  #10ns
  // Read the value in 0001
  ReadAddr = 0001;
  WriteRegEn = 0;
  ReadRegEn = 1;
  // 00000111 should be the value
 
  
  
  

end
endmodule