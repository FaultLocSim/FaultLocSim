module m(y, a);
  output logic  [7:0] y;
  input  wire  [39:0] a;

  logic [3:0][9:0] t;

  assign t = a; 

  assign y = t[2][9 -:8];  
endmodule
