`timescale 1ns / 1ps


module InstrRegMux(
    output IFIDWriteMux,
    input IFIDWrite,
    input[31:0] PCWire
    );
	 
	 reg tempOut;
	 
	 always@(*)
	 begin
	     if(PCWire==32'd0)
		  begin
		      tempOut = 1'b1;
		  end
		  else
		  begin
		      tempOut = IFIDWrite;
		  end
	 end
	 
	 assign IFIDWriteMux = tempOut;


endmodule
