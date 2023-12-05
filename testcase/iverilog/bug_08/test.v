module sub #(parameter WIDTH=8) (
    input [WIDTH-1:0] x [2:0],
    output [WIDTH-1:0] y
);
    assign y = 2 * x[2];
endmodule
module test #(parameter WIDTH=8) (
    input [WIDTH-1:0] t
);
    sub #(.WIDTH(WIDTH)) m1(E[0], E[1]);
    sub #(.WIDTH(WIDTH)) m2(E[1], E[2]);
    sub #(.WIDTH(WIDTH)) m3(E[2], E[3]);
endmodule
