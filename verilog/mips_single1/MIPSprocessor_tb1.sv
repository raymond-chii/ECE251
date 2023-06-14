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
    wire [1023:0] Q;
    
    // Instantiate the MIPSprocessor module
    MIPSprocessor dut(clk, reset, pc, instr, memwrite, ALUresult, writedata, readdata, Q);
    
    initial 
    
        $monitor("PC=%b, ALUresult=%b, WRITEDATA=%b, READDATA=%b, Q =%b", pc, ALUresult, writedata, readdata, Q);
    initial 
    begin
        reset = 1;
        #10;
        reset = 0;
        clk = 0;
        #20;
        clk = 1;
        #20;
        clk = 0;
        //instr = 32'b1010 1100 0000 0110 0000 0000 0000 0000;
        instr = 32'b00000000000000000000011010101100;
        //instr = 14;     
        clk = 0;
        #20;
        clk = 1;
        #20;
        clk = 0;
        //instr = 32'b00110101000100000000000001100100; 
        instr = 32'b10101100000001100000000000000001;
    end

    
endmodule
