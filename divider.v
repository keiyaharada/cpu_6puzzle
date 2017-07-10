module divider(mclk, rst_n, clk);
	input mclk;
	input rst_n;
	output clk;
	reg [1:0] cnt;

	always @(posedge mclk) begin
			if(!rst_n) begin
				cnt <= 2'b0;
			end else begin
				cnt <= cnt + 2'b1;
			end
	end

	assign clk = ~cnt[1];
endmodule
