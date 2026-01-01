module logicgates(i1,i2,o1,o2,o3,o4,o5,o6,o7);
input i1,i2;
output o1,o2,o3,o4,o5,o6,o7;
assign o1 = i1 & i2;
assign o2 = i1 | i2;
assign o3 = ~i1;
assign o4 = i1 ^ i2;
assign o5 = ~(i1 ^ i2);
assign o6 = ~(i1 & i2);
assign o7 = ~(i1 | i2);
endmodule