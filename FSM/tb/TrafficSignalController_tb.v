`timescale 1ns/1ps

module TrafficSignalController_tb;
    reg clk;
    reg rst;
    wire A_red, A_yellow, A_green_ls, A_green;
    wire B_red, B_yellow, B_green_ls, B_green;
    wire C_red, C_yellow, C_green_ls, C_green;
    wire D_red, D_yellow, D_green_ls, D_green;

TrafficSignalController dut(.clk(clk),
                            .rst(rst),
                            .A_red(A_red),
                            .A_yellow(A_yellow),
                            .A_green_ls(A_green_ls),
                            .A_green(A_green),
                            .B_red(B_red),
                            .B_yellow(B_yellow),
                            .B_green_ls(B_green_ls),
                            .B_green(B_green),
                            .C_red(C_red),
                            .C_yellow(C_yellow),
                            .C_green_ls(C_green_ls),
                            .C_green(C_green),
                            .D_red(D_red),
                            .D_yellow(D_yellow),
                            .D_green_ls(D_green_ls),
                            .D_green(D_green)
                        );
    initial clk=0;
    always #5 clk = ~clk;

    initial 
    begin
        $dumpfile("TrafficSignalController.vcd");
        $dumpvars(0,TrafficSignalController_tb);
        $monitor("Time=%0t | A[G_A=%b G_LS=%b Y=%b R=%b] B[G_A=%b G_LS=%b Y=%b R=%b] C[G_A=%b G_LS=%b Y=%b R=%b] D[G_A=%b G_LS=%b Y=%b R=%b]",
                 $time, A_green,A_green_ls, A_yellow, A_red,
                        B_green,B_green_ls, B_yellow, B_red,
                        C_green,C_green_ls, C_yellow, C_red,
                        D_green,D_green_ls, D_yellow, D_red);
        //start from high reset to force the default state(A_GREEN)
        rst = 1;
        #20;
        rst = 0;
        // Run long enough to see multiple cycles
        #1000;
        $finish;
    end
endmodule