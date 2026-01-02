module mux4to1(i,out,sel);
input [3:0]i;
input [1:0] sel;
output reg out;
always @(*)
begin
    case(sel)
    2'b00 :out=i[0];
    2'b01 :out=i[1];
    2'b10 :out=i[2];
    2'b11 :out=i[3];
    default:out=1'bx;
    endcase
end
endmodule