module system_buffer(clk, character_done, start, toSHA, character, go, final_done);

parameter IDLE = 4'b0001;
parameter BUFFER = 4'b0010;
parameter END = 4'b0100;

input clk;
input [31:0] toSHA;
input character_done;
input start;
output reg [3:0] character;
output reg go = 0, final_done = 0;

reg state;
reg value;
reg i;

always @(posedge clk)
	case(state)
		IDLE: if (start == 1) begin
					final_done <= 0;
					value <= toSHA;
					state <= BUFFER;
				end
				else begin 
						go <= 0;
						state <= IDLE;
						end
		BUFFER: begin
					for (i = 0; i < 8; i = i + 1) begin
							character <= value & 4'b1111;
							go <= 1'b1;
							while (!character_done);
							go <= 1'b0;
							character <= character >> 4;
						end
						state <= END;
					end
		END: begin
				final_done = 1;
				state <= IDLE;
			  end
		default: state <= IDLE;
	endcase
		
endmodule
