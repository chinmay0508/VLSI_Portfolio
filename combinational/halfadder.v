module halfadder(i1,i2,sum,cout);
input i1,i2;
output sum,cout;
assign sum = i1 ^ i2;
assign cout = i1 & i2;
endmodule
module fulladdder()
endmodule