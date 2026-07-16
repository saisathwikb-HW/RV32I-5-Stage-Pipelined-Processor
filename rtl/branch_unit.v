module branch_unit(branchE,func3, Carry,OverFlow,Zero,Sign,Branchtaken);
  input branchE,Carry,OverFlow,Zero,Sign;
  input [2:0]func3;
  
  output Branchtaken; 
  
  
  reg BranchCond; 
        localparam BEQ  = 3'b000;
		localparam BNE  = 3'b001;
		localparam BLT  = 3'b100;
		localparam BGE  = 3'b101;
		localparam BLTU = 3'b110;
		localparam BGEU = 3'b111;
		
  

  
  always @(*) begin
    case(func3)

        BEQ : BranchCond = Zero;
        BNE : BranchCond = ~Zero;
        BLT : BranchCond = Sign ^ OverFlow;
        BGE : BranchCond = ~(Sign ^ OverFlow);
        BLTU: BranchCond = Carry;
        BGEU: BranchCond = ~Carry;

        default: BranchCond = 1'b0;

    endcase
end
  
	assign Branchtaken = branchE&&BranchCond;
  
endmodule