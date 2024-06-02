`timescale 1ns / 1ps

module ALU(
    output [31:0] ALUResult,
    output ZeroFlag,
	 input[31:0] Mux1Out,
	 input[31:0] Mux2Out,
    input [3:0] ALUControl
    );


	 reg[31:0] tempALUResult;
	 reg[31:0] tempzeroFlag;

	 always@(*)
	 begin
	      if(ALUControl == 4'b0000)
			  begin
			      tempALUResult = Mux1Out + Mux2Out;
			  end


			else if(ALUControl == 4'b0110)
			  begin
			      tempALUResult = Mux1Out - Mux2Out;
					if(tempALUResult == 31'd0)
					  begin
					      tempzeroFlag = 1'b1;
					  end
			  end


			else if(ALUControl == 4'b0001)
			  begin
			      tempALUResult = Mux1Out | Mux2Out;
			  end


			else if(ALUControl == 4'b0010)
			  begin
			      tempALUResult = Mux1Out & Mux2Out;
			  end


			else if(ALUControl == 4'b1100)
			  begin
			      tempALUResult = Mux1Out ^ Mux2Out;
			  end


	 end

	 assign ALUResult = tempALUResult;
	 assign ZeroFlag = tempzeroFlag;


endmodule
