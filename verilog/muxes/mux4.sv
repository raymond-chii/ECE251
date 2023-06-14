`ifndef instruction_mem
`define instruction_mem

///////////////////////////////////////////////////////////////////////////////
//
// N bits four way muxs 
//
// This module is an N bits four way muxs 
//
// module: N bits four way muxs 
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`include "mux2.sv"

module NBitFourWayMux #(parameter N=1)(A, B, C, D, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input wire [N-1:0] A, B, C, D;
   input wire [1:0] S;
   output wire [N-1:0] F;
   
   wire [N-1:0] lowMuxOut, highMuxOut;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
        NBitTwoWayMux #(.N(N)) lowMux(.A(A), .B(B), .S(S[0]), .F(lowMuxOut));
        NBitTwoWayMux #(.N(N)) highMux(.A(C), .B(D), .S(S[0]), .F(highMuxOut));
        NBitTwoWayMux #(.N(N)) finMux(.A(lowMuxOut), .B(highMuxOut), .S(S[1]), .F(F));
   
endmodule

`endif 