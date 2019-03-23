// Create Date:    2019.2.18
// Created by:     Group Divvy
// Design name:    CSE141L
// Module Name:    InstROM_tb 

// testbench for sample design
module InstROM_tb();
logic CLK;
logic  [16-1:0] InstAddress;
wire [9-1:0] InstOut;	  // output from design

InstROM i1(		  // our design itself
  InstAddress,	// address pointer
  InstOut
);

always begin
  #5ns CLK = 1;
  #5ns CLK = 0;
end

initial begin
  
  #10ns
  InstAddress = 1'd0;
  #10ns
  for(int i = 0; i < 10; i = i+1) 
  begin
	#10ns InstAddress = InstAddress + 1;
  end

end
endmodule