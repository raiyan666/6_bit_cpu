module ALU (
    input wire [5:0] A, B,           // 6-bit inputs A and B
    input wire OP,                   // 1-bit operation code
    output reg [5:0] R,              // 6-bit result
    output wire CF,                  // Carry flag
    output wire SF,                  // Sign flag
    output wire ZF                   // Zero flag
);

    wire [5:0] R_XANDOR;             // Result from XANDOR module
    wire [5:0] R_SHR;                // Result from SHR module

    // Instantiate modules
    ALU_XOR_AND_OR_6bit XANDOR1 (
        .A(A),
        .B(B),
        .result(R_XANDOR)
    );

    ALU_SHR_6bit SHR1 (
        .in(A),
        .shift(B[2:0]),
        .out(R_SHR)
    );

    // Operation selection
    always @(*) begin
        case (OP)
            1'b0: begin
                R = R_XANDOR; // XANDOR
            end
            1'b1: begin
                R = R_SHR;    // SHR
            end
            default: begin
                R = 6'b000000; // Default case
            end
        endcase
    end

    // Flag assignments
    assign CF = 1'b0;                    // No carry for XANDOR or SHR
    assign SF = R[5];                    // Sign flag: MSB of result
    assign ZF = ~(R[5] | R[4] | R[3] | R[2] | R[1] | R[0]); // Zero flag: NOR of result bits

endmodule


