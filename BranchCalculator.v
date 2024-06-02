`timescale 1ns / 1ps


module BranchCalculator(
    output [31:0] BranchAddress,
    input [31:0] SignExtConst,
	 input [31:0] Instruction,
	 input [31:0] pcWire
    );


	 reg[31:0] tempBranchAddr;

	 always@(*)
	 begin

		  tempBranchAddr = (SignExtConst << 2);
        tempBranchAddr = tempBranchAddr + pcWire;

	 end


	 assign BranchAddress = tempBranchAddr;


endmodule
