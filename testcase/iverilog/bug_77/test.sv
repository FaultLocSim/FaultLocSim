module bug;

reg [4:0] a = 'b0;
initial begin
    foreach(a[i])
        $display("Value of a[%0d]=%0d",i,a[i]);
end

endmodule
