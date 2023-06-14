///////////////////////////////////////////////////////////////////////////////
//
// extend unit
//
// This module is an extend unit
//
// module: Adder32Bit
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////



module extend_unit(instruction, imm_src, imm_ext);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
    input logic [31:7] instruction; 
    input logic [1:0] imm_src;
    output logic [31:0] imm_ext;
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //

    always_comb 
        case(imm_src)
            2'b00: imm_ext = {{20{instruction[31]}}, instruction[31:20]};
            2'b01: imm_ext={{20{instruction[31]}},instruction[31:25],instruction[11:7]}; 
            2'b10: imm_ext = {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
            2'b11: imm_ext = {{12{instruction[31]}}, instruction[19:12],instruction[20], instruction[30:21], 1'b0};
            default: imm_ext = 32'bx; //not defined 
        endcase 

endmodule