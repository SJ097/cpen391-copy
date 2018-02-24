module controller(clk,address,rw,byte_select,state, IO_EN, hash,datain_nios,datain_scan, dataout,block,done,start_out,start_in,reset,hashing);
input clk,done,rw,IO_EN;
input [2:0] state;
input [15:0] address;
input [31:0] datain_scan;
input [7:0] datain_nios;
input [255:0] hash;
input byte_select;
input start_in;

output reg [7:0] dataout;
output [511:0] block;
output reg reset = 0;
output reg [7:0] start_out = 8'd6;
output hashing;
assign hashing = (state != 3'b000) && (state != 3'b011);

assign block = {datain_scan,1'b1,415'b0,64'd32};

always @(start_in) 
	if(start_in)
		start_out <= 8'd17;
	else	
		start_out <= 8'd6;
	
always @(address, rw, IO_EN, datain_nios) begin
	dataout <= 16'bzzzzzzzzzzzzzzzz;
	if(IO_EN == 1'b1) begin
		if(address[15:4] == 12'h030) begin
			if(address[3:0] == 4'h0) begin
				if(rw == 1'b1) begin
					dataout <= {7'b0,done};
				end
				else begin
					reset <= datain_nios[0];
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