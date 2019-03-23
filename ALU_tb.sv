// Create Date:    2019.2.18
// Created by:     Group Divvy
// Design name:    CSE141L
// Module Name:    ALU_tb 

// testbench for ALU
module ALU_tb();
  logic		CLK;
  logic		[3:0] ALUOp;
  logic 	[7:0] A;
  logic		[7:0] B;
  wire	[7:0] Result;
  wire	Zero;	// data read out of reg file	

ALU a1(		  
  ALUOp,
  A,
  B,
  Result,
  Zero
);

always begin
  #5ns CLK = 1;
  #5ns CLK = 0;
end


// ALUOp 
// 0000 add
// 0001 or
// 0010 and
// 0011 greater than
// 0100 equal
// 0101 not equal
// 0110 shiftRight
// 0111 shiftLeft
// 1000 neg
initial begin

  #10ns
  // 1 + 4
  ALUOp = 4'b0000;
  A = 1;
  B = 4;
 
  #10ns 
  // 1010 | 0101
  ALUOp = 4'b0001;
  A = 4'b1010;
  B = 4'b0101;
    
  #10ns 
  // 1111 & 0000
  ALUOp = 4'b0010;
  A = 4'b1111;
  B = 4'b0000;
  
  #10ns 
  // 1110(A) < 1111(B) returns 1
  ALUOp = 4'b0011;
  A = 4'b1110;
  B = 4'b1111;
  
  #10ns 
  // 11111110(A) == 11111110(B) returns 1
  ALUOp = 4'b0100;
  A = 8'b11111110;
  B = 8'b11111110;
  
  #10ns 
  // 10111110(A) != 11111110(B) returns 1
  ALUOp = 4'b0101;
  A = 8'b10111110;
  B = 8'b11111110;
  
  #10ns 
  // 1100_0000 >> 6 returns 0000_0011
  ALUOp = 4'b0110;
  A = 6;
  B = 8'b1100_0000;
  
  #10ns 
  // 1010_1010 << 8 returns 0000_0000
  ALUOp = 4'b0111;
  A = 8;
  B = 8'b1010_1010;
  
  #10ns 
  // -0000_1111
  ALUOp = 4'b1000;
  A = 8'bx;
  B = 8'b0000_1111;
 
  
  
  

end
endmodule