module buffer_ex(clk,flushE,immxD,immxE,pcD,pcE,pcplus4D,pcplus4E,jumpD,res_srcD,regwD,memwD,alu_srcD,jumpE,res_srcE,regwE,
				
				memwE,alu_srcE,Rd1D,Rd2D,Rd1E,Rd2E,Rs1D,Rs2D,Rs1E,Rs2E,RdD,RdE,alucontrolD,alucontrolE,func3D,func3E,op5D,op5E,branchD,branchE,opcodeD,opcodeE);
  
  
  input				clk,flushE,op5D;
  
  input 	[31:0]	pcplus4D,pcD,immxD,Rd1D,Rd2D;
  input		[4:0]	Rs1D,Rs2D,RdD;  
  
  input		[1:0]	jumpD,res_srcD;
  input  			regwD,memwD,alu_srcD,branchD;
  input 	[2:0]	func3D;
  input 	[6:0]	opcodeD;
  input 	[3:0]	alucontrolD;
  
  output 	reg [31:0]	pcplus4E,pcE,immxE,Rd1E,Rd2E;
  output	reg	[4:0]	Rs1E,Rs2E,RdE;  
  
  output	reg [1:0]	jumpE,res_srcE;
  output  	reg 		regwE,memwE,alu_srcE,op5E,branchE;
  output 	reg [2:0]	func3E;
  output	reg	[6:0]	opcodeE;
  output	reg [3:0]	alucontrolE;	
  	
  always @(posedge clk)
    begin 
      if(flushE==1)
        begin 
          jumpE <= 2'b00;
          res_srcE <= 2'b00;                    
          regwE<=1'b0;
          memwE<=1'b0;
		  branchE<=1'b0;
          func3E<=3'b000;
          op5E<=1'b0;
		  alu_srcE <= 1'b0;//not needed
		  alucontrolE <= 4'b0000;//not needed 
        end
      else
	  begin
          immxE<=immxD;
          pcE<=pcD;
          pcplus4E<=pcplus4D;
          Rd1E<=Rd1D;
          Rd2E<=Rd2D;
          Rs1E<=Rs1D;
          Rs2E<=Rs2D;
          RdE<=RdD;
          jumpE<=jumpD;
          res_srcE<=res_srcD;          
          branchE<=branchD;
          regwE<= regwD;
          memwE<= memwD;
          alu_srcE<= alu_srcD;  
      	  alucontrolE<=alucontrolD;
      	  func3E<=func3D;
          op5E<=op5D; 
		  opcodeE<=opcodeD;
		  end
    end
endmodule