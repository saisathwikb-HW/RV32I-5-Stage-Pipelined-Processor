module buffer_decode(
    input clk,
    input flushD,
    input StallD,

    input [31:0] instF,
    input [31:0] pcF,
    input [31:0] pcplus4F,

    output reg [31:0] instD,
    output reg [31:0] pcD,
    output reg [31:0] pcplus4D
);

always @(posedge clk) begin
    if (flushD) begin
        instD    <= 32'd0;
        pcD      <= 32'd0;
        pcplus4D <= 32'd0;
    end
    else if (StallD) 
	begin
        instD    <= instD;
        pcD      <= pcD;
        pcplus4D <= pcplus4D;
    end
    else begin
    instD    <= instF;
        pcD      <= pcF;
        pcplus4D <= pcplus4F;
        end
end

endmodule