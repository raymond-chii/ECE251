//`include "dataMemory.sv"
//`include "imem.sv"
//`include "MIPSprocessor.sv"
//`include "dmem.sv"



module top (input wire clk, reset,
            output wire [31:0] writedata, dataadr,
            output wire memwrite ); 
        
        
        wire [31:0] pc, instr, readdata;

    MIPSprocessor mips(clk, reset, pc, instr, memwrite, dataadr,writedata, readdata); 
    imem imem(pc[7:2], instr);
    //dataMemory dmem(rest, clk, memwrite, dataadr, writedata, readdata); 
    dmem dmem(clk, memwrite, dataadr, writedata, readdata); 



endmodule