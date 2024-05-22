`timescale 1ns / 1ps


module OutputSelectorMUX(
    output [31:0] regWriteData,
    input [31:0] DataMemOut,
    input [31:0] ALUResult,
    input MemToReg
    );
	 
	 
	 reg[31:0] tempregWriteData;
	 
	 always@(*)
	   begin
		    if(MemToReg == 0)
			  begin
			    tempregWriteData = ALUResult;
			  end
			  else if(MemToReg == 1)
			   begin
				    tempregWriteData = DataMemOut;
				end
		end
		
		assign regWriteData = tempregWriteData;


endmodule
