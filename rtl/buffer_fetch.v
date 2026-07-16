module buffer_fetch(clk,rst,pc_in,pcF,StallF);
  input				clk,StallF,rst;
  input 	[31:0]	pc_in;
  output 	reg [31:0]	pcF;
  
  always @(posedge clk) begin
  if(rst)
  pcF<=32'd0;
    else if (!StallF)
        pcF <= pc_in;
	end
endmodule