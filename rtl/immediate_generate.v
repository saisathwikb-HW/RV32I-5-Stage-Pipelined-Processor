

module imm_gen(imm_src,in,imm_ext);
  input 			[31:0]	in;
  input 			[2:0]	imm_src;
  output	 reg 	[31:0]	imm_ext;
  
  localparam I 				=	3'b 000;
  localparam S 				=	3'b 001;
  localparam B 				=	3'b 010;
  localparam U 				=	3'b 011;
  localparam J 				=	3'b 100;
  
  
  always@(*)
    begin
      case(imm_src)
       I: imm_ext = {{20{in[31]}}, in[31:20]};

	   S: imm_ext = {{20{in[31]}}, in[31:25], in[11:7]};

   	   B: imm_ext = {{19{in[31]}},in[31],in[7],in[30:25],in[11:8],1'b0};

	   U: imm_ext = {in[31:12], 12'b0};

	   J: imm_ext = {{11{in[31]}},in[31],in[19:12],in[20],in[30:21],1'b0};

 default: imm_ext = 32'b0;
          
        endcase
      
    end
  endmodule
  