module zf(clk, rst_n, zf_in, zf_out);
	input clk, rst_n;
	input zf_in;
	output reg zf_out;
	always@(posedge clk)begin
		if(!rst_n) begin
			zf_out <= 0;
		end else begin
			zf_out <= zf_in;
		end
	end
endmodule

