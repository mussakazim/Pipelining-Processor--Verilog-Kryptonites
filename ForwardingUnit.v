module Forwarding_Unit	(			//notation id= id/ex --- ex= ex/mem --- mem= mem/wb

    output [1:0] forward_a_mux,		//2-bit
    output [1:0] forward_b_mux,			//depends upon your conditions if conditions are same then 1 bit se bhi kam chaly ga wesy 2 bit bhi krskty
    input RegWrite_ex,				// execution/mem stage wala RegWrite ka signal matlab next instruction ka
    input RegWrite_mem,				// mem/wb stage wala RegWrite ka signal matlab previous instruction ka	
    input [4:0] id_rs,				//id/ex
	 input [4:0] id_rt,				//id/ex
	 input [4:0] ex_rd,				//ex/mem
    input [4:0] mem_rd,				//mem/wb 
	 input ForwardControl

);

    reg [1:0] a;					
    reg [1:0] b;

    always @(*) begin

     if(ForwardControl)
	  begin
        if (RegWrite_ex && (ex_rd != 5'b0) && (ex_rd == id_rs)) begin
            a = 2'b01; 
        end else if (RegWrite_mem && (mem_rd != 5'b0) && (mem_rd == id_rs)) begin
            a = 2'b10; 
        end else begin
            a = 2'b00;
        end
		// conditions slides ke screenshot se double check kr skty ho jo mene beja ha ( i checked them )
        if (RegWrite_ex && (ex_rd != 5'b0) && (ex_rd == id_rt)) begin
            b = 2'b01;
        end else if (RegWrite_mem && (mem_rd != 5'b0) && (mem_rd == id_rt)) begin
            b = 2'b10; 
        end else begin
            b = 2'b00; 
        end
	 end
    end

    assign forward_a_mux = a;		
    assign forward_b_mux = b;
	 
endmodule