module top;
    function automatic [2:0] f;
        input [2:0] i;
        begin
            f[0] = i[0];
            f[3] = i[3];
            f[3:2] = i[3:2];
        end
    endfunction
    localparam C = f(3'b110);
    initial $display("C %b", C);
endmodule
