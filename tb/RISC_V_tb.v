`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 22:43:36
// Design Name: 
// Module Name: RISC_V_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module RISC_V_tb;

reg clk;
reg rst;

//--------------------------------------------------
// Debug Signals
//--------------------------------------------------
wire [31:0] pcF;
wire [31:0] instD;
wire [31:0] aluresultE;
wire [31:0] resultW;

//--------------------------------------------------
// DUT
//--------------------------------------------------

risc_top risc_dut
(
    .clk(clk),
    .rst(rst),
    .pcF(pcF),
    .instD(instD),
    .aluresultE(aluresultE),
    .resultW(resultW)
);

//--------------------------------------------------
// Clock Generation (100MHz)
//--------------------------------------------------

initial
    clk = 0;

always
    #5 clk = ~clk;

//--------------------------------------------------
// Reset
//--------------------------------------------------

initial
begin

    rst = 1;          // Active High Reset
    #20;
    rst = 0;

end

//--------------------------------------------------
// Cycle Counter
//--------------------------------------------------

integer cycle;

initial
    cycle = 0;

always @(posedge clk)
begin
    cycle = cycle + 1;
end

//--------------------------------------------------
// Simulation Timeout
//--------------------------------------------------

initial
begin

    repeat(100)
        @(posedge clk);

    $display("---------------------------------------");
    $display("Simulation Timeout");
    $display("---------------------------------------");

    $finish;

end

//--------------------------------------------------
// Simulation Start
//--------------------------------------------------

initial
begin

    $display("---------------------------------------");
    $display("RISC-V Processor Simulation Started");
    $display("---------------------------------------");

end

//--------------------------------------------------
// Pipeline Monitor
//--------------------------------------------------

always @(posedge clk)
begin

$display(
"Cycle=%0d  PC=%h  INST=%h  ALU=%h  RESULT=%h",
cycle,
pcF,
instD,
aluresultE,
resultW
);

end

//--------------------------------------------------
// Register Dump
//--------------------------------------------------

task dump_registers;

integer i;

begin

$display("\n========== Register File ==========");

for(i=0;i<32;i=i+1)
begin

$display("x%0d = %h",
i,
risc_dut.reg_f.regs[i]);

end

$display("===================================\n");

end

endtask

//--------------------------------------------------
// Register Checker
//--------------------------------------------------

task check_reg;

input [4:0] reg_no;
input [31:0] expected;

begin

if(risc_dut.reg_f.regs[reg_no] == expected)

$display(
"PASS : x%0d = %h",
reg_no,
expected);

else

begin

$display(
"FAIL : x%0d Expected=%h Got=%h",
reg_no,
expected,
risc_dut.reg_f.regs[reg_no]);

end

end

endtask

//--------------------------------------------------
// Example Verification
//--------------------------------------------------

initial
begin

//--------------------------------------------------
// Wait until program executes
//--------------------------------------------------

repeat(50)
@(posedge clk);

//--------------------------------------------------
// Display Register File
//--------------------------------------------------

dump_registers();

//--------------------------------------------------
// Example Checks
//--------------------------------------------------

check_reg(5,32'd25);

// Add more as you test instructions

//--------------------------------------------------

$display("---------------------------------------");
$display("Verification Completed");
$display("---------------------------------------");

$finish;

end

endmodule