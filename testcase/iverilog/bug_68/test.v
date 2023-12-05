typedef struct packed {
   logic b;
} single_bit;

typedef struct packed {
   single_bit b1;
   single_bit b2;
} two_bits;

module simple(input two_bits b2in,
              output two_bits b2out);
   assign b2out.b1.b = b2in.b1.b;
endmodule
