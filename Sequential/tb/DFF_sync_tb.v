module DFF_sync_tb;
reg D,clk,rst;
wire Q;
DFF_sync DUT(.Q(Q), .D(D), .clk(clk), .rst(rst));
always #5 clk=~clk;
initial
begin
    $dumpfile("DFF_sync.vcd");
    $dumpvars(0,DFF_sync_tb);
    $monitor("time=%2d, clk=%b, rst=%b, D=%b, Q=%b ",$time,clk,rst,D,Q);
    clk=0;
    D=0;
    rst=1;

    #12 rst = 0;   // deassert reset (not on edge)
    #8  D = 1;
    #10 D = 0;

    #10 rst = 1;   // assert reset
    #10 rst = 0;

    #20 $finish;
end
endmodule