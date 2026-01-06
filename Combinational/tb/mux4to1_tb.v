`timescale 1ms/1us
module mux4to1_tb;
    reg [3:0] i;
    reg [1:0] sel;
    wire out;
    mux4to1 dut (.i(i), .sel(sel), .out(out));
    initial 
    begin
        $dumpfile("mux4to1.vcd");
        $dumpvars(0,mux4to1_tb);
        $monitor("Time=%0t | i=%b sel=%b | out=%b",$time, i, sel, out);
        i = 4'b1010;
        sel = 2'b00; #2;
        sel = 2'b01; #2;
        sel = 2'b10; #2;
        sel = 2'b11; #2;
        i = 4'b0101;
        sel = 2'b00; #2;
        sel = 2'b01; #2;
        sel = 2'b10; #2;
        sel = 2'b11; #2;
        $finish;
    end
endmodule