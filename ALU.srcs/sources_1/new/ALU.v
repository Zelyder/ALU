`timescale 1ns / 1ps

`define ADD 5'b00000 //+
`define SUB 5'b01000 // -
`define SLL 5'b00001 //shift left logical (<<)
`define SLT 5'b00010 // set less than 
`define SLTU 5'b00011 // set less than unsigned
`define XOR 5'b00100 // xor
`define SRL 5'b00101 // shift right logical
`define SRA 5'b01101 // shift right arithmetic
`define OR 5'b00110 // or
`define AND 5'b00111 // and
`define BEQ 5'b11000 // branch if =
`define BNQ 5'b11001 // branch if !=
`define BLT 5'b11100 // branch if <
`define BGE 5'b11101 // branch if >=
`define BLTU 5'b11110 // branch if < unsigned
`define BGEU 5'b11111 // branch if >= unsigned

module ALU(
    input [4:0] ALUOp,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] Result,
    output reg Flag
);
    always @(*)
    case(ALUOp)
        `ADD: begin

            Result <= A + B;
            Flag <= 0;
        end

        `SUB: begin
            Result <= A + ~B + 1;
            Flag <= 0;
        end

        `SLL: begin
            Result <= A << B;
            Flag <= 0;
        end

        `SLT: begin
            Result <= $signed(A) < $signed(B);
            Flag <= 0;
        end

        `SLTU: begin
            Result <= A < B;
            Flag <= 0;
        end

        `XOR: begin
            Result <= A ^ B;
            Flag <= 0;
        end

        `SRL: begin
            Result <= A >> B;
            Flag <= 0;
        end

        `SRA: begin
            Result <= $signed(A) >>> $signed(B);
            Flag <= 0;
        end

        `OR: begin
            Result <= A | B;
            Flag <= 0;
        end

        `AND: begin
            Result <= A & B;
            Flag <= 0;
        end

        `BEQ: begin
            Result <= (A == B);
            Flag <= Result;
        end

        `BNQ: begin
            Result <= (A != B);
            Flag <= Result;

        end

        `BLT: begin
            Result <= ( $signed(A) < $signed(B) );
            Flag <= Result;
        end

        `BGE: begin
            Result <= ( $signed(A) >= $signed(B) );
            Flag <= Result;
        end

        `BLTU: begin
            Result <= ( A < B );
            Flag <= Result;
        end

        `BGEU: begin
            Result <= ( A >= B );
            Flag <= Result;
        end
    endcase
endmodule
