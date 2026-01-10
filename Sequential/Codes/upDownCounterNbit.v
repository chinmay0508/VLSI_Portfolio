module upDown_counter (clk,rst,en,mode,Q,tc_up,tc_down);
    parameter N=8;
    input clk;
    input rst;       // synchronous reset
    input en;        // enable counting
    input mode;      // 1 = count up, 0 = count down
    output reg  [N-1:0] Q;
    output tc_up;    // terminal count for up
    output tc_down;  // terminal count for down

assign tc_up   = (Q == {N{1'b1}}); // max value reached
assign tc_down = (Q == {N{1'b0}}); // zero reached
always @(posedge clk) begin
    if (rst)
        Q <= {N{1'b0}};
    else if (en) begin
        if (mode)
            Q <= Q + 1'b1;    // count up
        else
            Q <= Q - 1'b1;    // count down
    end
end
endmodule