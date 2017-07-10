module imem(pc, op);
	input wire[8:0] pc;
	output reg [31:0] op;

	`include "def.h"

parameter[4:0]  START = 5'd0,
				GOAL = 5'd1,
				DEPTH = 5'd2,
				CHECK_SPACE = 5'd3,
				CHECK_DEPTHREF1 = 5'd4,
				MOVEMENT20 = 5'd5,
				MOVEMENT1 = 5'd6,
				MOVEMENT2 = 5'd7,
				MOVEMENT3 = 5'd8,
				MOVEMENT4 = 5'd9,
				MOVEMENT5 = 5'd10,
				MOVEMENT6 = 5'd11,
				MOVEMENT7 = 5'd12,
				MOVEMENT8 = 5'd13,
				MOVEMENT9 = 5'd14,
				MOVEMENT10 = 5'd15,
				MOVEMENT11 = 5'd16,
				MOVEMENT12 = 5'd17,
				MOVEMENT13 = 5'd18,
				MOVEMENT14 = 5'd19,
				MOVEMENT15 = 5'd20,
				MOVEMENT16 = 5'd21,
				MOVEMENT17 = 5'd22,
				MOVEMENT18 = 5'd23,
				MOVEMENT19 = 5'd24,
				STATE_MOVEMENT = 5'd25,
				ADD1 = 5'd26,
				ADD1_M = 5'd27,
				CLEAR = 5'd28,
				TMP = 5'd29,
				COMP = 5'd30,
				ORDER = 5'd31,

				//static numaber
				NO1 = 5'd0,
				NO2 = 5'd1,
				NO3 = 5'd2,
				NO4 = 5'd3,
				NO5 = 5'd4,
				NO6 = 5'd5,
				NO7 = 5'd6,
				NO8 = 5'd7,
				NO9 = 5'd8;



parameter[8:0]  BEGINNING = 0,
				FIND_SPACE = 3,
				WRITE1 = 15,
				WRITE2 = 17,
				WRITE3 = 19,
				WRITE4 = 21,
				WRITE5 = 23,
				WRITE6 = 25,
				DEPTH_CHECK = 27,
				INPUT_TABLE_SPACE1 = 69,
				INPUT_TABLE_SPACE2 = 72,
				INPUT_TABLE_SPACE3 = 75,
				INPUT_TABLE_SPACE4 = 78,
				INPUT_TABLE_SPACE5 = 81,
				INPUT_TABLE_SPACE6 = 84,
				INPUT_TABLE_SPACE7 = 87,
				INPUT_TABLE_SPACE8 = 90,
				INPUT_TABLE_SPACE9 = 93,
				INPUT_TABLE_SPACE10 = 96,
				INPUT_TABLE_SPACE11 = 99,
				INPUT_TABLE_SPACE12 = 102,
				INPUT_TABLE_SPACE13 = 105,
				INPUT_TABLE_SPACE14 = 108,
				INPUT_TABLE_SPACE15 = 111,
				INPUT_TABLE_SPACE16 = 114,
				INPUT_TABLE_SPACE17 = 117,
				INPUT_TABLE_SPACE18 = 120,
				INPUT_TABLE_SPACE19 = 123,
				INPUT_TABLE_SPACE20 = 126,
				MOVEMENT_CHECK1 = 129,
				MOVEMENT_CHECK2 = 134,
				MOVEMENT_CHECK3 = 139,
				MOVEMENT_CHECK4 = 144,
				MOVEMENT_CHECK5 = 149,
				MOVEMENT_CHECK6 = 154,
				MOVEMENT_CHECK7 = 159,
				MOVEMENT_CHECK8 = 164,
				MOVEMENT_CHECK9 = 169,
				MOVEMENT_CHECK10 = 174,
				MOVEMENT_CHECK11 = 179,
				MOVEMENT_CHECK12 = 184,
				MOVEMENT_CHECK13 = 189,
				MOVEMENT_CHECK14 = 194,
				MOVEMENT_CHECK15 = 199,
				MOVEMENT_CHECK16 = 204,
				MOVEMENT_CHECK17 = 209,
				MOVEMENT_CHECK18 = 214,
				MOVEMENT_CHECK19 = 219,
				MOVEMENT_CHECK20 = 224,
				SPACE_MOVEMENT_CHECK_REF = 229,
				RIGHT_REF1 = 277,
				RIGHT_REF2 = 279,
				RIGHT_REF4 = 281,
				RIGHT_REF5 = 283,
				LEFT_REF2 = 285,
				LEFT_REF3 = 287,
				LEFT_REF5 = 289,
				LEFT_REF6 = 291,
				UP_REF4 = 293,
				UP_REF5 = 295,
				UP_REF6 = 297,
				DOWN_REF1 = 299,
				DOWN_REF2 = 301,
				DOWN_REF3 = 303,
				DEPTH_ADD = 305,
				JMP_BEGINNING = 347,
				UNMOVE_20 = 348,
				UNMOVE_100_1 = 427,
				UNMOVE_100_2 = 351,
				UNMOVE_100_3 = 355,
				UNMOVE_100_4 = 359,
				UNMOVE_100_5 = 363,
				UNMOVE_100_6 = 367,
				UNMOVE_100_7 = 371,
				UNMOVE_100_8 = 375,
				UNMOVE_100_9 = 379,
				UNMOVE_100_10 = 383,
				UNMOVE_100_11 = 387,
				UNMOVE_100_12 = 391,
				UNMOVE_100_13 = 395,
				UNMOVE_100_14 = 399,
				UNMOVE_100_15 = 403,
				UNMOVE_100_16 = 407,
				UNMOVE_100_17 = 411,
				UNMOVE_100_18 = 415,
				UNMOVE_100_19 = 419,
				UNMOVE_100_20 = 423,
				STORE1 = 427,
				CMP = 427,
				STORE2 = 429;




	always @(pc) begin
		case (pc)
		//CHECK_BEGINNING
		0 : begin
			op[31:25] <= CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= START;
			op[14:10] <= GOAL;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		1 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= CMP;
			op[0] <= 1'b0;
		end
		2 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//FIND_SPACE
		3 : begin
			op[31:25] <= CHECK1;
			op[24:20] <= 5'b0;
			op[19:15] <= CHECK_SPACE;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		4 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= WRITE1;
			op[0] <= 1'b0;
		end
		5 : begin
			op[31:25] <= CHECK2;
			op[24:20] <= 5'b0;
			op[19:15] <= CHECK_SPACE;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		6 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= WRITE2;
			op[0] <= 1'b0;
		end
		7 : begin
			op[31:25] <= CHECK3;
			op[24:20] <= 5'b0;
			op[19:15] <= CHECK_SPACE;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		8 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= WRITE3;
			op[0] <= 1'b0;
		end
		9 : begin
			op[31:25] <= CHECK4;
			op[24:20] <= 5'b0;
			op[19:15] <= CHECK_SPACE;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		10 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= WRITE4;
			op[0] <= 1'b0;
		end
		11 : begin
			op[31:25] <= CHECK5;
			op[24:20] <= 5'b0;
			op[19:15] <= CHECK_SPACE;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		12 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= WRITE5;
			op[0] <= 1'b0;
		end
		13 : begin
			op[31:25] <= CHECK6;
			op[24:20] <= 5'b0;
			op[19:15] <= CHECK_SPACE;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		14 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= WRITE6;
			op[0] <= 1'b0;
		end
		//WRITE1
		15 : begin
			op[31:25] <= INPUT_SPACE;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= NO1;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		16 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		//WRITE2
		17 : begin
			op[31:25] <= INPUT_SPACE;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= NO2;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		18 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		//WRITE3
		19 : begin
			op[31:25] <= INPUT_SPACE;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= NO3;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		20 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		//WRITE4
		21 : begin
			op[31:25] <= INPUT_SPACE;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= NO4;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		22 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		//WRITE5
		23 : begin
			op[31:25] <= INPUT_SPACE;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= NO5;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		24 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		//WRITE6
		25 : begin
			op[31:25] <= INPUT_SPACE;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= NO6;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		26 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		//DEPTH_CHECK
		27 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd0;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		28 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE1;
			op[0] <= 1'b0;
		end
		29 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		30 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE2;
			op[0] <= 1'b0;
		end
		31 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd2;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		32 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE3;
			op[0] <= 1'b0;
		end
		33 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd3;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		34 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE4;
			op[0] <= 1'b0;
		end
		35 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd4;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		36 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE5;
			op[0] <= 1'b0;
		end
		37 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd5;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		38 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE6;
			op[0] <= 1'b0;
		end
		39 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd6;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		40 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE7;
			op[0] <= 1'b0;
		end
		41 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd7;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		42 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE8;
			op[0] <= 1'b0;
		end
		43 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd8;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		44 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE9;
			op[0] <= 1'b0;
		end
		45 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd9;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		46 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE10;
			op[0] <= 1'b0;
		end
		47 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd10;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		48 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE11;
			op[0] <= 1'b0;
		end
		49 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd11;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		50 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE12;
			op[0] <= 1'b0;
		end
		51 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd12;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		52 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE13;
			op[0] <= 1'b0;
		end
		53 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd13;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		54 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE14;
			op[0] <= 1'b0;
		end
		55 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd14;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		56 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE15;
			op[0] <= 1'b0;
		end
		57 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd15;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		58 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE16;
			op[0] <= 1'b0;
		end
		59 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd16;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		60 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE17;
			op[0] <= 1'b0;
		end
		61 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd17;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		62 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE18;
			op[0] <= 1'b0;
		end
		63 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd18;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		64 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE19;
			op[0] <= 1'b0;
		end
		65 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd19;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		66 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= INPUT_TABLE_SPACE20;
			op[0] <= 1'b0;
		end
		67 : begin
			op[31:25] <= CHECK_DEPTH1;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'd20;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		68 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_20;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE1
		69 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT1;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT1;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		70 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT1;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT1;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		71 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK1;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE2
		72 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT2;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT2;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		73 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT2;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT2;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		74 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK2;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE3
		75 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT3;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT3;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		76 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT3;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT3;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		77 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK3;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE4
		78 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT4;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT4;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		79 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT4;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT4;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		80 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK4;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE5
		81 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT5;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT5;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		82 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT5;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT5;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		83 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK5;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE6
		84 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT6;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT6;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		85 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT6;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT6;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		86 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK6;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE7
		87 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT7;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT7;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		88 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT7;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT7;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		89 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK7;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE8
		90 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT8;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT8;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		91 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT8;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT8;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		92 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK8;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE9
		93 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT9;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT9;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		94 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT9;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT9;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		95 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK9;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE10
		96 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT10;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT10;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		97 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT10;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT10;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		98 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK10;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE11
		99 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT11;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT11;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		100 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT11;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT11;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		101 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK11;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE12
		102 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT12;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT12;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		103 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT12;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT12;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		104 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK12;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE13
		105 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT13;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT13;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		106 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT13;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT13;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		107 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK13;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE14
		108 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT14;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT14;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		109 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT14;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT14;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		110 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK14;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE15
		111 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT15;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT15;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		112 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT15;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT15;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		113 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK15;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE16
		114 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT16;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT16;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		115 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT16;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT16;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		116 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK16;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE17
		117 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT17;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT17;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		118 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT17;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT17;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		119 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK17;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE18
		120 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT18;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT18;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		121 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT18;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT18;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		122 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK18;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE19
		123 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT19;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT19;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		124 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT19;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT19;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		125 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK19;
			op[0] <= 1'b0;
		end
		// INPUT_TABLE_SPACE20
		126 : begin
			op[31:25] <= INPUT_TABLE;
			op[24:20] <= MOVEMENT20;
			op[19:15] <= BEGINNING;
			op[14:10] <= MOVEMENT20;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		127 : begin
			op[31:25] <= INPUT_TABLE_SPACE;
			op[24:20] <= MOVEMENT20;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT20;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		128 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= MOVEMENT_CHECK20;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK1
		129 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT1;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		130 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_1;
			op[0] <= 1'b0;
		end
		131 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT1;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		132 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT1;
			op[19:15] <= MOVEMENT1;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		133 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK2
		134 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT2;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		135 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_2;
			op[0] <= 1'b0;
		end
		136 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT2;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		137 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT2;
			op[19:15] <= MOVEMENT2;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		138 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK3
		139 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT3;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		140 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_3;
			op[0] <= 1'b0;
		end
		141 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT3;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		142 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT3;
			op[19:15] <= MOVEMENT3;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		143 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK4
		144 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT4;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		145 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_4;
			op[0] <= 1'b0;
		end
		146 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT4;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		147 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT4;
			op[19:15] <= MOVEMENT4;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		148 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK5
		149 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT5;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		150 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_5;
			op[0] <= 1'b0;
		end
		151 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT5;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		152 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT5;
			op[19:15] <= MOVEMENT5;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		153 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK6
		154 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT6;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		155 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_6;
			op[0] <= 1'b0;
		end
		156 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT6;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		157 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT6;
			op[19:15] <= MOVEMENT6;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		158 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK7
		159 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT7;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		160 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_7;
			op[0] <= 1'b0;
		end
		161 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT7;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		162 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT7;
			op[19:15] <= MOVEMENT7;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		163 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK8
		164 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT8;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		165 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_8;
			op[0] <= 1'b0;
		end
		166 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT8;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		167 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT8;
			op[19:15] <= MOVEMENT8;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		168 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK9
		169 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT9;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		170 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_9;
			op[0] <= 1'b0;
		end
		171 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT9;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		172 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT9;
			op[19:15] <= MOVEMENT9;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		173 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK10
		174 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT10;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		175 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_10;
			op[0] <= 1'b0;
		end
		176 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT10;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		177 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT10;
			op[19:15] <= MOVEMENT10;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		178 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK11
		179 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT11;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		180 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_11;
			op[0] <= 1'b0;
		end
		181 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT11;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		182 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT11;
			op[19:15] <= MOVEMENT11;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		183 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK12
		184 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT12;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		185 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_12;
			op[0] <= 1'b0;
		end
		186 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT12;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		187 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT12;
			op[19:15] <= MOVEMENT12;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		188 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK13
		189 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT13;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		190 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_13;
			op[0] <= 1'b0;
		end
		191 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT13;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		192 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT13;
			op[19:15] <= MOVEMENT13;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		193 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK14
		194 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT14;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		195 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_14;
			op[0] <= 1'b0;
		end
		196 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT14;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		197 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT14;
			op[19:15] <= MOVEMENT14;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		198 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK15
		199 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT15;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		200 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_15;
			op[0] <= 1'b0;
		end
		201 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT15;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		202 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT15;
			op[19:15] <= MOVEMENT15;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		203 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK16
		204 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT16;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		205 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_16;
			op[0] <= 1'b0;
		end
		206 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT16;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		207 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT16;
			op[19:15] <= MOVEMENT16;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		208 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK17
		209 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT17;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		210 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_17;
			op[0] <= 1'b0;
		end
		211 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT17;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		212 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT17;
			op[19:15] <= MOVEMENT17;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		213 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK18
		214 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT18;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		215 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_18;
			op[0] <= 1'b0;
		end
		216 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT18;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		217 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT18;
			op[19:15] <= MOVEMENT18;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		218 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK19
		219 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT19;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		220 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_19;
			op[0] <= 1'b0;
		end
		221 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT19;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		222 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT19;
			op[19:15] <= MOVEMENT19;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		223 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		// MOVEMENT_CHECK20
		224 : begin
			op[31:25] <= CHECK_MOVEMENT;
			op[24:20] <= 5'b0;
			op[19:15] <= MOVEMENT20;
			op[14:10] <= 5'b00100;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		225 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UNMOVE_100_20;
			op[0] <= 1'b0;
		end
		226 : begin
			op[31:25] <= INPUT_MOVEMENT;
			op[24:20] <= STATE_MOVEMENT;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= MOVEMENT20;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		227 : begin
			op[31:25] <= ADD;
			op[24:20] <= MOVEMENT20;
			op[19:15] <= MOVEMENT20;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		228 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= SPACE_MOVEMENT_CHECK_REF;
			op[0] <= 1'b0;
		end
		//SPACE_MOVEMENT_CHECK_REF
		//SPACE_1
		229 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0000_0000;
			op[0] <= 1'b0;
		end
		230 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= JMP_BEGINNING;
			op[0] <= 1'b0;
		end
		231 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0000_0001;
			op[0] <= 1'b0;
		end
		232 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= RIGHT_REF1;
			op[0] <= 1'b0;
		end
		233 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0000_0010;
			op[0] <= 1'b0;
		end
		234 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DOWN_REF1;
			op[0] <= 1'b0;
		end
		235 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0000_0011;
			op[0] <= 1'b0;
		end
		236 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= JMP_BEGINNING;
			op[0] <= 1'b0;
		end
		//SPACE_2
		237 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0001_0000;
			op[0] <= 1'b0;
		end
		238 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= JMP_BEGINNING ;
			op[0] <= 1'b0;
		end
		239 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0001_0001;
			op[0] <= 1'b0;
		end
		240 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= RIGHT_REF2;
			op[0] <= 1'b0;
		end
		241 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0001_0010;
			op[0] <= 1'b0;
		end
		242 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DOWN_REF2;
			op[0] <= 1'b0;
		end
		243 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0001_0011;
			op[0] <= 1'b0;
		end
		244 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= LEFT_REF2;
			op[0] <= 1'b0;
		end
		//SPACE_3
		245 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0010_0000;
			op[0] <= 1'b0;
		end
		246 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= JMP_BEGINNING;
			op[0] <= 1'b0;
		end
		247 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0010_0001;
			op[0] <= 1'b0;
		end
		248 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= JMP_BEGINNING;
			op[0] <= 1'b0;
		end
		249 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0010_0010;
			op[0] <= 1'b0;
		end
		250 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DOWN_REF3;
			op[0] <= 1'b0;
		end
		251 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0010_0011;
			op[0] <= 1'b0;
		end
		252 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= LEFT_REF3;
			op[0] <= 1'b0;
		end
		//SPACE_4
		253 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0011_0000;
			op[0] <= 1'b0;
		end
		254 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UP_REF4;
			op[0] <= 1'b0;
		end
		255 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0011_0001;
			op[0] <= 1'b0;
		end
		256 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= RIGHT_REF4;
			op[0] <= 1'b0;
		end
		257 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0011_0010;
			op[0] <= 1'b0;
		end
		258 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= JMP_BEGINNING;
			op[0] <= 1'b0;
		end
		259 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0011_0011;
			op[0] <= 1'b0;
		end
		260 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= JMP_BEGINNING;
			op[0] <= 1'b0;
		end
		//SPACE_5
		261 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0100_0000;
			op[0] <= 1'b0;
		end
		262 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UP_REF5;
			op[0] <= 1'b0;
		end
		263 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0100_0001;
			op[0] <= 1'b0;
		end
		264 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= RIGHT_REF5;
			op[0] <= 1'b0;
		end
		265 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0100_0010;
			op[0] <= 1'b0;
		end
		266 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= JMP_BEGINNING;
			op[0] <= 1'b0;
		end
		267 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0100_0011;
			op[0] <= 1'b0;
		end
		268 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= LEFT_REF5;
			op[0] <= 1'b0;
		end
		//SPACE_6
		269 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0101_0000;
			op[0] <= 1'b0;
		end
		270 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= UP_REF6;
			op[0] <= 1'b0;
		end
		271 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0101_0001;
			op[0] <= 1'b0;
		end
		272 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= JMP_BEGINNING;
			op[0] <= 1'b0;
		end
		273 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0101_0010;
			op[0] <= 1'b0;
		end
		274 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= JMP_BEGINNING;
			op[0] <= 1'b0;
		end
		275 : begin
			op[31:25] <= SPACE_MOVEMENT_CHECK;
			op[24:20] <= 5'b0;
			op[19:15] <= STATE_MOVEMENT;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0_0101_0011;
			op[0] <= 1'b0;
		end
		276 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= LEFT_REF6;
			op[0] <= 1'b0;
		end
		//RIGHT_REF1
		277 : begin
			op[31:25] <= RIGHT1;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		278 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//RIGHT_REF2
		279 : begin
			op[31:25] <= RIGHT2;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		280 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//RIGHT_REF4
		281 : begin
			op[31:25] <= RIGHT4;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		282 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//RIGHT_REF5
		283 : begin
			op[31:25] <= RIGHT5;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		284 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//LEFT_REF2
		285 : begin
			op[31:25] <= LEFT2;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		286 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//LEFT_REF3
		287 : begin
			op[31:25] <= LEFT3;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		288 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//LEFT_REF5
		289 : begin
			op[31:25] <= LEFT5;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		290 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//LEFT_REF6
		291 : begin
			op[31:25] <= LEFT6;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		292 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//UP_REF4
		293 : begin
			op[31:25] <= UP4;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		294 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//UP_REF5
		295 : begin
			op[31:25] <= UP5;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 65'b0;
		end
		296 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//UP_REF6
		297 : begin
			op[31:25] <= UP6;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		298 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//DOWN_REF1
		299 : begin
			op[31:25] <= DOWN1;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		300 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//DOWN_REF2
		301 : begin
			op[31:25] <= DOWN2;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		302 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//DOWN_REF3
		303 : begin
			op[31:25] <= DOWN3;
			op[24:20] <= TMP;
			op[19:15] <= 5'b0;
			op[14:10] <= START;
			op[9:1] <= 9'b0_1000_0011;
			op[0] <= 1'b0;
		end
		304 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_ADD;
			op[0] <= 1'b0;
		end
		//CHECK_BEFORE
		305 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT1;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		306 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		307 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT2;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		308 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		309 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT3;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		310 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		311 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT4;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		312 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		313 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT5;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		314 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		315 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT6;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		316 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		317 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT7;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		318 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		319 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT8;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		320 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		321 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT9;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		322 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		323 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT10;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		324 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		325 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT11;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		326 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		327 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT12;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		328 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		329 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT13;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		330 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		331 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT14;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		332 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		333 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT15;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		334 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		335 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT16;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		336 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		337 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT17;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		338 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		339 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT18;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		340 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		341 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT19;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		342 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		343 : begin
			op[31:25] <= CHECK_D;
			op[24:20] <= 5'b0;
			op[19:15] <= TMP;
			op[14:10] <= MOVEMENT20;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		344 : begin
			op[31:25] <= JNZ;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= DEPTH_CHECK;
			op[0] <= 1'b0;
		end
		//DEPTH_ADD
		345 : begin
			op[31:25] <= ADD;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		346 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= START;
			op[19:15] <= TMP;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		//JMP_BEGINNING
		347 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= BEGINNING;
			op[0] <= 1'b0;
		end
		//UNMOVE_20
		348 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT20;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		349 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		350 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_2
		351 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT1;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		352 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		353 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT2;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		354 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_3
		355 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT2;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		356 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		357 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT3;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		358 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_4
		359 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT3;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		360 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		361 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT4;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		362 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_5
		363 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT4;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		364 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		365 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT5;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		366 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_6
		367 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT5;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		368 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		369 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT6;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		370 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_7
		371 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT6;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		372 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		373 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT7;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		374 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_8
		375 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT7;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		376 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		377 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT8;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		378 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_9
		379 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT8;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		380 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		381 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT9;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		382 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_10
		383 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT9;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		384 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		385 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT10;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		386 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_11
		387 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT10;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		388 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		389 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT11;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		390 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_12
		391 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT11;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		392 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		393 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT12;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		394 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_13
		395 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT12;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		396 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		397 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT13;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		398 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_14
		399 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT13;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		400 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		401 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT14;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		402 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_15
		403 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT14;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		404 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		405 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT15;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		406 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_16
		407 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT15;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		408 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		409 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT16;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		410 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_17
		411 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT16;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		412 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		413 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT17;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		414 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_18
		415 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT17;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		416 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		417 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT18;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		418 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_19
		419 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT18;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		420 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		421 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT19;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		422 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//UNMOVE_100_20
		423 : begin
			op[31:25] <= OVERWRITE1;
			op[24:20] <= BEGINNING;
			op[19:15] <= MOVEMENT19;
			op[14:10] <= BEGINNING;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		424 : begin
			op[31:25] <= SUB;
			op[24:20] <= DEPTH;
			op[19:15] <= ADD1;
			op[14:10] <= DEPTH;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		425 : begin
			op[31:25] <= OVERWRITE;
			op[24:20] <= MOVEMENT20;
			op[19:15] <= CLEAR;
			op[14:10] <= 5'b0;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		426 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end
		//STORE1
		427 : begin
			op[31:25] <= ADD;
			op[24:20] <= COMP;
			op[19:15] <= COMP;
			op[14:10] <= ADD1_M;
			op[9:1] <= 9'b0;
			op[0] <= 1'b0;
		end
		428 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= STORE1;
			op[0] <= 1'b0;
		end
		//STORE2
		429 : begin
			op[31:25] <= JMP;
			op[24:20] <= 5'b0;
			op[19:15] <= 5'b0;
			op[14:10] <= 5'b0;
			op[9:1] <= FIND_SPACE;
			op[0] <= 1'b0;
		end


		endcase
	end
endmodule

