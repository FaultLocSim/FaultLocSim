`timescale 1ns/1ns

module hct74245(
  input dir,
  input nOE,
  inout [7:0] A,
  inout [7:0] B,
  output [7:0] C
);


  specify
    (A *> C) = 100;
    (A *> B) = 10;
    (B *> A) = 10;
    (dir *> A) = 16;
    (dir *> B) = 16;
    (nOE *> A) = 16;
    (nOE *> B) = 16;
  endspecify

  assign A=nOE? 8'bzzzzzzzz : dir?8'bzzzzzzzz:B;
  assign B=nOE? 8'bzzzzzzzz : dir?A:8'bzzzzzzzz;
  assign C=A;

endmodule: hct74245

`timescale 1ns/1ns

module tb();

  tri [7:0]A;
  tri [7:0]B;

  tri [7:0]C;

  logic [7:0] Vb=8'b00000000;
  logic [7:0] Va=8'b11111111;

  logic dir;
  logic nOE;

  assign B=Vb;
  assign A=Va;

  hct74245 buf245(.A, .B, .dir, .nOE);

  integer timer;

  initial begin
    $display("disable output , set dir a->b");
    dir <= 1; // A->B
    nOE <= 1;
    Va=8'b11111111;
    Vb=8'bzzzzzzzz;

    #50

    $display("enable output - B will change immediately");

    timer=$time;
    nOE <= 0;
    wait(B === 8'b11111111);
    if ($time - timer < 16)
      $display("%6d", $time, " ERROR TOO QUICK - EXPECTED nOE->B = 16ns - BUT TOOK %-d", ($time - timer));
    else
      $display("%6d", $time, " OK %-d", ($time - timer));


    #50


    $display("change A - B will change immediately (but C is delayed as expected by 100)");

    Va=8'b00000000;

    timer=$time;
    nOE <= 0;
    wait(B === 8'b00000000);
    if ($time - timer < 10)
      $display("%6d", $time, " ERROR TOO QUICK - EXPECTED A->B = 10ns - BUT TOOK %-d", ($time - timer));
    else
      $display("%6d", $time, " OK - TOOK %-d", ($time - timer));

  end
endmodule
