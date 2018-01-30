// Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"
// CREATED		"Mon Jan 29 20:37:36 2018"

module OnChipM68xxIO(
	Reset_L,
	Clock_50Mhz,
	RS232_RxData,
	WE_L,
	GPS_RxData,
	BlueTooth_RxData,
	IOSelect_H,
	ByteSelect_L,
	TouchScreen_RxData,
	Address,
	DataIn,
	RS232_TxData,
	ACIA_IRQ,
	GPS_TxData,
	BlueTooth_TxData,
	TouchScreen_TxData,
	DataOut
);


input wire	Reset_L;
input wire	Clock_50Mhz;
input wire	RS232_RxData;
input wire	WE_L;
input wire	GPS_RxData;
input wire	BlueTooth_RxData;
input wire	IOSelect_H;
input wire	ByteSelect_L;
input wire	TouchScreen_RxData;
input wire	[15:0] Address;
input wire	[7:0] DataIn;
output wire	RS232_TxData;
output wire	ACIA_IRQ;
output wire	GPS_TxData;
output wire	BlueTooth_TxData;
output wire	TouchScreen_TxData;
output wire	[7:0] DataOut;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_12 = 0;
assign	SYNTHESIZED_WIRE_13 = 1;




M68xxIODecoder	b2v_inst(
	.IOSelect_H(IOSelect_H),
	.ByteSelect_L(ByteSelect_L),
	.WE_L(WE_L),
	.Address(Address),
	
	
	.GPS_Port_Enable(SYNTHESIZED_WIRE_2),
	.GPS_Baud_Enable(SYNTHESIZED_WIRE_0)
	
	
	
	);


ACIA_BaudRate_Generator	b2v_inst1(
	.Clk_50Mhz(Clock_50Mhz),
	.Enable_H(SYNTHESIZED_WIRE_0),
	.Clk(Clock_50Mhz),
	.Reset_L(Reset_L),
	.DataIn(DataIn[2:0]),
	.ACIA_Clock(SYNTHESIZED_WIRE_11));


ACIA_6850	b2v_inst2(
	.Clk(Clock_50Mhz),
	.Reset_H(SYNTHESIZED_WIRE_1),
	.CS_H(SYNTHESIZED_WIRE_2),
	.Write_L(WE_L),
	.RS(Address[1]),
	.RxClock(SYNTHESIZED_WIRE_11),
	.TxClock(SYNTHESIZED_WIRE_11),
	.RxData(GPS_RxData),
	.DCD_L(SYNTHESIZED_WIRE_12),
	.CTS_L(SYNTHESIZED_WIRE_12),
	.DataIn(DataIn),
	.IRQ_L(SYNTHESIZED_WIRE_7),
	.TxData(GPS_TxData),
	
	.DataOut(DataOut));

assign	SYNTHESIZED_WIRE_1 =  ~Reset_L;


assign	ACIA_IRQ = ~(SYNTHESIZED_WIRE_7 & SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_13);



endmodule
