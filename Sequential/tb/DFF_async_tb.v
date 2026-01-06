module DFF_async_tb;
reg D,clk,rst;
wire Q;
DFF_async DUT(.Q(Q), .D(D), .clk(clk), .rst(rst));
always #5 clk=~clk;
initial
begin
    $dumpfile("DFF_async.vcd");
    $dumpvars(0,DFF_async_tb);
    $monitor("time=%2d, clk=%b, rst=%b, D=%b, Q=%b ",$time,clk,rst,D,Q);
    clk=0;
    D=0;
    rst=1;

    #7 rst = 0;    // deassert reset (before clock edge)
    #8  D = 1;     // set D
    #10 D = 0;     // clear D
    #3  rst = 1;   // assert reset asynchronously
    #4  rst = 0;   // deassert reset

    #20 $finish;
end
endmodule
        