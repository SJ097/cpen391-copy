module sha_tb();

reg clk;

reg [15:0] address;
reg [31:0] datain_scan;
reg [7:0] datain_nios;
reg IO_EN,rw;
reg  byte_select;
reg start_in;

wire [255:0] h_out, h_in;
wire [7:0] dataout;
wire done,reset;
wire [7:0] start_out;
wire [511:0] block;
wire [2:0] state;
wire hashing;


controller ctrl(clk,address,rw,byte_select,state,IO_EN,h_in,datain_nios,datain_scan,dataout,block,done,start_out,start_in,reset,hashing);
sha sh(clk,reset,start_out,block,h_in,h_out,hashing,state,done);
register8 r8(done,reset,h_out,h_in);

initial begin
clk = 0;
rw = 0;
IO_EN = 0;
address = 16'b0;
datain_nios = 8'b0;
start_in = 1'b0;
#5;
IO_EN = 1;
start_in = 1'b1;
address = 16'h0300;
datain_nios = 8'b1;
byte_select = 2'b11;
datain_scan = 32'd1;
#5;
clk = 1;
#5;

clk = 0;
rw=1;
address = 16'h0310;
#5;
clk =1;
#5;
start_in = 1'b0;

clk = 0;
rw = 0;
address = 16'h0310;
datain_nios = 8'd0;
#5;
clk = 1;
#5;
clk = 0;
address = 16'h0300;
datain_nios = 8'b10;
start_in = 1'b1;
#5;
clk = 1;
datain_nios = 8'b0;
start_in = 1'b0;
#5;
repeat(200) begin
clk = 0;
#5;
clk = 1;
#5;
end
clk = 0;
rw=1;
address = 16'h0310;
#5;
clk =1;
#5;
clk = 0;
#5;
clk = 1;
#25;

address = 16'h0300;
datain_nios=8'b1;
rw = 0;
clk = 0;
#5;
clk = 1;
#5;

clk = 0;
rw=1;
address = 16'h0310;
#5;
clk =1;
#5;
rw = 0;
address = 16'h0310;
datain_nios = 8'd0;
clk = 0;
#5;
clk = 1;
#5;
clk = 0;
address = 16'h0300;
datain_scan = 32'd1;
datain_nios = 8'b10;
start_in = 1'b1;
#5;
clk = 1;
datain_nios = 8'b0;
start_in = 1'b0;
#5;
repeat(200) begin
clk = 0;
#5;
clk = 1;
#5;
end

clk = 0;
rw=1;
address = 16'h0310;
#5;
clk =1;
#5;
clk = 0;
#5;
clk = 1;
#25;
end


endmodule