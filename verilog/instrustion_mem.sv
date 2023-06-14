`ifndef instruction_mem
`define instruction_mem

///////////////////////////////////////////////////////////////////////////////
//
// instruction memory
//
// This module is an instruction memory
//
// module: instruction memory
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

module instruction_mem(A, RD);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
    input wire [31:0] A;
    output wire [31:0] RD;
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [31:0] RAM[63:0];


initial $readmemh("riscvtest.txt",RAM);


assign RD = RAM[A[31:2]];

`endif 