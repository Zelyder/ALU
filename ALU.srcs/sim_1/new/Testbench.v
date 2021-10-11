`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2021 20:16:02
// Design Name: 
// Module Name: Testbench
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


module Testbench();
    wire Flag;

    wire [31:0] Result;
    reg [31:0] A,B;
    reg [4:0] ALUop;

    ALU dut (
        .ALUOp(ALUop),
        .A(A),
        .B(B),
        .Result(Result),
        .Flag(Flag)
    );

    initial begin
        add_op(4'b0111 ,4'b1000);
        sub_op(4'b0111 ,4'b1000);
        sll_op(4'b0111 ,4'b0001);
        slt_op($signed(4'b0111), $signed(4'b1000));
        sltu_op(4'b0111, 4'b1000);
        xor_op(4'b0111, 4'b1000);
        srl_op(5'b01100, 4'b0011);
        sra_op($signed(5'b01100), $signed(4'b0011));
        or_op($signed(5'b01100), $signed(4'b0111));
        and_op($signed(5'b01100), $signed(4'b0111));
        beq_op(0,1);
        bnq_op(0,1);
        blt_op($signed(4'b1001), $signed(4'b0010));
        bge_op($signed(4'b1001), $signed(4'b0010));
        bltu_op(4'b0111, 4'b0011);
        bgeu_op(4'b0111, 4'b0011);
        $stop;
    end

    task add_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `ADD;
            $display ("Test ADD");
            #100;
            if (Result == (A + B) )
                $display("good %d + %d = %d", A, B, Result);
            else
                $display("bad %d + %d != %d", A, B, Result);
        end
    endtask
    
    task sub_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `SUB;
            $display ("Test SUB");
            #100;
            if (Result == (A - B) )
                $display("good %d - %d = %d", A, B, $signed(Result));
            else
                $display("bad %d - %d != %d", A, B, $signed(Result));
        end
    endtask
    
    task sll_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `SLL;
            $display ("Test SLL");
            #100;
            if (Result == (A << B) )
                $display("good %d << %d = %d", A, B, Result);
            else
                $display("bad %d << %d != %d", A, B, Result);
        end
    endtask

    task slt_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `SLT;
            $display ("Test SLT");
            #100;
            if ( Result == ($signed(A) < $signed(B)))
                $display ("good %d < %d = %d", $signed(A), $signed(B), $signed(Result));
            else
                $display("bad %d < %d != %d", $signed(A), $signed(B), $signed(Result));
        end
    endtask
    
    task sltu_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `SLTU;
            $display ("Test SLTU");
            #100;
            if ( Result == (A < B))
                $display ("good %d < %d = %d", A, B, Result);
            else
                $display("bad %d < %d != %d", A, B, Result);
        end
    endtask
    
    task xor_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `XOR;
            $display ("Test XOR");
            #100;
            if ( Result == (A ^ B))
                $display ("good %d ^ %d = %d", A, B, Result);
            else
                $display("bad %d ^ %d != %d", A, B, Result);
        end
    endtask
    
    task srl_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `SRL;
            $display ("Test SRL");
            #100;
            if ( Result == (A >> B))
                $display ("good %d >> %d = %d", A, B, Result);
            else
                $display("bad %d >> %d != %d", A, B, Result);
        end
    endtask

    task sra_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B= b_op;
            ALUop = `SRA;
            $display ("Test SRA");
            #100;
            if (Result == ( $signed(A) >>> $signed(B) ) )
                $display("good %d >>> %d = %d ", $signed(A), $signed(B), $signed(Result));
            else
                $display("bad %d >>> %d != %d", $signed(A), $signed(B), $signed(Result) );
        end
    endtask
    
    task or_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `OR;
            $display ("Test OR");
            #100;
            if ( Result == (A | B))
                $display ("good %d or %d = %d", A, B, Result);
            else
                $display("bad %d or %d != %d", A, B, Result);
        end
    endtask
    
    task and_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `AND;
            $display ("Test AND");
            #100;
            if ( Result == (A & B))
                $display ("good %d and %d = %d", A, B, Result);
            else
                $display("bad %d and %d != %d", A, B, Result);
        end
    endtask

    task beq_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `BEQ;
            $display ("Test BEQ");
            #100;
            if (Result == (A == B) )
                $display("good %d == %d = %d", A, B, Result);
            else
                $display("bad %d == %d != %d", A, B, Result);
        end
    endtask
    
    task bnq_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `BNQ;
            $display ("Test BNQ");
            #100;
            if (Result == (A != B) )
                $display("good %d != %d = %d", A, B, Result);
            else
                $display("bad %d != %d != %d", A, B, Result);
        end
    endtask

    task blt_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `BLT;
            $display ("Test BLT");
            #100;
            if ( Result == ($signed(A) < $signed(B)))
                $display("good %d < %d = %d", $signed(A), $signed(B), $signed(Result) );
            else
                $display("bad %d < %d != %d", $signed(A), $signed(B), $signed(Result) );
        end
    endtask
    
    task bge_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `BGE;
            $display ("Test BGE");
            #100;
            if ( Result == ($signed(A) >= $signed(B)))
                $display("good %d >= %d = %d", $signed(A), $signed(B), $signed(Result) );
            else
                $display("bad %d >= %d = != %d", $signed(A), $signed(B), $signed(Result) );
        end
    endtask

    task bltu_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `BLTU;
            $display ("Test BLTU");
            #100;
            if ( Result == (A < B))
                $display("good %d < %d = %d", A, B, Result);
            else
                $display("bad %d !< %d != %d", A, B, Result);
        end
    endtask
    
    task bgeu_op;
        input [31:0] a_op, b_op;
        begin
            A = a_op;
            B = b_op;
            ALUop = `BGEU;
            $display ("Test BGEU");
            #100;
            if ( Result == (A >= B))
                $display("good %d >= %d = %d", A, B, Result);
            else
                $display("bad %d >= %d != %d", A, B, Result);
        end
    endtask

endmodule
