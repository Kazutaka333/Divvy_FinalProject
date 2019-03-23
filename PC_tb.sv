// Create Date:    2019.2.18
// Created by:     Group Divvy
// Design name:    CSE141L
// Module Name:    PC_tb 

// testbench for sample design
module PC_tb();
  logic		CLK;
  logic		RESET;
  logic		HALT;
  logic		Branch;					// branch signal from control unit
  logic 	Zero;					// zero flag from the ALU
  logic		[15:0]AbsoluteAddr;	// AbsoluteAddr for bne / be
  wire		[15:0]PC;			// the next program count

PC i1(		  // our design itself
  CLK,		  // address pointer
  RESET,
  HALT,
  Branch,
  Zero,
  AbsoluteAddr,
  PC
);

always begin
  #5ns CLK = 1;
  #5ns CLK = 0;
end

initial begin
  
  #10ns
  RESET = 1'b1;
  #10ns
  RESET = 1'b0;
  #10ns 
  //Program Counter increase by 1
  #10ns
  //PC increase by 1
  #10ns
  HALT = 1'b1;
  //PC stay at 3
  #10ns
  HALT = 1'b0;
  Branch = 1'b1;
  //PC increase by 1 should be 4 now
  #10ns
  Branch = 1'b1;
  Zero = 1'b1;
  AbsoluteAddr = 16'hf;
  #10ns
  HALT = 1'b1;

end
endmodule