`timescale 1ns / 1ps

module InstructionRegister(
    output [31:0] InstructionOut,
    input [31:0] InstructionIn,
	 input clk,
	 input IFIDWrite,//new
	 input IFFLush
    );


   reg[31:0] InstructionReg;

   always@(posedge clk)
   begin
		if(IFIDWrite == 1'b1)
			begin
            InstructionReg = InstructionIn;
			end 
		if(IFFLush == 1'b1)
		begin
		InstructionReg=32'b0;
		end
	end
	
	assign InstructionOut = InstructionReg;

endmodule
