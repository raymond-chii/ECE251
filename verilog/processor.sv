`include "ControlUnit.sv"
`include "datapath.sv"


module scprocessor (clk, reset, PC, instruction, mem_write, alu_result, write, read)
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
    input logic clk;
    input logic reset;
    input wire [31:0] instruction;
    input wire [31:0] read;
    output wire [31:0] PC;
    output logic mem_write;
    output wire [31:0] alu_result;
    output wire [31:0] write;


logic alu_src, reg_wire, jump, zero;
logic [1:0] result_src;
logic [1:0] imm_src;
logic [2:0] alu_control 

controller controller(instruction[6:0], instruction[14:12], instruction[30], zero, result_src, mem_write, pcSource,alu_src, reg_wire, jump,imm_src, alu_control);
datapath datapath(clk, reset, result_src, pcSource, alu_src, reg_wire, imm_src, alu_control, zero, PC, instruction, alu_result, write, read)

endmodule

