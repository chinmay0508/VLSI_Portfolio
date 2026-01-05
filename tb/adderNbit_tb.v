`timescale 1ns/1ps
module adderNbit_tb;
    parameter N = 8;
    reg  [N-1:0] A;
    reg  [N-1:0] B;
    wire [N-1:0] Sum;
    wire Cout;
    adderNbit #(.N(N)) dut (.A(A), .B(B), .Sum(Sum), .Cout(Cout));
    initial begin
        $dumpfile("adderNbit.vcd");
        $dumpvars(0, adderNbit_tb);
        $monitor("T=%0t | A=%0d B=%0d | Sum=%0d Cout=%b",
                  $time, A, B, Sum, Cout);
        A = 0;      B = 0;      #5;
        A = 5;      B = 3;      #5;
        A = 20;     B = 10;     #5;
        A = 100;    B = 28;     #5;
        A = 8'hFF;  B = 8'h01;  #5;   
        A = 8'hAA;  B = 8'h55;  #5;
        A = 8'h0F;  B = 8'h01;  #5;
        $finish;
    end
endmodule