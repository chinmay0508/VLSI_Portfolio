module UP_TB;
parameter N=8;
reg clk,rst,en;
wire [N-1:0] Q;
sync_upCounterNbit #(.N(N)) dut (.clk(clk), .rst(rst), .en(en), .Q(Q));
initial clk=0;
always #5 clk = ~clk;
initial
begin
    $dumpfile("sync_upCounterNbit.vcd");
    $dumpvars(0,UP_TB);
    $monitor("T=%2d | clk=%b rst=%b en=%b Q=%b",$time, clk, rst, en, Q);
    rst = 1;
    en  = 0;
    #12;
    rst = 0;
    #10 en = 1; //enable counting
    #40;       //count for 4 cycles
    en = 0; // disable counting
    #20;// hold value for 2 cycles
    en = 1;// enable again
    #30;
    $finish;
end
endmodule