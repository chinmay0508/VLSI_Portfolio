module sync_upCounterNbit(clk,rst,en,Q);
parameter N = 8;
input clk,rst,en;
output reg  [N-1:0] Q;
always @(posedge clk) 
begin
    if (rst)
        Q <= {N{1'b0}};
    else if (en)
        Q <= Q + 1'b1;
    else
        Q <= Q;   
end
endmodule