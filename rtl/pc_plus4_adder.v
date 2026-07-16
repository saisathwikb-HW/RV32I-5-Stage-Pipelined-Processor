module pc_plus4_adder(pc_in,pcplus4);
  input [31:0]pc_in;
  output [31:0]pcplus4;
  
  assign pcplus4=pc_in+4;
endmodule