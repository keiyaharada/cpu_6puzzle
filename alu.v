module alu(in0, in1, op, zf, out);
	input [25:0] in0, in1;
	input [6:0] op;
	output reg zf;
	output reg [25:0] out;
	`include "def.h"

	always @(*) begin
		case(op)
			AND : begin
				out <= in0 & in1;
				zf <= 0;
			end
			OR : begin
				out <= in0 | in1;
				zf <= 0;
			end 
			ADD : begin
				out <= in0 + in1;
				zf <= 0;
			end
			SUB : begin
				out <= (in0>in1) ? in0 - in1 : in1 - in0;
				zf <= 0;
			end
			INC : begin
				out <= in0 + 1;
				zf <= 0;
			end
			DEC : begin
				out <= in0 - 1;
				zf <= 0;
			end
			/*COMP : begin
				zf <= (in0 == in1) ? 1:0;
			end*/
			CHECK : begin
				zf <= (in0 == in1) ? 1:0;
			end
			LOAD : begin
				out <= in0;
				zf <= 0;
			end
			STORE : begin
				out <= in0;
				zf <= 0;
			end
			LI : begin
				out <= in0;
				zf <= 0;
			end
			INPUT_SPACE : begin
				out <= {in1[25:8], in0[3:0], in1[3:0]};
				zf <= 0;
			end
			INPUT_MOVEMENT : begin
				out <= {in1[25:4], in0[3:0]};
				zf <= 0;
			end
			INPUT_TABLE : begin
				out <= {in1[17:0], in0[7:0]};
				zf <= 0;
			end
			INPUT_TABLE_SPACE : begin
				out <= {in0[25:8], in1[7:4], in0[3:0]};
				zf <= 0;
			end
			OVERWRITE : begin
				out <= in1;
				zf <= 0;
			end
			OVERWRITE1 : begin
				out <= {in0[25:18], in1[25:8]};
				zf <= 0;
			end
			CHECK1 : begin
				zf <= {in0[17:15] == in1[2:0]} ? 1:0 ;
			end
			CHECK2 : begin
				zf <= (in0[14:12] == in1[2:0]) ? 1:0 ;
			end
			CHECK3 : begin
				zf <= (in0[11:9] == in1[2:0]) ? 1:0 ;
			end
			CHECK4 : begin
				zf <= (in0[8:6] == in1[2:0]) ? 1:0 ;
			end
			CHECK5 : begin
				zf <= (in0[5:3] == in1[2:0]) ? 1:0 ;
			end
			CHECK6 : begin
				zf <= (in0[2:0] == in1[2:0]) ? 1:0 ;
			end
			/*
			CHECK7 : begin
				zf <= (in0[11:8] == in1[11:8]) ? 1:0 ;
			end
			CHECK8 : begin
				zf <= (in0[7:4] == in1[7:4]) ? 1:0 ;
			end
			CHECK9 : begin
				zf <= (in0[3:0] == in1[3:0]) ? 1:0 ;
			end
			*/
			CHECK_D : begin
				zf <= (in0[25:8] == in1[17:0]) ? 1:0 ;
			end
			RIGHT1 : begin
				out <= {in0[25:18], in0[14:12], in0[17:15], in0[11:0]};
				zf <= 0;
			end
			RIGHT2 : begin
				out <= {in0[25:18], in0[17:15], in0[11:9], in0[14:12], in0[8:0]};
				zf <= 0;
			end
			RIGHT4 : begin
				out <= {in0[25:18], in0[17:9], in0[5:3], in0[8:6], in0[2:0]};
				zf <= 0;
			end
			RIGHT5 : begin
				out <= {in0[25:18], in0[17:6], in0[2:0], in0[5:3]};
				zf <= 0;
			end
			/*
			RIGHT7 : begin
				out <= {in0[43:36], in0[35:12], in0[7:4], in0[11:8], in0[3:0]};
				zf <= 0;
			end
			RIGHT8 : begin
				out <= {in0[43:36], in0[35:8], in0[3:0], in0[7:4]};
				zf <= 0;
			end
			*/
			LEFT3 : begin
				out <= {in0[25:18], in0[17:15], in0[11:9], in0[14:12], in0[8:0]};
				zf <= 0;
			end
			LEFT2 : begin
				out <= {in0[25:18], in0[14:12], in0[17:15], in0[11:0]};
				zf <= 0;
			end
			LEFT5 : begin
				out <= {in0[25:18], in0[17:9], in0[5:3], in0[8:6], in0[2:0]};
				zf <= 0;
			end
			LEFT6 : begin
				out <= {in0[25:18], in0[17:6], in0[2:0], in0[5:3]};
				zf <= 0;
			end
			/*
			LEFT8 : begin
				out <= {in0[43:36], in0[35:12], in0[7:4], in0[11:8], in0[3:0]};
				zf <= 0;
			end
			LEFT9 : begin
				out <= {in0[43:36], in0[35:8], in0[3:0], in0[7:4]};
				zf <= 0;
			end
			*/
			UP4 : begin
				out <= {in0[25:18], in0[8:6], in0[14:9], in0[17:15], in0[5:0]};
				zf <= 0;
			end
			UP5 : begin
				out <= {in0[25:18], in0[17:15], in0[5:3], in0[11:6], in0[14:12], in0[2:0]};
				zf <= 0;
			end
			UP6 : begin
				out <= {in0[25:18], in0[17:12], in0[2:0], in0[8:3], in0[11:9]};
				zf <= 0;
			end
			/*
			UP7 : begin
				out <= {in0[43:36], in0[35:24], in0[11:8], in0[19:12], in0[23:20], in0[7:0]};
				zf <= 0;
			end
			UP8 : begin
				out <= {in0[43:36], in0[35:20], in0[7:4], in0[15:8], in0[19:16], in0[3:0]};
				zf <= 0;
			end
			UP9 : begin
				out <= {in0[43:36], in0[35:16], in0[3:0], in0[11:4], in0[15:12]};
				zf <= 0;
			end
			*/
			DOWN1 : begin
				out <= {in0[25:18], in0[8:6], in0[14:9], in0[17:15], in0[5:0]};
				zf <= 0;
			end
			DOWN2 : begin
				out <= {in0[25:18], in0[17:15], in0[5:3], in0[11:6], in0[14:12], in0[2:0]};
				zf <= 0;
			end
			DOWN3 : begin
				out <= {in0[25:18], in0[17:12], in0[2:0], in0[8:3], in0[11:9]};
				zf <= 0;
			end
			/*
			DOWN4 : begin
				out <= {in0[43:36], in0[35:24], in0[11:8], in0[19:12], in0[23:20], in0[7:0]};
				zf <= 0;
			end
			DOWN5 : begin
				out <= {in0[43:36], in0[35:20], in0[7:4], in0[15:8], in0[19:16], in0[3:0]};
				zf <= 0;
			end
			DOWN6 : begin
				out <= {in0[43:36], in0[35:16], in0[3:0], in0[11:4], in0[15:12]};
				zf <= 0;
			end
			*/
			CHECK_DEPTH1 : begin
				zf <= (in0[4:0] == in1[4:0]) ? 1:0 ;
			end
			/*
			CHECK_DEPTH2 : begin
				zf <= (in0[35:32] == in1[31:28]) ? 1:0 ;
			end
			CHECK_DEPTH3 : begin
				zf <= (in0[35:32] == in1[27:24]) ? 1:0 ;
			end
			CHECK_DEPTH4 : begin
				zf <= (in0[35:32] == in1[23:20]) ? 1:0 ;
			end
			CHECK_DEPTH5 : begin
				zf <= (in0[35:32] == in1[19:16]) ? 1:0 ;
			end
			CHECK_DEPTH6 : begin
				zf <= (in0[35:32] == in1[15:12]) ? 1:0 ;
			end
			CHECK_DEPTH7 : begin
				zf <= (in0[35:32] == in1[11:8]) ? 1:0 ;
			end
			CHECK_DEPTH8 : begin
				zf <= (in0[35:32] == in1[7:4]) ? 1:0 ;
			end
			CHECK_DEPTH9 : begin
				zf <= (in0[35:32] == in1[3:0]) ? 1:0 ;
			end
			CHECK_DEPTH10 : begin
				zf <= (in0[35:32] == in1[35:32]) ? 1:0 ;
			end
			CHECK_DEPTH11 : begin
				zf <= (in0[35:32] == in1[31:28]) ? 1:0 ;
			end
			CHECK_DEPTH12 : begin
				zf <= (in0[35:32] == in1[27:24]) ? 1:0 ;
			end
			CHECK_DEPTH13 : begin
				zf <= (in0[35:32] == in1[23:20]) ? 1:0 ;
			end
			CHECK_DEPTH14 : begin
				zf <= (in0[35:32] == in1[19:16]) ? 1:0 ;
			end
			CHECK_DEPTH15 : begin
				zf <= (in0[35:32] == in1[15:12]) ? 1:0 ;
			end
			CHECK_DEPTH16 : begin
				zf <= (in0[35:32] == in1[11:8]) ? 1:0 ;
			end
			*/
			CHECK_MOVEMENT : begin
				zf <= (in0[3:0] == in1[3:0]) ? 1:0 ;
			end
			SPACE_MOVEMENT_CHECK : begin
				zf <= (in0[7:0] == in1[7:0]) ? 1:0 ;
			end
			default : begin
				out <= out;
			end
		endcase
	end
endmodule
