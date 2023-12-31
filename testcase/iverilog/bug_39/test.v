module test #(parameter int foo = 8, parameter int bar = 2, parameter int math = bar * foo) (output reg [7:0] val);

   initial val = math;

   initial begin
      $display("foo=%0d", foo);
      $display("bar=%0d", bar);
      $display("math=%0d", math);
   end
endmodule // test
