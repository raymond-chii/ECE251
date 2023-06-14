`ifndef instruction_mem
`define instruction_mem

///////////////////////////////////////////////////////////////////////////////
//
// N bits 32 way muxs 
//
// This module is an N bits 32 way muxs 
//
// module: N bits 32 way muxs 
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`include "mux16.sv"

module NBitThirtyTwoWayMux #(parameter N=1) (A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, S, F);

	//
   // ---------------- PORT DEFINITIONS ----------------
   //
	
	input wire [N-1:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31;

	wire [N-1:0] B0, B1;
	
	input wire [4:0] S;
	
	output wire [N-1:0] F;

	//
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
	
	NBitSixteenWayMux #(.N(N)) lowMux (.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .A8(A8), .A9(A9), .A10(A10), .A11(A11), .A12(A12), .A13(A13), .A14(A14), .A15(A15), .S(S[3:0]), .F(B0));
	
	NBitSixteenWayMux #(.N(N)) highMux (.A0(A16), .A1(A17), .A2(A18), .A3(A19), .A4(A20), .A5(A21), .A6(A22), .A7(A23), .A8(A24), .A9(A25), .A10(A26), .A11(A27), .A12(A28), .A13(A29), .A14(A30), .A15(A31), .S(S[3:0]), .F(B1));
	
	NBitTwoWayMux #(.N(N)) finMux(.A(B0), .B(B1), .S(S[4]), .F(F));

endmodule

`endif 