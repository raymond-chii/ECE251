///////////////////////////////////////////////////////////////////////////////
//
// 32 bit adder TESTBENCH module
//
// An 32 bit adder testbench module for your Computer Architecture Elements Catalog
//
// module: 32 bit adder
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module adder32_tb;

  logic [31:0] A, B, sum;
  logic carry_out;

  adder32 dut (
    .a(A),
    .b(B),
    .sum(sum),
    .carry_out(carry_out)
  );

  initial begin
    $monitor("A = %d, B = %d, Sum = %u`, Carry_out = %u", A, B, sum, carry_out);
  end

  initial begin
    A = 32'h00000000;
    B = 32'h00000000;
    #10;
    A = 32'h12345678;
    B = 32'h87654321;
    #10;
    A = 32'h80000000;
    B = 32'h40000000;
    #10;
    A = 32'h7fffffff;
    B = 32'h80000000;
    #10;
    $finish;
  end

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, dut);
  end

endmodule
