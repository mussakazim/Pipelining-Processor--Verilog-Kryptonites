`timescale 1ns / 1ps


module TopModule(
    input clk,
	 input stallingControl,
	 input forwardControl,
    output out
    );


reg tempclk;
initial
begin
    tempclk = 0;
end

always
begin
    #200 tempclk = ~tempclk;
end

assign clk = tempclk;

   wire [31:0] jumpaddr;
	wire[31:0] PCmuxout;
	wire[31:0] plus1;
	wire[31:0] BranchAddress;
	wire pcSrc;
	wire[31:0]  BranchAddress1;
	wire   pcSrc1;
	
	wire[31:0]  BranchAddress2;
	wire   pcSrc2;
	
	wire[31:0]  BranchAddress3;
	wire   pcSrc3;
	wire   Jump1;
	PCmodule uut_pcmod(PCmuxout,plus1,BranchAddress1,jumpaddr,Jump1,pcSrc1);
	
	
	wire[31:0] PCwire;
	PCregister uut_pcreg(PCwire,PCmuxout,clk);     // PCin = PCmuxout
	
	wire PCWrite;
	wire[31:0] FetchOut;
	FetchModule uut_fetch(FetchOut,plus1,PCwire,clk,PCWrite);    // PCin = PCwire   , PCAdderout = plus1
	
	
	
	
	
	wire[31:0] InstrRegOut;
	wire Write_IFID;
	wire Flush_IFID; 
	
	wire TestIFIDWrite;
	InstrRegMux uut_instrRegMux(TestIFIDWrite,Write_IFID,PCwire);
	
	InstructionRegister uut_InstructionReg(InstrRegOut,FetchOut,clk,TestIFIDWrite,Flush_IFID);    // InstrIn = FetchOut
	
	
	 wire[5:0]  opcode;
    wire[4:0]  rs;
	 wire[4:0]  rt;
	 wire[4:0]  rd;
	 wire[4:0]  shamt;
	 wire[5:0]  funct;
	 wire[15:0] constant;
	 wire[25:0] jumpConst;
	
	
	Decoder uut_decoder(opcode,rs,rt,rd,shamt,funct,constant,jumpConst,InstrRegOut);
	
	
	wire[31:0] SignExtConst;
	SignExtensionMod uut_signExt(SignExtConst,constant);
	
	
	wire[31:0] jumpaddress;
	// wire BranchAddress already made which goes into PCModule
	BranchCalculator uut_branchCalc(BranchAddress,SignExtConst,InstrRegOut,PCwire);
	jumpcalc uut_jumper(PCwire,jumpConst,jumpaddress);
	
	
	wire   RegDst;
	wire   ALUSrc;
	wire   MemtoReg;
	wire   RegWrite;
	wire   MemRead;
	wire   MemWrite;
	wire   Branch;
	wire   Jump;
   wire   SignZero;
	//wire   pcSrc;
	wire   [1:0]ALUOp;
	
	
	ControlUnit uut_ControlUnit(RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,SignZero,ALUOp,opcode);
	
	
	
	wire[31:0] RsData;
	wire[31:0] RtData;
	wire[31:0] regWriteData;
	wire[4:0] RegWriteAddress;
   wire [4:0] RegWriteAddress3;
   wire RegWrite3;		 
	RegisterModule uut_RegistersMod(RsData,RtData,rs,rt,rd,regWriteData,RegDst,RegWrite3,RegWriteAddress3);
	
	
	wire BranchTaken;
	BranchChecker uut_BranchChecker(pcSrc,BranchTaken,RsData,RtData,Branch);  // Branch comes from Control Unit
	
	
	
   wire[31:0]      InstrOut1;
   wire[31:0]        RsData1;
   wire[31:0]        RtData1;
   wire[31:0]  SignExtConst1;
	wire[4:0]             rs1;
   wire[4:0]             rt1;
   wire[4:0]             rd1;
	wire[5:0]         opcode1;
   wire              RegDst1;
   wire              ALUSrc1;
   wire            MemtoReg1;
   wire            RegWrite1;
   wire             MemRead1;
   wire            MemWrite1;
   wire              Branch1;
   
   wire            SignZero1;
   wire[1:0]          ALUOp1;	
	
	
	
	//wire Flush_IFID;    Added in InstrReg
	//wire Write_IFID;    Added in InstrReg
	//wire PCWrite;       Fetch mai bnadia
	wire Hazard;
	Stalling uut_stall(Flush_IFID,Write_IFID,PCWrite,Hazard,rs,rt,rt1,rd1,MemRead1,Branch,BranchTaken,
	                   RegWrite1,stallingControl);
	
	
	
	
	 wire pcSrcMux;
	 wire RegDstMux;
    wire ALUSrcMux;
    wire MemtoRegMux;
    wire RegWriteMux;
    wire MemReadMux;
    wire MemWriteMux;
    wire BranchMux;
    wire JumpMux;
    wire SignZeroMux;
    wire [1:0 ]ALUOpMux;
	HazardMux uut_MuxHazard(pcSrcMux,RegDstMux,ALUSrcMux,MemtoRegMux,RegWriteMux,MemReadMux,MemWriteMux,
	                        BranchMux,JumpMux,SignZeroMux,ALUOpMux,pcSrc,RegDst,ALUSrc,MemtoReg,
										RegWrite,MemRead,MemWrite,Branch,Jump,SignZero,ALUOp, Hazard );
	
	
	
	ID_EX_REGISTER uut_IdExReg(InstrOut1,RsData1,RtData1,SignExtConst1,BranchAddress1,jumpaddr,rs1,rt1,rd1,opcode1,pcSrc1,
	                           RegDst1,ALUSrc1,MemtoReg1,RegWrite1,MemRead1,MemWrite1,Branch1,Jump1,SignZero1,ALUOp1,
										clk,InstrRegOut,RsData,RtData,SignExtConst,BranchAddress,rs,rt,rd,opcode,pcSrcMux,RegDstMux,ALUSrcMux,
										MemtoRegMux,RegWriteMux,MemReadMux,MemWriteMux,BranchMux,JumpMux,SignZeroMux,ALUOpMux,jumpaddress);
										
	
	
	
	
	wire [1:0] ForwardingOutput1;
	wire [1:0] ForwardingOutput2;
	wire RegWrite2;  // RegWrite3 is already declared with the Registers
	wire [4:0] RegWriteAddress2; // 3 is already declared with Registers
	
	Forwarding_Unit uut_Forwarding(ForwardingOutput1,ForwardingOutput2,RegWrite2,RegWrite3,rs1,rt1,RegWriteAddress2,RegWriteAddress3,forwardControl);
	
	
	wire [31:0] ALUResult2;  ///// EXMEM SE GENERATE HORA
	
	wire [31:0] AluMuxOneOut;
	AluMUX1   uut_AluMux1(AluMuxOneOut,RsData1,ALUResult2,regWriteData,ForwardingOutput1);
	
	wire [31:0] BackAluMuxOut;
	BackAluMux  uut_BackAluMux(BackAluMuxOut,RtData1,SignExtConst1,ALUSrc1);
	
	
	
	
	wire [31:0] AluMuxTwoOut;	
	AluMux2 uut_AluMux2(AluMuxTwoOut,BackAluMuxOut,ALUResult2,regWriteData,ForwardingOutput2);
	
	
	
	wire[3:0] ALUControl;
	ALU_Control uut_ALUControl(ALUControl,opcode1,ALUOp1);
	
	
	wire[31:0] ALUResult;
	wire zeroFlag;
	ALU uut_ALU(ALUResult,zeroFlag,AluMuxOneOut,AluMuxTwoOut,ALUControl);
	
	
	// wire WriteAddress already declared
	RegWriteAddressSelector uut_regWrtAddressSelector(RegWriteAddress,rt1,rd1,RegDst1);
	
	
	
	
	
	wire [31:0] RtData2;
	wire [4:0] rs2;
	wire [4:0] rt2;
//	wire [4:0] RegWriteAddress2;     DECLARED WITH FORWARDING UNIT
	wire zeroFlag2;
	wire MemtoReg2;
 //  wire RegWrite2;    DECLARED WITH FORWARDING UNIT
   wire MemRead2;
   wire MemWrite2;  
	wire Branch2;
	ExMemReg uut_ExMemReg(ALUResult2,RtData2,rs2,rt2,RegWriteAddress2,BranchAddress2,pcSrc2,zeroFlag2,MemtoReg2,RegWrite2,MemRead2,
	                      MemWrite2,Branch2,clk,ALUResult,RtData1,rs1,rt1,RegWriteAddress,BranchAddress1,
								 pcSrc1,zeroFlag,MemtoReg1,RegWrite1,MemRead1,MemWrite1,Branch1);
	
	
	
	
	 wire [31:0] DataMemOutput;
	 DataMemory uut_DataMem(DataMemOutput,RtData2,rs2,rt2,MemWrite2,MemRead2);




    wire [31:0] DataMemOutput3;
    wire [31:0] ALUResult3;
/////////// COULD GO UP
    wire MemtoReg3;
  
	 
	 MEMWB_Reg uut_MemWbReg(DataMemOutput3,ALUResult3,RegWriteAddress3,BranchAddress3,pcSrc3,MemtoReg3,RegWrite3,clk,DataMemOutput,
	           ALUResult2,RegWriteAddress2,BranchAddress2,pcSrc2,MemtoReg2,RegWrite2);
	
	
	
	
	OutputSelectorMUX uut_outputSelectorMux(regWriteData,DataMemOutput3,ALUResult3,MemtoReg3);
	
	assign out = DataMemOutput3;
	
	
endmodule
