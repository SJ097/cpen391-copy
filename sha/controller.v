module controller(clk,address,rw, hash,datain, dataout,block,done,start,reset);
input clk,done,rw;
input [15:0] address;
input [15:0] datain;
input [511:0] hash;
output reg [15:0] dataout;
output reg [511:0] block;
output reg reset;
output reg start;

always @(address,rw) begin
	start <= 1'b0;
	reset <= 1'b0;
	if(address[15:4] == 12'h030) begin
		if(address[3:0] == 4'h0) begin
			if(rw == 1'b1)
				dataout <= {15'b0,done};
			else
				if(datain == 15'd1)
					reset <= 1'b1;
				else if(datain == 15'd2)
					start <= 1'b1;
		end
		else if(address[3:0] == 4'h2) begin
			if(rw == 1'b1)
				dataout <= hash[15:0];
			else
				block <= {datain,1'b1,431'b0,32'b0,24'b0,8'b00001100};
		end
	end
end

endmodule