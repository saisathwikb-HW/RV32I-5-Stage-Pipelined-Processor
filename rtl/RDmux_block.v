module RDmuxs(Rd1E,Rd2E,forwardAE,forwardBE,srcA,srcB,aluresultM,resultW,alusrcE,immxE,writedataE);
  input [31:0]Rd1E,Rd2E,aluresultM,resultW,immxE;
  input alusrcE;
  input [1:0]forwardAE,forwardBE;
  output [31:0]srcA,srcB,writedataE;
  
  
  assign srcA=(forwardAE==2'b01)?resultW:(forwardAE==2'b10)?aluresultM:Rd1E;
  
  assign writedataE=(forwardBE==2'b01)?resultW:(forwardBE==2'b10)?aluresultM:Rd2E;
  
  assign srcB=(alusrcE==0)?writedataE:immxE;
  
endmodule