`timescale 1ns/1ps
module MooreSeqDet_tb;
    reg clk;
    reg rst;
    reg data_in;
    wire data_out;

    MooreSeqDet dut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .data_out(data_out)
    );
    always #5 clk = ~clk;
    initial begin
        $dumpfile("MooreSeqDet.vcd");
        $dumpvars(0,MooreSeqDet_tb);
        $monitor("T=%0t | data_in=%b | data_out=%b",
                  $time, data_in, data_out);
        clk = 0;
        rst = 1;
        data_in = 0;

        #10;
        rst = 0;

        // Input: 0110
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 1;
        #10 data_in = 0;

        // Overlapping part: 110
        #10 data_in = 1;
        #10 data_in = 1;
        #10 data_in = 0;

        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 1;
        #10 data_in = 0;

        #10;
        $finish;
    end
    // Monitor signals
    initial begin
        
    end

endmodule