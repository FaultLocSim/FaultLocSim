module test;

  reg failed = 1'b0;

  `define check(val, exp) \
    if (exp !== val) begin \
      $display("FAILED. Got %b, expected %b.", val, exp); \
      failed = 1'b1; \
    end

  integer i;

  function reg [3:0] f(input reg unused);
  begin

    f = 'hx;
    f[2:1] = 2'b10;
    `check(f, 4'bx10x)

    f = 'hx;
    f[4:-1] = 6'b101010;
    `check(f, 4'b0101)

    f = 'hx;
    f[0:-1] = 2'b10;
    `check(f, 4'bxxx1)

    f = 'hx;
    f[4:3] = 2'b01;
    `check(f, 4'b1xxx)

    f = 'hx;
    f[-1:-2] = 2'b11;
    `check(f, 4'bxxxx)

    f = 'hx;
    f[6:5] = 2'b11;
    `check(f, 4'bxxxx)


    i = 1;
    f = 'hx;
    f[i+:2] = 2'b10;
    `check(f, 4'bx10x)

    i = -1;
    f = 'hx;
    f[i+:6] = 6'b101010;
    `check(f, 4'b0101)

    i = -1;
    f = 'hx;
    f[i+:2] = 2'b10;
    `check(f, 4'bxxx1)

    i = 3;
    f = 'hx;
    f[i+:2] = 2'b01;
    `check(f, 4'b1xxx)

    i = -2;
    f = 'hx;
    f[i+:2] = 2'b11;
    `check(f, 4'bxxxx)


    i = 5;
    f = 'hx;
    f[i+:2] = 2'b11;
    `check(f, 4'bxxxx)

    i = 'hx;
    f = 'hx;
    f[i+:2] = 2'b11;
    `check(f, 4'bxxxx)
  end
  endfunction

  reg [3:0] x;

  initial begin
    x = f(1'b0);

    if (!failed) begin
      $display("PASSED");
    end
  end

endmodule

