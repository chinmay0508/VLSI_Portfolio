//detecting 0110
module MooreSeqDet(
    input clk,
    input rst,
    input data_in,
    output reg data_out
);
parameter s0 =3'b000 ;
parameter s1 =3'b001 ;
parameter s2 =3'b010 ;
parameter s3 =3'b011 ;
parameter s4 =3'b100 ;
reg [2:0]curr,next;
always@(posedge clk)
begin
    if(rst)curr<=s0;
    else curr<=next;
end
always @ (*)
begin
    case(curr)
    s0:
    begin
        if(data_in)
        next=s0;
        else
        next=s1;
    end
    s1:
    begin
        if(data_in)
        next=s2;
        else
        next=s1;
    end
    s2:
    begin
        if(data_in)
        next=s3;
        else
        next=s1;
    end
    s3:
    begin
        if(data_in)
        next=s0;
        else
        next=s4;
    end
    s4:
    begin
        if(data_in)
        next=s2;
        else
        next=s1;
    end
    default:next=s0;
    endcase
end
always @(*) 
begin
        if (curr == s4)
            data_out = 1'b1;
        else
            data_out = 1'b0;
    end
endmodule