module controller(
    input wire clk,reset,
    output reg [5:0]A,B,
    output reg [1:0] OP
);
reg [2:0]pstate,nstate;
parameter[2:0]START= 3'b000,
                ONE= 3'b001,
                TWO= 3'b010,
                THREE=3'b011,
                FINISH=3'b100;
//state Register
always @(posedge clk or posedge reset)
begin
    if(reset)
        pstate <= START;
    else 
        pstate <= nstate;
end
//Next state and Outputs
always @(*) begin
    case (pstate)
        START:  nstate = ONE;
        ONE:    nstate = TWO;
        TWO:    nstate = THREE;
        THREE:  nstate = FINISH;
        FINISH: nstate = FINISH;
        default: nstate = START;
    endcase
end
// Output logic
    always @(*) begin
        case (pstate)
            ONE: begin
                A = 6'b101010; // Example values
                B = 6'b010101;
                OP = 2'b00;    // e.g., addition
            end
            TWO: begin
                A = 6'b111100;
                B = 6'b000011;
                OP = 2'b01;    // e.g., subtraction
            end
            THREE: begin
                A = 6'b000000; // This will make ALU output zero
                B = 6'b000000;
                OP = 2'b00;    // e.g., addition
            end
            default: begin
                A = 6'b000000;
                B = 6'b000000;
                OP = 2'b00;
            end
        endcase
    end
endmodule

