`timescale 1ns / 1ps


module BranchChecker(
    output branchFlag,   //pcSrc
    input [31:0] RsData,
    input [31:0] RtData,
    input branch_control
    );


  reg zero_flag;
  reg tempbranchflag;
  
  always@(*)
  begin
      if(RsData == RtData)
		  begin
		    zero_flag = 1'b1;
			 
			 tempbranchflag = zero_flag & branch_control;
			 
	     end
		
		
		else
		  begin
		    tempbranchflag = 1'b0;
		  end
  end
  
  
  assign branchFlag = tempbranchflag;
  

endmodule
