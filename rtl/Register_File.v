module reg_file(clk,rst,in1,in2,we,wd,rd1,rd2,in3);
  input [4:0]in3,in2,in1;
  input [31:0]wd;
  input we,clk,rst;
  output [31:0]rd1,rd2;
  
  
  integer i;
reg [31:0]regs[31:0]; 
 
  always@(posedge clk)
    begin
    if(rst)
    begin
    for(i=0;i<32;i=i+1)
			regs[i]=32'd0;
	end
      else if(we&&(in3!=5'd0)) 
        begin 
          regs[in3]<=wd;
        end
    end
  
  assign rd1 =
    (in1 == 5'd0) ? 32'd0 :
    (we && (in3 == in1) && (in3 != 5'd0)) ? wd :
    regs[in1];

assign rd2 =
    (in2 == 5'd0) ? 32'd0 :
    (we && (in3 == in2) && (in3 != 5'd0)) ? wd :
    regs[in2];
endmodule
      
          
  