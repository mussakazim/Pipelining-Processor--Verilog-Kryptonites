`timescale 1ns / 1ps


module ALU_Control(
    output [3:0] ALUControl,
    input [5:0] opcode,
    input [1:0] ALUOp
    );


	 reg[3:0] tempALUControl;

	 always@(*)
	 begin
	     if(opcode == 6'b000000 && ALUOp ==2'b10)   // RTYPE
          begin
			   tempALUControl = 4'b0000;    // ADD  
          end
        else if(opcode == 6'b000001 && ALUOp ==2'b01)  //RTYPE
          begin
			   tempALUControl = 4'b0110;    // SUB
          end			   
		  else if(opcode == 6'b000010 && ALUOp ==2'b00)   //RTYPE
          begin
			   tempALUControl = 4'b0001;    // OR
          end
		  else if(opcode == 6'b000011 && ALUOp ==2'b11)   //RTYPE
          begin
			   tempALUControl = 4'b0010;    // AND
          end


		  else if(opcode == 6'b100011)    //LW
		    begin
			   tempALUControl = 4'b0000; // ADD
			 end

		  else if(opcode == 6'b101011)    //SW
		    begin
			   tempALUControl = 4'b0000; // ADD
			 end

		  else if(opcode == 6'b000101)    //BNEQ
		    begin
			   tempALUControl = 4'b0110; // SUB
			 end

		  else if(opcode == 6'b001110)    //XOR
		    begin
			   tempALUControl = 4'b1100; // XOR
			 end

		  else if(opcode == 6'b100000)    //JUMP
		    begin
			   tempALUControl = 4'b0000; // ADD
			 end	

	 end


assign ALUControl = tempALUControl;

endmodule
