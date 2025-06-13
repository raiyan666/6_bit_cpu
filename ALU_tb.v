`timescale 1ns / 1ps

module ALU_tb;

   // Signals for ALU
   reg [5:0] A, B;             // ALU inputs
   reg OP;                     // ALU operation code (1-bit)
   wire [5:0] R;               // ALU output
   wire CF;                    // Carry flag
   wire SF;                    // Sign flag
   wire ZF;                    // Zero flag

   // Instantiate ALU module
   ALU uut (
       .A(A),
       .B(B),
       .OP(OP),
       .R(R),
       .CF(CF),
       .SF(SF),
       .ZF(ZF)
   );

   // Dump file setup and test procedure
   initial begin
       $dumpfile("alu_test.vcd"); // Output VCD file
       $dumpvars(0, ALU_tb);    // Dump all variables in the testbench

       // Initialize inputs
       A = 6'b000000;
       B = 6'b000000;
       OP = 1'b0;

       // Test XANDOR operation (OP = 0)
       $display("\nTesting XOR AND OR Operation ((A XOR B) AND (A OR B)):");
       A = 6'b101010; B = 6'b010101; OP = 1'b0; // Test case 1
       #10 $display("XOR AND OR: A=%b, B=%b, R=%b, SF=%b, ZF=%b", A, B, R, SF, ZF);

       // Test SHR operation (OP = 1)
       $display("\nTesting SHR Operation (Right Shift):");
       A = 6'b101011; B = 3'b001; OP = 1'b1; // Shift by 1
       #10 $display("SHR by 1: A=%b, shift=%d, R=%b, SF=%b, ZF=%b", A, B[2:0], R, SF, ZF);

       // Finish simulation
       #10 $finish;
   end

endmodule
