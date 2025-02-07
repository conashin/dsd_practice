`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 18:22:27
// Design Name: 
// Module Name: lab1x
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module lab1x(seg,LED0,LED1,LED2,e1,e0,p,style,display);
output reg e1; 
output reg e0;
output reg[15:0]seg;
       reg[3:0]segn;
       reg[3:0]lefts;
output reg[3:0]LED0;
output reg[3:0]LED1;
output reg[3:0]LED2;
input [3:0]p;
input [2:0]style;
input display;

always@(p,style,display)
begin
case(style)
default: begin
      LED0=4'b0000;
      LED1=4'b0000;
      LED2=4'b0000;
      lefts=7;
      end 
3'b001:begin
      LED0=4'b0000;
      LED1=4'b0000;
      LED2=p;
      lefts=8;
      end      
3'b010:begin
      LED0=4'b0000;
      LED1=p;
      LED2=4'b0000;
      lefts=9;
      end
3'b011:begin
      LED0=4'b0000;
      LED1=p;
      LED2=p;
      lefts=10;
      end
3'b100:begin
      LED0=p;
      LED1=4'b0000;
      LED2=4'b0000;
      lefts=11;
      end
3'b101:begin
      LED0=p;
      LED1=4'b0000;
      LED2=p;
      lefts=12;
      end
3'b110:begin
      LED0=p;
      LED1=p;
      LED2=4'b0000;
      lefts=13;
      end
3'b111:begin
      LED0=p;
      LED1=p;
      LED2=p;
      lefts=14;
      end                                              
endcase
case(display)
1'b0:begin
    e1=1;
    e0=0;
    segn=lefts;
    end
1'b1:begin
    e1=0;
    e0=1;
    segn=p;
    end
endcase      

case(segn)
4'b0001:seg=16'b0000_0110_0000_0110;
4'b0010:seg=16'b0101_1011_0101_1011;
4'b0011:seg=16'b0100_1111_0100_1111;
4'b0100:seg=16'b0110_0110_0110_0110;
4'b0101:seg=16'b0110_1101_0110_1101;
4'b0110:seg=16'b0111_1101_0111_1101;
4'b0111:seg=16'b0000_0111_0000_0111;
4'b1000:seg=16'b0111_1111_0111_1111;
4'b1001:seg=16'b0110_1111_0110_1111;
4'b1010:seg=16'b0111_0111_0111_0111;
4'b1011:seg=16'b0111_1100_0111_1100;
4'b1100:seg=16'b0011_1001_0011_1001;
4'b1101:seg=16'b0101_1110_0101_1110;
4'b1110:seg=16'b0111_1001_0111_1001;
4'b1111:seg=16'b0111_0001_0111_0001;
default: seg=16'b0011_1111_0011_1111; 
endcase
end
endmodule
