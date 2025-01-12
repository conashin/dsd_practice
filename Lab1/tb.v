`timescale 1ns / 1ps

module tb;

    reg [2:0] x, y;
    reg [1:0] sel;
    wire [7:0] LED;
    wire [3:0] seg;

    main uut (
        .x(x),
        .y(y),
        .sel(sel),
        .LED(LED),
        .seg(seg),
    );

    initial begin
        $monitor("x=%d, y=%d, sel=%d, LED=%h, seg1=%h, seg2=%h", x, y, sel, LED, seg1, seg2);

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