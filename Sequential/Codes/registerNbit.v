module registerNbit(Q,D,clk,rst);
parameter N = 8;
input clk,rst;
input [N-1:0] D;
output reg [N-1:0] Q;
always @(posedge clk)
begin
    if(rst)
        Q<={N{1'b0}};
    else
        Q<=D;
end
endmodule