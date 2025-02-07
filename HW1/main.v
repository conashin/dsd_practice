`timescale 1ns/1ps

module hw1(
    input a, b, c, sel;
    output O1;
)

wire Net1, Net2, Net3, Net4, Net5, Net6;
xor D0L0(Net1, a, b);
xor D0(Net2, Net1, c);

or D1L0s0(Net3, a, c);
and D1L0(Net4, Net3, b);
and D1L1(Net5, a, c);
and D1(Net6, Net5, Net4);

// create mux select d0 or d1
assign O1 = (sel) ? Net6 : Net2;

endmodule