//`default_nettype none
module scanner_control(

    //////////// CLOCK //////////
    CLOCK_50,

    //////////// LED //////////
    LEDR,
	 
	 READY,
	 
	 HASH_DONE,
    
    //////// PS2 //////////
    PS2_CLK,
    PS2_DAT,
    
	 SEND_TO_SHA,
	 
	 DONE
);
`define zero_pad(width,signal)  {{((width)-$size(signal)){1'b0}},(signal)}
//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input                       CLOCK_50;

//////////// LED //////////
output           [9:0]      LEDR;

//////////// PS2 //////////
inout                       PS2_CLK;
inout                       PS2_DAT;

output reg		  [31:0]		 SEND_TO_SHA;
output reg 						 DONE = 0;

input								 READY;
input 							 HASH_DONE;

//=======================================================
//  REG/WIRE declarations
//=======================================================
// Input and output declarations
wire CLK_50M;
reg  [7:0] LED;
assign CLK_50M =  CLOCK_50;
assign LEDR[7:0] = LED[7:0];

//Character definitions

//numbers
parameter character_0 =8'h30;
parameter character_1 =8'h31;
parameter character_2 =8'h32;
parameter character_3 =8'h33;
parameter character_4 =8'h34;
parameter character_5 =8'h35;
parameter character_6 =8'h36;
parameter character_7 =8'h37;
parameter character_8 =8'h38;
parameter character_9 =8'h39;


//Uppercase Letters
parameter character_A =8'h41;
parameter character_B =8'h42;
parameter character_C =8'h43;
parameter character_D =8'h44;
parameter character_E =8'h45;
parameter character_F =8'h46;
parameter character_G =8'h47;
parameter character_H =8'h48;
parameter character_I =8'h49;
parameter character_J =8'h4A;
parameter character_K =8'h4B;
parameter character_L =8'h4C;
parameter character_M =8'h4D;
parameter character_N =8'h4E;
parameter character_O =8'h4F;
parameter character_P =8'h50;
parameter character_Q =8'h51;
parameter character_R =8'h52;
parameter character_S =8'h53;
parameter character_T =8'h54;
parameter character_U =8'h55;
parameter character_V =8'h56;
parameter character_W =8'h57;
parameter character_X =8'h58;
parameter character_Y =8'h59;
parameter character_Z =8'h5A;

//Lowercase Letters
parameter character_lowercase_a= 8'h61;
parameter character_lowercase_b= 8'h62;
parameter character_lowercase_c= 8'h63;
parameter character_lowercase_d= 8'h64;
parameter character_lowercase_e= 8'h65;
parameter character_lowercase_f= 8'h66;
parameter character_lowercase_g= 8'h67;
parameter character_lowercase_h= 8'h68;
parameter character_lowercase_i= 8'h69;
parameter character_lowercase_j= 8'h6A;
parameter character_lowercase_k= 8'h6B;
parameter character_lowercase_l= 8'h6C;
parameter character_lowercase_m= 8'h6D;
parameter character_lowercase_n= 8'h6E;
parameter character_lowercase_o= 8'h6F;
parameter character_lowercase_p= 8'h70;
parameter character_lowercase_q= 8'h71;
parameter character_lowercase_r= 8'h72;
parameter character_lowercase_s= 8'h73;
parameter character_lowercase_t= 8'h74;
parameter character_lowercase_u= 8'h75;
parameter character_lowercase_v= 8'h76;
parameter character_lowercase_w= 8'h77;
parameter character_lowercase_x= 8'h78;
parameter character_lowercase_y= 8'h79;
parameter character_lowercase_z= 8'h7A;

//Other Characters
parameter character_colon = 8'h3A;          //':'
parameter character_stop = 8'h2E;           //'.'
parameter character_semi_colon = 8'h3B;   //';'
parameter character_minus = 8'h2D;         //'-'
parameter character_divide = 8'h2F;         //'/'
parameter character_plus = 8'h2B;          //'+'
parameter character_comma = 8'h2C;          // ','
parameter character_less_than = 8'h3C;    //'<'
parameter character_greater_than = 8'h3E; //'>'
parameter character_equals = 8'h3D;         //'='
parameter character_question = 8'h3F;      //'?'
parameter character_dollar = 8'h24;         //'$'
parameter character_space=8'h20;           //' '     
parameter character_exclaim=8'h21;          //'!'

// Source: https://embeddedthoughts.com/2016/07/05/fpga-keyboard-interface/
parameter character_enter = 8'h0D;
parameter character_tab = 8'h09;
parameter character_backspace = 8'h08;


// 16 Bit audio sample signal
wire [15:0] sampled_audio;
// controls for playback
wire [2:0] audio_playback_control;
					
wire [31:0] barcode;
reg [31:0] scanned_barcode = 0;
reg [4:0] state;

// Decimal input
/*always @(posedge kbd_data_ready) begin
		case(kbd_received_ascii_code)
			character_0: scanned_barcode = scanned_barcode*10 + 0;
			character_1: scanned_barcode = scanned_barcode*10 + 1;
			character_2: scanned_barcode = scanned_barcode*10 + 2;
			character_3: scanned_barcode = scanned_barcode*10 + 3;
			character_4: scanned_barcode = scanned_barcode*10 + 4;
			character_5: scanned_barcode = scanned_barcode*10 + 5;
			character_6: scanned_barcode = scanned_barcode*10 + 6;
			character_7: scanned_barcode = scanned_barcode*10 + 7;
			character_8: scanned_barcode = scanned_barcode*10 + 8;
			character_9: scanned_barcode = scanned_barcode*10 + 9;
			character_R: scanned_barcode = 0;
			default: scanned_barcode = scanned_barcode;
		endcase
		
		if (SEND_TO_SHA[15:0] == scanned_barcode[15:0]) scanned_barcode = 0;
		if (READY == 0) scanned_barcode = 0;
	end*/

// Hexadecimal input
always @(posedge kbd_data_ready) begin
		case(kbd_received_ascii_code)
			character_0: scanned_barcode = scanned_barcode*16 + 0;
			character_1: scanned_barcode = scanned_barcode*16 + 1;
			character_2: scanned_barcode = scanned_barcode*16 + 2;
			character_3: scanned_barcode = scanned_barcode*16 + 3;
			character_4: scanned_barcode = scanned_barcode*16 + 4;
			character_5: scanned_barcode = scanned_barcode*16 + 5;
			character_6: scanned_barcode = scanned_barcode*16 + 6;
			character_7: scanned_barcode = scanned_barcode*16 + 7;
			character_8: scanned_barcode = scanned_barcode*16 + 8;
			character_9: scanned_barcode = scanned_barcode*16 + 9;
			character_A: scanned_barcode = scanned_barcode*16 + 10;
			character_B: scanned_barcode = scanned_barcode*16 + 11;
			character_C: scanned_barcode = scanned_barcode*16 + 12;
			character_D: scanned_barcode = scanned_barcode*16 + 13;
			character_E: scanned_barcode = scanned_barcode*16 + 14;
			character_F: scanned_barcode = scanned_barcode*16 + 15;
			character_R: scanned_barcode = 0;
			default: scanned_barcode = scanned_barcode;
		endcase
		
		if (SEND_TO_SHA[15:0] == scanned_barcode[15:0]) scanned_barcode = 0;
		if (READY == 0) scanned_barcode = 0;
	end
	

// All digits and letters
/*always @(posedge kbd_data_ready) begin
		case(kbd_received_ascii_code)
			character_0: scanned_barcode = scanned_barcode*36 + 0;
			character_1: scanned_barcode = scanned_barcode*36 + 1;
			character_2: scanned_barcode = scanned_barcode*36 + 2;
			character_3: scanned_barcode = scanned_barcode*36 + 3;
			character_4: scanned_barcode = scanned_barcode*36 + 4;
			character_5: scanned_barcode = scanned_barcode*36 + 5;
			character_6: scanned_barcode = scanned_barcode*36 + 6;
			character_7: scanned_barcode = scanned_barcode*36 + 7;
			character_8: scanned_barcode = scanned_barcode*36 + 8;
			character_9: scanned_barcode = scanned_barcode*36 + 9;
			character_A: scanned_barcode = scanned_barcode*36 + 10;
			character_B: scanned_barcode = scanned_barcode*36 + 11;
			character_C: scanned_barcode = scanned_barcode*36 + 12;
			character_D: scanned_barcode = scanned_barcode*36 + 13;
			character_E: scanned_barcode = scanned_barcode*36 + 14;
			character_F: scanned_barcode = scanned_barcode*36 + 15;
			character_G: scanned_barcode = scanned_barcode*36 + 16;
			character_H: scanned_barcode = scanned_barcode*36 + 17;
			character_I: scanned_barcode = scanned_barcode*36 + 18;
			character_J: scanned_barcode = scanned_barcode*36 + 19;
			character_K: scanned_barcode = scanned_barcode*36 + 20;
			character_L: scanned_barcode = scanned_barcode*36 + 21;
			character_M: scanned_barcode = scanned_barcode*36 + 22;
			character_N: scanned_barcode = scanned_barcode*36 + 23;
			character_O: scanned_barcode = scanned_barcode*36 + 24;
			character_P: scanned_barcode = scanned_barcode*36 + 25;
			character_Q: scanned_barcode = scanned_barcode*36 + 26;
			character_R: scanned_barcode = scanned_barcode*36 + 27;
			character_S: scanned_barcode = scanned_barcode*36 + 28;
			character_T: scanned_barcode = scanned_barcode*36 + 29;
			character_U: scanned_barcode = scanned_barcode*36 + 30;
			character_V: scanned_barcode = scanned_barcode*36 + 31;
			character_W: scanned_barcode = scanned_barcode*36 + 32;
			character_X: scanned_barcode = scanned_barcode*36 + 33;
			character_Y: scanned_barcode = scanned_barcode*36 + 34;
			character_Z: scanned_barcode = scanned_barcode*36 + 35;
			character_minus: scanned_barcode = 0;
			default: scanned_barcode = scanned_barcode;
		endcase
		
		if (SEND_TO_SHA[15:0] == scanned_barcode[15:0]) scanned_barcode = 0;
		if (READY == 0) scanned_barcode = 0;
	end*/
	
	
always @(posedge CLK_50M) begin
	case(kbd_received_ascii_code)
		character_enter: if (READY == 1) begin
								LED[7:0] <= scanned_barcode[7:0];
								SEND_TO_SHA[31:0] <= scanned_barcode[31:0];
								DONE <= 1;
							end
		character_space: LED[7:0] = scanned_barcode[15:8];
		character_backspace: LED[7:0] = scanned_barcode[23:16];
		character_stop: LED[7:0] = scanned_barcode[31:24];
		default: LED[7:0] = LED[7:0];
	endcase
	if (HASH_DONE == 1) DONE <= 0;
	end
	
//======================================================================================
// 
// Keyboard Interface
//
//

wire ps2c, ps2d; //filtered kbd wires
wire kbd_data_ready, Kbd_to_LCD_finish;

doublesync ps2c_doublsync
(.indata(PS2_CLK),
.outdata(ps2c),
.clk(CLK_50M),
.reset(1'b1));

doublesync ps2d_doublsync
(.indata(PS2_DAT),
.outdata(ps2d),
.clk(CLK_50M),
.reset(1'b1));

wire reset_kbd_data;
(* KEEP = "TRUE" *) wire conv_now_ignore_timing;
 
wire [7:0] kbd_received_ascii_code, kbd_scan_code;
    
Kbd_ctrl Kbd_Controller(
.kbd_clk(ps2c), 
.kbd_data(ps2d),
 .clk(CLK_50M), 
.scan_code(kbd_scan_code), 
.reset_kbd_reg(~reset_kbd_data), 
.data_ready(kbd_data_ready)
);
                
key2ascii kbd2ascii(
.key_code(kbd_scan_code),
.ascii_code(kbd_received_ascii_code),
.clk(conv_now_ignore_timing)
); 
            
parameter scope_info_bytes = 16;
parameter scope_info_bits_per_byte = 8;

wire [15:0] write_kbd_debug;

wire  [scope_info_bits_per_byte-1:0] scope_info0, scope_info1, scope_info2,
     scope_info3, scope_info4, scope_info5, scope_info6, scope_info7, scope_info8, 
     scope_info9, scope_info10, scope_info11, scope_info12, scope_info13, 
     scope_info14, scope_info15;
                
Write_Kbd_To_Scope_LCD Write_Kbd_To_LCD1
(.kbd_ascii_data(kbd_received_ascii_code), 
              .kbd_ready(kbd_data_ready), .reset_kbd_data(reset_kbd_data), 
                     .sm_clk(CLK_50M), .reset(1'b1), 
                     .finish(Kbd_to_LCD_finish), 
                     .scope_info0(scope_info0), 
                     .scope_info1(scope_info1),
                     .scope_info2(scope_info2),
                     .scope_info3(scope_info3),
                     .scope_info4(scope_info4),
                     .scope_info5(scope_info5),
                     .scope_info6(scope_info6),
                     .scope_info7(scope_info7),
                     .scope_info8(scope_info8),
                     .scope_info9(scope_info9),
                     .scope_info10(scope_info10),
                     .scope_info11(scope_info11),
                     .scope_info12(scope_info12),
                     .scope_info13(scope_info13),
                     .scope_info14(scope_info14),
                     .scope_info15(scope_info15),
                     .debug(write_kbd_debug),
                     .convert_now(conv_now_ignore_timing)
    );
                
                    
            
endmodule
