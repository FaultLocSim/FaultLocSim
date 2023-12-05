module testbench;
   wire y;
   reg  clk;
   reg [15:0] wire0; // Reducing the size of wire0 to 15 bits seems to fix the output.
   reg        reg1 = 1'h0;
   assign y = reg1;
   initial
     begin
        clk = 1'h0;
        wire0 = 1'h0;
        #10 $finish;
     end
   always #5 clk = ~clk;
   always @(posedge clk) $strobe("%b", y);
   // Problematic line, should assign 1'b0 but assigns 1'bx.
   always @(posedge clk) reg1 <= (wire0 >> {wire0 ~^ 1'b1, wire0});
endmodule
