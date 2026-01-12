module  (clk,rst,en,mode,Q,tc_up,tc_down);
    parameter N=8;
    input clk;
    input rst;    
    input en;   
    input mode;      // 1 = up, 0 = down
    output reg  [N-1:0] Q;
    output tc_up;    // terminal count for up
    output tc_down;  // terminal count for down

    assign tc_up   = (Q == {N{1'b1}}); // max value reached
    assign tc_down = (Q == {N{1'b0}}); // zero reached
    always @(posedge clk) 
    begin
        if (rst)
            Q <= '0;
        else if (en) 
        begin
            if (mode)
                Q <= Q + 1'b1;  
            else
                Q <= Q - 1'b1;   
        end
    end
endmodule