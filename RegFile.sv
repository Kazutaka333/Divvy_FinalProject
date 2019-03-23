// Create Date:    2019.2.18
// Latest rev:     2019.2.18
// Created by:     Group Divvy
// Design Name:    CSE141L
// Module Name:    Reg File

// register file with asynchronous read and synchronous write
// parameter RAW = "RegFile Address Width" -- default is 4 bits, but our imm can be 5 bits as well
// for 16 words in the RegFile
// there are 16 registers
// version has ONE read addresses and read data out
// One ACC write, One Reg
// these may be strapped together or decoded in any way,
// to save instruction or decoder bits
// reads are always enabled, hence no read enable control
module RegFile #(parameter RAW = 4)
(	
 input		CLK,    			// clock (for writes only
 input		[RAW-1:0] ReadAddr,	  	// read pointer 
 input		[RAW-1:0] RegWriteAddr,		// RegAddr to be written into the RF	
 input		ReadRegEn,    			// read data as imm if off or read as value in reg if on
 input		WriteRegEn,			// write register enable
 input		WriteACCEn,	  		// write acc enable
 input		[7:0] ACCWrite,	  		// ACC to be written/loaded 
 output logic	[7:0] ACCRead,	  		// value of the ACC reg
 output logic	[7:0] ReadDataOut	  	// data read out of reg file
    
);

	parameter ACC = 4'b1110;
	logic [7:0] RF [2**RAW];				  // regFile itself
	
	always_comb 
	begin // READ the data
			if(ReadRegEn) begin
				ReadDataOut = RF[ReadAddr];
			end
			else begin
				ReadDataOut = ReadAddr;
			end
	end
	
	// asynchronous read for ACC
	assign ACCRead = RF[ACC];
	
	// synchronous (clocked) write to selected RF content "bin"
	always_ff @ (posedge CLK) begin
		if (WriteACCEn) begin
			RF [ACC] <= ACCWrite;
		end
		if(WriteRegEn) begin
			RF [RegWriteAddr] <= RF [ACC];
		end
	end
endmodule

