`timescale 1ns / 1ps


module AluMUX1(
    output [31:0] Mux1Output,
    input [31:0] RsData1,
	 input [31:0] AluOut_exmem,
	 input [31:0] MuxOut_memwb,
	 input [1:0] selectLine1
    );

     
	 reg[31:0] tempOut;
	 
	 always@(*)
	 begin
	       
			 if(selectLine1 == 2'b01)
			 begin
			      tempOut = AluOut_exmem;
			 end
			 
			 else if(selectLine1 == 2'b10)
			 begin
			      tempOut = MuxOut_memwb;
			 end
			 
			 
			 else 
			 begin
			      tempOut = RsData1;
			 end
			 
	 end
	 
	 
	 assign Mux1Output = tempOut;
 
endmodule
