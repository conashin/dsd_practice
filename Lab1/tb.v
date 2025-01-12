`timescale 1ns / 1ps

module tb;

    reg [2:0] x, y;
    reg [1:0] sel;
    wire [7:0] LED;
    wire [3:0] seg;

    main uut (
        x,
        y,
        sel,
        LED,
        seg
    );

    initial begin
        // Testcase 1: X_1=3'b110, Y_1=3'b001
        for (sel_num = 0; sel_num < 4; sel_num = sel_num + 1) begin
            x = 3'b110;
            y = 3'b001;
            sel = sel_num;
            #10;
        end

        // Testcase 2: X_2=3'b110, Y_2=3'b111
        for (sel_num = 0; sel_num < 4; sel_num = sel_num + 1) begin
            x = 3'b110;
            y = 3'b111;
            sel = sel_num;
            #10;
        end

        // Testcase 3: X_3=3'b111, Y_3=3'b010
        for (sel_num = 0; sel_num < 4; sel_num = sel_num + 1) begin
            x = 3'b111;
            y = 3'b010;
            sel = sel_num;
            #10;
        end
    end

endmodule