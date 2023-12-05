module  interp1d_tb ();
    reg clk;

    initial begin
        clk = 0;

        forever begin
            #1;
            clk = ~clk;
        end
    end


    real lut_values[1:0];
    assign lut_values[0] = 1;
    assign lut_values[1] = 2;

    wire[8-1:0] lut2_addr;
    reg[8-1:0] lut2_out;

    always @(posedge clk) begin
        lut2_out <= lut_values[lut2_addr];
    end


    always begin
        #1 

        $finish();
    end



    assign lut2_addr = 3; 
endmodule
