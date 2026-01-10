module shiftRegister_tb;
reg clk,rst,Din;
wire [3:0] Q;
shiftRegister dut(.Din(Din), .clk(clk), .rst(rst), .Q(Q));
always #5 clk=~clk;
initial
begin
    $dumpfile("shiftRegister.vcd");
    $dumpvars(0,shiftRegister_tb);
    $monitor("Din=%b, clk=%b, rst=%b, Q=%b ",Din,clk,rst,Q);
    clk=0;
    rst=1;
    Din=1;
    #8 rst=0;
    #5 Din=0;
    #5 Din=1;
    #5 Din=1;
    #5 Din=1;
    #5 Din=1;
    #5 Din=1;
    #10 $finish;
end
endmodule