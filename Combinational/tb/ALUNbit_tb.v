`timescale 1ns/1ps;
module ALUNbit_tb;
    parameter N = 8;
    reg [N-1:0] A, B;
    reg [3:0] Sel;
    wire [N-1:0] Y;
    wire Zero, Cout, Borrow;
    ALUNbit #(.N(N)) dut (.A(A), .B(B), .Sel(Sel), .Y(Y), .Zero(Zero), .Cout(Cout), .Borrow(Borrow));
    initial begin
        $dumpfile("ALUNbit.vcd");
        $dumpvars(0, ALUNbit_tb);
        $monitor("Time=%2d  Sel=%4b  A=%d  B=%d  Y=%d  Zero=%b  Cout=%b  Borrow=%b",$time, Sel, A, B, Y, Zero, Cout, Borrow);
        // Test ADD
        A = 8'd15; B = 8'd10; Sel = 4'b0000; #5;
        // Test SUB
        A = 8'd20; B = 8'd25; Sel = 4'b0001; #5;
        // Test AND
        A = 8'b10101010; B = 8'b11001100; Sel = 4'b0010; #5;
        // Test OR
        A = 8'b10101010; B = 8'b11001100; Sel = 4'b0011; #5;
        // Test XOR
        A = 8'b10101010; B = 8'b11001100; Sel = 4'b0100; #5;
        // Test Zero output
        A = 8'd5; B = 8'd5; Sel = 4'b0001; #5; // SUB result should be 0
        // Finish simulation
        #5 $finish;
    end
endmodule