// Create Date:    2019.2.18
// Latest rev:     2019.2.18
// Created by:     Group Divvy
// Design Name:    CSE141L
// Module Name:    Ctr

module Ctr(
  input 		[4:0] Instr,
  output logic	ReadRegEn,
  output logic	WriteRegEn,
  output logic	WriteACCEn,
  output logic	Branch,
  output logic	[3:0] ALUOp,
  output logic	[1:0] ALUSrcA,
  output logic	ALUSrcB,
  output logic	[1:0] MemStatus,
  output logic	MemToReg,
  output logic	HALT
);
	typedef enum logic [3:0] {
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
	}Opcode;
	
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

	// MemStatus
	// 00 disabled  
	// 01 load from memory
	// 10 store into memory
	
	//Opcode = opcode(Opcode);
	Opcode opcode;
	assign opcode = Opcode'(Instr[4:1]);
	assign flag = Instr[0];
	assign Branch = (opcode == BE) || (opcode == BNE);
	assign MemToReg = ((opcode == LOAD) && flag);
	assign ReadRegEn = ((flag && (opcode != SHIFT)) || (opcode == LOAD) || (opcode == BE) || (opcode == BNE));
	assign WriteRegEn = ((opcode == STORE) && ~flag);
	assign WriteACCEn = ~((opcode == STORE) || (opcode == BE) || (opcode == BNE) || (opcode == HLT));
	assign ALUSrcB = ~((opcode == STORE) || (opcode == LOAD) || opcode == MOVE);
	assign HALT = (opcode == HLT);
	
	always_comb begin
		case(opcode)
			MOVE : begin // Move
					ALUOp = 4'b0000;
					ALUSrcA = 2'b10;
					MemStatus = 2'b00;
				  end
			ADD : begin //add
					ALUOp = 4'b0000;
					ALUSrcA = 2'b01;
					MemStatus = 2'b00;
				  end 
			SOR : begin //sor
					ALUOp = 4'b0001;
					ALUSrcA = 2'b01;
					MemStatus = 2'b00;
				  end
			SAND : begin //sand
					ALUOp = 4'b0010;
					ALUSrcA = 2'b01;
					MemStatus = 2'b00;
				  end
			SGT : begin //sgt
					ALUOp = 4'b0011;
					ALUSrcA = 2'b01;
					MemStatus = 2'b00;
				  end
			SEQ : begin //seq
					ALUOp = 4'b0100;
					ALUSrcA = 2'b01;
					MemStatus = 2'b00;
				  end
			SHIFT : begin //shift
					ALUSrcA = 2'b01;
					MemStatus = 2'b00;
					if(flag == 1'b1) ALUOp = 4'b0110;
					else ALUOp = 4'b0111;
				  end
			LOAD : begin // load
					ALUOp = 4'b0000;
					ALUSrcA = 2'b01;
					if(flag) begin
						MemStatus = 2'b01;
					end
					else begin
						MemStatus = 2'b00;
					end
				  end
			STORE : begin // store
					ALUOp = 4'b0000;
					if(flag) begin
						ALUSrcA = 2'b01;
						MemStatus = 2'b10;
					end
					else begin
						ALUSrcA = 2'b00;
						MemStatus = 2'b00;
					end
				  end
			BE	: begin // be
					ALUOp = 4'b0101;
					ALUSrcA = 2'b00;
					MemStatus = 2'b00;
				  end
			BNE : begin // bne
					ALUOp = 4'b0100;
					ALUSrcA = 2'b00;
					MemStatus = 2'b00;
				  end
			NEG : begin //neg
					ALUOp = 4'b1000;
					ALUSrcA = 2'b00;
					MemStatus = 2'b00;
				  end
			HLT : begin // halt
					ALUOp = 0;
					ALUSrcA = 0;
					MemStatus = 2'b00;
				  end
			default: begin
					ALUOp = 0;
					ALUSrcA = 0;
					MemStatus = 0;
					$display("ERROR on opcode: %d ",opcode);
					end
					
		endcase
	
	end


endmodule
