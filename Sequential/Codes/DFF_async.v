module DFF_async(Q,D,clk,rst);
input clk,D,rst;
output reg Q;
always @(posedge clk or posedge rst ) begin
    if(rst)
        Q<=1'b0;
    else 
        Q<=D;
end
endmodule