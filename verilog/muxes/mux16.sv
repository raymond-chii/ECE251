`ifndef instruction_mem
`define instruction_mem

///////////////////////////////////////////////////////////////////////////////
//
// N bits 16 way muxs 
//
// This module is an N bits 16 way muxs 
//
// module: N bits 16 way muxs 
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`include "mux4.sv"

module NBitSixteenWayMux #(parameter N=1) (A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire [N-1:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15;
   
   wire [N-1:0] B0, B1, B2, B3;
   
   input wire [3:0] S;
   
   output wire [N-1:0] F;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   NBitFourWayMux #(.N(N)) mux1 (.A(A0), .B(A1), .C(A2), .D(A3), .S(S[1:0]), .F(B0));
   
   NBitFourWayMux #(.N(N)) mux2 (.A(A4), .B(A5), .C(A6), .D(A7), .S(S[1:0]), .F(B1));
   
   NBitFourWayMux #(.N(N)) mux3 (.A(A8), .B(A9), .C(A10), .D(A11), .S(S[1:0]), .F(B2));
   
   NBitFourWayMux #(.N(N)) mux4 (.A(A12), .B(A13), .C(A14), .D(A15), .S(S[1:0]), .F(B3));
   
   NBitFourWayMux #(.N(N)) muxF (.A(B0), .B(B1), .C(B2), .D(B3), .S(S[3:2]), .F(F));
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
        
   
endmodule

`endif 