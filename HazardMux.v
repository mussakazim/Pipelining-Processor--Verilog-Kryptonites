`timescale 1ns / 1ps


module HazardMux(
    
	 output pcSrcOut,
	 output RegDstOut,
    output ALUSrcOut,
    output MemtoRegOut,
    output RegWriteOut,
    output MemReadOut,
    output MemWriteOut,
    output BranchOut,
    output JumpOut,
    output SignZeroOut,
    output [1:0 ]ALUOpOut,
	 
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
	 
	 input Hazard
    );
	 
	 
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
	 
	 
	 
	 always@(*)
	 begin
	     
		  if (Hazard==1)
		  begin
		      
	      pcSrctemp        =     1'bx;
			RegDsttemp		  =     1'bx;
			ALUSrctemp		  =     1'bx;
			MemtoRegtemp	  =     1'bx;
			RegWritetemp	  =     1'bx;
			MemReadtemp		  =     1'bx;
			MemWritetemp	  =     1'bx;
			Branchtemp		  =     1'bx;
			Jumptemp		     =     1'bx;
			SignZerotemp	  =     1'bx;
			ALUOptemp		  =     2'bxx;
				
		  end
		  
		  else
		  begin
		  
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
		  
		  end
		  
	 end

	 
assign      pcSrcOut           =    pcSrctemp         ;
assign      RegDstOut          =    RegDsttemp		   ;
assign      ALUSrcOut          =    ALUSrctemp		   ;
assign      MemtoRegOut        =    MemtoRegtemp	   ;
assign      RegWriteOut        =    RegWritetemp	   ;
assign      MemReadOut         =    MemReadtemp	      ;
assign      MemWriteOut        =    MemWritetemp	   ;
assign      BranchOut          =    Branchtemp		   ;
assign      JumpOut            =    Jumptemp		      ;
assign      SignZeroOut        =    SignZerotemp	   ;
assign      ALUOpOut           =    ALUOptemp		   ;
	 


endmodule
