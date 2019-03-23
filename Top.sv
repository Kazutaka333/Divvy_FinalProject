// Create Date:     2019.2.18
// Latest rev date: 2018.2.18
// Created by:      Group Divvy
// Design Name:     CSE141L
// Module Name:     top (top of microprocessor design) 

module Top(
	input				CLK,  
	input				START,
	output logic 		DONE
);

logic Branch;
logic Zero;
logic [15:0] AbsoluteAddr;
logic [15:0] PC;
logic [8:0] InstOut;

logic ReadRegEn;
logic WriteRegEn;
logic WriteACCEn;
logic [7:0] ACCWrite;
logic [7:0] ACCRead;
logic [7:0] A,B;
logic [7:0] Result;
logic [7:0] DataOut;
logic [3:0] ALUOp;
logic [1:0] ALUSrcA;
logic ALUSrcB;
logic [1:0] MemStatus;
logic MemToReg;
logic HALT;
logic [7:0]ReadDataOut;



PC #(.PCW(16)) MyPC(
	 .CLK			(CLK),   	// branch to "offset"
	 .START			(START),	// branch by "offset"
	 .HALT			(HALT),
	 .Branch		(Branch),
	 .Zero			(Zero),
	 .AbsoluteAddr 	(AbsoluteAddr),
	 .PC			(PC)      	// pointer to insr. mem
);		


InstROM #(.IW(16)) MyInstROM(
	 .InstAddress	(PC),	// address pointer
	 .InstOut	(InstOut)
);

RegFile #(.RAW(4)) MyRegFile(
	 .CLK			(CLK),   						// clock (for writes only)
	 .ReadAddr		(InstOut[3:0]),  	// read pointer rs
	 .RegWriteAddr	(InstOut[3:0]),		// read pointer rt
	 .ReadRegEn			(ReadRegEn),   	// write pointer (rd)
	 .WriteRegEn	(WriteRegEn),  		// write enable
	 .WriteACCEn	(WriteACCEn),		// data to be written/loaded 
	 .ACCWrite		(ACCWrite),  		// data read out of reg file
	 .ACCRead		(ACCRead),
	 .ReadDataOut	(ReadDataOut)
);

ALU MyALU(
	.ALUOp	(ALUOp),	
	.A		(A),	
	.B     	(B),	
	.Result	(Result),	
	.Zero 	(Zero)
);

DataMem MyDataMem(
	.CLK		(CLK),
	.DataAddress	(Result),
	.MemStatus	(MemStatus),			
	.DataIn		(ACCRead),
	.DataOut	(DataOut)
);

Ctr MyCtr(
	.Instr		(InstOut[8:4]),
	.ReadRegEn	(ReadRegEn),
	.WriteRegEn	(WriteRegEn),
	.WriteACCEn	(WriteACCEn),
	.Branch		(Branch),
	.ALUOp		(ALUOp),
	.ALUSrcA	(ALUSrcA),
	.ALUSrcB	(ALUSrcB),
	.MemStatus	(MemStatus),
	.MemToReg	(MemToReg),
	.HALT		(HALT)
);

LUTPC MyLUTPC(
	.ReadData	(ReadDataOut),
	.PCAddr		(AbsoluteAddr)
);
assign ACCWrite = MemToReg ?  DataOut : Result;	// choode ACCWrite 
assign A = (ALUSrcA == 2'b00) ? 1'b0 :( (ALUSrcA == 2'b01 )? ReadDataOut : InstOut[4:0]);
assign B = ALUSrcB == 1'b0 ? 1'b0 : ACCRead;
assign DONE = HALT;
endmodule

