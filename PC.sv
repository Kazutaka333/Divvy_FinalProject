// Create Date:    2019.2.18 
// Latest rev:     2019.2.18
// Design Name:    CSE141L
// Module Name:    PC 

//Program Counter
module PC #(parameter PCW = 16)(
  input		CLK,
  input		START,
  input		HALT,  
  input		Branch,						// branch signal from control unit
  input 	Zero,						// zero flag from the ALU
  input    [PCW-1:0]AbsoluteAddr,		// absoluteAddr for bne / be
  output logic	[PCW-1:0]PC				// the next program count
);

logic [1:0]PROG_STATE = 2'b0; // initialize prog_state to 0
logic [1:0]NEXT_PROG_STATE;

always_comb 
begin
	NEXT_PROG_STATE = PROG_STATE + 2'b01;
end


always @(negedge START) 
  PROG_STATE <= NEXT_PROG_STATE;   // prog_state cycles through 1, 2, 3 following the init pulses the test bench provides


always_ff@(posedge CLK) begin

	if(START) begin
		case(PROG_STATE)
			0: PC <= 'b0;     // start first program; hold PC until init is released by the test bench
			1: PC <= 'd214;   // value should correspond to first line of program 2 in your instruction memory
			2: PC <= 'd477;   // value should correspond to first line of program 3 in your instruction memory
			3: PC <= 'bz;   // (optional) value should trigger a halt in your PC 
		endcase
	end
	else if (HALT)
		PC <= PC;
	else if(Branch && Zero)
		PC <= AbsoluteAddr;
	else
		PC <= PC + 'b1;
end

endmodule
