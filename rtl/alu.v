module ALU(A,B,Result,ALUControl,Carry,OverFlow,Zero,Sign);

  input [31:0]A,B;
    input [3:0]ALUControl;
   
    output reg [31:0]Result;

    output Carry,OverFlow,Zero,Sign;
    		
		
	   localparam ADD = 4'b0000;
	   localparam SUB = 4'b0001;
  
	   localparam AND = 4'b0010;
	   localparam OR = 4'b0011;
	   localparam XOR = 4'b0100;
  
	   localparam SLL = 4'b0101;
	   localparam SRL = 4'b0110;
	   localparam SRA =4'b0111;
	   localparam SLT= 4'b1000;
	   localparam SLTU=4'b1001;
  
      
		

wire [32:0] add_res = {1'b0,A} + {1'b0,B};
wire [32:0] sub_res = {1'b0,A} - {1'b0,B};

assign Carry =
    (ALUControl == ADD) ? add_res[32] :
    (ALUControl == SUB) ? sub_res[32] :
                          1'b0;


assign Zero     = ~|Result;
assign Sign     = Result[31];
assign OverFlow =(ALUControl==SUB)? ((A[31] ^ B[31]) &(A[31] ^ Result[31])):1'b0;


always @(*) begin

    case(ALUControl)

    ADD: Result = A + B;

    SUB: Result = A - B;

    AND:Result = A & B;

    OR: Result = A | B;      

    XOR:Result = A ^ B;
      
    SLL:Result = A << B[4:0];

    SRL:Result = A >> B[4:0];

    SRA: Result = $signed(A) >>> B[4:0];

    SLT: Result =($signed(A)<$signed(B))?(32'd1):(32'd0);

    SLTU:Result = (A < B) ? 32'd1 : 32'd0;
      
	
		
	default:
		Result = 32'b0;

    endcase

end	
endmodule