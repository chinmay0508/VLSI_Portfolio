`timescale 1ns/1ps;
module PE_tb;
reg [7:0] in;
wire [2:0] out;
priorityEncoder8to3 dut(.in(in), .out(out));
initial
begin
$dumpfile("priorityEncoder8to3.vcd");
$dumpvars(0,PE_tb);
$monitor("T=%2d, I=%8b, O=%3b",$time,in,out);
    #5 in=8'b00000000;
    #5 in=8'b00000001;
    #5 in=8'b00000100;
    #5 in=8'b00010001;
    #5 in=8'b00100001;
    #5 in=8'b01010100;
    #5 in=8'b10001001;
    #5 in=8'b11111111;
    #5 $finish;
end
endmodule