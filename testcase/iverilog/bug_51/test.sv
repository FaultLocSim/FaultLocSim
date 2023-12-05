package test_pkg;

  virtual class uvm_void;
  endclass : uvm_void

  class uvm_object extends uvm_void;
    virtual function void print ();
      $display ("Print");
    endfunction : print 
  endclass : uvm_object

  class uvm_report_object extends uvm_object;
    function new ();
      print();
    endfunction : new 
  endclass : uvm_report_object 

  class uvm_component extends uvm_report_object;
  endclass : uvm_component 

endpackage : test_pkg

module m;
  import test_pkg::*;
  uvm_report_object r_0;
  uvm_object u_0;
  uvm_component c_0;
  
   initial begin : test
     #100;
     $display ("Hello World");
     u_0 = new();
     r_0 = new();
     c_0 = new();

     u_0.print();
     r_0.print();
     c_0.print();

   end : test

endmodule : m
