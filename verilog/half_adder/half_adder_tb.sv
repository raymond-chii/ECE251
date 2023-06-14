///////////////////////////////////////////////////////////////////////////////
//
// half_adder TESTBENCH module
//
// An half_adder testbench module for your Computer Architecture Elements Catalog
//
// module: half_adder
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module half_adder_tb;

  logic A, B, Sum, Carry; 

  half_adder dut (
    .A(A),
    .B(B),
    .sum(Sum),
    .carry(Carry)
  );

  initial begin
    $monitor("A = %b, B = %b, Sum = %b, Carry = %b", A, B, Sum, Carry);
  end

  initial begin
    A = 1'b0;
    B = 1'b0;
    #10;
    A = 1'b1;
    B = 1'b0;
    #10;
    A = 1'b0;
    B = 1'b1;
    #10;
    A = 1'b1;
    B = 1'b1;
    #10;
    $finish;
  end

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, dut);
  end

endmodule
