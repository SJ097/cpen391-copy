module register(clk,reset,h1_in,h2_in,h3_in,h4_in,h5_in,h6_in,h7_in,h8_in,h1_out,h2_out,h3_out,h4_out,h5_out,h6_out,h7_out,h8_out);
	input clk,reset;
	input [31:0] h1_in,h2_in,h3_in,h4_in,h5_in,h6_in,h7_in,h8_in;
	output reg[31:0] h1_out,h2_out,h3_out,h4_out,h5_out,h6_out,h7_out,h8_out;
	always @(posedge clk or posedge reset) begin
		if(reset) begin
			h1_out <= 32'h6a09e667;
			h2_out <= 32'hbb67ae85;
			h3_out <= 32'h3c6ef372;
			h4_out <= 32'ha54ff53a;
			h5_out <= 32'h510e527f;
			h6_out <= 32'h9b05688c;
			h7_out <= 32'h1f83d9ab;
			h8_out <= 32'h5be0cd19;
		end
		
		else begin 
			h1_out <= h1_in;
			h2_out <= h2_in;
			h3_out <= h3_in;
			h4_out <= h4_in;
			h5_out <= h5_in;
			h6_out <= h6_in;
			h7_out <= h7_in;
			h8_out <= h8_in;
		end
	end
endmodule