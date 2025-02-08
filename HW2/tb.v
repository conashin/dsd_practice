`timescale 1ns/1ps

module tb;
    reg [4:0] inState;
    reg CLK, Reset, Load;
    wire [4:0] RO;
    
    hw2 uut(
        .CLK(CLK),
        .Reset(Reset),
        .Load(Load),
        .inState(inState),
        .RO(RO)
    );

    initial begin
        CLK = 1;
        Reset = 0;
        Load = 0;
        inState = 2;
        #100;
        #5
        Reset = 1;
        #10
        Reset = 0;
        #10
        Load = 1;
        #10
        Load = 0;
    end

    always begin
        #5 CLK = ~CLK;
    end

    initial begin
        $monitor("CLK=%b, Reset=%b, Load=%b, inState=%b, RO=%b, Time=%d", CLK, Reset, Load, inState, RO, $time);
    end
endmodule
