module pc_imm_adder(pcE,immxE,pcplus_imm);
  input [31:0]pcE,immxE;
  output [31:0]pcplus_imm;
  
  assign pcplus_imm=pcE+immxE;
endmodule
