`timescale 1ns / 1ps


module RegistersModule(
    output [31:0] RsData,
    output [31:0] RtData,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] WriteData,
	 input RegDst,
	 input RegWrite
    );

  
  reg [31:0] registerFile[31:0];  
     
  initial
   begin
    registerFile[0] = 32'd5;
    registerFile[1] = 32'd10;
    registerFile[2] = 32'd20;
    registerFile[3] = 32'd30;
    registerFile[4]  = 32'd40;
    registerFile[5]  = 32'd50;
    registerFile[6]  = 32'd60;
    registerFile[7]  = 32'd70;
    registerFile[8]  = 32'd80;
    registerFile[9]  = 32'd90;
    registerFile[10] = 32'd100;
    registerFile[11] = 32'd110;
    registerFile[12] = 32'd120;
    registerFile[13] = 32'd130;
    registerFile[14] = 32'd140;
    registerFile[15] = 32'd150;
    registerFile[16] = 32'd160;
    registerFile[17] = 32'd170;
    registerFile[18] = 32'd180;
    registerFile[19] = 32'd190;
    registerFile[20] = 32'd200;
    registerFile[21] = 32'd210;
    registerFile[22] = 32'd220;
    registerFile[23] = 32'd230;
    registerFile[24] = 32'd240;
    registerFile[25] = 32'd250;
    registerFile[26] = 32'd260;
    registerFile[27] = 32'd270;
    registerFile[28] = 32'd280;
    registerFile[29] = 32'd290;
    registerFile[30] = 32'd300;
    registerFile[31] = 32'd310;
   end
	
	
	
	reg[4:0]  writeAddress;
   reg[31:0] tempRsData;
	reg[31:0] tempRtData;
	
	always@(*)
	begin
	    tempRsData = registerFile[rs];
		 tempRtData = registerFile[rt];
		 
		 if(RegDst==0)
		 begin
		     writeAddress = rt;
		 end
		 else if(RegDst == 1)
		 begin
		     writeAddress = rd;
		 end
	end
	
	
	
	
	always@(posedge clk)
	begin
	    if(RegWrite == 1)
		 begin
		      registerFile[writeAddress] = WriteData;
		 end
	end
	
	
	assign RsData = tempRsData;
	assign RtData = tempRtData;
     
endmodule
