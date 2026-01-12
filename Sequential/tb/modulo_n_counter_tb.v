`timescale 1ns/1ps
module modulo_n_counter_tb;
    parameter N = 10;
    localparam WIDTH = (N > 1) ? $clog2(N) : 1;
    reg clk,rst,en;
    wire [WIDTH-1:0] count;
    wire tc;
    modulo_n_counter #(.N(N)) dut (.clk(clk), .rst(rst), .en(en), .count(count), .tc(tc));
    always #5 clk = ~clk;
    initial begin
        $dumpfile("modulo_n_counter.vcd");
        $dumpvars(0, modulo_n_counter_tb);
        $monitor("T=%0t | clk=%b rst=%b en=%b count=%0d tc=%b",
                  $time, clk, rst, en, count, tc);
        clk = 0;
        rst = 1;
        en  = 0;
        #20 rst = 0;
        #10 en =1 ;
        #(N * 20);
        en = 0;
        #40;
        en = 1;
        #60;
        $finish;
    end
endmodule