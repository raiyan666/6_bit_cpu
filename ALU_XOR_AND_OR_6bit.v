module ALU_XOR_AND_OR_6bit(
    input wire [5:0]A,   //6 bit input A
    input wire [5:0]B,   //6 bit input B
    output wire [5:0]result//6 bit result
);
    assign result= (A^B) & (A|B);
endmodule