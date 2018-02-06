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
			dataout <= hash[7:0];
		end
		else
			datain_clk <= 1;
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