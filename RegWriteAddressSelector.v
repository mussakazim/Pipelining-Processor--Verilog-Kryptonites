`timescale 1ns / 1ps


module RegWriteAddressSelector(
    output [4:0] WriteAddress,
    input [4:0] rt,
    input [4:0] rd,
    input RegDst
    );
	 
	 
	 reg [4:0]tempWriteAddress;
	 
	 always@(*)
	begin
		 if(RegDst == 0)
		 begin
		   tempWriteAddress = rt;
		 end
		 else if(RegDst == 1)
		 begin
		   tempWriteAddress = rd;
		 end
	end


  assign WriteAddress = tempWriteAddress;

endmodule
