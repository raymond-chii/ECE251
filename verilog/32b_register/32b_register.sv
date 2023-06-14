///////////////////////////////////////////////////////////////////////////////
//
// 32 bit register module
//
// An 32 bit register module for your Computer Architecture Elements Catalog
//
// module: 32 bit register
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps

module dFlipFlop (input D, clk, R, output Q, Qn);
    wire clkN, S, R2, R3, Dn, Q1, Qn1;

    not (clkN, clk);
    nor (Q1, R3, Qn1);
    nor (Qn1, Q1, S);
    or (R3, R, R2);
    and (R2, clkN, Dn);
    and (S, clk, D);
    not (Dn, D);
    nor (Q, R, Qn);
    nor (Qn, Q, S);
endmodule

module thirtyTwoBitRegister (input [31:0] D, input clk, input R, output [31:0] Q, output [31:0] Qn);
    wire [7:0] D0, D1, D2, D3;
    wire [7:0] Q0, Q1, Q2, Q3;
    wire [7:0] Qn0, Qn1, Qn2, Qn3;

    dFlipFlop d0 (.D(D[0]),.clk(clk),.R(R),.Q(Q0[0]),.Qn(Qn0[0]));
    dFlipFlop d1 (.D(D[1]),.clk(clk),.R(R),.Q(Q0[1]),.Qn(Qn0[1]));
    dFlipFlop d2 (.D(D[2]),.clk(clk),.R(R),.Q(Q0[2]),.Qn(Qn0[2]));
    dFlipFlop d3 (.D(D[3]),.clk(clk),.R(R),.Q(Q0[3]),.Qn(Qn0[3]));
    dFlipFlop d4 (.D(D[4]),.clk(clk),.R(R),.Q(Q0[4]),.Qn(Qn0[4]));
    dFlipFlop d5 (.D(D[5]),.clk(clk),.R(R),.Q(Q0[5]),.Qn(Qn0[5]));
    dFlipFlop d6 (.D(D[6]),.clk(clk),.R(R),.Q(Q0[6]),.Qn(Qn0[6]));
    dFlipFlop d7 (.D(D[7]),.clk(clk),.R(R),.Q(Q0[7]),.Qn(Qn0[7]));

    dFlipFlop d8 (.D(Q0[0]),.clk(clk),.R(R),.Q(Q1[0]),.Qn(Qn1[0]));
    dFlipFlop d9 (.D(Q0[1]),.clk(clk),.R(R),.Q(Q1[1]),.Qn(Qn1[1]));
    dFlipFlop d10 (.D(Q0[2]),.clk(clk),.R(R),.Q(Q1[2]),.Qn(Qn1[2]));
    dFlipFlop d11 (.D(Q0[3]),.clk(clk),.R(R),.Q(Q1[3]),.Qn(Qn1[3]));
    dFlipFlop d12 (.D(Q0[4]),.clk(clk),.R(R),.Q(Q1[4]),.Qn(Qn1[4]));
    dFlipFlop d13 (.D(Q0[5]),.clk(clk),.R(R),.Q(Q1[5]),.Qn(Qn1[5]));
    dFlipFlop d14 (.D(Q0[6]),.clk(clk),.R(R),.Q(Q1[6]),.Qn(Qn1[6]));
    dFlipFlop d15 (.D(Q0[7]),.clk(clk),.R(R),.Q(Q1[7]),.Qn(Qn1[7]));

    dFlipFlop d16 (.D(Q1[0]),.clk(clk),.R(R),.Q(Q2[0]),.Qn(Qn2[0]));
    dFlipFlop d17 (.D(Q1[1]),.clk(clk),.R(R),.Q(Q2[1]),.Qn(Qn2[1]));
    dFlipFlop d18 (.D(Q1[2]),.clk(clk),.R(R),.Q(Q2[2]),.Qn(Qn2[2]));
    dFlipFlop d19 (.D(Q1[3]),.clk(clk),.R(R),.Q(Q2[3]),.Qn(Qn2[3]));
    dFlipFlop d20 (.D(Q1[4]),.clk(clk),.R(R),.Q(Q2[4]),.Qn(Qn2[4]));
    dFlipFlop d21 (.D(Q1[5]),.clk(clk),.R(R),.Q(Q2[5]),.Qn(Qn2[5]));
    dFlipFlop d22 (.D(Q1[6]),.clk(clk),.R(R),.Q(Q2[6]),.Qn(Qn2[6]));
    dFlipFlop d23 (.D(Q1[7]),.clk(clk),.R(R),.Q(Q2[7]),.Qn(Qn2[7]));

    dFlipFlop d24 (.D(Q2[0]),.clk(clk),.R(R),.Q(Q3[0]),.Qn(Qn3[0]));
    dFlipFlop d25 (.D(Q2[1]),.clk(clk),.R(R),.Q(Q3[1]),.Qn(Qn3[1]));
    dFlipFlop d26 (.D(Q2[2]),.clk(clk),.R(R),.Q(Q3[2]),.Qn(Qn3[2]));
    dFlipFlop d27 (.D(Q2[3]),.clk(clk),.R(R),.Q(Q3[3]),.Qn(Qn3[3]));
    dFlipFlop d28 (.D(Q2[4]),.clk(clk),.R(R),.Q(Q3[4]),.Qn(Qn3[4]));
    dFlipFlop d29 (.D(Q2[5]),.clk(clk),.R(R),.Q(Q3[5]),.Qn(Qn3[5]));
    dFlipFlop d30 (.D(Q2[6]),.clk(clk),.R(R),.Q(Q3[6]),.Qn(Qn3[6]));
    dFlipFlop d31 (.D(Q2[7]),.clk(clk),.R(R),.Q(Q3[7]),.Qn(Qn3[7]));

    assign D0 = D[7:0];
    assign D1 = D[15:8];
    assign D2 = D[23:16];
    assign D3 = D[31:24];

    assign Q = {Q3, Q2, Q1, Q0};
    assign Qn = {Qn3, Qn2, Qn1, Qn0};
endmodule