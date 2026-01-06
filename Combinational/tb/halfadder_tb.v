module HA_tb;
reg i1,i2;
wire sum,cout;
halfadder obj(.i1(i1), .i2(i2), .sum(sum), .cout(cout));
initial
begin
    $dumpfile("halfadder.vcd");
    $dumpvars(0,HA_tb);
    $monitor("i1=%b   i2=%b   sum=%b   cout=%b",i1,i2,sum,cout);
    i1=0;i2=0;
    #5 i1=0;i2=1;
    #5 i1=1;i2=0;
    #5 i1=1;i2=1;
    #5 $finish;
end
endmodule