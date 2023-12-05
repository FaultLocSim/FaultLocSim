package P;

  function integer f(integer x);
    return x * 2;
  endfunction

  task t(bit failed);
    if (failed) begin
      $display("FAILED");
    end else begin
      $display("PASSED");
    end
  endtask

endpackage

import P::*;

module test;

  initial begin
    t(f(10) !== 20);
  end

endmodule
