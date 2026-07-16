module buffer_wb(clk,regwM,res_srcM,pcplus4M,RdM,aluresultM,UI_writeM,readdataM,regwW,res_srcW,pcplus4W,RdW,aluresultW,UI_writeW,readdataW);
  
  input 			clk;
  
  input 			regwM;
  input 	[1:0]	res_srcM;
 // input 	[2:0]	func3M;
  input		[31:0]	pcplus4M,aluresultM,UI_writeM;
  input 	[4:0]	RdM;
  input		[31:0]	readdataM;
  //input 	[6:0]	opcodeM;
  
  output	reg			regwW;
  output	reg [1:0]	res_srcW;
  //output	reg [2:0]	func3W;
  output 	reg [4:0]	RdW;
  output	reg [31:0]	pcplus4W,aluresultW,UI_writeW;
  output	reg [31:0]	readdataW;
  //output 	reg [6:0]	opcodeW;
  
  
   always @(posedge clk)
    begin           
          pcplus4W<=pcplus4M;          
          RdW<=RdM;
          res_srcW<=res_srcM;                    
          regwW<= regwM;                   
          aluresultW<=aluresultM;
          UI_writeW<=UI_writeM;
      	  //func3W<=func3M;
      	  readdataW<=readdataM;
		  //opcodeW<=opcodeM;
    end
endmodule