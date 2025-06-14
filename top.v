module top
(
    input wire clk,reset,
    output wi [5:0]result,
    output wire flag_zero
);

wire [5:0]A,B;
wire [1:0] OP;
wire [5:0] R_result;

controller controller1(
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .OP(OP)
);

ALU datapath1(
    .A(A),
    .B(B),
    .OP(OP),
    .result(R_result),
    .ZF(R_ZF)
);
assign result=R_result;
assign flag_zero=~R_ZF;

endmodule

module controller(
    input wire clk,reset,
    output reg [5:0]A,B,
    output reg [1:0] OP
);