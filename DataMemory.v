`timescale 1ns / 1ps


module DataMemory(
    output [31:0] DataMemOutput,
    input [31:0] RtData,
    input [4:0] rs,
    input [4:0] rt,
    input MemWrite,
    input MemRead
    );
	 
	 
	 
	 reg[31:0] DataMemory [31:0];
	 initial
	  begin
	      DataMemory[0] = 32'd10;
			DataMemory[1] = 32'd100;
         DataMemory[2] = 32'd200;
         DataMemory[3] = 32'd300;
         DataMemory[4] = 32'd400;
         DataMemory[5] = 32'd500;
         DataMemory[6] = 32'd600;
         DataMemory[7] = 32'd700;
         DataMemory[8] = 32'd800;
         DataMemory[9] = 32'd900;
         DataMemory[10] = 32'd1000;
         DataMemory[11] = 32'd1100;
         DataMemory[12] = 32'd1200;
         DataMemory[13] = 32'd1300;
         DataMemory[14] = 32'd1400;
         DataMemory[15] = 32'd1500;
         DataMemory[16] = 32'd1600;
         DataMemory[17] = 32'd1700;
         DataMemory[18] = 32'd1800;
         DataMemory[19] = 32'd1900;
         DataMemory[20] = 32'd2000;
         DataMemory[21] = 32'd2100;
         DataMemory[22] = 32'd2200;
         DataMemory[23] = 32'd2300;
         DataMemory[24] = 32'd2400;
         DataMemory[25] = 32'd2500;
         DataMemory[26] = 32'd2600;
         DataMemory[27] = 32'd2700;
         DataMemory[28] = 32'd2800;
         DataMemory[29] = 32'd2900;
         DataMemory[30] = 32'd3000;
         DataMemory[31] = 32'd3100;
	  end
	 
	 
	 reg [31:0] tempDataMemOutput;
	 
	 always@(*)
	 begin
	      if(MemRead == 1)
			 begin
			     tempDataMemOutput = DataMemory[rs];
			 end
	 
	      if(MemWrite==1)
		    begin
		       DataMemory[rt] = RtData;
		    end
	 end
	 
	 assign DataMemOutput = tempDataMemOutput;


endmodule
