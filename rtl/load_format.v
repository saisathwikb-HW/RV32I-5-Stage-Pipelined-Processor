module load_format(fun3,opcode,RD,rdataM);
  input 		[2:0]	fun3;
  input 		[6:0]	opcode;
  input 		[31:0]	RD;
  output 	reg	[31:0]	rdataM;
  
  
  
  always@(*)
    begin
      if(opcode==7'b0000011)
        begin 
          case(fun3)
            3'b000:rdataM = {{24{RD[7]}},RD[7:0]};
              
            3'b001:rdataM = {{16{RD[15]}},RD[15:0]};
              
            3'b010:rdataM = RD;
              
            3'b100:rdataM = {24'd0,RD[7:0]} ;
            
            3'b101:rdataM = {16'd0,RD[15:0]};
              
            default:rdataM = RD;
          endcase
        end
      else 
        begin
        rdataM = RD;
        end
    end
endmodule

  
      
              
            