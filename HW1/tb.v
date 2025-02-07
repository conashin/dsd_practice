`timescale 1ns / 1ps
module tb;
    reg a, b, c, sel;
    wire O1;

    initial begin
        {a,b,c,sel} = 4'b0000; #50;
        {a,b,c,sel} = 4'b1000; #50;
        {a,b,c,sel} = 4'b0100; #50;
        {a,b,c,sel} = 4'b1110; #50;
        {a,b,c,sel} = 4'b0010; #50;
        {a,b,c,sel} = 4'b1011; #50;
        {a,b,c,sel} = 4'b0111; #50;
        {a,b,c,sel} = 4'b1101; #50;
        {a,b,c,sel} = 4'b0001; #50;
        {a,b,c,sel} = 4'b1001; #50;
        $stop;
    end
endmodule