module test;

function func;
input x;

integer i;
reg [5 - 1:0] c[1:0];
begin
        for (i = 0; i < 10; i = i + 1)
                c[-i] = 123;

        func = 0;
end
endfunction

localparam X = func(0);

endmodule
