module decoder(op, zf, pc_in, pc_we, src0, src1, dst, reg_we, sel1, sel2, data, alu_op, mem_we);
	input [31:0] op;
	input zf;
	output reg [8:0] pc_in;
	output reg pc_we;
	output reg [4:0] src0, src1, dst;
	output reg reg_we;
	output reg sel1, sel2;
	output reg [25:0] data;
	output reg [6:0] alu_op;
	output reg mem_we;

	`include "def.h"

	always @(*) begin
		case (op[31:25])
		//synopsys parallel_case full_case
		AND : begin
			alu_op <= op[31:25];
			dst <= op[14:10];
			src1 <= op[24:20];
			src0 <= op[19:15];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		OR : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		JMP : begin
			alu_op <= 0;
			dst <= 0;
			src1 <= 0;
			src0 <= 0;
			pc_in <= op[9:1];
			pc_we <= 1;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		JNZ : begin
			alu_op <= 0;
			dst <= 0;
			src1 <= 0;
			src0 <= 0;
			pc_in <= op[9:1];
			pc_we <= zf;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end


		LI : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= 0;
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 1;
			sel2 <= 1;
			data <= op[18:0];
			mem_we <= 0;
		end

		CHECK : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		ADD : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		SUB : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_D : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK1 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK2 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK3 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK4 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK5 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK6 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK7 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK8 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK9 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH1 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[14:10];
			src0 <= 0;
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 1;
			sel2 <= 1;
			data <= op[19:15];
			mem_we <= 0;
		end

		CHECK_DEPTH2 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH3 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH4 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH5 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH6 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH7 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH8 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH9 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH10 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH11 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH12 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH13 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_DEPTH14 : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		RIGHT1: begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		RIGHT2: begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		RIGHT4: begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		RIGHT5: begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		RIGHT7: begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		RIGHT8: begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		LEFT2 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		LEFT3 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		LEFT5 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		LEFT6 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		LEFT8 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		LEFT9 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		UP4 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		UP5 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		UP6 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		UP7 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		UP8 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		UP9 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		DOWN1 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		DOWN2 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		DOWN3 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		DOWN4 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		DOWN5 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		DOWN6 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= 0;
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		INPUT_SPACE : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= op[19:15];
			src0 <= 0;
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 1;
			sel2 <= 1;
			data <= op[14:10];
			mem_we <= 0;
		end

		INPUT_MOVEMENT : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		INPUT_TABLE : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		INPUT_TABLE_SPACE : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		CHECK_MOVEMENT : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= 0;
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 1;
			sel2 <= 1;
			data <= op[14:10];
			mem_we <= 0;
		end

		SPACE_MOVEMENT_CHECK : begin
			alu_op <= op[31:25];
			dst <= 0;
			src1 <= op[19:15];
			src0 <= 0;
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 0;
			sel1 <= 1;
			sel2 <= 1;
			data <= op[8:1];
			mem_we <= 0;
		end

		OVERWRITE : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= op[19:15];
			src0 <= 0;
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

		OVERWRITE1 : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= op[19:15];
			src0 <= op[14:10];
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 0;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end

/*		SPACE_MOVEMENT_CHECK : begin
			alu_op <= op[31:25];
			dst <= op[24:20];
			src1 <= op[19:15];
			src0 <= 0;
			pc_in <= 0;
			pc_we <= 0;
			reg_we <= 1;
			sel1 <= 1;
			sel2 <= 1;
			data <= 0;
			mem_we <= 0;
		end*/

		default : begin
			pc_we <= 0;
		end
	
		endcase
	end
endmodule
