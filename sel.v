module sel(in0,in1,sel,out);
	input sel;
	input[25:0] in0,in1;
	output[25:0] out;
	reg [25:0] out;

	always @(*) begin
		if(sel) out = in0;
		else out = in1;
	end
endmodule
