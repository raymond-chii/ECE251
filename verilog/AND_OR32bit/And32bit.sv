`ifndef And32bit
`define And32bit
 

module AND32bit (
  input wire [31:0] A,
  input wire [31:0] B,
  output wire [31:0] Out,
);


assign Out = A && B;

endmodule


`endif