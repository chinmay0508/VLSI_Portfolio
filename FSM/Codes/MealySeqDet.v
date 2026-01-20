module MealySeqDet(
    input clk,
    input rst,
    input data_in,
    output reg data_out
);
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
    reg [1:0] curr, next;

    always @(posedge clk) begin
        if (rst)
            curr <= S0;
        else
            curr <= next;
    end

    always @(*) begin
        data_out = 0; 
        case(curr)
            S0: 
            begin
                if(data_in == 0)
                next = S1;
                else
                next = S0;
            end

            S1: 
            begin
                if(data_in == 0)
                next = S1;
                else
                next = S2;
            end

            S2: 
            begin
                if(data_in == 0)
                next = S1;
                else
                next = S3;
            end

            S3: 
            begin
                if(data_in == 0) 
                begin
                next = S1;      
                data_out = 1;  
                end else
                next = S0;      
            end
            default: next = S0;
        endcase
    end
endmodule