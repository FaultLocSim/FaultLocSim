module test;
   function void fun;
      begin
	 $display("PASSED");
	 $finish;
      end
   endfunction

   always_comb fun;

endmodule
