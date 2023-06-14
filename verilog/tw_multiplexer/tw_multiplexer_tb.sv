///////////////////////////////////////////////////////////////////////////////
//
// two way multiplexer TESTBENCH module
//
// An two way multiplexer testbench module for your Computer Architecture Elements Catalog
//
// module: two way multiplexer
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module tw_multiplexer_tb;

    logic in1, in2, ctrl, out;
    

    tw_multiplexer DUT (.in1(in1), .in2(in2), .ctrl(ctrl), .out(out));

    initial begin
        $monitor("in1 = %b, in2 = %b, ctrl = %b, out = %b", in1, in2, ctrl,  out);
    end
    
    initial begin
        in1 = 1'b0;
        in2 = 1'b0;
        ctrl = 1'b0;

        #10
        in1 = 1'b0;
        in2 = 1'b0;
        ctrl = 1'b1;

        #10
        in1 = 1'b0;
        in2 = 1'b1;
        ctrl = 1'b0;

        #10
        in1 = 1'b0;
        in2 = 1'b1;
        ctrl = 1'b1;

        #10
        in1 = 1'b1;
        in2 = 1'b0;
        ctrl = 1'b0;

        #10
        in1 = 1'b1;
        in2 = 1'b0;
        ctrl = 1'b1;

        #10
        in1 = 1'b1;
        in2 = 1'b1;
        ctrl = 1'b0;

        #10
        in1 = 1'b1;
        in2 = 1'b1;
        ctrl = 1'b1;

        #10 
        $finish;
    end

    initial begin
        $dumpfile("waveForm.vcd");
        $dumpvars(0, DUT);
    end

endmodule
