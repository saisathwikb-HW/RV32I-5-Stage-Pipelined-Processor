module buffer_mem(clk,regwE,memwE,res_srcE,pcplus4E,RdE,writedataE,aluresultE,UI_writeE,func3E,regwM,memwM,res_srcM,pcplus4M,RdM,writedataM,aluresultM,UI_writeM,func3M,opcodeE,opcodeM);
  
  input 			clk;
  
  input 	[31:0]	pcplus4E,writedataE,aluresultE,UI_writeE;
  input 	[4:0]	RdE;
  input 			regwE,memwE;
  input 	[1:0]	res_srcE;
  input 	[2:0]	func3E;
  input 	[6:0]	opcodeE;
  
  
  output	reg [31:0]	pcplus4M,writedataM,aluresultM,UI_writeM;
  output	reg	[4:0]	RdM;
  output 	reg			regwM,memwM;
  output 	reg [1:0]	res_srcM;
  output 	reg [2:0]	func3M;
  output	reg [6:0]	opcodeM;
  
  always @(posedge clk) begin
    pcplus4M   <= pcplus4E;
    RdM        <= RdE;
    res_srcM   <= res_srcE;
    regwM      <= regwE;
    memwM      <= memwE;
    writedataM <= writedataE;
    aluresultM <= aluresultE;
    UI_writeM  <= UI_writeE;
    func3M     <= func3E;
	opcodeM	   <=opcodeE;
	end
endmodule