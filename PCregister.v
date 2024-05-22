`timescale 1ns / 1ps


module PCregister(
    output [31:0] PCwire,
    input [31:0] PCin,
	 input clk
    );
	 
	 
	 reg[31:0] PCreg;
	 
	 always@(*)
	 begin 
	     PCreg = PCin;
	 end
	 
	 assign PCwire = PCreg; 

endmodule
