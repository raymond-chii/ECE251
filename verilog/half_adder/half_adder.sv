///////////////////////////////////////////////////////////////////////////////
//
// half_adder module
//
// An half_adder module for your Computer Architecture Elements Catalog
//
// module: half_adder
// hdl: Verilog
//
// author: Lei(Raymond) <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module half_adder (input logic A, B, output logic carry, sum);
    assign sum = A ^ B;
    assign carry = A & B;
endmodule
