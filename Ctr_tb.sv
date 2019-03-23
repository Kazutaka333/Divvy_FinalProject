// Create Date:    2019.2.18
// Created by:     Group Divvy
// Design name:    CSE141L
// Module Name:    Ctr_tb 

// testbench for Ctr
module Ctr_tb();
  logic 	CLK;
  logic 	[4:0] Instr;
  wire		ReadRegEn;
  wire 		WriteRegEn;
  wire		WriteACCEn;
  wire		Branch;
  wire		[3:0] ALUOp;
  wire		[1:0] ALUSrcA;
  wire		ALUSrcB;
  wire		[1:0] MemStatus;
  wire		MemToReg;
  wire		HALT;

Ctr a1(		  
  Instr,
  ReadRegEn,
  WriteRegEn,
  WriteACCEn,
  Branch,
  ALUOp,
  ALUSrcA,
  ALUSrcB,
  MemStatus,
  MemToReg,
  HALT
);

always begin
  #5ns CLK = 1;
  #5ns CLK = 0;
end

enum logic [3:0] {
	MOVE	=4'b0000,
	ADD		=4'b0001,
	SOR		=4'b0010,
	SAND	=4'b0011,
	SGT		=4'b0100,
	SEQ		=4'b0101,
	SHIFT	=4'b0110,
	LOAD	=4'b0111,
	STORE	=4'b1000,
	BE		=4'b1001,
	BNE		=4'b1010,
	NEG		=4'b1011,
	HLT		=4'b1100
} Opcode;

initial begin
	
  #10ns 
  Instr = {MOVE,1'bx};
  #10ns
  // assert (ReadRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("Move_x - WriteRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("Move_x - WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("Move_x - WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("Move_x - Branch");
  assert (ALUOp ==  4'b0000) 	$display ("OK. A equals B"); else $error("Move_x - ALUOP");
  assert (ALUSrcA ==  2'b10) 	$display ("OK. A equals B"); else $error("Move_x - ALUSrcA");
  assert (ALUSrcB ==  1'b0) 	$display ("OK. A equals B"); else $error("Move_x - ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("Move_x - MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("Move_x - MemToReg");
  assert (HALT ==  1'b0) 		$display ("OK. A equals B"); else $error("Move_x - HALT");
  
  
  #10ns 
  Instr = {ADD,1'b0};
  #10ns
  assert (ReadRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("ADD_0 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("ADD_0 - WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("ADD_0 - WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("ADD_0 - Branch");
  assert (ALUOp ==  4'b0000) 	$display ("OK. A equals B"); else $error("ADD_0 - ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("ADD_0 - ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("ADD_0 - ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("ADD_0 - MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("ADD_0 - MemToReg");
  assert (HALT ==  1'b0) 		$display ("OK. A equals B"); else $error("ADD_0 - HALT");
  
  #10ns 
  Instr = {ADD,1'b1};
  #10ns
  assert (ReadRegEn ==  1'b1) 	$display ("OK. A equals B"); else $error("ADD_1 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("ADD_1 - WriteRegEn"); 
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("ADD_1 - WriteACCEn"); 
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("ADD_1 - Branch"); 
  assert (ALUOp ==  4'b0000) 	$display ("OK. A equals B"); else $error("ADD_1 - ALUOP"); 
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("ADD_1 - ALUSrcA"); 
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("ADD_1 - ALUSrcB"); 
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("ADD_1 - MemStatus"); 
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("ADD_1 - MemToReg"); 
  assert (HALT ==  1'b0) 		$display ("OK. A equals B"); else $error("ADD_1 - HALT"); 
  
  #10ns 
  Instr = {SOR,1'b0};
  #10ns
  assert (ReadRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SOR_0 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SOR_0 - WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SOR_0 - WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("SOR_0 - Branch");
  assert (ALUOp ==  4'b0001) 	$display ("OK. A equals B"); else $error("SOR_0 - ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("SOR_0 - ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("SOR_0 - ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("SOR_0 - MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("SOR_0 - MemToReg");
  assert (HALT ==  1'b0) 		$display ("OK. A equals B"); else $error("SOR_0 - HALT");
  
  #10ns
  Instr = {SOR,1'b1};
  #10ns
  assert (ReadRegEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SOR_1 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SOR_1 - WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SOR_1 - WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("SOR_1 - Branch");
  assert (ALUOp ==  4'b0001) 	$display ("OK. A equals B"); else $error("SOR_1 - ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("SOR_1 - ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("SOR_1 - ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("SOR_1 - MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("SOR_1 - MemToReg");
  assert (HALT ==  1'b0) 		$display ("OK. A equals B"); else $error("SOR_1 - HALT");
  
  #10ns 
  Instr = {SAND,1'b0};
  #10ns
  assert (ReadRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SAND_0- ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SAND_0 - WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SAND_0 - WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("SAND_0 - Branch");
  assert (ALUOp ==  4'b0010) 	$display ("OK. A equals B"); else $error("SAND_0 - ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("SAND_0 - ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("SAND_0 - ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("SAND_0 - MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("SAND_0 - MemToReg");
  assert (HALT ==  1'b0) 		$display ("OK. A equals B"); else $error("SAND_0 - HALT");
  
  #10ns 
  Instr = {SAND,1'b1};
  #10ns
  assert (ReadRegEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SAND_1 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SAND_1 - WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SAND_1 - WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("SAND_1 - Branch");
  assert (ALUOp ==  4'b0010) 	$display ("OK. A equals B"); else $error("SAND_1 - ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("SAND_1 - ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("SAND_1 - ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("SAND_1 - MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("SAND_1 - MemToReg");
  assert (HALT ==  1'b0) 		$display ("OK. A equals B"); else $error("SAND_1 - HALT");
  
  #10ns 
  Instr = {SGT,1'b0};
  #10ns
  assert (ReadRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SGT_0 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SGT_0 - WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SGT_0 - WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("SGT_0 - Branch");
  assert (ALUOp ==  4'b0011) 	$display ("OK. A equals B"); else $error("SGT_0 - ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("SGT_0 - ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("SGT_0 - ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("SGT_0 - MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("SGT_0 - MemToReg");
  assert (HALT ==  1'b0) 		$display ("OK. A equals B"); else $error("SGT_0 - HALT");
  
  #10ns 
  Instr = {SGT,1'b1};
  #10ns
  assert (ReadRegEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SGT_1 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SGT_1 - WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SGT_1 - WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("SGT_1 - Branch");
  assert (ALUOp ==  4'b0011) 	$display ("OK. A equals B"); else $error("SGT_1 - ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("SGT_1 - ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("SGT_1 - ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("SGT_1 - MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("SGT_1 - MemToReg");
  assert (HALT ==  1'b0) 		$display ("OK. A equals B"); else $error("SGT_1 - HALT");
  
  #10ns 
  Instr = {SEQ,1'b0};
  #10ns
  assert (ReadRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SEQ_0 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SEQ_0 - WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SEQ_0 - WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("SEQ_0 - Branch");
  assert (ALUOp ==  4'b0100) 	$display ("OK. A equals B"); else $error("SEQ_0 - ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("SEQ_0 - ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("SEQ_0 - ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("SEQ_0 - MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("SEQ_0 - MemToReg");
  assert (HALT ==  1'b0) 		$display ("OK. A equals B"); else $error("SEQ_0 - HALT");
  
  #10ns 
  Instr = {SEQ,1'b1};
  #10ns
  assert (ReadRegEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SEQ_1 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SEQ_1 - WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SEQ_1 - WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("SEQ_1 - Branch");
  assert (ALUOp ==  4'b0100) 	$display ("OK. A equals B"); else $error("SEQ_1 - ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("SEQ_1 - ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("SEQ_1 - ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("SEQ_1 - MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("SEQ_1 - MemToReg");
  assert (HALT ==  1'b0)        $display ("OK. A equals B"); else $error("SEQ_1 - HALT");
  
  #10ns  
  Instr = {SHIFT,1'b0};
  #10ns
  assert (ReadRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SHIFT_0 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SHIFT_0 -- WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SHIFT_0 -- WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("SHIFT_0 -- Branch");
  assert (ALUOp ==  4'b0111) 	$display ("OK. A equals B"); else $error("SHIFT_0 -- ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("SHIFT_0 -- ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("SHIFT_0 -- ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("SHIFT_0 -- MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("SHIFT_0 -- MemToReg");
  assert (HALT ==  1'b0)        $display ("OK. A equals B"); else $error("SHIFT_0 -- HALT");
  
  #10ns 
  Instr = {SHIFT,1'b1};
  #10ns
  assert (ReadRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SHIFT_1 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("SHIFT_1 -- WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("SHIFT_1 -- WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("SHIFT_1 -- Branch");
  assert (ALUOp ==  4'b0110) 	$display ("OK. A equals B"); else $error("SHIFT_1 -- ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("SHIFT_1 -- ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("SHIFT_1 -- ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("SHIFT_1 -- MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("SHIFT_1 -- MemToReg");
  assert (HALT ==  1'b0)        $display ("OK. A equals B"); else $error("SHIFT_1 -- HALT");
  
  #10ns 
  Instr = {LOAD,1'b0};
  #10ns
  assert (ReadRegEn ==  1'b1) 	$display ("OK. A equals B"); else $error("LOAD_0 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("LOAD_0 -- WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("LOAD_0 -- WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("LOAD_0 -- Branch");
  assert (ALUOp ==  4'b0000) 	$display ("OK. A equals B"); else $error("LOAD_0 -- ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("LOAD_0 -- ALUSrcA");
  assert (ALUSrcB ==  1'b0) 	$display ("OK. A equals B"); else $error("LOAD_0 -- ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("LOAD_0 -- MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("LOAD_0 -- MemToReg");
  assert (HALT ==  1'b0)        $display ("OK. A equals B"); else $error("LOAD_0 -- HALT");
  
  #10ns 
  Instr = {LOAD,1'b1};
  #10ns
  assert (ReadRegEn ==  1'b1) 	$display ("OK. A equals B"); else $error("LOAD_1 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("LOAD_1 -- WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("LOAD_1 -- WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("LOAD_1 -- Branch");
  assert (ALUOp ==  4'b0000) 	$display ("OK. A equals B"); else $error("LOAD_1 -- ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("LOAD_1 -- ALUSrcA");
  assert (ALUSrcB ==  1'b0) 	$display ("OK. A equals B"); else $error("LOAD_1 -- ALUSrcB");
  assert (MemStatus ==  2'b01) 	$display ("OK. A equals B"); else $error("LOAD_1 -- MemStatus");
  assert (MemToReg ==  1'b1) 	$display ("OK. A equals B"); else $error("LOAD_1 -- MemToReg");
  assert (HALT ==  1'b0)        $display ("OK. A equals B"); else $error("LOAD_1 -- HALT");
  
  #10ns 
  Instr = {STORE,1'b0};
  #10ns
  assert (ReadRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("STORE_0 - ReadRegEn");
  assert (WriteRegEn ==  1'b1) 	$display ("OK. A equals B"); else $error("STORE_0 -- WriteRegEn");
  assert (WriteACCEn ==  1'b0) 	$display ("OK. A equals B"); else $error("STORE_0 -- WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("STORE_0 -- Branch");
  assert (ALUOp ==  4'b0000) 	$display ("OK. A equals B"); else $error("STORE_0 -- ALUOP");
  //assert (ALUSrcA ==  2'bx) 	$display ("OK. A equals B"); else $error("STORE_0 -- ALUSrcA");
  //assert (ALUSrcB ==  1'bx) 	$display ("OK. A equals B"); else $error("STORE_0 -- ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("STORE_0 -- MemStatus");
  //assert (MemToReg ==  1'bx) 	$display ("OK. A equals B"); else $error("STORE_0 -- MemToReg");
  assert (HALT ==  1'b0)        $display ("OK. A equals B"); else $error("STORE_0 -- HALT");
  
  #10ns 
  Instr = {STORE,1'b1};
  #10ns
  assert (ReadRegEn ==  1'b1) 	$display ("OK. A equals B"); else $error("STORE_1 - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("STORE_1 -- WriteRegEn");
  assert (WriteACCEn ==  1'b0) 	$display ("OK. A equals B"); else $error("STORE_1 -- WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("STORE_1 -- Branch");
  assert (ALUOp ==  4'b0000) 	$display ("OK. A equals B"); else $error("STORE_1 -- ALUOP");
  assert (ALUSrcA ==  2'b01) 	$display ("OK. A equals B"); else $error("STORE_1 -- ALUSrcA");
  assert (ALUSrcB ==  1'b0) 	$display ("OK. A equals B"); else $error("STORE_1 -- ALUSrcB");
  assert (MemStatus ==  2'b10) 	$display ("OK. A equals B"); else $error("STORE_1 -- MemStatus");
  //assert (MemToReg ==  1'bx) 	$display ("OK. A equals B"); else $error("STORE_1 -- MemToReg");
  assert (HALT ==  1'b0)        $display ("OK. A equals B"); else $error("STORE_1 -- HALT");
  
  #10ns
  Instr = {BE,1'bx};
  #10ns
  assert (ReadRegEn ==  1'b1) 	$display ("OK. A equals B"); else $error("BE_x - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("BE_x -- WriteRegEn");
  assert (WriteACCEn ==  1'b0) 	$display ("OK. A equals B"); else $error("BE_x -- WriteACCEn");
  assert (Branch ==  1'b1) 		$display ("OK. A equals B"); else $error("BE_x -- Branch");
  assert (ALUOp ==  4'b0101) 	$display ("OK. A equals B"); else $error("BE_x -- ALUOP");
  assert (ALUSrcA ==  2'b00) 	$display ("OK. A equals B"); else $error("BE_x -- ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("BE_x -- ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("BE_x -- MemStatus");
  //assert (MemToReg ==  1'bx) 	$display ("OK. A equals B"); else $error("BE_x -- MemToReg");
  assert (HALT ==  1'b0)        $display ("OK. A equals B"); else $error("BE_x -- HALT");
  
  #10ns
  Instr = {BNE,1'bx};
  #10ns
  assert (ReadRegEn ==  1'b1) 	$display ("OK. A equals B"); else $error("BNE_x - ReadRegEn");
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("BNE_x -- WriteRegEn");
  assert (WriteACCEn ==  1'b0) 	$display ("OK. A equals B"); else $error("BNE_x -- WriteACCEn");
  assert (Branch ==  1'b1) 		$display ("OK. A equals B"); else $error("BNE_x -- Branch");
  assert (ALUOp ==  4'b0100) 	$display ("OK. A equals B"); else $error("BNE_x -- ALUOP");
  assert (ALUSrcA ==  2'b00) 	$display ("OK. A equals B"); else $error("BNE_x -- ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("BNE_x -- ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("BNE_x -- MemStatus");
  //assert (MemToReg ==  1'bx) 	$display ("OK. A equals B"); else $error("BNE_x -- MemToReg");
  assert (HALT ==  1'b0)        $display ("OK. A equals B"); else $error("BNE_x -- HALT");
  
  #10ns
  Instr = {NEG,1'bx};
  #10ns
  assert (WriteRegEn ==  1'b0) 	$display ("OK. A equals B"); else $error("NEG_x -- WriteRegEn");
  assert (WriteACCEn ==  1'b1) 	$display ("OK. A equals B"); else $error("NEG_x -- WriteACCEn");
  assert (Branch ==  1'b0) 		$display ("OK. A equals B"); else $error("NEG_x -- Branch");
  assert (ALUOp ==  4'b1000) 	$display ("OK. A equals B"); else $error("NEG_x -- ALUOP");
  assert (ALUSrcA ==  2'b00) 	$display ("OK. A equals B"); else $error("NEG_x -- ALUSrcA");
  assert (ALUSrcB ==  1'b1) 	$display ("OK. A equals B"); else $error("NEG_x -- ALUSrcB");
  assert (MemStatus ==  2'b00) 	$display ("OK. A equals B"); else $error("NEG_x -- MemStatus");
  assert (MemToReg ==  1'b0) 	$display ("OK. A equals B"); else $error("NEG_x -- MemToReg");
  assert (HALT ==  1'b0)        $display ("OK. A equals B"); else $error("NEG_x -- HALT");
  
  #10ns
  Instr = {HLT,1'bx};
  #10ns
  assert (HALT ==  1'b1) 		$display ("OK. A equals B"); else $error("HLT_x -- HALT");
 
  
  
  

end
endmodule