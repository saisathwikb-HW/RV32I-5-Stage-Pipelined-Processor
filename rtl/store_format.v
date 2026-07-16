module store_format(fun3,opcode,byte_enable);
  input 	[2:0]		fun3;
  input 	[6:0]		opcode;
  output reg[3:0]	byte_enable;
  
  
  always @(*)
    begin
      if(opcode==7'b0100011)
        begin 
          case(fun3)
            3'b000:byte_enable = 4'b0001;
              
            3'b001:byte_enable = 4'b0011;
              
            3'b010:byte_enable = 4'b1111;
            
            default:byte_enable = 4'b1111;
          endcase
        end
      else 
        begin
        byte_enable = 4'b1111;
        end
    end
endmodule

  
      
              
            