`timescale 1ns / 1ps


module Stalling(
   output IFIDFlush,
   output IFIDWrite,
	output PCWrite,
	output hazard,
	input[4:0]rsfetch,
	input [4:0]rtfetch,
	input [4:0]rtexecute,
	input [4:0] rdexecute,
	input IDEXmemread,
	input branch,
	input branchtaken,
	input regwriteIDEX,
	input StallControl
	
	);
	reg ifidflush;
	reg ifidwritereg;
	reg pcwritereg;
	reg hazardreg;
	always@(*)
	begin
	ifidwritereg=1'b1;
	pcwritereg=1'b1;
	hazardreg=1'b0;
	ifidflush=1'b0;

 if(StallControl==1)
 begin
	
	 
	if(IDEXmemread && (rtfetch==rtexecute || rsfetch==rtexecute))   
		begin
			ifidwritereg=0;
			pcwritereg=0;
			hazardreg=1;
		end
	if (branch && branchtaken && !((rdexecute == rsfetch) || (rdexecute == rtfetch))) 
		begin
            ifidwritereg= 0;
            ifidflush = 1;
           hazardreg = 0;
		end

       
	if (branch && regwriteIDEX && ((rdexecute == rsfetch) || (rdexecute == rtfetch)))
		begin
            pcwritereg = 0;
            ifidwritereg = 0;
            hazardreg = 0;
		end
	if (branch && IDEXmemread && ((rtexecute == rsfetch) || (rtexecute == rtfetch))) 
		begin
            pcwritereg = 0;
            ifidwritereg = 0;
            hazardreg = 0;
		end
		  
	if (branch && branchtaken && IDEXmemread && !((rtexecute == rsfetch) || (rtexecute==rtfetch))) 
		begin
            ifidwritereg = 0;
            ifidflush = 1;
            hazardreg = 0;
		end
		
		
	end
	
end
	assign IFIDWrite = ifidwritereg;
	assign PCWrite = pcwritereg;
	assign hazard =hazardreg;
	assign IFIDFlush=ifidflush;


endmodule
