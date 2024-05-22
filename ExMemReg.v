`timescale 1ns / 1ps


module ExMemReg(
    output [31:0] ALUResult,
	 output [31:0] RtData,
	 output [4:0]  rs,
    output [4:0]  rt,
	 output [4:0]  regwriteAddress,
	 output [31:0] BranchAddress,
	 output        pcSrc,
	 output        ZeroFlag,
    output MemtoReg,  //2
    output RegWrite,  //2 
    output MemRead,   //1
    output MemWrite,  //1
	 output Branch,    //1
	 
	 
	 
	 input         clk,
	 input [31:0]  ALUResultin,
	 input [31:0]  RtDatain,
	 input [4:0]   rsin,
	 input [4:0]   rtin,
	 input [4:0]   regwriteAddressin,
	 input  [31:0] BranchAddressin,
	 input         pcSrcin,
	 input         ZeroFlagin,
	 input         MemtoRegin,
	 input         RegWritein,
    input         MemReadin,   
    input         MemWritein,  
	 input      	Branchin
	  
    );
	 
	 
	 reg [31:0] tempALUResult;
	 reg [31:0] tempRtData;
	 reg [4:0]  temprs;
	 reg [4:0]  temprt;
	 reg [4:0]  tempregwriteAddress;
	 reg [31:0] tempBranchAddress;
	 reg        temppcSrc;
	 reg        tempZeroFlag;
	 reg        tempMemtoReg;  
	 reg        tempRegWrite;   
	 reg        tempMemRead;  
	 reg        tempMemWrite;  
	 reg        tempBranch;  
	 
	 
	 always@(posedge clk)
	 begin
	 
            tempALUResult         =  ALUResultin         ;
				tempRtData            =  RtDatain            ;
				temprs                =  rsin                ;
            temprt                =  rtin                ;
            tempregwriteAddress   =  regwriteAddressin   ;
				tempBranchAddress     = BranchAddressin      ;
				temppcSrc             = pcSrcin              ;
            tempZeroFlag          =  ZeroFlagin          ;
            tempMemtoReg          =  MemtoRegin          ;
            tempRegWrite          =  RegWritein          ;
            tempMemRead           =  MemReadin           ;
            tempMemWrite          =  MemWritein          ;
            tempBranch            =  Branchin            ;	 
	  
	 
	 end
	 
	 
      assign          ALUResult         =  tempALUResult       ;
      assign          RtData            =  tempRtData          ;
      assign		    rs                =  temprs              ;
      assign          rt                =  temprt              ;
      assign          regwriteAddress   =  tempregwriteAddress ;
		assign          BranchAddress     =  tempBranchAddress   ;
		assign          pcSrc             =  temppcSrc           ;
      assign          ZeroFlag          =  tempZeroFlag        ;
      assign          MemtoReg          =  tempMemtoReg        ;
      assign          RegWrite          =  tempRegWrite        ;
      assign          MemRead           =  tempMemRead         ;
      assign          MemWrite          =  tempMemWrite        ;
      assign          Branch            =  tempBranch          ;


endmodule
