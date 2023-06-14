module bcd_to_decimal_decoder (Input, Output);
    input [1:0] Input;
    output [3:0] Output;

    wire [1:0] nots;
    not #5(nots(0), Input(0));
    not #5(nots(1), Input(1));

    and #5(Output[0], nots[0], nots[1]); //00
    and #5(Output[1], nots[0], Input[1]); //01
    and #5(Output[2], Input[0], nots[0]); //10
    and #5(Output[3], Input[0], Input[1]); //11

endmodule