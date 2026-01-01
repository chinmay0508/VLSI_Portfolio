module mux2to1_tb;
reg i1,i2,sel;
wire out;
mux2to1_structural dut(.a(i1),.b(i2), .sel(sel), .out(out));
integer i;
initial 
begin
    $dumpfile("mux2to1_structural.vcd");
    $dumpvars(0,mux2to1_tb);
    for (i = 0; i < 8; i = i + 1) begin
      {i1, i2, sel} = i;
      #5;
      $display("i1=%b i2=%b sel=%b | out=%b",
                i1, i2, sel, out);
    end
    $finish;
  end
endmodule