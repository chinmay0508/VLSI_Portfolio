module UDC_TB;
    parameter N = 8;
    reg clk, rst, en, mode;
    wire [N-1:0] Q;
    wire tc_up, tc_down;
    upDownCounterNbit #(.N(N)) dut (.clk(clk), .rst(rst), .en(en), .mode(mode), .Q(Q), .tc_up(tc_up), .tc_down(tc_down));
    initial clk = 0;
    always #5 clk = ~clk;
    initial begin
        $dumpfile("upDownCounterNbit.vcd");
        $dumpvars(0, UDC_TB);
        $monitor("T=%2d | clk=%b rst=%b en=%b mode=%b Q=%b tc_up=%b tc_down=%b",$time, clk, rst, en, mode, Q, tc_up, tc_down);
        rst = 1;
        en  = 0;
        mode = 1;
        #10;            
        
        rst = 0;
        #10 en = 1;    

        #50;            
        mode = 0;       
        #50;           

        en = 0;         
        #20;           
        en = 1;         
        #30;            

        $finish;
    end
endmodule