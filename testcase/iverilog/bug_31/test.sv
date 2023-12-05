package pkg1;

typedef enum logic [1:0]
{
R0 = 2'b00,
R1 = 2'b01,
R2 = 2'b10,
R3 = 2'b11
} reg_t;

endpackage

module test
(input pkg1::reg_t r1);

import pkg1::*;

reg_t r2;

always_comb
r2 = r1;

endmodule

