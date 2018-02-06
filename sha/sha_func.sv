
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