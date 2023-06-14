module dmem(input  wire        clk, we,
            input  wire [31:0] a, wd,
            output wire [31:0] rd);

  logic [31:0] RAM[0:63];

  assign rd = RAM[a[31:2]]; // word aligned

  always @(posedge clk)
    if (we) RAM[a[31:2]] <= wd;
endmodule