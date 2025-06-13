module ALU_SHR_6bit (
   input wire [5:0] in,      // 6-bit input
   input wire [2:0] shift,   // 3-bit input shift
   output reg [5:0] out // 6-bit output
);

   always @(*) begin
      case (shift)
         3'b000: out = in;                    // No shift
         3'b001: out = {1'b0, in[5:1]};      // Right shift by 1 bit
         3'b010: out = {2'b00, in[5:2]};     // Right shift by 2 bits
         3'b011: out = {3'b000, in[5:3]};    // Right shift by 3 bits
         3'b100: out = {4'b0000, in[5:4]};   // Right shift by 4 bits
         3'b101: out = {5'b00000, in[5]};    // Right shift by 5 bits
         3'b110: out = 6'b000000;            // Right shift by 6 bits (all zeros)
         3'b111: out = 6'b000000;            // Right shift by 7 bits (all zeros)
      endcase
   end

endmodule

