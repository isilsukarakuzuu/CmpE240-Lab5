`timescale 1ns / 1ns

module FSM (z, w, clk, rst);

output reg [0:0]z;
input wire w;
input wire rst;
input wire clk;

parameter S0 = 3'b000,
	S1 = 3'b001,
	S2 = 3'b010,
	S3 = 3'b011,
	S4 = 3'b100,
	S5 = 3'b101,
	S6 = 3'b110;
	
reg [2:0] stateReg;
reg [2:0] nextStateReg;

always@(w, stateReg) begin
	case(stateReg)
		S0: begin
			if(w == 0) begin
				nextStateReg <= S1;
			end
			else begin
				nextStateReg <= S4;
			end
			z <= 1'b0;
		end
		S1: begin
			if(w == 0) begin
				nextStateReg <= S2;
			end
			else begin
				nextStateReg <= S4;
			end
			z <= 1'b0;
		end
		S2: begin
			if(w == 0) begin
				nextStateReg <= S3;
			end
			else begin
				nextStateReg <= S4;
			end
			z <= 1'b0;
		end
		S3: begin
			if(w == 0) begin
				nextStateReg <= S3;
			end
			else begin
				nextStateReg <= S4;
			end
			z <= 1'b1;
		end
		S4: begin
			if(w == 0) begin
				nextStateReg <= S1;
			end
			else begin
				nextStateReg <= S5;
			end
			z <= 1'b0;
		end
		S5: begin
			if(w == 0) begin
				nextStateReg <= S1;
			end
			else begin
				nextStateReg <= S6;
			end
			z <= 1'b0;
		end
		S6: begin
			if(w == 0) begin
				nextStateReg <= S1;
			end
			else begin
				nextStateReg <= S6;
			end
			z <= 1'b1;
		end
	endcase
end

always@(posedge clk) begin
	if(rst) begin
		stateReg <= S0;
	end
	else begin
		stateReg <= nextStateReg;
	end
end

endmodule
	