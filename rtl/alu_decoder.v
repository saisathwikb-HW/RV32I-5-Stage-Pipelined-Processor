

module alu_dec(ALUOp,funct3,funct7,op,ALUControl);
    input 	[1:0]	ALUOp;
    input 	[2:0]	funct3;
    input 	[6:0]	funct7,op;
    output 	[3:0]	ALUControl;

   //ALU OP
	   localparam ADD = 4'b0000;
	   localparam SUB = 4'b0001;
	   localparam AND = 4'b0010;
	   localparam OR = 4'b0011;
	   localparam XOR = 4'b0100;
	   localparam SLL = 4'b0101;
	   localparam SRL = 4'b0110;
	   localparam SRA =4'b0111;
	   localparam SLT= 4'b1000;
	   localparam SLTU=4'b1001;
  
		
 
     assign ALUControl = 	(ALUOp == 2'b00) ? ADD : (ALUOp == 2'b01) ? SUB
						  : ((ALUOp == 2'b10) && (funct3 == 3'b000) && ({op[5],funct7[5]} == 2'b11)) ? SUB
						  : ((ALUOp == 2'b10) && (funct3 == 3'b000) && ({op[5],funct7[5]} != 2'b11)) ? ADD 
						  : ((ALUOp == 2'b10) && (funct3 == 3'b010)) ? SLT 
						  : ((ALUOp == 2'b10) && (funct3 == 3'b110)) ? OR 
						  : ((ALUOp == 2'b10) && (funct3 == 3'b111)) ? AND 
						  : ((ALUOp == 2'b10) && (funct3 == 3'b001)) ? SLL
						  : ((ALUOp == 2'b10) && (funct3 == 3'b011)) ? SLTU
						  : ((ALUOp == 2'b10) && (funct3 == 3'b100)) ? XOR
						  : ((ALUOp == 2'b10) && (funct3 == 3'b101)) &&(funct7[5] == 1'b1) ? SRA
						  : ((ALUOp == 2'b10) && (funct3 == 3'b101)) &&(funct7[5] == 1'b0) ? SRL
						  :	  ADD;
endmodule
      
		