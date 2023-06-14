module slt(
    input [31:0] a,
    input [31:0] b,
    output reg out
);
  
  assign out = (a < b) ? 1'b1 : 1'b0;

endmodule
