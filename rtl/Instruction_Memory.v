module instrmem(pc_in,instr_d);
  
  input  [31:0]pc_in;
  output [31:0]instr_d;
  reg [31:0]instrmem[1023:0];
      
assign instr_d = instrmem[pc_in[11:2]];
 
 integer i;

initial begin
    for(i = 0; i < 1024; i = i + 1)
        instrmem[i] = 32'h00000013;   // NOP

    $readmemh("memfile.hex", instrmem);
end
  
endmodule
      