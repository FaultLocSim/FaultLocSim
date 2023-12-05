module urandom_bug;

reg [32:0] something;

initial begin
	repeat(100) begin
`ifdef MAX_32_RANGE
		something = $urandom_range(32'hffff_ffff, 32'h0);
`else
		something = $urandom_range(32'hfff_ffff, 32'h0);
`endif
		$display("%h", something);
		#10;
	end
end

endmodule
