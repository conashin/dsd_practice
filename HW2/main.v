`timescale 1ns/1ps

/*
// dff
module dff (input clk, input rst, input dffD, output reg dffO);
    always @(posedge clk or posedge rst)
        if (rst)
            dffO <= 1'b0;
        else
            dffO <= dffD;
endmodule

// mux 2 to 1
module mux2to1 (input load, input muxD0, input muxD1, output muxO);
    always @(*) begin
        case (load)
            1'b0: muxO = muxD1;
            1'b1: muxO = muxD0; // Load inState
        endcase
    end
endmodule
*/

module dff_muxi2o1 (clk, rst, load, D0, D1, out);
    input clk, rst, load, D0, D1;
    output reg out;
    wire mux_dffD;
    
    // mux part
    assign mux_dffD = (load) ? D0 : D1;
    // dff part
    always @(posedge clk or posedge rst)
        if (rst)
            out <= 1'b0;
        else
            out <= mux_dffD;
endmodule

module hw2 (CLK, Reset, Load, inState, RO);
    input CLK, Reset, Load;
    input [4:0] inState;
    output [4:0] RO;
    wire [4:0] Net;

    // DFF with MUX blocks
    dff_muxi2o1 R0 (CLK, Reset, Load, inState[0], Net[1], RO[0]);
    dff_muxi2o1 R1 (CLK, Reset, Load, inState[1], Net[2], RO[1]);
    dff_muxi2o1 R2 (CLK, Reset, Load, inState[2], Net[3], RO[2]);
    dff_muxi2o1 R3 (CLK, Reset, Load, inState[3], Net[4], RO[3]);
    dff_muxi2o1 R4 (CLK, Reset, Load, inState[4], Net[0], RO[4]);

    // Assign Net
    assign Net[0] = RO[0];
    assign Net[1] = RO[1] ^ Net[0]// xor x1(Net[1], RO[1], Net[0]);
    assign Net[2] = RO[2] ^ Net[0]// xor x2(Net[2], RO[2], Net[0]);
    assign Net[3] = RO[3];
    assign Net[4] = RO[4] ^ Net[0]// xor x4(Net[4], RO[4], Net[0]);
endmodule


