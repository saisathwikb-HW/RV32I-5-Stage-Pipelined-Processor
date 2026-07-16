module Data_Memory(clk,WE,WD,A,RD,ByteEnable);

    input clk,WE;
    input[3:0]ByteEnable;
    input [31:0]A,WD;
    output [31:0]RD;
    
  reg [31:0] mem [0:1023];
  wire [9:0] addr = A[11:2];

    always @ (posedge clk)
    begin
   
    
    
    if (WE) begin
    if (ByteEnable[0]) mem[addr][7:0]   <= WD[7:0];
    if (ByteEnable[1]) mem[addr][15:8]  <= WD[15:8];
    if (ByteEnable[2]) mem[addr][23:16] <= WD[23:16];
    if (ByteEnable[3]) mem[addr][31:24] <= WD[31:24];
end
    end
    
   assign  RD = mem[addr];

  integer i;

initial begin
    for(i = 0; i < 1024; i = i + 1)
        mem[i] = 32'h00000000;
end
  
endmodule