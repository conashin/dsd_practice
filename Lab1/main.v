`timescale 1ns / 1ps

module main(x, y, sel, out);
    input [2:0] x, y; // Input 3-bit x and y
    input [1:0] sel; // Input 2-bit selection
    
    output reg [7:0] LED; // LED output
    output reg [3:0] seg; // Seg

always @(clk) begin
    case (sel)
        2'00: LED = 8 * x + y; // Mode 00 8X+Y
        2'01: LED = x + 16 * y; // Mode 01 X+16Y
        2'10: LED = x << y; // Mode X shift Y bits
        2'11: LED = y << x; // Mode Y shift X bits
    endcase

    if sel[0] begin
        seg = 2 * x;
        
    end else begin
        seg = y + 3;
    end
end

endmodule
