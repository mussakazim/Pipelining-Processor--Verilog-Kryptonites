`timescale 1ns / 1ps


module MEMWB_Reg(
    output [31:0] DataMemOut,
    output [31:0] ALUOutput,
    output [4:0] RegWriteAddress,
	 output [31:0] BranchAddress,
	 output pcSrc,
    output MemToReg,
    output RegWrite,
    input clk,
    input [31:0] DataMemOutin,
    input [31:0] ALUOutputin,
    input [4:0] RegWriteAddressin,
	 input [31:0] BranchAddressin,
	 input pcSrcin,
    input MemToRegin,
    input RegWritein
    );
	 
	 
	 
	 reg [31:0]  tempDataMemOut;
	 reg [31:0]  tempALUOutput;
	 reg [4:0]   tempRegWriteAddress;
	 reg [31:0]  tempBranchAddress;
	 reg         temppcSrc;
	 reg         tempMemToReg;
	 reg         tempRegWrite;
	 
	 
	 always@(posedge clk)
	 begin
	     tempDataMemOut      = DataMemOutin;
		  tempALUOutput       = ALUOutputin;
		  tempRegWriteAddress = RegWriteAddressin;
		  tempBranchAddress   = BranchAddressin;
		  temppcSrc           = pcSrcin;
		  tempMemToReg        = MemToRegin;
		  tempRegWrite        = RegWritein;
	 end
	 
	 
	 assign DataMemOut      = tempDataMemOut;
	 assign ALUOutput       = tempALUOutput;
	 assign RegWriteAddress = tempRegWriteAddress;
	 assign BranchAddress   = tempBranchAddress;
	 assign pcSrc           = temppcSrc;
	 assign MemToReg        = tempMemToReg;
	 assign RegWrite        = tempRegWrite;


endmodule
