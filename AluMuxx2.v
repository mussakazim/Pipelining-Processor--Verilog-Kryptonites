`timescale 1ns / 1ps

module AluMux2(

    output[31:0] AluMux2Out,
    input [31:0] BackAluMux_in,
	 input [31:0] AluOut_exmem,
	 input [31:0] MuxOut_memwb,
	 input [1:0] selectLine2
    );


    reg[31:0] tempOut;
	 
	 always@(*)
	 begin
	       
			 if(selectLine2 == 2'b01)
			 begin
			      tempOut = AluOut_exmem;
			 end
			 
			 else if(selectLine2 == 2'b10)
			 begin
			      tempOut = MuxOut_memwb;
			 end
			 
			 
			 else 
			 begin
			      tempOut = BackAluMux_in;
			 end
			 
	 end
	 
	 
	 assign AluMux2Out = tempOut;

endmodule
