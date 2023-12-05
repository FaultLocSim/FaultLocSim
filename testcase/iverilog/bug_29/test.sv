typedef struct packed {
    union packed {
        logic[2:0] a;
        logic[2:0] b;
    } u;
} s1;

module top(input s1 inp, output logic out);
    assign out = | inp.u.a;
endmodule
