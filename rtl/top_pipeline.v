module top_pipeline( clk,rst,flushD,flushE,StallF,StallD,regwD,memwD,alu_srcD,res_srcD,jumpD,pc_in,pcplus4F,instD,instF,immxD,Rd1D,Rd2D,writedataE,aluresultE,
					
					UI_writeE,readdataM,alucontrolD,immxE,pcE,Rd1E,Rd2E,writedataM,aluresultM,pcplus4W,aluresultW,UI_writeW,
                    
                    readdataW,Rs1E,Rs2E,RdW,jumpE,res_srcW,func3M,alu_srcE,memwM,regwW,op5E,alucontrolE,branchD,branchE,func3E,RdM,res_srcE,RdE,regwM,pcF,opcodeM);
  
  
  input 			clk,rst;
  
  input 			regwD,memwD,alu_srcD,branchD;
  input		[1:0]	res_srcD,jumpD;
  input				flushD,flushE,StallF,StallD;
  
  input 	[31:0]	pc_in,pcplus4F,instF,immxD,Rd1D,Rd2D,writedataE,aluresultE,UI_writeE,readdataM;
  input		[3:0]	alucontrolD;
  
  
  output	[31:0]	instD,immxE,pcE,Rd1E,Rd2E,writedataM,aluresultM,pcplus4W,aluresultW,UI_writeW,readdataW,pcF;
  output	[4:0]	Rs1E,Rs2E,RdE,RdM,RdW;
  output 	[1:0]	jumpE,res_srcW,res_srcE;
  output	[2:0]	func3E,func3M;
  output		 	alu_srcE,memwM,regwW,op5E,branchE,regwM;
  output	[3:0]	alucontrolE;
  output 	[6:0]	opcodeM;
  
  
  
  wire [31:0] 	pcD,pcplus4D,pcplus4E,pcplus4M,UI_writeM;
  
  wire [6:0]	opcodeE;
  
  wire 			regwE,memwE;
  wire [1:0]	res_srcM;
  
  buffer_fetch  B_fetch(.rst(rst),.clk(clk),.pc_in(pc_in),.pcF(pcF),.StallF(StallF));
  
  
  buffer_decode  B_decode(.clk(clk),.flushD(flushD),.instF(instF),.instD(instD),.pcF(pcF),.pcD(pcD),.pcplus4F(pcplus4F),.pcplus4D(pcplus4D),.StallD(StallD));
  
  
  buffer_ex      B_ex(.clk(clk),.flushE(flushE),.immxD(immxD),.immxE(immxE),.pcD(pcD),.pcE(pcE),.pcplus4D(pcplus4D),.pcplus4E(pcplus4E),
                      .jumpD(jumpD),.res_srcD(res_srcD),.regwD(regwD),.memwD(memwD),.alu_srcD(alu_srcD),
                      .jumpE(jumpE),.res_srcE(res_srcE),.regwE(regwE),.memwE(memwE),
                      .alu_srcE(alu_srcE),.Rd1D(Rd1D),.Rd2D(Rd2D),.Rd1E(Rd1E),.Rd2E(Rd2E),.Rs1D(instD[19:15]),.Rs2D(instD[24:20]),.Rs1E(Rs1E),.Rs2E(Rs2E),
                      .RdD(instD[11:7]),.RdE(RdE),.alucontrolD(alucontrolD),
                      .alucontrolE(alucontrolE),.func3D(instD[14:12]),.func3E(func3E),.op5D(instD[5]),.op5E(op5E),.branchD(branchD),.branchE(branchE),.opcodeD(instD[6:0]),.opcodeE(opcodeE));
  
  
  buffer_mem	B_mem(.clk(clk),.regwE(regwE),.memwE(memwE),.res_srcE(res_srcE),.pcplus4E(pcplus4E),.RdE(RdE),
                      .writedataE(writedataE),.aluresultE(aluresultE),.UI_writeE(UI_writeE),.func3E(func3E),.regwM(regwM),
                      .memwM(memwM),.res_srcM(res_srcM),.pcplus4M(pcplus4M),.RdM(RdM),
                      .writedataM(writedataM),.aluresultM(aluresultM),.UI_writeM(UI_writeM),.func3M(func3M),.opcodeE(opcodeE),.opcodeM(opcodeM));
  
  buffer_wb     B_wb(.clk(clk),.regwM(regwM),.res_srcM(res_srcM),
                     .pcplus4M(pcplus4M),.RdM(RdM),.aluresultM(aluresultM),.UI_writeM(UI_writeM),
                     .readdataM(readdataM),.regwW(regwW),.res_srcW(res_srcW),.pcplus4W(pcplus4W),
                     .RdW(RdW),.aluresultW(aluresultW),.UI_writeW(UI_writeW),.readdataW(readdataW));
  
  
endmodule