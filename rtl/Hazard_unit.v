module hazard_unit(Rs1E,Rs2E,RdM,RdW,regwM,regwW,forwardAE,forwardBE,flushE,flushD,pcsrc,Rs1D,Rs2D,RdE,ResultSrcE,StallF,StallD);
      input [4:0] Rs1E,Rs2E,RdM,RdW;
      input [1:0] pcsrc;
      input regwW,regwM;
  
      input [4:0] Rs1D;
      input [4:0] Rs2D;

      input [4:0] RdE;

      input [1:0] ResultSrcE;

      output [1:0]forwardAE,forwardBE;
      output flushE,flushD,StallF,StallD;
  
  	  wire PCRedirect;
  	  wire LoadE;
  
  

  assign LoadE = (ResultSrcE == 2'b01);
  
  wire LoadUseHazard;

  assign LoadUseHazard =LoadE && (RdE != 5'd0)&&(((RdE == Rs1D) && (Rs1D != 5'd0))||((RdE == Rs2D) && (Rs2D != 5'd0)));
  
  assign PCRedirect = (pcsrc != 2'b00);
  assign forwardAE =
    ((regwM) && (RdM != 5'd0) && (RdM == Rs1E)) ? 2'b10 :
    ((regwW) && (RdW != 5'd0) && (RdW == Rs1E)) ? 2'b01 :
                                                  2'b00;

  assign forwardBE =
    ((regwM) && (RdM != 5'd0) && (RdM == Rs2E)) ? 2'b10 :
    ((regwW) && (RdW != 5'd0) && (RdW == Rs2E)) ? 2'b01 :
                                                  2'b00;

  assign StallF = LoadUseHazard;
  
  assign StallD = LoadUseHazard;

  assign flushE = PCRedirect || LoadUseHazard;

  assign flushD = PCRedirect;
  
  
  
endmodule

 
  
  
  