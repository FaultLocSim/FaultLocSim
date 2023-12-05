module top;

    logic clk = 0;
    int cnt = 0;

    always @(posedge clk) begin
        fork begin
            #(10*2); // Wait 10 clock periods
            $display("End of this process");
            cnt++;
        end
        join_none
    end

    initial begin
        $display("Starting test!");
        #(100*2); // Wait 100 clock periods
        $display("cnt = %d", cnt);
        $finish;
    end
    
    always begin
        #1 clk = ~clk;
    end

endmodule
