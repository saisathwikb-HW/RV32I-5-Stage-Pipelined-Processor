module pc_select_mux(pc_src,pc_imm,pc_plus4,pc_aluresult,pc_in);
  input [1:0]pc_src;
  input [31:0] pc_imm,pc_plus4,pc_aluresult;
  output [31:0]pc_in;
  
  
 assign  pc_in = (pc_src==2'b01)?pc_imm:(pc_src==2'b10)?pc_aluresult:pc_plus4;
  
endmodule
  