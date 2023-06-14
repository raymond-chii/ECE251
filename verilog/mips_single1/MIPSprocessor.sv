`ifndef MIPSprocessor
`define MIPSprocessor

`include "datapath.sv"
`include "ControlUnit.sv"


module MIPSprocessor(clk, reset, pc, instr, memwrite, ALUresult, writedata, readdata, Q);
        input wire clk, reset;
        output wire [31:0] pc;
        input wire [31:0] instr;
        output wire memwrite;
        output wire [31:0] ALUresult, writedata;
        input wire [31:0] readdata;
        output wire [1023:0] Q;
    wire   memtoreg, alusrc, regdst, regwrite, jump, pcsrc, zero;
    wire [2:0] alucontrol;


    ControlUnit c(instr[31:26], instr[5:0], zero, memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, alucontrol);
    datapath dp(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, zero, pc, instr, ALUresult, writedata, readdata, Q);  
endmodule

`endif