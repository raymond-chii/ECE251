///////////////////////////////////////////////////////////////////////////////
//
// 32 bit register TESTBENCH module
//
// An 32 bit register testbench module for your Computer Architecture Elements Catalog
//
// module: 32 bit register
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module thirtyTwoBitRegister_Tb;

  reg [31:0] D;
  reg R, Clk;
  wire [31:0] Q, notQ;

  
  thirtyTwoBitRegister DUT (.D(D), .clk(Clk), .R(R), .Q(Q), .Qn(notQ));

  
  initial begin
    $monitor("D = %d, R = %b, Clk = %b, Q = %d, notQ = %d", D, R, Clk, Q, notQ);
  end

 
  initial begin
    // Reset the register to all zeros
    D = 32'd0;
    R = 1'b1;
    Clk = 1'b0;

    #10;
    Clk = 1'b1;

    #10;
    R = 1'b0;
    Clk = 1'b0;

    #10;
    Clk = 1'b1;

    #10;
    D = 32'd1;
    R = 1'b1;
    Clk = 1'b0;

    #10;
    Clk = 1'b1;

    #10;
    R = 1'b0;
    Clk = 1'b0;

    #10;
    Clk = 1'b1;

    #10;
    D = 32'hAAAAAAAA;
    R = 1'b1;
    Clk = 1'b0;

    #10;
    Clk = 1'b1;

    #10;
    R = 1'b0;
    Clk = 1'b0;

    #10;
    Clk = 1'b1;

    #10;
    D = 32'h1F2E3D4C;
    R = 1'b1;
    Clk = 1'b0;

    #10;
    Clk = 1'b1;

    #10;
    R = 1'b0;
    Clk = 1'b0;

    #10;
    Clk = 1'b1;

    #10;
    $finish;
  end

  
  initial begin
    $dumpfile("waveForm.vcd");
    $dumpvars(0, DUT);
  end

endmodule

