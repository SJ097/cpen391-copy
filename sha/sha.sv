module sha(clk,start,block,h_in,h_out,state_out,done_out);

input clk;
input [7:0] start;
input [511:0] block;
input [255:0] h_in;
output [255:0] h_out;
output [2:0] state_out;

reg [31:0] h1_out,h2_out,h3_out,h4_out,h5_out,h6_out,h7_out,h8_out;
output done_out;

wire [63:0][31:0]W;
reg [7:0] counter;

assign h_out = {h1_out,h2_out,h3_out,h4_out,h5_out,h6_out,h7_out,h8_out};
//constants
wire [63:0][31:0] K;

reg [31:0] a,b,c,d,e,f,g,h;
reg [31:0] a_new,b_new,c_new,d_new,e_new,f_new,g_new,h_new;
reg a_h_en;

typedef enum logic[2:0] {IDLE,INIT,LOAD_W,HASH,DONE} state;
state current_state, next_state;

assign state_out = current_state;
assign done_out = current_state == DONE;

assign h1_out = h_in[31:0] + a;
assign h2_out = h_in[63:32] + b;
assign h3_out = h_in[95:64] + c;
assign h4_out = h_in[127:96] + d;
assign h5_out = h_in[159:128] + e;
assign h6_out = h_in[191:160] + f;
assign h7_out = h_in[223:192] + g;
assign h8_out = h_in[255:224] + h;

//Combinational block signals
wire [31:0] bigsig0_out;
wire [31:0] bigsig1_out;
wire [47:0][31:0] sig0_out, sig0_in;
wire [47:0][31:0] sig1_out, sig1_in;
wire [31:0] ch_out, maj_out;

 assign sig0_in[0] = W[14];
 assign sig1_in[0] = W[1];
 assign sig0_in[1] = W[15];
 assign sig1_in[1] = W[2];
 assign sig0_in[2] = W[16];
 assign sig1_in[2] = W[3];
 assign sig0_in[3] = W[17];
 assign sig1_in[3] = W[4];
 assign sig0_in[4] = W[18];
 assign sig1_in[4] = W[5];
 assign sig0_in[5] = W[19];
 assign sig1_in[5] = W[6];
 assign sig0_in[6] = W[20];
 assign sig1_in[6] = W[7];
 assign sig0_in[7] = W[21];
 assign sig1_in[7] = W[8];
 assign sig0_in[8] = W[22];
 assign sig1_in[8] = W[9];
 assign sig0_in[9] = W[23];
 assign sig1_in[9] = W[10];
 assign sig0_in[10] = W[24];
 assign sig1_in[10] = W[11];
 assign sig0_in[11] = W[25];
 assign sig1_in[11] = W[12];
 assign sig0_in[12] = W[26];
 assign sig1_in[12] = W[13];
 assign sig0_in[13] = W[27];
 assign sig1_in[13] = W[14];
 assign sig0_in[14] = W[28];
 assign sig1_in[14] = W[15];
 assign sig0_in[15] = W[29];
 assign sig1_in[15] = W[16];
 assign sig0_in[16] = W[30];
 assign sig1_in[16] = W[17];
 assign sig0_in[17] = W[31];
 assign sig1_in[17] = W[18];
 assign sig0_in[18] = W[32];
 assign sig1_in[18] = W[19];
 assign sig0_in[19] = W[33];
 assign sig1_in[19] = W[20];
 assign sig0_in[20] = W[34];
 assign sig1_in[20] = W[21];
 assign sig0_in[21] = W[35];
 assign sig1_in[21] = W[22];
 assign sig0_in[22] = W[36];
 assign sig1_in[22] = W[23];
 assign sig0_in[23] = W[37];
 assign sig1_in[23] = W[24];
 assign sig0_in[24] = W[38];
 assign sig1_in[24] = W[25];
 assign sig0_in[25] = W[39];
 assign sig1_in[25] = W[26];
 assign sig0_in[26] = W[40];
 assign sig1_in[26] = W[27];
 assign sig0_in[27] = W[41];
 assign sig1_in[27] = W[28];
 assign sig0_in[28] = W[42];
 assign sig1_in[28] = W[29];
 assign sig0_in[29] = W[43];
 assign sig1_in[29] = W[30];
 assign sig0_in[30] = W[44];
 assign sig1_in[30] = W[31];
 assign sig0_in[31] = W[45];
 assign sig1_in[31] = W[32];
 assign sig0_in[32] = W[46];
 assign sig1_in[32] = W[33];
 assign sig0_in[33] = W[47];
 assign sig1_in[33] = W[34];
 assign sig0_in[34] = W[48];
 assign sig1_in[34] = W[35];
 assign sig0_in[35] = W[49];
 assign sig1_in[35] = W[36];
 assign sig0_in[36] = W[50];
 assign sig1_in[36] = W[37];
 assign sig0_in[37] = W[51];
 assign sig1_in[37] = W[38];
 assign sig0_in[38] = W[52];
 assign sig1_in[38] = W[39];
 assign sig0_in[39] = W[53];
 assign sig1_in[39] = W[40];
 assign sig0_in[40] = W[54];
 assign sig1_in[40] = W[41];
 assign sig0_in[41] = W[55];
 assign sig1_in[41] = W[42];
 assign sig0_in[42] = W[56];
 assign sig1_in[42] = W[43];
 assign sig0_in[43] = W[57];
 assign sig1_in[43] = W[44];
 assign sig0_in[44] = W[58];
 assign sig1_in[44] = W[45];
 assign sig0_in[45] = W[59];
 assign sig1_in[45] = W[46];
 assign sig0_in[46] = W[60];
 assign sig1_in[46] = W[47];
 assign sig0_in[47] = W[61];
 assign sig1_in[47] = W[48];

//Combinational blocks
bigsig1 bs1(e, bigsig1_out);
bigsig0 bs0(a, bigsig0_out);
Ch ch0(e,f,g, ch_out);
Maj maj0(a,b,c,maj_out);

 sig0 ss0_16(sig0_in[0],sig0_out[0]);
 sig1 ss1_16(sig1_in[0],sig1_out[0]);
 sig0 ss0_17(sig0_in[1],sig0_out[1]);
 sig1 ss1_17(sig1_in[1],sig1_out[1]);
 sig0 ss0_18(sig0_in[2],sig0_out[2]);
 sig1 ss1_18(sig1_in[2],sig1_out[2]);
 sig0 ss0_19(sig0_in[3],sig0_out[3]);
 sig1 ss1_19(sig1_in[3],sig1_out[3]);
 sig0 ss0_20(sig0_in[4],sig0_out[4]);
 sig1 ss1_20(sig1_in[4],sig1_out[4]);
 sig0 ss0_21(sig0_in[5],sig0_out[5]);
 sig1 ss1_21(sig1_in[5],sig1_out[5]);
 sig0 ss0_22(sig0_in[6],sig0_out[6]);
 sig1 ss1_22(sig1_in[6],sig1_out[6]);
 sig0 ss0_23(sig0_in[7],sig0_out[7]);
 sig1 ss1_23(sig1_in[7],sig1_out[7]);
 sig0 ss0_24(sig0_in[8],sig0_out[8]);
 sig1 ss1_24(sig1_in[8],sig1_out[8]);
 sig0 ss0_25(sig0_in[9],sig0_out[9]);
 sig1 ss1_25(sig1_in[9],sig1_out[9]);
 sig0 ss0_26(sig0_in[10],sig0_out[10]);
 sig1 ss1_26(sig1_in[10],sig1_out[10]);
 sig0 ss0_27(sig0_in[11],sig0_out[11]);
 sig1 ss1_27(sig1_in[11],sig1_out[11]);
 sig0 ss0_28(sig0_in[12],sig0_out[12]);
 sig1 ss1_28(sig1_in[12],sig1_out[12]);
 sig0 ss0_29(sig0_in[13],sig0_out[13]);
 sig1 ss1_29(sig1_in[13],sig1_out[13]);
 sig0 ss0_30(sig0_in[14],sig0_out[14]);
 sig1 ss1_30(sig1_in[14],sig1_out[14]);
 sig0 ss0_31(sig0_in[15],sig0_out[15]);
 sig1 ss1_31(sig1_in[15],sig1_out[15]);
 sig0 ss0_32(sig0_in[16],sig0_out[16]);
 sig1 ss1_32(sig1_in[16],sig1_out[16]);
 sig0 ss0_33(sig0_in[17],sig0_out[17]);
 sig1 ss1_33(sig1_in[17],sig1_out[17]);
 sig0 ss0_34(sig0_in[18],sig0_out[18]);
 sig1 ss1_34(sig1_in[18],sig1_out[18]);
 sig0 ss0_35(sig0_in[19],sig0_out[19]);
 sig1 ss1_35(sig1_in[19],sig1_out[19]);
 sig0 ss0_36(sig0_in[20],sig0_out[20]);
 sig1 ss1_36(sig1_in[20],sig1_out[20]);
 sig0 ss0_37(sig0_in[21],sig0_out[21]);
 sig1 ss1_37(sig1_in[21],sig1_out[21]);
 sig0 ss0_38(sig0_in[22],sig0_out[22]);
 sig1 ss1_38(sig1_in[22],sig1_out[22]);
 sig0 ss0_39(sig0_in[23],sig0_out[23]);
 sig1 ss1_39(sig1_in[23],sig1_out[23]);
 sig0 ss0_40(sig0_in[24],sig0_out[24]);
 sig1 ss1_40(sig1_in[24],sig1_out[24]);
 sig0 ss0_41(sig0_in[25],sig0_out[25]);
 sig1 ss1_41(sig1_in[25],sig1_out[25]);
 sig0 ss0_42(sig0_in[26],sig0_out[26]);
 sig1 ss1_42(sig1_in[26],sig1_out[26]);
 sig0 ss0_43(sig0_in[27],sig0_out[27]);
 sig1 ss1_43(sig1_in[27],sig1_out[27]);
 sig0 ss0_44(sig0_in[28],sig0_out[28]);
 sig1 ss1_44(sig1_in[28],sig1_out[28]);
 sig0 ss0_45(sig0_in[29],sig0_out[29]);
 sig1 ss1_45(sig1_in[29],sig1_out[29]);
 sig0 ss0_46(sig0_in[30],sig0_out[30]);
 sig1 ss1_46(sig1_in[30],sig1_out[30]);
 sig0 ss0_47(sig0_in[31],sig0_out[31]);
 sig1 ss1_47(sig1_in[31],sig1_out[31]);
 sig0 ss0_48(sig0_in[32],sig0_out[32]);
 sig1 ss1_48(sig1_in[32],sig1_out[32]);
 sig0 ss0_49(sig0_in[33],sig0_out[33]);
 sig1 ss1_49(sig1_in[33],sig1_out[33]);
 sig0 ss0_50(sig0_in[34],sig0_out[34]);
 sig1 ss1_50(sig1_in[34],sig1_out[34]);
 sig0 ss0_51(sig0_in[35],sig0_out[35]);
 sig1 ss1_51(sig1_in[35],sig1_out[35]);
 sig0 ss0_52(sig0_in[36],sig0_out[36]);
 sig1 ss1_52(sig1_in[36],sig1_out[36]);
 sig0 ss0_53(sig0_in[37],sig0_out[37]);
 sig1 ss1_53(sig1_in[37],sig1_out[37]);
 sig0 ss0_54(sig0_in[38],sig0_out[38]);
 sig1 ss1_54(sig1_in[38],sig1_out[38]);
 sig0 ss0_55(sig0_in[39],sig0_out[39]);
 sig1 ss1_55(sig1_in[39],sig1_out[39]);
 sig0 ss0_56(sig0_in[40],sig0_out[40]);
 sig1 ss1_56(sig1_in[40],sig1_out[40]);
 sig0 ss0_57(sig0_in[41],sig0_out[41]);
 sig1 ss1_57(sig1_in[41],sig1_out[41]);
 sig0 ss0_58(sig0_in[42],sig0_out[42]);
 sig1 ss1_58(sig1_in[42],sig1_out[42]);
 sig0 ss0_59(sig0_in[43],sig0_out[43]);
 sig1 ss1_59(sig1_in[43],sig1_out[43]);
 sig0 ss0_60(sig0_in[44],sig0_out[44]);
 sig1 ss1_60(sig1_in[44],sig1_out[44]);
 sig0 ss0_61(sig0_in[45],sig0_out[45]);
 sig1 ss1_61(sig1_in[45],sig1_out[45]);
 sig0 ss0_62(sig0_in[46],sig0_out[46]);
 sig1 ss1_62(sig1_in[46],sig1_out[46]);
 sig0 ss0_63(sig0_in[47],sig0_out[47]);
 sig1 ss1_63(sig1_in[47],sig1_out[47]);

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

always @(posedge clk) begin
	current_state <= next_state;
end

// Update register logic
always @(posedge clk) begin
	if(a_h_en) begin
		a <= a_new;
		b <= b_new;
		c <= c_new;
		d <= d_new;
		e <= e_new;
		f <= f_new;
		g <= g_new;
		h <= h_new;
	end
end

always @(posedge clk) begin
	if(current_state == INIT)
		counter <= 16;
	else if(current_state == LOAD_W | current_state == HASH)
		if(counter == 8'b01000000)
			counter <= 0;
		else
			counter <= counter + 1;
	else
		counter <= 0;
end

wire [47:0][31:0] w_in;
wire w_en;
assign w_in[0] = W[9] + W[0] + sig1_out + sig0_out;
assign w_en = current_state == LOAD_W;


assign	W[0] = block[511:480];
assign	W[1] = block[479:448];
assign	W[2] = block[447:416];
assign	W[3] = block[415:384];
assign	W[4] = block[383:352];
assign	W[5] = block[351:320];
assign	W[6] = block[319:288];
assign	W[7] = block[287:256];
assign	W[8] = block[255:224];
assign	W[9] = block[223:192];
assign	W[10] = block[191:160];
assign	W[11] = block[159:128];
assign	W[12] = block[127:96];
assign	W[13] = block[95:64];
assign	W[14] = block[63:32];
assign	W[15] = block[31:0];

 assign W[16] = W[9] + W[0] + sig1_out[0] + sig0_out[0];
 assign W[17] = W[10] + W[1] + sig1_out[1] + sig0_out[1];
 assign W[18] = W[11] + W[2] + sig1_out[2] + sig0_out[2];
 assign W[19] = W[12] + W[3] + sig1_out[3] + sig0_out[3];
 assign W[20] = W[13] + W[4] + sig1_out[4] + sig0_out[4];
 assign W[21] = W[14] + W[5] + sig1_out[5] + sig0_out[5];
 assign W[22] = W[15] + W[6] + sig1_out[6] + sig0_out[6];
 assign W[23] = W[16] + W[7] + sig1_out[7] + sig0_out[7];
 assign W[24] = W[17] + W[8] + sig1_out[8] + sig0_out[8];
 assign W[25] = W[18] + W[9] + sig1_out[9] + sig0_out[9];
 assign W[26] = W[19] + W[10] + sig1_out[10] + sig0_out[10];
 assign W[27] = W[20] + W[11] + sig1_out[11] + sig0_out[11];
 assign W[28] = W[21] + W[12] + sig1_out[12] + sig0_out[12];
 assign W[29] = W[22] + W[13] + sig1_out[13] + sig0_out[13];
 assign W[30] = W[23] + W[14] + sig1_out[14] + sig0_out[14];
 assign W[31] = W[24] + W[15] + sig1_out[15] + sig0_out[15];
 assign W[32] = W[25] + W[16] + sig1_out[16] + sig0_out[16];
 assign W[33] = W[26] + W[17] + sig1_out[17] + sig0_out[17];
 assign W[34] = W[27] + W[18] + sig1_out[18] + sig0_out[18];
 assign W[35] = W[28] + W[19] + sig1_out[19] + sig0_out[19];
 assign W[36] = W[29] + W[20] + sig1_out[20] + sig0_out[20];
 assign W[37] = W[30] + W[21] + sig1_out[21] + sig0_out[21];
 assign W[38] = W[31] + W[22] + sig1_out[22] + sig0_out[22];
 assign W[39] = W[32] + W[23] + sig1_out[23] + sig0_out[23];
 assign W[40] = W[33] + W[24] + sig1_out[24] + sig0_out[24];
 assign W[41] = W[34] + W[25] + sig1_out[25] + sig0_out[25];
 assign W[42] = W[35] + W[26] + sig1_out[26] + sig0_out[26];
 assign W[43] = W[36] + W[27] + sig1_out[27] + sig0_out[27];
 assign W[44] = W[37] + W[28] + sig1_out[28] + sig0_out[28];
 assign W[45] = W[38] + W[29] + sig1_out[29] + sig0_out[29];
 assign W[46] = W[39] + W[30] + sig1_out[30] + sig0_out[30];
 assign W[47] = W[40] + W[31] + sig1_out[31] + sig0_out[31];
 assign W[48] = W[41] + W[32] + sig1_out[32] + sig0_out[32];
 assign W[49] = W[42] + W[33] + sig1_out[33] + sig0_out[33];
 assign W[50] = W[43] + W[34] + sig1_out[34] + sig0_out[34];
 assign W[51] = W[44] + W[35] + sig1_out[35] + sig0_out[35];
 assign W[52] = W[45] + W[36] + sig1_out[36] + sig0_out[36];
 assign W[53] = W[46] + W[37] + sig1_out[37] + sig0_out[37];
 assign W[54] = W[47] + W[38] + sig1_out[38] + sig0_out[38];
 assign W[55] = W[48] + W[39] + sig1_out[39] + sig0_out[39];
 assign W[56] = W[49] + W[40] + sig1_out[40] + sig0_out[40];
 assign W[57] = W[50] + W[41] + sig1_out[41] + sig0_out[41];
 assign W[58] = W[51] + W[42] + sig1_out[42] + sig0_out[42];
 assign W[59] = W[52] + W[43] + sig1_out[43] + sig0_out[43];
 assign W[60] = W[53] + W[44] + sig1_out[44] + sig0_out[44];
 assign W[61] = W[54] + W[45] + sig1_out[45] + sig0_out[45];
 assign W[62] = W[55] + W[46] + sig1_out[46] + sig0_out[46];
 assign W[63] = W[56] + W[47] + sig1_out[47] + sig0_out[47];

always @(current_state or counter or block or h_in or start) begin 
	a_h_en <= 0;
	a_new <= 0;
	b_new <= 0;
	c_new <= 0;
	d_new <= 0;
	e_new <= 0;
	f_new <= 0;
	g_new <= 0;
	h_new <= 0;
	case(current_state)
		INIT: begin
			a_new <= h_in[31:0];
			b_new <= h_in[63:32];
			c_new <= h_in[95:64];
			d_new <= h_in[127:96];
			e_new <= h_in[159:128];
			f_new <= h_in[191:160];
			g_new <= h_in[223:192];
			h_new <= h_in[255:224];
			a_h_en <= 1;
			next_state <= LOAD_W;
		end
		LOAD_W: begin
			if(counter == 8'b01000000) begin
				next_state <= HASH;
			end
			else begin
				next_state <= LOAD_W;
			end
		end
		HASH: begin
			if(counter == 8'b01000000) begin
				next_state <= DONE;
			end
			else begin
				a_h_en <= 1;
				h_new <= g;
				g_new <= f;
				f_new <= e;
				e_new <= d + h + bigsig1_out + K[counter] + ch_out + W[counter];
				d_new <= c;
				c_new <= b;
				b_new <= a;
				a_new <= h + bigsig1_out + ch_out + K[counter] + W[counter] + bigsig0_out + maj_out;
				next_state <= HASH;
			end
		end
		DONE: begin
			if(start == 8'd17)
				next_state <= INIT;
			else
				next_state <= DONE;
		end
		IDLE: begin
			if(start == 8'd17)
				next_state <= INIT;
			else
				next_state <= IDLE;
		end
		default: begin
			next_state <= IDLE;
		end
	endcase
end
endmodule