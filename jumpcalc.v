`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:23:15 06/01/2024 
// Design Name: 
// Module Name:    jumpcalc 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module jumpcalc(
input [31:0] pc,
input [25:0]jumpinstr,
output[31:0] jumper
);
reg[31:0] tempjumper;

always@(*)
begin 
tempjumper= (jumpinstr<<2);
tempjumper[31:28]= pc[31:28];
end

assign jumper=tempjumper;

endmodule