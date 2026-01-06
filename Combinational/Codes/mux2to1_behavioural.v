module mux2to1_behavioural(y,a,b,sel);
    input  a,b,sel;
    output y;
    assign y = sel ? b : a;
endmodule
