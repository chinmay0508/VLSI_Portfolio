module modulo_n_counter(clk,rst,en,count,tc);
    parameter  N = 10;
    parameter integer WIDTH = (N > 1) ? $clog2(N) : 1;
    input clk,rst,en;
    output reg  [WIDTH-1:0]  count;
    output tc;

    assign tc = (count == N-1);

    always @(posedge clk) 
    begin
        if (rst)
            count <= '0;
        else if (en) 
        begin
            if (count == N-1)
                count <= '0;
            else
                count <= count + 1'b1;
        end
    end
endmodule