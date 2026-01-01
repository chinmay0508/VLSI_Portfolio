module FA_tb;
reg i1,i2,cin;
wire sum,cout;
fulladder d(.A(i1),.B(i2), .Cin(cin), .Cout(cout), .Sum(sum));
integer i;
initial 
begin
    for (i = 0; i < 8; i = i + 1) begin
      {i1, i2, cin} = i;
      #5;
      $display("i1=%b i2=%b cin=%b | sum=%b cout=%b",
                i1, i2, cin, sum, cout);
    end
    $finish;
  end
endmodule