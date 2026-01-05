module comparator2bit(A,B,A_gt_B,A_lt_B,A_eq_B);
input [1:0] A,B;
output reg A_gt_B,A_lt_B,A_eq_B;
always @(*)
begin
    A_gt_B = 1'b0;
    A_eq_B = 1'b0;
    A_lt_B = 1'b0;
    if(A>B)
        A_gt_B=1'b1;
    else if(A<B)
        A_lt_B=1'b1;
    else
        A_eq_B=1'b1;
end
endmodule