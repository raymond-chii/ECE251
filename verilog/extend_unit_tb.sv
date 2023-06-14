`timescale 1ns/100ps

module extend_unit_tb;

    // Inputs
    logic [31:7] test_instr;
    logic [1:0] test_imm_src;
    
    // Outputs
    logic [31:0] test_imm_ext;

    // Instantiate the Unit Under Test (UUT)
    extend_unit uut (
        .instruction(test_instr), 
        .imm_src(test_imm_src), 
        .imm_ext(test_imm_ext)
    );

    initial begin
        // Test case 1
        test_instr = 32'b11000000000000000000000000000000; // imm_src = 2'b00
        test_imm_src = 2'b00;
        #10;
        if (test_imm_ext !== 32'b11111111111111110000000000000000) $error("Test case 1 failed.");

        // Test case 2
        test_instr = 32'b11110000000000000000000000000000; // imm_src = 2'b01
        test_imm_src = 2'b01;
        #10;
        if (test_imm_ext !== 32'b11111111111111111111000000000000) $error("Test case 2 failed.");
        
        // Test case 3
        test_instr = 32'b11100000000000001000111000000000; // imm_src = 2'b10
        test_imm_src = 2'b10;
        #10;
        if (test_imm_ext !== 32'b11111111000000000010001110000000) $error("Test case 3 failed.");
        
        // Test case 4
        test_instr = 32'b11011000000000000000110000000000; // imm_src = 2'b11
        test_imm_src = 2'b11;
        #10;
        if (test_imm_ext !== 32'b11111111111100000011000000000000) $error("Test case 4 failed.");
        
        $display("All test cases passed.");
        $finish;
    end

endmodule
