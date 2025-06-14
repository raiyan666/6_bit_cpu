`timescale 1ns/1ns
module controller_tb;
reg clk, reset;
wire [5:0] A, B;
wire OP;

controller uut(
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

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("Controller_test.vcd");
    $dumpvars(0, controller_tb);
    reset = 1;
    #10;
    reset = 0;
    #100;
    $finish;
end

endmodule