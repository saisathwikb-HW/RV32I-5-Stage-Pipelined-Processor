module main_dec(opcode,alu_op,regw,res_src,memw,jump,branch,immsrc,alu_src);
  
  input		[6:0]	opcode;
  
  output 	[2:0]	immsrc;
  output 	[1:0]	jump,res_src,alu_op;
  output 			branch,regw,memw,alu_src;
  
  localparam  Register_ALU 	=	7'b0110011 ;
  localparam Immediate_ALU	= 	7'b0010011 ; 
  localparam Loads  		=	7'b0000011 ;
  localparam Stores  	 	=	7'b0100011 ;
  localparam Branches  		=	7'b1100011 ;
  localparam JAL 			=	7'b1101111 ;
  localparam JALR  			=	7'b1100111 ;
  localparam LUI    		=	7'b0110111 ;
  localparam AUIPC 			=	7'b0010111 ;
  localparam I 				=	3'b 000;
  localparam S 				=	3'b 001;
  localparam B 				=	3'b 010;
  localparam U 				=	3'b 011;
  localparam J 				=	3'b 100;
  
  assign alu_op     =((opcode == Register_ALU) || (opcode == Immediate_ALU)) ? 2'b10 :(opcode == Branches) ? 2'b01 :2'b00;
  assign branch     = (opcode == Branches) ? 1'b1 : 1'b0 ;
  assign regw       =((opcode==Register_ALU)|| (opcode==Immediate_ALU)||(opcode==Loads)|| (opcode==JAL)|| (opcode==JALR)|| (opcode==LUI)|| (opcode==AUIPC))? 1'b1 : 1'b0 ;
  assign alu_src    = ((opcode == Loads) || (opcode == Stores )||( opcode == Immediate_ALU)|| (opcode==JALR)|| (opcode==LUI)|| (opcode==AUIPC)) ? 1'b1 :1'b0 ;
  assign memw       = (opcode == Stores) ? 1'b1 :1'b0 ;
  assign res_src    = (opcode == Loads) ? 2'b01 :((opcode==LUI)|| (opcode==AUIPC))? 2'b11:((opcode==JAL)||(opcode==JALR))?2'b10:2'b00 ;//00readdataw,01aluresult,10jump,11,upperimmediate;
  assign immsrc     =(opcode==Immediate_ALU || opcode==Loads || opcode==JALR) ? I :(opcode==Stores) ? S :(opcode==Branches)  ? B :(opcode==LUI || opcode==AUIPC)? U :(opcode==JAL)? J : I;   // default
  assign jump       =(opcode == JAL)  ? 2'b01 :(opcode == JALR) ? 2'b10 : 2'b00;
  endmodule