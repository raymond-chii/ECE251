`timescale 1ns/1ns

module testbench();

    // Inputs
    reg clk = 0;
    reg reset = 0;
    reg memtoreg = 0;
    reg pcsrc = 0;
    reg alusrc = 0;
    reg regdst = 0;
    reg regwrite = 0;
    reg jump = 0;
    reg [2:0] alucontrol = 0;
    reg [31:0] instr = 0;
    reg [31:0] readdata = 0;
    
    // Outputs
    wire zero;
    wire [31:0] pc;
    wire [31:0] aluout;
    wire [31:0] writedata;
    
    datapath dut(
        .clk(clk),
        .reset(reset),
        .memtoreg(memtoreg),
        .pcsrc(pcsrc),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .alucontrol(alucontrol),
        .zero(zero),
        .pc(pc),
        .instr(instr),
        .aluout(aluout),
        .writedata(writedata),
        .readdata(readdata)
    );
    
    // Monitor outputs
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, dut);
        reset = 1;
        clk = 0;
        #10 reset = 0;
        #10 instr = 32'h20080001; // addi $8, $0, 1
        #10 clk = 1;
        #10 clk = 0;
        #10 $finish;
    end
    
endmodule
