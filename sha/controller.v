module controller(clk,address,rw,byte_select,state, IO_EN, hash,datain, dataout,block,done,start,reset);
input clk,done,rw,IO_EN;
input [2:0] state;
input [15:0] address;
input [7:0] datain;
input [255:0] hash;
input byte_select;

output reg [7:0] dataout;
output [511:0] block;
output reg reset;
output reg [7:0] start;

wire [7:0] datain_reg;

assign block = {datain_reg,1'b1,439'b0,32'b0,24'b0,8'b00001000};

reg datain_clk;
d_ff #(8) datain_ff(datain_clk,datain,datain_reg);

always @(address, rw, IO_EN, datain, byte_select) begin
	reset <= 0;
	datain_clk <= 0;
	start <= 8'd6;
	dataout <= 16'bzzzzzzzzzzzzzzzz;
	if(IO_EN == 1'b1 && byte_select == 1'b0) begin
		if(address[15:4] == 12'h030) begin
			if(address[3:0] == 4'h0) begin
				if(rw == 1'b1) begin
					dataout <= {7'b0,done};
				end
				else begin
					if(datain[1] == 1'b1)
						start <= 8'd17;
					reset <= datain[0];
				end
			end
		end
		else if(address[15:4] == 12'h031) begin
			if(rw == 1'b1) begin
				if(address[3:0] == 4'h0)
					dataout <= hash[7:0];
				else if(address[3:0] == 4'h2)
					dataout <= hash[15:8];
				else if(address[3:0] == 4'h4)
					dataout <= hash[23:16];
				else if(address[3:0] == 4'h6)
					dataout <= hash[31:24];
				else if(address[3:0] == 4'h8)
					dataout <= hash[39:32];
				else if(address[3:0] == 4'ha)
					dataout <= hash[47:40];
				else if(address[3:0] == 4'hc)
					dataout <= hash[55:48];
				else if(address[3:0] == 4'he)
					dataout <= hash[63:56];
			end
			else
				datain_clk <= 1;
		end
		else if(address[15:4] == 12'h032) begin
			if(rw == 1'b1) begin
				if(address[3:0] == 4'h0)
					dataout <= hash[71:64];
				else if(address[3:0] == 4'h2)
					dataout <= hash[79:72];
				else if(address[3:0] == 4'h4)
					dataout <= hash[87:80];
				else if(address[3:0] == 4'h6)
					dataout <= hash[95:88];
				else if(address[3:0] == 4'h8)
					dataout <= hash[103:96];
				else if(address[3:0] == 4'ha)
					dataout <= hash[111:104];
				else if(address[3:0] == 4'hc)
					dataout <= hash[119:112];
				else if(address[3:0] == 4'he)
					dataout <= hash[127:120];
			end
		end
		else if(address[15:4] == 12'h033) begin
			if(rw == 1'b1) begin
				if(address[3:0] == 4'h0)
					dataout <= hash[135:128];
				else if(address[3:0] == 4'h2)
					dataout <= hash[143:136];
				else if(address[3:0] == 4'h4)
					dataout <= hash[151:144];
				else if(address[3:0] == 4'h6)
					dataout <= hash[159:152];
				else if(address[3:0] == 4'h8)
					dataout <= hash[167:160];
				else if(address[3:0] == 4'ha)
					dataout <= hash[175:168];
				else if(address[3:0] == 4'hc)
					dataout <= hash[183:176];
				else if(address[3:0] == 4'he)
					dataout <= hash[191:184];
			end
		end
		else if(address[15:4] == 12'h034) begin
			if(rw == 1'b1) begin
				if(address[3:0] == 4'h0)
					dataout <= hash[199:192];
				else if(address[3:0] == 4'h2)
					dataout <= hash[207:200];
				else if(address[3:0] == 4'h4)
					dataout <= hash[215:208];
				else if(address[3:0] == 4'h6)
					dataout <= hash[223:216];
				else if(address[3:0] == 4'h8)
					dataout <= hash[231:224];
				else if(address[3:0] == 4'ha)
					dataout <= hash[239:232];
				else if(address[3:0] == 4'hc)
					dataout <= hash[247:240];
				else if(address[3:0] == 4'he)
					dataout <= hash[255:248];
			end
		end
	end
end

endmodule

module d_ff(clk,q,out);
parameter n = 1;
input clk;
input [n-1:0] q;
output reg [n-1:0] out;
always @(posedge clk)
	out <= q;

endmodule