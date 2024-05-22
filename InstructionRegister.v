`timescale 1ns / 1ps

module InstructionRegister(
    output [31:0] InstructionOut,
    input [31:0] InstructionIn,
    input hazardDet,
	 input clk
    );


   reg[31:0] InstructionReg;

   always@(posedge clk)
   begin
	    // if(hazardDet != 1)
		 // begin
            InstructionReg = InstructionIn;
		 // end
	end
	
	assign InstructionOut = InstructionReg;

endmodule
