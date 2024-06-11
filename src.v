`timescale 1ns / 1ns

module source(y, stateReg, nextStateReg, x, rst, clk);

output reg y;
input wire x;
input wire rst;
input wire clk;
parameter 	S0 = 4'b0000,
			S1 = 4'b0001,
			S2 = 4'b0010,
			S3 = 4'b0011,
			S4 = 4'b0100,
			S5 = 4'b0101;

		
				
output reg [3:0] stateReg;
output reg [3:0] nextStateReg;

always@(stateReg, x) begin
	case(stateReg)
		S0: begin
			y <= 0;
			if(x == 0) begin
				nextStateReg <= S1;
			end
			else begin
				nextStateReg <= S0;
			end
		end
		S1: begin
			y <= 0;
			if(x == 0) begin
				nextStateReg <= S2;
			end
			else begin
				nextStateReg <= S4;
			end
		end
		S2: begin
			y <= 0;
			if(x == 0) begin
				nextStateReg <= S2;
			end
			else begin
				nextStateReg <= S3;
			end
		end
		S3: begin
			y <= 1;
			if(x == 0) begin
				nextStateReg <= S5;
			end
			else begin
				nextStateReg <= S0;
			end
		end
		S4: begin
			y <= 0;
			if(x == 0) begin
				nextStateReg <= S5;
			end
			else begin
				nextStateReg <= S0;
			end
		end
		S5: begin
			y <= 1;
			if(x == 0) begin
				nextStateReg <= S2;
			end
			else begin
				nextStateReg <= S4;
			end
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