module adderNbit(A,B,Sum,Cout);
parameter N = 8;
input [N-1:0] A,B;
output reg [N-1:0] Sum;
output reg Cout;
always @(*) 
begin
    {Cout,Sum}=A+B;
end
endmodule