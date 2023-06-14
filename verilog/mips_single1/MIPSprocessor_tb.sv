`timescale 1ns / 1ps

module MIPSprocessor_tb;

    // Inputs
    reg clk = 0;
    reg reset = 0;
    reg [31:0] instr = 0;
    reg [31:0] readdata = 0;
    
    // Outputs
    wire [31:0] pc;
    wire memwrite;
    wire [31:0] ALUresult, writedata;
    
    // Instantiate the MIPSprocessor module
    MIPSprocessor dut(clk, reset, pc, instr, memwrite, ALUresult, writedata, readdata);
    
    initial begin
        // Initialize inputs
        instr = 14; // Example instruction to load word (lw $t2, 0($s1))
        
        // Reset the module
        reset = 1;
        #10;
        reset = 0;
        
        // Wait a few cycles
        #20;
        
        // Assert clock signal
        clk = 1;
        
        // Wait a few cycles
        #20;
        
        // Deassert clock signal
        clk = 0;
        
        // Wait a few cycles
        #20;
        
        // Example test: Check if the program counter incremented correctly
        if (pc !== 32'h00000004) begin
            $display("Error: Program counter did not increment correctly.");
        end
        
        // Example test: Check if the ALU output is correct for the instruction
        if (ALUresult !== 32'h00000004) begin
            $display("Error: ALU output is not correct.");
        end
        
        // Example test: Check if the write data output is correct for the instruction
        if (writedata !== 32'h00000000) begin
            $display("Error: Write data output is not correct.");
        end
        
        // Example test: Check if the memwrite signal is correct for the instruction
        if (memwrite !== 0) begin
            $display("Error: Memwrite signal is not correct.");
        end
        
        // Example test: Check if the read data input is correct for the instruction
        if (readdata !== 32'h0000000A) begin
            $display("Error: Read data input is not correct.");
        end
        
        // Wait a few cycles
        #100;
        
        // End the simulation
        $finish;
    end
    
endmodule
