module DFF_sync(Q,D,clk,rst);
input clk,D,rst;
output reg Q;
always @(posedge clk) begin
    if(rst)
        Q<=1'b0;
    else 
        Q<=D;
end
endmodule