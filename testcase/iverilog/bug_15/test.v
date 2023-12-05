module test(input clk, input rst, input a, output reg [1:0] state);
    reg [1:0] next_state;
    reg [3:0] pos;
    reg [3:0] next_pos;

    always @(*) begin
        next_state = state;
       if(a) begin
           next_state = '0;
       end
    end
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            state <= '1;
        end else begin
            state <= next_state;
            pos <= next_pos;
        end
    end
endmodule
