`timescale 1ns/1ps
module decoder3to8_tb;
    reg[2:0] a;
    reg en;
    wire [7:0] y;
    decoder3to8 dut(.in(a), .en(en), .out(y));
    integer i;
    initial 
    begin
        $dumpfile("decoder3to8.vcd");
        $dumpvars(0,decoder3to8_tb);
        en = 0;
        a  = 3'b000;
        #5;
        if (y !== 8'b0000_0000)
            $display("ERROR: en=0, y=%b", y);
        en = 1;
        for (i = 0; i < 8; i = i + 1) begin
            a = i[2:0];
            #5;
            if (y !== (8'b0000_0001 << i)) 
            begin
                $display("ERROR: a=%b y=%b expected=%b",
                          a, y, (8'b0000_0001 << i));
            end
        end
        $finish;
    end
endmodule