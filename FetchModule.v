`timescale 1ns / 1ps


module FetchModule(
    output [31:0] InstrOut,
    output [31:0] PCAdderOut,
    input [31:0] PCin,
	 input clk
    );

  reg [31:0] tempInstrOut;
  reg [31:0 ]tempPCAdderOut;
  
  reg[31:0] InstructionMemory [31:0];
     
	  initial
     begin
         // Add Function Instructions- R type
//BRANCH CHECK			InstructionMemory[0]  = 32'b000100_10000100000000000000000011;
         InstructionMemory[0]  = 32'b100011_00001_00010_10000_00000_100000;  // rs=1, rt=2, rd=16, LW
         InstructionMemory[1]  = 32'b000000_00011_00000_10000_00000_100000;  // rs=3, rt=0, rd=16, Add
         InstructionMemory[2]  = 32'b000000_00100_00101_10000_00000_100000;  // rs=4, rt=5, rd=16, Add
         InstructionMemory[3]  = 32'b000001_10000_00110_10000_00000_100010;  // rs=6, rt=16, rd=16, Sub
         // Store Word Command - I type
         InstructionMemory[4]  = 32'b101011_01010_01000_10000_00000_000000;  // rs=10, rt=8, rd=16, Store Word
         // Load Word Command - I type
         InstructionMemory[5]  = 32'b100011_01000_01000_01000_00000_000000;  // rs=8, rt=2, rd=8, Load Word
         // Branch if Equal Command - I type
         InstructionMemory[6]  = 32'b000100_10000100000000000000000011;  // rs, rt=16, constant=2, Branch if Equal
         InstructionMemory[7]  = 32'b00010010000100000000000000000001;  // rs, rt=16, constant=2, Branch if Equal
         InstructionMemory[8]  = 32'h89ABCDEF;  
         InstructionMemory[9]  = 32'h89ABCDEF; 
         InstructionMemory[10]  = 32'h89ABCDEF;  
         InstructionMemory[11]  = 32'h89ABCDEF; 			
			
			
			
			
			
			// Add Function Instructions- R type
			
         InstructionMemory[12]  = 32'b100011_00001_00010_10000_00000_100000;  // rs=1, rt=2, rd=16, LW
         InstructionMemory[13]  = 32'b000000_00011_00000_10000_00000_100000;  // rs=3, rt=0, rd=16, Add
         InstructionMemory[14]  = 32'b000000_00100_00101_10000_00000_100000;  // rs=4, rt=5, rd=16, Add
         InstructionMemory[15]  = 32'b000001_00110_10000_10000_00000_100010;  // rs=6, rt=16, rd=16, Sub
         // Store Word Command - I type
         InstructionMemory[16]  = 32'b101011_01010_01000_10000_00000_000000;  // rs=10, rt=8, rd=16, Store Word
         // Load Word Command - I type
         InstructionMemory[17]  = 32'b100011_01000_01000_01000_00000_000000;  // rs=8, rt=2, rd=8, Load Word
         // Branch if Equal Command - I type
         InstructionMemory[18]  = 32'b000100_10000100000000000000000001;  // rs, rt=16, constant=2, Branch if Equal
         InstructionMemory[19]  = 32'b00010010000100000000000000000001;  // rs, rt=16, constant=2, Branch if Equal
         InstructionMemory[20]  = 32'h89ABCDEF;  
         InstructionMemory[21]  = 32'h89ABCDEF;  
     end
	  
	  
	  always@(posedge clk)
	  begin
	      
			tempInstrOut = InstructionMemory[PCin];
			tempPCAdderOut = PCin + 1;
	  end
	  
	  
	  assign InstrOut   = tempInstrOut;
	  assign PCAdderOut = tempPCAdderOut;


    

endmodule
