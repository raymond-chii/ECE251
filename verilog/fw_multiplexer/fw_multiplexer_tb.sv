///////////////////////////////////////////////////////////////////////////////
//
// four way multiplexer TESTBENCH module
//
// An four way multiplexer testbench module for your Computer Architecture Elements Catalog
//
// module: four way multiplexer
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module mux4_tb;

   
    logic [3:0] data_in;
    logic [1:0] select;
    logic out;

   
    mux4 DUT (.data_in(data_in), .select(select), .out(out));

    
    initial begin
        data_in = 4'b0000;
        select = 2'b00;
        #10;
        
        data_in = 4'b0001;
        select = 2'b00;
        #10;
        
        data_in = 4'b0010;
        select = 2'b00;
        #10;
        
        data_in = 4'b0100;
        select = 2'b00;
        #10;
        
        data_in = 4'b0000;
        select = 2'b01;
        #10;
        
        data_in = 4'b0001;
        select = 2'b01;
        #10;
        
        data_in = 4'b0010;
        select = 2'b01;
        #10;
        
        data_in = 4'b0100;
        select = 2'b01;
        #10;
        
        data_in = 4'b0000;
        select = 2'b10;
        #10;
        
        data_in = 4'b0001;
        select = 2'b10;
        #10;
        
        data_in = 4'b0010;
        select = 2'b10;
        #10;
        
        data_in = 4'b0100;
        select = 2'b10;
        #10;
        
        data_in = 4'b0000;
        select = 2'b11;
        #10;
        
        data_in = 4'b0001;
        select = 2'b11;
        #10;
        
        data_in = 4'b0010;
        select = 2'b11;
        #10;
        
        data_in = 4'b0100;
        select = 2'b11;
        #10;
        
        $finish;
    end

    
    initial begin
        $dumpfile("mux4.vcd");
        $dumpvars(0, DUT);
    end

endmodule
