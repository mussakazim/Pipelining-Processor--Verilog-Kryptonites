`timescale 1ns / 1ps


module ID_EX_REGISTER(
    output [31:0] InstrOut,
    output [31:0] RsData,
    output [31:0] RtData,
    output [31:0] SignExtConst,
	 output [31:0] BranchAddress,
	 output [31:0] jumpaddress2,

	 output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
	 output [5:0] opcode,
	 output pcSrc,
	 output RegDst,
    output ALUSrc,
    output MemtoReg,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output Branch,
    output Jump,
    output SignZero,
    output [1:0 ]ALUOp,
	 
	 input clk,
    input [31:0] Instrin,
    input [31:0] RsDatain,
    input [31:0] RtDatain,
    input [31:0] SignExtConstin,
	 input [31:0] BranchAddressin,
	 input [4:0] rsin,
    input [4:0] rtin,
    input [4:0] rdin,
	 input [5:0] opcodein,
	 input pcSrcin,
	 input RegDstin,
    input ALUSrcin,
    input MemtoRegin,
    input RegWritein,
    input MemReadin,
    input MemWritein,
    input Branchin,
    input Jumpin,
    input SignZeroin,
    input [1:0]ALUOpin,
	 input [31:0] jumpaddress

    );
	 
	 
	 
	 reg [31:0]     InstrOuttemp;
    reg [31:0]       RsDatatemp;
    reg [31:0]       RtDatatemp;
    reg [31:0] SignExtConsttemp;
	 reg [31:0] BranchAddresstemp;
	 reg [31:0] jumpaddressreg;

	 reg [4:0]            rstemp;
    reg [4:0]            rttemp;
    reg [4:0]            rdtemp;
	 reg [5:0]        opcodetemp;
	 reg              pcSrctemp ;
    reg              RegDsttemp;
    reg              ALUSrctemp;
    reg            MemtoRegtemp;
    reg            RegWritetemp;
    reg             MemReadtemp;
    reg            MemWritetemp;
    reg              Branchtemp;
    reg                Jumptemp;
    reg            SignZerotemp;
    reg [1:0]         ALUOptemp;
	 
	 
	 always@(posedge clk)
	 begin
	  
	     InstrOuttemp      =     Instrin;
			RsDatatemp		  =     RsDatain;
			RtDatatemp		  =     RtDatain;
			SignExtConsttemp =     SignExtConstin;
			BranchAddresstemp=     BranchAddressin;
			rstemp           =     rsin;
			rttemp			  =     rtin;
			rdtemp			  =     rdin;
			opcodetemp       =     opcodein;
			pcSrctemp        =     pcSrcin;
			RegDsttemp		  =     RegDstin;
			ALUSrctemp		  =     ALUSrcin;
			MemtoRegtemp	  =     MemtoRegin;
			RegWritetemp	  =     RegWritein;
			MemReadtemp		  =     MemReadin;
			MemWritetemp	  =     MemWritein;
			Branchtemp		  =     Branchin;
			Jumptemp		     =     Jumpin;
			SignZerotemp	  =     SignZeroin;
			ALUOptemp		  =     ALUOpin;
			jumpaddressreg   =     jumpaddress;
	 
	 end
	 
	 
assign     InstrOut         =    InstrOuttemp      ;
assign     RsData           =    RsDatatemp		   ;
assign     RtData           =    RtDatatemp		   ;
assign     SignExtConst     =    SignExtConsttemp  ;
assign     BranchAddress    =    BranchAddresstemp ;
assign      rs              =    rstemp            ;
assign      rt              =    rttemp			   ;
assign      rd              =    rdtemp			   ;
assign     opcode           =    opcodetemp        ;
assign      pcSrc           =    pcSrctemp;
assign      RegDst          =    RegDsttemp		   ;
assign      ALUSrc          =    ALUSrctemp		   ;
assign      MemtoReg        =    MemtoRegtemp	   ;
assign      RegWrite        =    RegWritetemp	   ;
assign      MemRead         =    MemReadtemp	   ;
assign      MemWrite        =    MemWritetemp	   ;
assign      Branch          =    Branchtemp		   ;
assign      Jump            =    Jumptemp		   ;
assign      SignZero        =    SignZerotemp	   ;
assign    ALUOp             =    ALUOptemp		   ;
assign    jumpaddress2      =    jumpaddressreg;
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 


endmodule
