module register8(done, reset, hash_in, hash_out);

input done, reset;
input [255:0] hash_in;
output reg [255:0] hash_out =
{32'h6a09e667,
32'hbb67ae85,
32'h3c6ef372,
32'ha54ff53a,
32'h510e527f,
32'h9b05688c,
32'h1f83d9ab,
32'h5be0cd19};

always @(posedge done or posedge reset) begin
	if(reset) begin
	hash_out[31:0] <= 32'h5be0cd19;
	hash_out[63:32] <= 32'h1f83d9ab;
	hash_out[95:64] <= 32'h9b05688c;
	hash_out[127:96] <= 32'h510e527f;
	hash_out[159:128] <= 32'ha54ff53a;
	hash_out[191:160] <= 32'h3c6ef372;
	hash_out[223:192] <= 32'hbb67ae85;
	hash_out[255:224] <= 32'h6a09e667;
	end
	else
		hash_out <= hash_in;
	
end

endmodule