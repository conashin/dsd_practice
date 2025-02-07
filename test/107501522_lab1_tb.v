`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 18:55:13
// Design Name: 
// Module Name: lab1x_tb
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
module lab1x_tb;
wire e1,e0;
wire [15:0]seg;
wire [3:0]LED0;
wire [3:0]LED1;
wire [3:0]LED2;
reg [3:0]p;
reg [2:0]style;
reg display;

lab1x uut(seg,LED0,LED1,LED2,e1,e0,p,style,display);

initial begin 
p = 2 ; style = 5 ; display = 1 ;
#10
p = 2 ; style = 6 ; display = 0 ; 
#10
p = 2 ; style = 7 ; display = 1 ;
#10
p = 2 ; style = 1 ; display = 0 ;
#10
p = 9 ; style = 2 ; display = 1 ;
#10
p = 9 ; style = 3 ; display = 0 ;  
#10
 $finish;
end
endmodule
