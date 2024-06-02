`timescale 1ns / 1ps


module PCmodule(
    output [31:0] muxout,
    input [31:0] plus1,
    input [31:0] branchAddr,
	 input [31:0] jumpaddress,
	 input jump,
	 input pcSrc
    );
	 
	 
	 reg[31:0] tempmuxout;
	 initial 
	 begin
	     tempmuxout = 32'd0;
	 end
	 
	 
	 always@(*)
	 begin
	       if(pcSrc == 1)
			   begin
			 
			      tempmuxout  = branchAddr;
			   end
				else if(jump==1)
				begin
				tempmuxout=jumpaddress;
				end
	         else if(pcSrc != 1)
			   begin
			      tempmuxout  =  plus1;
			   end
			
	 end
	 
	 
	 assign muxout = tempmuxout;
	 


endmodule
