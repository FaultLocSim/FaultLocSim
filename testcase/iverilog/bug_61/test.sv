module main;

function int bla();
endfunction

int x;

initial begin
    $display("initial x = %d", x);
    $display("trying to force to 'x...");
    x = 'x;
    $display("x = %d", x);
    $display("assigning from function...");
    x = bla();
    $display("x = %d", x);
end
endmodule
