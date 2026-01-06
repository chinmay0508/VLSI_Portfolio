module mux2to1_structural(a,b,sel,out);
input a,b,sel;
output out;
wire selbar,w1,w2;
not(selbar,sel);
and(w1,a,selbar);
and(w2,b,sel);
or(out,w1,w2);
endmodule