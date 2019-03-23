// Create Date:    2019.2.18
// Latest rev:     2019.2.18
// Created by:     Group Divvy
// Design Name:    CSE141L
// Module Name:    ALU

module ALU(
  input		[3:0] ALUOp,
  input 	[7:0] A,
  input		[7:0] B,
  output logic	[7:0] Result,
  output logic	Zero
);

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
	always_comb 
	begin
		case(ALUOp) 
			4'b0000 : begin // add
				  	Result = A + B;
				  end
			4'b0001 : begin // or
					Result = A | B;
				  end 
			4'b0010 : begin //and
					Result = A & B;
				  end
			4'b0011 : begin //gt
					Result = ( B >  A ) ? 1'b1 : 1'b0;
				  end
			4'b0100 : begin //eq
					Result = ( B == A ) ? 1'b1 : 1'b0;
				  end
			4'b0101 : begin //not equal
					Result = ( B != A ) ? 1'b1 : 1'b0;
				  end
			4'b0110 : begin //shiftRight
					Result = B >> A;		
				  end
			4'b0111 : begin // shiftLeft
					Result = B << A;
				  end
			4'b1000 : begin // neg
				  	Result = ~B;
				  end
			default : begin
					Result = 0;
					end
		endcase
	
	end
	
	assign Zero = ( Result == 1'b0 ); //zero flag turn on

endmodule
