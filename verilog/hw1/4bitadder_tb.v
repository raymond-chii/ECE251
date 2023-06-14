`timescale 1 ns/10 ps
`include "design_4bitadder.v"


module full_adder_4bit_tb;
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] Sum;
  wire Cout;

  full_adder_4bit uut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

 initial begin
    integer i = 0, j = 0, k = 0;
    while (i < 16) begin
      A = i;
      j = 0;
      while (j < 16) begin
        B = j;
        k = 0;
        while (k < 2) begin
          Cin = k;
          #1;
          k = k + 1;
        end
        j = j + 1;
      end
      i = i + 1;
    end
  end

endmodule