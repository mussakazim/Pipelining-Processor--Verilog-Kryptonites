`timescale 1ns / 1ps


module AluMUX2(
    output [31:0] AluMuxTwoOut,
    input [31:0] RtData1,
    input [31:0] SignExtConst1,
	 input ALUSrc1
    );


    reg[31:0] tempOut;
	 
	 always@(*)
	 begin
	     
		  if(ALUSrc1==0)
		  begin
		      tempOut = RtData1;
		  end
		  else if(ALUSrc1 == 1)
		  begin
		      tempOut = SignExtConst1;
		  end
		  
	 end

   assign AluMuxTwoOut = tempOut;

endmodule
