`timescale 1ns / 1ps

module NBitTwoWayMux_TB;

   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   parameter N = 32;
   
   reg [N-1:0] A_tb, B_tb;
   reg S_tb;
   wire [N-1:0] F_tb;
   
   //
   // ---------------- INSTANCE OF DUT ----------------
   //

   NBitTwoWayMux #(.N(N)) dut (
      .A(A_tb),
      .B(B_tb),
      .S(S_tb),
      .F(F_tb)
   );
   
   //
   // ---------------- CLOCK GENERATION ----------------
   //

   reg clk_tb = 0;
   always #5 clk_tb = !clk_tb;
   
   //
   // ---------------- INPUT SIGNALS ----------------
   //
   
   initial begin
      // Initialize inputs
      A_tb = 'b10101010101010101010101010101010;
      B_tb = 'b01010101010101010101010101010101;
      S_tb = 0;
      
      // Wait for a few clock cycles before toggling inputs
      #10;
      
      // Toggle inputs
      S_tb = 1;
      #10;
      A_tb = 'b11111111111111111111111111111111;
      B_tb = 'b00000000000000000000000000000000;
      #10;
      S_tb = 0;
      #10;
      
      // Wait for a few more clock cycles before ending simulation
      #100;
      $finish;
   end
   
   //
   // ---------------- MONITORING ----------------
   //
   
   always @(posedge clk_tb) begin
      $display("A = %b", A_tb);
      $display("B = %b", B_tb);
      $display("S = %b", S_tb);
      $display("F = %b", F_tb);
   end

endmodule
