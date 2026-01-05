`timescale 1ns/1ps
module comparator2bit_tb;
reg  [1:0] A;
reg  [1:0] B;
wire A_gt_B,A_lt_B,A_eq_B;
comparator2bit dut (.A(A), .B(B), .A_gt_B(A_gt_B), .A_lt_B(A_lt_B), .A_eq_B(A_eq_B));
initial 
    begin
        $dumpfile("comparator2bit.vcd");
        $dumpvars(0, comparator2bit_tb);
        $monitor("T=%0t | A=%b B=%b | GT=%b EQ=%b LT=%b",
                 $time, A, B, A_gt_B, A_eq_B, A_lt_B);
        A = 2'b00; B = 2'b00; #5;
        A = 2'b00; B = 2'b01; #5;
        A = 2'b00; B = 2'b10; #5;
        A = 2'b00; B = 2'b11; #5;

        A = 2'b01; B = 2'b00; #5;
        A = 2'b01; B = 2'b01; #5;
        A = 2'b01; B = 2'b10; #5;
        A = 2'b01; B = 2'b11; #5;

        A = 2'b10; B = 2'b00; #5;
        A = 2'b10; B = 2'b01; #5;
        A = 2'b10; B = 2'b10; #5;
        A = 2'b10; B = 2'b11; #5;

        A = 2'b11; B = 2'b00; #5;
        A = 2'b11; B = 2'b01; #5;
        A = 2'b11; B = 2'b10; #5;
        A = 2'b11; B = 2'b11; #5;
        $finish;
    end
endmodule