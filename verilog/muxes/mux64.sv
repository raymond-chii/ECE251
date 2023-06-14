`ifndef instruction_mem
`define instruction_mem

///////////////////////////////////////////////////////////////////////////////
//
// N bits 64 way muxs 
//
// This module is an N bits 64 way muxs 
//
// module: N bits 64 way muxs 
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`include "mux32.sv"


module NBitSixtyFourWayMux #(parameter N=1) (A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36, A37, A38, A39, A40, A41, A42, A43, A44, A45, A46, A47, A48, A49, A50, A51, A52, A53, A54, A55, A56, A57, A58, A59, A60, A61, A62, A63, S, F);

	//
   // ---------------- PORT DEFINITIONS ----------------
   //
	
	input wire [N-1:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36, A37, A38, A39, A40, A41, A42, A43, A44, A45, A46, A47, A48, A49, A50, A51, A52, A53, A54, A55, A56, A57, A58, A59, A60, A61, A62, A63;

	wire [N-1:0] B0, B1;
	
	input wire [5:0] S;
	
	output wire [N-1:0] F;

	//
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
	
	NBitThirtyTwoWayMux #(.N(N)) lowMux (.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .A8(A8), .A9(A9), .A10(A10), .A11(A11), .A12(A12), .A13(A13), .A14(A14), .A15(A15), .A16(A16), .A17(A17), .A18(A18), .A19(A19), .A20(A20), .A21(A21), .A22(A22), .A23(A23), .A24(A24), .A25(A25), .A26(A26), .A27(A27), .A28(A28), .A29(A29), .A30(A30), .A31(A31), .S(S[4:0]), .F(B0));
	
	
	NBitThirtyTwoWayMux #(.N(N)) hiMux (.A0(A32), .A1(A33), .A2(A34), .A3(A35), .A4(A36), .A5(A37), .A6(A38), .A7(A39), .A8(A40), .A9(A41), .A10(A42), .A11(A43), .A12(A44), .A13(A45), .A14(A46), .A15(A47), .A16(A48), .A17(A49), .A18(A50), .A19(A51), .A20(A52), .A21(A53), .A22(A54), .A23(A55), .A24(A56), .A25(A57), .A26(A58), .A27(A59), .A28(A60), .A29(A61), .A30(A62), .A31(A63), .S(S[4:0]), .F(B1));
	
	NBitTwoWayMux #(.N(N)) finMux(.A(B0), .B(B1), .S(S[5]), .F(F));

endmodule


`endif 