module control_unit(opcode,func3,func7,regw,res_src,memw,jump,branch,immsrc,alu_src,alucontrol);
  input [6:0]opcode,func7;
  input [2:0]func3;
  
  
  output 	[2:0]	immsrc;
  output 	[1:0]	jump,res_src;
  output 			branch,regw,memw,alu_src;
  output 	[3:0]	alucontrol;
  
  wire 		[1:0]	aluop;
  
  
  main_dec    main_d(.opcode(opcode),.alu_op(aluop),.regw(regw),.res_src(res_src),.memw(memw),.jump(jump),.branch(branch),.immsrc(immsrc),.alu_src(alu_src));
  
  
  alu_dec     alu_d(.ALUOp(aluop),.funct3(func3),.funct7(func7),.op(opcode),.ALUControl(alucontrol));
  
endmodule