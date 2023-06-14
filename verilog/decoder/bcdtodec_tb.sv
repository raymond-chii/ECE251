module bcd_to_decimal_decoder ();
    reg [1:0] A;
    reg [3;0] B; 

    bcd_to_decimal_decoder DUT(
        .Input(A);
    );

    
endmodule