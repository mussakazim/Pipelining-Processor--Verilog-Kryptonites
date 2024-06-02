`timescale 1ns / 1ps


module Decoder(
    output[5:0]  opcode,
    output[4:0]  rs,
	 output[4:0]  rt,
	 output[4:0]  rd,
	 output[4:0]  shamt,
	 output[5:0]  funct,
	 output[15:0] constant,
	 output[25:0] jumpConst,
    input [31:0] Instruction
    );


    reg[5:0]   tempOpcode;
    reg[4:0]   tempRs;
    reg[4:0]   tempRt;
    reg[4:0]   tempRd;
	 reg[4:0]   tempShamt;
    reg[5:0]   tempFunct;
    reg[15:0]  tempConstant;
    reg[25:0]  tempJumpConst;


	 always@(*)
	 begin
	       tempOpcode    = Instruction[31:26];
			 tempRs        = Instruction[25:21];
			 tempRt        = Instruction[20:16];
			 tempRd        = Instruction[15:11];
			 tempShamt     = Instruction[10:6];
			 tempFunct     = Instruction[5:0];
			 tempConstant  = Instruction[15:0];
			 tempJumpConst = Instruction[25:0];
	 end


	  assign   opcode     =     tempOpcode   ;
	  assign   rs         =     tempRs       ;
	  assign   rt         =     tempRt       ;
	  assign   rd         =     tempRd       ;
	  assign   shamt      =     tempShamt    ;
	  assign   funct      =     tempFunct    ;
	  assign   constant   =     tempConstant ;
	  assign   jumpConst  =     tempJumpConst;



endmodule
