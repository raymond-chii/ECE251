///////////////////////////////////////////////////////////////////////////////
//
// four way multiplexer module
//
// An four way multiplexer module for your Computer Architecture Elements Catalog
//
// module: four way multiplexer
// hdl: Verilog
//
// author: Lei(Raymond) <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
module mux4(input [3:0] data_in, input [1:0] select, output reg out);

always @(*)
begin
    case(select)
        2'b00: out = data_in[0];
        2'b01: out = data_in[1];
        2'b10: out = data_in[2];
        2'b11: out = data_in[3];
    endcase
end

endmodule
