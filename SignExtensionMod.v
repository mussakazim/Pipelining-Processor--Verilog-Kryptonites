`timescale 1ns / 1ps


module SignExtensionMod(
    output [31:0] SignExtConst,
    input [15:0] Constant
    );
	 
	 
	  reg[31:0] tempextendedImmediate;
     always@(*)
     begin
     //  if(ExtOp==1)
     //  begin
            tempextendedImmediate[14:0] = Constant[14:0];
             if(Constant[15] == 1'b0)
                begin
                  tempextendedImmediate[30:15] = 16'd0;
                end
             else
                begin
                  tempextendedImmediate[30:15] = 16'b1111111111111111;
                end
             tempextendedImmediate[31] = Constant[15];
     //   end
     end
	  
	  assign SignExtConst = tempextendedImmediate;



endmodule
