module Buffer(output Y, input A);

  assign Y = A;
             
  specify
    specparam tpdLH = (0.01:0.01:0.01);
    specparam tpdHL = (0.01:0.01:0.01);
  endspecify
endmodule
  
module Buffer1(output Y, input A);
  Buffer inst(.Y(Y), .A(A));
endmodule
  
module Buffer2(output Y, input A);
  Buffer inst(.Y(Y), .A(A));
endmodule
