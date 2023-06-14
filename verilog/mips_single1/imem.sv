`ifndef imem
`define imem

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

module imem(A, rd);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
    input wire [5:0] A;
    output wire [31:0] rd;
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [31:0] RAM[17:0];


initial $readmemh("memfile.dat", RAM);


assign rd = RAM[A];


endmodule
`endif 