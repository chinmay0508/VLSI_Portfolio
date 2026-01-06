`timescale 1ns/1ps
module registerNbit_tb;
reg clk, rst;
reg [7:0] D;
wire [7:0] Q;
registerNbit #(8) DUT (.clk(clk), .rst(rst), .D(D), .Q(Q));
always #5 clk = ~clk; 
initial 
begin
    $dumpfile("registerNbit.vcd");
    $dumpvars(0, registerNbit_tb);
    $monitor("time=%2d clk=%b rst=%b D=%b Q=%b", $time, clk, rst, D, Q);
    clk = 0;
    rst = 1;   
    D   = 8'b00000000;
    #12 rst = 0;          // deassert reset
    #8  D = 8'b10101010;  // load new data
    #10 D = 8'b11110000;  // load another value
    #10 rst = 1;          // assert reset again
    #10 rst = 0;          // deassert reset
    #20 $finish;
end
endmodule