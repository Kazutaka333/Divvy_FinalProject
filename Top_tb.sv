// Create Date:    2019.2.18
// Created by:     Group Divvy
// Design name:    CSE141L
// Module Name:    Top_tb 

// testbench for Top
module Top_tb();
  logic CLK;                  	// clock
  logic START;
  wire 	DONE;	

Top i1(		  
  CLK,		 
  START,
  DONE
);

always begin
  #5ns CLK = 1;
  #5ns CLK = 0;
end

initial begin
  //Program 1 start
  #10ns
  START = 1'b1;
  #20ns
  START = 1'b0;
  #20ns wait(DONE);
  
  //Program 2 start
  #10ns START = 1;
  #20ns START = 0;
  #20ns wait(DONE);
  

end
endmodule
