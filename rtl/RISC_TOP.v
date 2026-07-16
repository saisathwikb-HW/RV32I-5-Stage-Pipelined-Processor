module risc_top(clk,rst,pcF,instD,aluresultE,resultW);
input 			rst,clk;

output [31:0] pcF;
output [31:0] instD;
output [31:0] aluresultE;
output [31:0] resultW;



wire [31:0]		pc_in,pcplus4F,instF,immxD,pcE,immxE,pcplus_imm,writedataE,aluresultM,srcB,srcA;
wire [31:0]		Rd1E,Rd2E,UI_writeE,writedataM,readdataM,UI_writeW,pcplus4W,aluresultW,readdataW,RD_WB,Rd1D,Rd2D;


wire 			regwW,regwD,memwD,branchD,branchE,alu_srcD,Branchtaken,Carry,OverFlow,Zero,Sign,alu_srcE,op5E,memwM,StallD,StallF,regwM,flushE,flushD;
wire [1:0]		res_srcD,jumpD,pcsrc,res_srcW,res_srcE,forwardAE,forwardBE,jumpE;
wire [4:0]		RdW,Rs1E,Rs2E,RdM,RdE;
wire [2:0]		immsrc,func3E,func3M,func3W;
wire [3:0]		alucontrolD,alucontrolE,byte_enable;
wire [6:0]		opcodeM;




top_pipeline    pipeline	(.clk(clk),.rst(rst),.flushD(flushD),.flushE(flushE),.StallF(StallF),.StallD(StallD),.regwD(regwD),.memwD(memwD),.alu_srcD(alu_srcD),.res_srcD(res_srcD),.jumpD(jumpD),.pc_in(pc_in),.pcplus4F(pcplus4F),.instD(instD),

							.instF(instF),.immxD(immxD),.Rd1D(Rd1D),.Rd2D(Rd2D),.writedataE(writedataE),.aluresultE(aluresultE),.UI_writeE(UI_writeE),.readdataM(readdataM),.alucontrolD(alucontrolD),
							
							.immxE(immxE),.pcE(pcE),.Rd1E(Rd1E),.Rd2E(Rd2E),.writedataM(writedataM),.aluresultM(aluresultM),.pcplus4W(pcplus4W),.aluresultW(aluresultW),.UI_writeW(UI_writeW),
                    
							.readdataW(readdataW),.Rs1E(Rs1E),.Rs2E(Rs2E),.RdW(RdW),.jumpE(jumpE),.res_srcW(res_srcW),.func3M(func3M),.alu_srcE(alu_srcE),.memwM(memwM),.regwW(regwW),.op5E(op5E),.alucontrolE(alucontrolE),.branchD(branchD),.branchE(branchE),.func3E(func3E),
							
							.opcodeM(opcodeM),.RdM(RdM),.res_srcE(res_srcE),.regwM(regwM),.RdE(RdE),.pcF(pcF));


pc_select_mux  	pc_mux		(.pc_src(pcsrc),.pc_imm(pcplus_imm),.pc_plus4(pcplus4F),.pc_aluresult(aluresultE),.pc_in(pc_in));

instrmem		inst_mem	(.pc_in(pcF),.instr_d(instF));

pc_plus4_adder	pc4adder	(.pc_in(pcF),.pcplus4(pcplus4F));

control_unit	C_Unit		(.opcode(instD[6:0]),.func3(instD[14:12]),.func7(instD[31:25]),.regw(regwD),.res_src(res_srcD),.memw(memwD),.jump(jumpD),.branch(branchD),.immsrc(immsrc),.alu_src(alu_srcD),.alucontrol(alucontrolD));

reg_file		reg_f		(.clk(clk),.rst(rst),.in1(instD[19:15]),.in2(instD[24:20]),.we(regwW),.wd(resultW),.rd1(Rd1D),.rd2(Rd2D),.in3(RdW) );

imm_gen			Immgen		(.imm_src(immsrc),.in(instD),.imm_ext(immxD));

RDmuxs			RD_mux_B	(.Rd1E(Rd1E),.Rd2E(Rd2E),.forwardAE(forwardAE),.forwardBE(forwardBE),.srcA(srcA),.srcB(srcB),.aluresultM(aluresultM),.resultW(resultW),.alusrcE(alu_srcE),.immxE(immxE),.writedataE(writedataE));

ALU				alu1		(.A(srcA),.B(srcB),.Result(aluresultE),.ALUControl(alucontrolE),.Carry(Carry),.OverFlow(OverFlow),.Zero(Zero),.Sign(Sign));

branch_unit		B_unit		(.branchE(branchE),.func3(func3E),.Carry(Carry),.OverFlow(OverFlow),.Zero(Zero),.Sign(Sign),.Branchtaken(Branchtaken));

pcsrc_logic		pcsrc_l 	(.pcsrc(pcsrc),.jumpE(jumpE),.branchtaken(Branchtaken));

pc_imm_adder	pc_imm_ad 	(.pcE(pcE),.immxE(immxE),.pcplus_imm(pcplus_imm));

UI_select_mux	UI_mux		(.immxE(immxE),.pcplus_imm(pcplus_imm),.UI_writeE(UI_writeE),.op5E(op5E));

store_format	store_F 	(.fun3(func3M),.opcode(opcodeM),.byte_enable(byte_enable));

Data_Memory		DM			(.clk(clk),.WE(memwM),.WD(writedataM),.A(aluresultM),.RD(RD_WB),.ByteEnable(byte_enable));

load_format		LF			(.fun3(func3M),.opcode(opcodeM),.RD(RD_WB),.rdataM(readdataM));

mux_wb			WB_mux		(.aluresultW(aluresultW),.readdataW(readdataW),.pcplus4W(pcplus4W),.UI_writeW(UI_writeW),.resultW(resultW),.result_srcW(res_srcW));

hazard_unit		H_unit		(.Rs1E(Rs1E),.Rs2E(Rs2E),.RdM(RdM),.RdW(RdW),.regwM(regwM),.regwW(regwW),.forwardAE(forwardAE),.forwardBE(forwardBE),.flushE(flushE),.flushD(flushD),.pcsrc(pcsrc),.Rs1D(instD[19:15]),.Rs2D(instD[24:20]),.RdE(RdE),.ResultSrcE(res_srcE),.StallF(StallF),.StallD(StallD));

endmodule 
