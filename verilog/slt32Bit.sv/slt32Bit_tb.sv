module slt_tb;
  
  reg [31:0] a, b;
  wire out;
  
  slt uut(
    .a(a),
    .b(b),
    .out(out)
  );
  
  initial begin
    a = 10;
    b = 20;
    #10;
    $display("a = %d, b = %d, out = %d", a, b, out);
    $finish;
  end
  
endmodule
