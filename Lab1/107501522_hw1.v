`timescale 100ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/21 23:03:04
// Design Name: 
// Module Name: tt
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


module OddOnes(A1,X,Y,Z,W);
input X,Y,Z,W;
output A1;
assign A1 = (X ^ Y) ^ (Z ^ W); 
endmodule

module AOI(A2,X,Y,Z,W);
input X,Y,Z,W;
output A2;
assign A2 = ~((X & Y) | (Z & W));
endmodule

module AllOne(A3,X,Y,Z,W);
input X,Y,Z,W;
output A3;
assign A3 = (X & Y) & (Z & W);
endmodule

module MUX(Out,A1,A2,A3,Sel);
input A1,A2,A3;
input [1:0]Sel;
output Out;
reg Out;
always @(A1 or A2 or A3)
case (Sel)
2'b00: Out = A1;
2'b01: Out = A2;
2'b10: Out = A3;
endcase

endmodule

module tt(Out,X,Y,Z,W,Sel);
input X,Y,Z,W;
input [1:0]Sel;
output Out;
wire [2:0] ll;

OddOnes Odd(ll[0],X,Y,Z,W);
AOI aoi(ll[1],X,Y,Z,W);
AllOne all(ll[2],X,Y,Z,W);
MUX m1(Out,ll[0],ll[1],ll[2],Sel);
endmodule
