module pcsrc_logic(pcsrc,jumpE,branchtaken);
  input [1:0]jumpE;
  input branchtaken;
  output [1:0]pcsrc;
  
assign pcsrc = (branchtaken) ? 2'b01 : jumpE;
  
endmodule