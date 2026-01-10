module DFF(D,clk,rst,Q);
input D,clk,rst;
output reg Q;
always @(posedge clk)
begin
    if(rst)Q<=1'b0;
    else Q<=D;
end
endmodule
module shiftRegister(Din,clk,rst,Q);
input Din,clk,rst;
output [3:0] Q;
DFF one(Din,clk,rst,Q[0]);
DFF two(Q[0],clk,rst,Q[1]);
DFF three(Q[1],clk,rst,Q[2]);
DFF four(Q[2],clk,rst,Q[3]);
endmodule