module UI_select_mux(immxE,pcplus_imm,UI_writeE,op5E);
  input [31:0] immxE,pcplus_imm;
  input 	   op5E;
  output [31:0]UI_writeE;
  
  assign UI_writeE=(op5E==1)?immxE:pcplus_imm;
  
endmodule