module mux_wb(aluresultW,readdataW,pcplus4W,UI_writeW,resultW,result_srcW);
  input 	[1:0]	result_srcW;
  input 	[31:0] 	aluresultW,readdataW,pcplus4W,UI_writeW;
  output	[31:0]	resultW;
  
  
  assign resultW = (result_srcW==2'b00)?aluresultW:(result_srcW==2'b01)?readdataW:(result_srcW==2'b10)?pcplus4W:UI_writeW;
  
endmodule
