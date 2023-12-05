module main;
   parameter [3:0] foo = 4'd5;
   localparam [3:0] bar = 7;
   parameter real   PI = 3.14;
   wire [3:0] bat = foo + bar;
   wire real tau = 2.0 * PI;

   initial begin
      $dumpfile("/home/dpc/Documents/project/bug_10/runfile/bin/br_gh156.vcd");
      $dumpvars(0, main);
      #1 $finish;
      
   end
   
endmodule // main
