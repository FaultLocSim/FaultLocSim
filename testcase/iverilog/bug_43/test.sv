package ivl_uvm_pkg;
  virtual class uvm_test;
  endclass : uvm_test 
endpackage : ivl_uvm_pkg

package test_pkg;
  import ivl_uvm_pkg::*;
  class sanity_test extends uvm_test;
  endclass : sanity_test 
endpackage : test_pkg


module m;

  import ivl_uvm_pkg::*;
  import test_pkg::*;


endmodule : m
