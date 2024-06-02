`timescale 1ns / 1ps

module ControlUnit(
output RegDst,
output ALUSrc,
output MemtoReg,
output RegWrite,
output MemRead,
output MemWrite,
output Branch,
output Jump,
output SignZero,
//output pcSrc,
output [1:0 ]ALUOp,
input [5:0]Opcode
);

reg tempRegDst,tempALUSrc,tempMemtoReg,tempRegWrite,tempMemRead,tempMemWrite,tempBranch,tempJump,tempSignZero;
reg [1:0] tempALUOp;

always @(*)

begin
casex (Opcode)
 6'b000000 : begin // R - type   Add
    tempRegDst = 1'b1;
    tempALUSrc = 1'b0;
    tempMemtoReg= 1'b0;
    tempRegWrite= 1'b1;
    tempMemRead = 1'b0;
    tempMemWrite= 1'b0;
    tempBranch = 1'b0;
    tempALUOp = 2'b10;
    tempJump = 1'b0;
    tempSignZero= 1'b0;
    end
	 6'b000001 : begin // R - type   Sub
    tempRegDst = 1'b1;
    tempALUSrc = 1'b0;
    tempMemtoReg= 1'b0;
    tempRegWrite= 1'b1;
    tempMemRead = 1'b0;
    tempMemWrite= 1'b0;
    tempBranch = 1'b0;
    tempALUOp = 2'b01;
    tempJump = 1'b0;
    tempSignZero= 1'b0;
    end
	 6'b000010 : begin // R - type   OR
    tempRegDst = 1'b1;
    tempALUSrc = 1'b0;
    tempMemtoReg= 1'b0;
    tempRegWrite= 1'b1;
    tempMemRead = 1'b0;
    tempMemWrite= 1'b0;
    tempBranch = 1'b0;
    tempALUOp = 2'b00;
    tempJump = 1'b0;
    tempSignZero= 1'b0;
    end
	 6'b000011 : begin // R - type   AND
    tempRegDst = 1'b1;
    tempALUSrc = 1'b0;
    tempMemtoReg= 1'b0;
    tempRegWrite= 1'b1;
    tempMemRead = 1'b0;
    tempMemWrite= 1'b0;
    tempBranch = 1'b0;
    tempALUOp = 2'b11;
    tempJump = 1'b0;
    tempSignZero= 1'b0;
    end
 6'b100011 : begin // lw - load word
     tempRegDst = 1'b0;
     tempALUSrc = 1'b1;
     tempMemtoReg= 1'b1;
     tempRegWrite= 1'b1;
     tempMemRead = 1'b1;
     tempMemWrite= 1'b0;
     tempBranch = 1'b0;
     tempALUOp = 2'b00;
     tempJump = 1'b0;
     tempSignZero= 1'b0; // sign extend
    end
 6'b101011 : begin // sw - store word
     tempRegDst = 1'bx;
     tempALUSrc = 1'b1;
     tempMemtoReg= 1'bx;
     tempRegWrite= 1'b0;
     tempMemRead = 1'b0;
     tempMemWrite= 1'b1;
     tempBranch = 1'b0;
     tempALUOp = 2'b00;
     tempJump = 1'b0;
     tempSignZero= 1'b0;
    end
 6'b000100 : begin // bne - branch if equal
     tempRegDst = 1'b0;
     tempALUSrc = 1'b0;
     tempMemtoReg= 1'b0;
     tempRegWrite= 1'b0;
     tempMemRead = 1'b0;
     tempMemWrite= 1'b0;
     tempBranch = 1'b1;
     tempALUOp = 2'b01;
     tempJump = 1'b0;
     tempSignZero= 1'b0; // sign extend
    end
 6'b001111 : begin // XORI - XOR immidiate
     tempRegDst = 1'b0;
     tempALUSrc = 1'b1;
     tempMemtoReg= 1'b0;
     tempRegWrite= 1'b1;
     tempMemRead = 1'b0;
     tempMemWrite= 1'b0;
     tempBranch = 1'b0;
     tempALUOp = 2'b11;
     tempJump = 1'b0;
     tempSignZero= 1'b1; // zero extend
    end
 6'b100000 : begin // j - Jump
     tempRegDst = 1'b0;
     tempALUSrc = 1'b0;
     tempMemtoReg= 1'b0;
     tempRegWrite= 1'b0;
     tempMemRead = 1'b0;
     tempMemWrite= 1'b0;
     tempBranch = 1'b0;
     tempALUOp = 2'b00;
     tempJump = 1'b1;
     tempSignZero= 1'b0;
    end
 default : begin 
     tempRegDst = 1'b0;
     tempALUSrc = 1'b0;
     tempMemtoReg= 1'b0;
     tempRegWrite= 1'b0;
     tempMemRead = 1'b0;
     tempMemWrite= 1'b0;
     tempBranch = 1'b0;
     tempALUOp = 2'b10;
     tempJump = 1'b0;
     tempSignZero= 1'b0;
    end
 
endcase
end


assign  RegDst       =    tempRegDst;
assign  ALUSrc       =    tempALUSrc;
assign  MemtoReg     =    tempMemtoReg;
assign  RegWrite     =    tempRegWrite;
assign  MemRead      =    tempMemRead ;
assign  MemWrite     =    tempMemWrite;
assign  Branch       =    tempBranch; 
assign  ALUOp        =    tempALUOp; 
assign  Jump         =    tempJump;
assign  SignZero     =    tempSignZero;


endmodule 