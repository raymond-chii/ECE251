///////////////////////////////////////////////////////////////////////////////
//
// two way multiplexer module
//
// An two way multiplexer module for your Computer Architecture Elements Catalog
//
// module: two way multiplexer
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module tw_multiplexer (
    input logic in1, in2, ctrl,
    output logic out
);

    assign out = (ctrl & in2) | (!ctrl & in1);

endmodule
