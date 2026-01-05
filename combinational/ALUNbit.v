module ALUNbit(A,B,Sel,Y,Zero,Cout,Borrow);
parameter N=8;
input [N-1:0] A,B;
input [3:0] Sel;
output reg [N-1:0] Y;
output reg Zero,Cout,Borrow;
always @(*)
begin
    case (Sel)
        4'b0000: begin{Cout,Y}=A+B;Borrow=0;end      //Addition 0000
        4'b0001: begin
            Y=A-B;
            Cout=0;                                  //Subtraction 0001
            Borrow= (A<B)?1:0;end 
        4'b0010: begin Y=A&B;Cout=0;Borrow=0;end     //bitwise AND
        4'b0011: begin Y=A|B;Cout=0;Borrow=0;end     //bitwise OR
        4'b0100: begin Y=A^B;Cout=0;Borrow=0;end     //bitwise XOR
        default: begin Y=0;Cout=0;Borrow=0;end 
    endcase
    Zero=(Y==0)? 1'b1:1'b0;
end
endmodule