// Behavior Level Abstraction
module SMUX(out, a, b, sel);
    output out;
    input a, b, sel;
    wire out;

    assign out = sel ? a : b;
endmodule

// Register Transfer Level
module SMUX(out, a, b, sel);
output out;
input a,b,sel;
reg out;
always @(a or b or sel)
    if (sel)
        out=a;
    else
        out=b;
endmodule

// Gate Level Abstraction
module SMUX(out, a, b, sel);

output out;
input a,b,sel;
wire sel_n,t1,t2;

not U0(sel_n,sel);
and U1(t1,a,sel);
and U2(t2,b,sel_n);
or U3(out,t1,t2);

endmodule

// Switch Level Abstraction
module SMUX(out, a, b, sel);
output out;
input a,b,sel;
wire t1,t2;
supply1 pwr;
supply0 gnd;
// Inverter
pmos U0(sel_n,sel,pwr);
nmos U1(sel_n,sel,gnd);
// NAND (a*sel)’
pmos U2(t1,pwr,a);
pmos U3(t1,pwr,sel);
nmos U4(t1,t2,a);
nmos U5(t2,gnd,sel);
// NAND (b*sel’)’
pmos U6(t3,pwr,b);
pmos U7(t3,pwr,sel_n);
nmos U8(t3,t4,b);
nmos U9(t4,gnd,sel_n);
// NAND
pmos U10(out,pwr,t1);
pmos U11(out,pwr,t3);
nmos U12(out,t5,t1);
nmos U13(t5,gnd,t3);
endmodule

module Outter;
reg A,B,SEL;
wire OUT;
SMUX U0(.out(OUT),.a(A),.b(B),.sel(SEL));
initial
begin
    $fsdbdumpvars;
    $monitor (“A=%d OUT=%d at time %t”, A, OUT, $time);
    A=0;B=0;SEL=0;
    #10 A=0;B=1;SEL=1;
    #10 A=1;B=0;SEL=0
    #10 A=0;B=0;SEL=0;
    .....
    #10 A=1;B=1;SEL=1;
    #10 $finish;
end
endmodule

`timescale 1ns / 100ps
module AND_FUNC (Z, A, B);
    output Z;
    input A, B;
    and #(5.22, 6.17) A1(Z, A, B);
endmodule