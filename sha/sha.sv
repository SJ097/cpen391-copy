module sha(clk,start,block,
h1_in,h2_in,h3_in,h4_in,h5_in,h6_in,h7_in,h8_in,
h1_out,h2_out,h3_out,h4_out,h5_out,h6_out,h7_out,h8_out,done);

input clk, start;
input [511:0] block;
input [31:0] h1_in,h2_in,h3_in,h4_in,h5_in,h6_in,h7_in,h8_in;
output [31:0] h1_out,h2_out,h3_out,h4_out,h5_out,h6_out,h7_out,h8_out;
output done;

reg [31:0] W;
reg [6:0] counter;

assign done = current_state == IDLE;

//constants
wire [63:0][31:0] K;

reg [31:0] a,b,c,d,e,f,g,h;

typedef enum logic[2:0] {INIT,LOAD_W,HASH,IDLE} state;
state current_state, next_state;


assign h1_out = h1_in + a;
assign h2_out = h2_in + b;
assign h3_out = h3_in + c;
assign h4_out = h4_in + d;
assign h5_out = h5_in + e;
assign h6_out = h6_in + f;
assign h7_out = h7_in + g;
assign h8_out = h8_in + h;

//Combinational block signals
wire [31:0] bigsig0_out;
wire [31:0] bigsig1_out;
wire [31:0] sig0_out, sig0_in;
wire [31:0] sig1_out, sig1_in;
wire [31:0] ch_out, maj_out;

assign sig0_in = W[counter-2];
assign sig1_in = W[counter-15];

//Combinational block
bigsig1 bs1(e, bigsig1_out);
bigsig0 bs0(a, bigsig0_out);
Ch ch0(e,f,g, ch_out);
Maj maj0(a,b,c,maj_out);
sig0 ss0(sig0_in, sig0_out);
sig1 ss1(sig1_in, sig1_out);


assign K = '{
32'h428a2f98,32'h71374491,32'hb5c0fbcf,32'he9b5dba5,
32'h3956c25b,32'h59f111f1,32'h923f82a4,32'hab1c5ed5,
32'hd807aa98,32'h12835b01,32'h243185be,32'h550c7dc3,
32'h72be5d74,32'h80deb1fe,32'h9bdc06a7,32'hc19bf174,
32'he49b69c1,32'hefbe4786,32'h0fc19dc6,32'h240ca1cc,
32'h2de92c6f,32'h4a7484aa,32'h5cb0a9dc,32'h76f988da,
32'h983e5152,32'ha831c66d,32'hb00327c8,32'hbf597fc7,
32'hc6e00bf3,32'hd5a79147,32'h06ca6351,32'h14292967,
32'h27b70a85,32'h2e1b2138,32'h4d2c6dfc,32'h53380d13,
32'h650a7354,32'h766a0abb,32'h81c2c92e,32'h92722c85,
32'ha2bfe8a1,32'ha81a664b,32'hc24b8b70,32'hc76c51a3,
32'hd192e819,32'hd6990624,32'hf40e3585,32'h106aa070,
32'h19a4c116,32'h1e376c08,32'h2748774c,32'h34b0bcb5,
32'h391c0cb3,32'h4ed8aa4a,32'h5b9cca4f,32'h682e6ff3,
32'h748f82ee,32'h78a5636f,32'h84c87814,32'h8cc70208,
32'h90befffa,32'ha4506ceb,32'hbef9a3f7,32'hc67178f2};



always @(posedge clk or posedge start) begin
	if(start) begin
		current_state <= INIT;
	end
	else begin
		current_state <= next_state;
	end
	case(current_state)
		INIT: begin
			counter <= 7'b0;
			
			W[0] <= block[511:480];
			W[1] <= block[479:448];
			W[2] <= block[447:416];
			W[3] <= block[415:384];
			W[4] <= block[383:352];
			W[5] <= block[351:320];
			W[6] <= block[319:288];
			W[7] <= block[287:256];
			W[8] <= block[255:224];
			W[9] <= block[223:192];
			W[10] <= block[191:160];
			W[11] <= block[159:128];
			W[12] <= block[127:96];
			W[13] <= block[95:64];
			W[14] <= block[63:32];
			W[15] <= block[31:0];
			next_state <= LOAD_W;
		end
		LOAD_W: begin
			if(counter == 64) begin
				next_state <= HASH;
				counter <= 7'b0;
			end
			else begin
				counter <= counter + 7'b1;
				W[counter] = W[counter-7] + W[counter-16] + sig1_out + sig0_out;
				next_state <= LOAD_W;
			end
		end
		HASH: begin
			if(counter > 64) begin
				counter <= 7'b0;
				next_state <= IDLE;
			end
			else begin
				h <= g;
				g <= f;
				f <= e;
				e <= d + h + bigsig1_out + K[counter] + ch_out + W[counter];
				d <= c;
				c <= b;
				b <= a;
				a <= h + bigsig1_out + ch_out + K[counter] + W[counter] + bigsig0_out + maj_out;
				next_state <= HASH;
			end
		end
		IDLE: begin
			next_state <= IDLE;
		end
		
		default: begin
			next_state <= INIT;
		end
	endcase
end
endmodule

module Maj(x,y,z,out);
	input [31:0] x,y,z;
	output reg [31:0] out;
	
	always_comb begin
		out <= (x&y)^(y&z)^(x&z);
	end
endmodule

module Ch(x,y,z,out);
	input [31:0] x,y,z;
	output reg [31:0] out;
	
	always_comb begin
		out <= (x&y)^(~x&z);
	end
endmodule

module ROTR(x,out);
	parameter n = 1;
	input [31:0] x;
	output reg [31:0] out;
	
	always_comb begin
		out[31:31-n+1] <= x[n-1:0];
		out[31-n:0] <= x[31:n];
	end
endmodule

module sig0(x, out);
	input [31:0] x;
	output reg [31:0] out;
	wire [31:0] rot7_out, rot18_out;
	ROTR #(7) rot7(x, rot7_out);
	ROTR #(18) rot18(x, rot18_out);
	
	always_comb begin
		out <= (x >> 3)^rot7_out^rot18_out;
	end
endmodule

module sig1(x, out);
	input [31:0] x;
	output reg [31:0] out;
	wire [31:0] rot17_out, rot19_out;
	ROTR #(17) rot17(x, rot17_out);
	ROTR #(19) rot19(x, rot19_out);
	
	always_comb begin
		out <= (x >> 10)^rot17_out^rot19_out;
	end
endmodule

module bigsig0(x, out);
	input [31:0] x;
	output reg [31:0] out;
	wire [31:0] rot2_out, rot13_out, rot22_out;
	ROTR #(2) rot2(x, rot2_out);
	ROTR #(13) rot13(x, rot13_out);
	ROTR #(22) rot22(x, rot22_out);
	
	always_comb begin
		out <= rot2_out^rot13_out^rot22_out;
	end
endmodule

module bigsig1(x, out);
	input [31:0] x;
	output reg [31:0] out;
	wire [31:0] rot6_out, rot11_out, rot25_out;
	ROTR #(6) rot6(x, rot6_out);
	ROTR #(11) rot11(x, rot11_out);
	ROTR #(25) rot25(x, rot25_out);
	
	always_comb begin
		out <= rot6_out^rot11_out^rot25_out;
	end
endmodule