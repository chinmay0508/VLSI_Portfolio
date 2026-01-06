`timescale 1ns/1ps
module lg_tb;
reg x,y;
wire a,b,c,d,e,f,g;
logicgates obj(.i1(x), .i2(y), .o1(a), .o2(b), .o3(c), .o4(d), .o5(e), .o6(f), .o7(g));
initial
begin
    $dumpfile("logicgates.vcd");
    $dumpvars(0,lg_tb);
    $monitor($time,"i1=%b,i2=%b,AND=%b,OR=%b,NOT=%b,XOR=%b,XNOR=%b,NAND=%b,NOR=%b",x,y,a,b,c,d,e,f,g);
    x=0;y=0;
    #5 x=0;y=1;
    #5 x=1;y=0;
    #5 x=1;y=1;
    #5 $finish;
end
endmodule