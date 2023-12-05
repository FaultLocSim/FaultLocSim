module struct_assert_test;

struct packed
{
  logic a,b;
} s;

assign s.a = 1;
assign s.b = 0;
assign s.c = 1;

endmodule
