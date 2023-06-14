module full_adder(input wire a, b, cin,
                  output wire sum, cout);
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (cin & (a ^ b));
endmodule

module full_adder_4bit (
  input wire [3:0] A,
  input wire [3:0] B,
  input wire Cin,
  output wire [3:0] Sum,
  output wire Cout
);

    wire [2:0] carry;

full_adder adder0 (a[0], b[0], cin[Cin], sum[0], cout[carry[0]]);
  full_adder adder1 (a[1], b[1], cin[carry[0]], sum[1], cout[carry[1]]);
  full_adder adder2 (a[2], b[2], cin[carry[1]], sum[2], cout[carry[2]]);
  full_adder adder3 (a[3], b[3], cin[carry[2]], sum[3], cout);
endmodule

