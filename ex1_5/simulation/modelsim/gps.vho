-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"

-- DATE "01/29/2018 23:42:39"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	OnChipM68xxIO IS
    PORT (
	RS232_TxData : OUT std_logic;
	ACIA_IRQ : OUT std_logic;
	Clock_50Mhz : IN std_logic;
	Reset_L : IN std_logic;
	IOSelect_H : IN std_logic;
	ByteSelect_L : IN std_logic;
	WE_L : IN std_logic;
	Address : IN std_logic_vector(15 DOWNTO 0);
	DataIn : IN std_logic_vector(7 DOWNTO 0);
	GPS_RxData : IN std_logic;
	GPS_TxData : OUT std_logic;
	BlueTooth_TxData : OUT std_logic;
	TouchScreen_TxData : OUT std_logic;
	DataOut : OUT std_logic_vector(7 DOWNTO 0);
	RS232_RxData : IN std_logic;
	BlueTooth_RxData : IN std_logic;
	TouchScreen_RxData : IN std_logic
	);
END OnChipM68xxIO;

-- Design Ports Information
-- RS232_TxData	=>  Location: PIN_AJ11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ACIA_IRQ	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GPS_TxData	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BlueTooth_TxData	=>  Location: PIN_AJ10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TouchScreen_TxData	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataOut[7]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataOut[6]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataOut[5]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataOut[4]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataOut[3]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataOut[2]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataOut[1]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataOut[0]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RS232_RxData	=>  Location: PIN_AK27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BlueTooth_RxData	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TouchScreen_RxData	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clock_50Mhz	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataIn[6]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[1]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WE_L	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[2]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[5]	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[4]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[3]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[0]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IOSelect_H	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ByteSelect_L	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[15]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[14]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[13]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[12]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[11]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[10]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[9]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[8]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[7]	=>  Location: PIN_W24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Address[6]	=>  Location: PIN_AH30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataIn[5]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataIn[7]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset_L	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataIn[2]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataIn[1]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataIn[0]	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataIn[3]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataIn[4]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GPS_RxData	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF OnChipM68xxIO IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_RS232_TxData : std_logic;
SIGNAL ww_ACIA_IRQ : std_logic;
SIGNAL ww_Clock_50Mhz : std_logic;
SIGNAL ww_Reset_L : std_logic;
SIGNAL ww_IOSelect_H : std_logic;
SIGNAL ww_ByteSelect_L : std_logic;
SIGNAL ww_WE_L : std_logic;
SIGNAL ww_Address : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_DataIn : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_GPS_RxData : std_logic;
SIGNAL ww_GPS_TxData : std_logic;
SIGNAL ww_BlueTooth_TxData : std_logic;
SIGNAL ww_TouchScreen_TxData : std_logic;
SIGNAL ww_DataOut : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_RS232_RxData : std_logic;
SIGNAL ww_BlueTooth_RxData : std_logic;
SIGNAL ww_TouchScreen_RxData : std_logic;
SIGNAL \RS232_RxData~input_o\ : std_logic;
SIGNAL \BlueTooth_RxData~input_o\ : std_logic;
SIGNAL \TouchScreen_RxData~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \Address[1]~input_o\ : std_logic;
SIGNAL \Clock_50Mhz~input_o\ : std_logic;
SIGNAL \Clock_50Mhz~inputCLKENA0_outclk\ : std_logic;
SIGNAL \GPS_RxData~input_o\ : std_logic;
SIGNAL \DataIn[1]~input_o\ : std_logic;
SIGNAL \Address[2]~input_o\ : std_logic;
SIGNAL \WE_L~input_o\ : std_logic;
SIGNAL \Address[11]~input_o\ : std_logic;
SIGNAL \Address[9]~input_o\ : std_logic;
SIGNAL \Address[7]~input_o\ : std_logic;
SIGNAL \Address[10]~input_o\ : std_logic;
SIGNAL \Address[8]~input_o\ : std_logic;
SIGNAL \Address[6]~input_o\ : std_logic;
SIGNAL \inst|GPS_Port_Enable~2_combout\ : std_logic;
SIGNAL \Address[4]~input_o\ : std_logic;
SIGNAL \Address[3]~input_o\ : std_logic;
SIGNAL \Address[5]~input_o\ : std_logic;
SIGNAL \Address[0]~input_o\ : std_logic;
SIGNAL \inst|GPS_Port_Enable~0_combout\ : std_logic;
SIGNAL \Address[13]~input_o\ : std_logic;
SIGNAL \ByteSelect_L~input_o\ : std_logic;
SIGNAL \Address[15]~input_o\ : std_logic;
SIGNAL \IOSelect_H~input_o\ : std_logic;
SIGNAL \Address[12]~input_o\ : std_logic;
SIGNAL \Address[14]~input_o\ : std_logic;
SIGNAL \inst|GPS_Port_Enable~1_combout\ : std_logic;
SIGNAL \inst2|CtrlReg[6]~0_combout\ : std_logic;
SIGNAL \DataIn[0]~input_o\ : std_logic;
SIGNAL \inst2|Reset~0_combout\ : std_logic;
SIGNAL \Reset_L~input_o\ : std_logic;
SIGNAL \inst2|Reset~q\ : std_logic;
SIGNAL \inst2|RxDev|RxDatDel0~q\ : std_logic;
SIGNAL \inst2|RxDev|RxDatDel1~q\ : std_logic;
SIGNAL \inst2|RxDev|RxDatDel2~q\ : std_logic;
SIGNAL \DataIn[4]~input_o\ : std_logic;
SIGNAL \inst2|CtrlReg[4]~feeder_combout\ : std_logic;
SIGNAL \inst1|inst5|Add2~29_sumout\ : std_logic;
SIGNAL \inst1|inst5|ACIA_Count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|inst5|ACIA_Count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \DataIn[2]~input_o\ : std_logic;
SIGNAL \inst|GPS_Baud_Enable~0_combout\ : std_logic;
SIGNAL \inst1|inst5|Equal4~0_combout\ : std_logic;
SIGNAL \inst1|inst5|Equal2~0_combout\ : std_logic;
SIGNAL \inst1|inst5|Equal3~0_combout\ : std_logic;
SIGNAL \inst1|inst5|Equal0~0_combout\ : std_logic;
SIGNAL \inst1|inst5|HALF_CYCLE[3]~2_combout\ : std_logic;
SIGNAL \inst1|inst5|HALF_CYCLE~1_combout\ : std_logic;
SIGNAL \inst1|inst5|Add0~10\ : std_logic;
SIGNAL \inst1|inst5|Add0~14\ : std_logic;
SIGNAL \inst1|inst5|Add0~18\ : std_logic;
SIGNAL \inst1|inst5|Add0~22\ : std_logic;
SIGNAL \inst1|inst5|Add0~26\ : std_logic;
SIGNAL \inst1|inst5|Add0~30\ : std_logic;
SIGNAL \inst1|inst5|Add0~33_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add0~34\ : std_logic;
SIGNAL \inst1|inst5|Add0~37_sumout\ : std_logic;
SIGNAL \inst1|inst5|HALF_CYCLE[3]~0_combout\ : std_logic;
SIGNAL \inst1|inst5|Add0~38\ : std_logic;
SIGNAL \inst1|inst5|Add0~41_sumout\ : std_logic;
SIGNAL \inst1|inst5|Equal5~3_combout\ : std_logic;
SIGNAL \inst1|inst5|Add0~21_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add0~25_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add0~29_sumout\ : std_logic;
SIGNAL \inst1|inst5|Equal5~2_combout\ : std_logic;
SIGNAL \inst1|inst5|ACIA_Count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|inst5|Add0~9_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add0~17_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add0~13_sumout\ : std_logic;
SIGNAL \inst1|inst5|Equal5~0_combout\ : std_logic;
SIGNAL \inst1|inst5|Add2~10\ : std_logic;
SIGNAL \inst1|inst5|Add2~13_sumout\ : std_logic;
SIGNAL \inst1|inst5|ACIA_Count[11]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|inst5|Add0~42\ : std_logic;
SIGNAL \inst1|inst5|Add0~1_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add0~2\ : std_logic;
SIGNAL \inst1|inst5|Add0~5_sumout\ : std_logic;
SIGNAL \inst1|inst5|Equal5~4_combout\ : std_logic;
SIGNAL \inst1|inst5|Equal5~5_combout\ : std_logic;
SIGNAL \inst1|inst5|Add2~30\ : std_logic;
SIGNAL \inst1|inst5|Add2~33_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add2~34\ : std_logic;
SIGNAL \inst1|inst5|Add2~37_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add2~38\ : std_logic;
SIGNAL \inst1|inst5|Add2~41_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add2~42\ : std_logic;
SIGNAL \inst1|inst5|Add2~45_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add2~46\ : std_logic;
SIGNAL \inst1|inst5|Add2~21_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add2~22\ : std_logic;
SIGNAL \inst1|inst5|Add2~25_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add2~26\ : std_logic;
SIGNAL \inst1|inst5|Add2~17_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add2~18\ : std_logic;
SIGNAL \inst1|inst5|Add2~1_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add2~2\ : std_logic;
SIGNAL \inst1|inst5|Add2~5_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add2~6\ : std_logic;
SIGNAL \inst1|inst5|Add2~9_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add1~22\ : std_logic;
SIGNAL \inst1|inst5|Add1~26\ : std_logic;
SIGNAL \inst1|inst5|Add1~30\ : std_logic;
SIGNAL \inst1|inst5|Add1~34\ : std_logic;
SIGNAL \inst1|inst5|Add1~38\ : std_logic;
SIGNAL \inst1|inst5|Add1~10\ : std_logic;
SIGNAL \inst1|inst5|Add1~14\ : std_logic;
SIGNAL \inst1|inst5|Add1~18\ : std_logic;
SIGNAL \inst1|inst5|Add1~1_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add1~2\ : std_logic;
SIGNAL \inst1|inst5|Add1~5_sumout\ : std_logic;
SIGNAL \inst1|inst5|ACIA_Clk~0_combout\ : std_logic;
SIGNAL \inst1|inst5|Equal5~1_combout\ : std_logic;
SIGNAL \inst1|inst5|ACIA_Clk~q\ : std_logic;
SIGNAL \inst1|inst5|Add1~17_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add1~33_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add1~37_sumout\ : std_logic;
SIGNAL \inst1|inst5|ACIA_Clk~2_combout\ : std_logic;
SIGNAL \inst1|inst5|Add1~21_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add1~25_sumout\ : std_logic;
SIGNAL \inst1|inst5|Add1~29_sumout\ : std_logic;
SIGNAL \inst1|inst5|ACIA_Clk~1_combout\ : std_logic;
SIGNAL \inst1|inst5|Add1~13_sumout\ : std_logic;
SIGNAL \inst1|inst5|Equal6~1_combout\ : std_logic;
SIGNAL \inst1|inst5|Add1~9_sumout\ : std_logic;
SIGNAL \inst1|inst5|Equal6~0_combout\ : std_logic;
SIGNAL \inst1|inst5|ACIA_Clk~3_combout\ : std_logic;
SIGNAL \inst1|inst5|ACIA_Clk~4_combout\ : std_logic;
SIGNAL \inst1|inst5|ACIA_Clk~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|TxClkDel~q\ : std_logic;
SIGNAL \inst2|RxDev|RxClkEdge~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxClkEdge~q\ : std_logic;
SIGNAL \inst2|RxDev|Add0~21_sumout\ : std_logic;
SIGNAL \inst2|RxDev|RxDatEdge~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxDatEdge~q\ : std_logic;
SIGNAL \inst2|RxDev|Add0~22\ : std_logic;
SIGNAL \inst2|RxDev|Add0~17_sumout\ : std_logic;
SIGNAL \inst2|RxDev|Add0~18\ : std_logic;
SIGNAL \inst2|RxDev|Add0~13_sumout\ : std_logic;
SIGNAL \inst2|RxDev|Add0~14\ : std_logic;
SIGNAL \inst2|RxDev|Add0~5_sumout\ : std_logic;
SIGNAL \inst2|RxDev|Add0~6\ : std_logic;
SIGNAL \inst2|RxDev|Add0~9_sumout\ : std_logic;
SIGNAL \inst2|RxDev|Add0~10\ : std_logic;
SIGNAL \inst2|RxDev|Add0~1_sumout\ : std_logic;
SIGNAL \inst2|RxDev|Mux0~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxBdDel~q\ : std_logic;
SIGNAL \inst2|RxDev|RxBdEdge~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxBdEdge~q\ : std_logic;
SIGNAL \inst2|RxDev|Selector10~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxState.RxParity_state~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|RxDev|RxState.RxStop_state~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|RxDev|RxBitCount[2]~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|Selector9~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|Selector13~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxState.RxData_state~q\ : std_logic;
SIGNAL \inst2|RxDev|Selector11~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxBitCount[0]~DUPLICATE_q\ : std_logic;
SIGNAL \DataIn[3]~input_o\ : std_logic;
SIGNAL \inst2|RxDev|Selector14~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxState.RxParity_state~q\ : std_logic;
SIGNAL \inst2|RxDev|Selector15~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|Selector15~1_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxState.RxStop_state~q\ : std_logic;
SIGNAL \inst2|RxDev|Selector12~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxState.RxStart_State~q\ : std_logic;
SIGNAL \inst2|RxDev|RxShiftReg[7]~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxDout[7]~0_combout\ : std_logic;
SIGNAL \DataIn[6]~input_o\ : std_logic;
SIGNAL \DataIn[7]~input_o\ : std_logic;
SIGNAL \inst2|CtrlReg[7]~feeder_combout\ : std_logic;
SIGNAL \DataIn[5]~input_o\ : std_logic;
SIGNAL \inst2|ReadRR~0_combout\ : std_logic;
SIGNAL \inst2|ReadRR~q\ : std_logic;
SIGNAL \inst2|RxDev|Selector16~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxAck~q\ : std_logic;
SIGNAL \inst2|RxDev|RxReq~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxReq~q\ : std_logic;
SIGNAL \inst2|RxDev|RxAck~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|RxDev|RxReady~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxReady~q\ : std_logic;
SIGNAL \inst2|WriteTR~0_combout\ : std_logic;
SIGNAL \inst2|WriteTR~q\ : std_logic;
SIGNAL \inst2|TxDev|TxClkEdge~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxClkEdge~q\ : std_logic;
SIGNAL \inst2|TxDev|TxClkCnt[0]~6_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxClkCnt[3]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|TxClkCnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|TxClkCnt[1]~5_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxClkCnt[2]~4_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxClkCnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|TxClkCnt[3]~2_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxClkCnt[4]~3_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxClkCnt[3]~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxClkCnt[5]~1_combout\ : std_logic;
SIGNAL \inst2|TxDev|Mux0~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxBdDel~q\ : std_logic;
SIGNAL \inst2|TxDev|TxBdEdge~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxBdEdge~q\ : std_logic;
SIGNAL \inst2|TxDev|TxState.TxStart_State~q\ : std_logic;
SIGNAL \inst2|TxDev|TxBitCount[0]~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|Add1~1_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxBitCount[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|Add1~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxBitCount[2]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|Selector4~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxState.TxData_State~q\ : std_logic;
SIGNAL \inst2|TxDev|TxBitCount[0]~_wirecell_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxBitCount[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|Equal0~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxState.Tx1Stop_State~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|Selector5~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxState.TxParity_State~q\ : std_logic;
SIGNAL \inst2|TxDev|Selector6~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxState.Tx2Stop_State~q\ : std_logic;
SIGNAL \inst2|TxDev|Selector2~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|Selector2~1_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxState.Tx1Stop_State~q\ : std_logic;
SIGNAL \inst2|TxDev|TxReq~q\ : std_logic;
SIGNAL \inst2|TxDev|Selector3~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxState.TxStart_State~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|Selector1~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxAck~feeder_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxAck~q\ : std_logic;
SIGNAL \inst2|TxDev|TxReq~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxReq~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|TxEmp~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxEmp~q\ : std_logic;
SIGNAL \inst2|StatReg~0_combout\ : std_logic;
SIGNAL \inst2|InternalDataOut[7]~0_combout\ : std_logic;
SIGNAL \inst2|ACIA_DataOut~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxPErr~q\ : std_logic;
SIGNAL \inst2|RxDev|Selector8~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxParity~q\ : std_logic;
SIGNAL \inst2|RxDev|RxPErr~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxPErr~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|RxDev|RxShiftReg[6]~feeder_combout\ : std_logic;
SIGNAL \inst2|InternalDataOut[6]~1_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxOErr~q\ : std_logic;
SIGNAL \inst2|RxDev|RxDout[5]~feeder_combout\ : std_logic;
SIGNAL \inst2|InternalDataOut[5]~2_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxDout[4]~feeder_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxFErr~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxFErr~q\ : std_logic;
SIGNAL \inst2|InternalDataOut[4]~3_combout\ : std_logic;
SIGNAL \inst2|InternalDataOut[3]~4_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxShiftReg[2]~feeder_combout\ : std_logic;
SIGNAL \inst2|InternalDataOut[2]~5_combout\ : std_logic;
SIGNAL \inst2|StatReg[1]~1_combout\ : std_logic;
SIGNAL \inst2|InternalDataOut[1]~6_combout\ : std_logic;
SIGNAL \inst2|RxDev|RxShiftReg[0]~feeder_combout\ : std_logic;
SIGNAL \inst2|InternalDataOut[0]~7_combout\ : std_logic;
SIGNAL \inst2|TxDev|Selector7~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxShiftReg[6]~feeder_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxShiftReg[5]~feeder_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxShiftReg[4]~feeder_combout\ : std_logic;
SIGNAL \inst2|TranReg[4]~feeder_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxShiftReg[3]~feeder_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxShiftReg[2]~feeder_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxShiftReg[1]~feeder_combout\ : std_logic;
SIGNAL \inst2|TranReg[1]~feeder_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxShiftReg[0]~feeder_combout\ : std_logic;
SIGNAL \inst2|TxDev|Selector15~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxParity~q\ : std_logic;
SIGNAL \inst2|TxDev|Selector0~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|Selector0~1_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxDat~feeder_combout\ : std_logic;
SIGNAL \inst2|TxDev|TxDat~q\ : std_logic;
SIGNAL \inst2|Mux1~0_combout\ : std_logic;
SIGNAL \inst2|CtrlReg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst2|RxDev|RxShiftReg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst2|TxDev|TxShiftReg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst2|RxDev|RxClkCnt\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst2|TxDev|TxBitCount\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst2|TranReg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst1|inst5|ACIA_Count\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst2|StatReg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst2|RxDev|RxDout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst2|TxDev|TxClkCnt\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst2|RxDev|RxBitCount\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst1|inst6|Q\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst2|TxDev|ALT_INV_Selector0~1_combout\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxState.TxData_State~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxState.TxParity_State~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxParity~q\ : std_logic;
SIGNAL \inst2|ALT_INV_CtrlReg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst2|TxDev|ALT_INV_TxState.Tx2Stop_State~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxState.Tx1Stop_State~q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxReady~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxEmp~q\ : std_logic;
SIGNAL \inst2|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxDat~q\ : std_logic;
SIGNAL \inst2|ALT_INV_StatReg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst2|RxDev|ALT_INV_RxClkCnt\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst2|TxDev|ALT_INV_TxShiftReg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst1|inst5|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add1~37_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add1~33_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_ACIA_Count\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst1|inst5|ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxShiftReg\ : std_logic_vector(7 DOWNTO 1);
SIGNAL \inst2|TxDev|ALT_INV_TxBitCount\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst2|RxDev|ALT_INV_RxBitCount[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxClkCnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxClkCnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxState.RxParity_state~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxState.RxStop_state~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxClkCnt[3]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_ACIA_Clk~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxState.TxStart_State~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxAck~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxReq~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxState.Tx1Stop_State~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_ACIA_Count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_ACIA_Count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_ACIA_Count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_ACIA_Count[11]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxBitCount[1]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxBitCount[0]~DUPLICATE_q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxBitCount[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\ : std_logic;
SIGNAL \ALT_INV_GPS_RxData~input_o\ : std_logic;
SIGNAL \ALT_INV_DataIn[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_DataIn[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_DataIn[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_ByteSelect_L~input_o\ : std_logic;
SIGNAL \ALT_INV_IOSelect_H~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_WE_L~input_o\ : std_logic;
SIGNAL \ALT_INV_Address[1]~input_o\ : std_logic;
SIGNAL \inst2|ALT_INV_TranReg\ : std_logic_vector(7 DOWNTO 7);
SIGNAL \inst2|RxDev|ALT_INV_RxClkEdge~q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxDatDel0~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxClkDel~q\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_HALF_CYCLE[3]~2_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_HALF_CYCLE~1_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_HALF_CYCLE[3]~0_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Equal3~0_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Equal4~0_combout\ : std_logic;
SIGNAL \inst1|inst6|ALT_INV_Q\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst1|inst5|ALT_INV_Equal5~4_combout\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxParity~q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_Selector15~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxBitCount\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst2|RxDev|ALT_INV_RxBdDel~q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxDatDel2~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxClkCnt[3]~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxClkCnt\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst2|TxDev|ALT_INV_TxClkEdge~q\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Equal5~3_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Equal5~2_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Equal5~1_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Equal5~0_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_ACIA_Clk~3_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_ACIA_Clk~2_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_ACIA_Clk~1_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Equal6~1_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_Equal6~0_combout\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_ACIA_Clk~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxState.RxParity_state~q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxState.RxData_state~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxPErr~q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxState.RxStop_state~q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxBdEdge~q\ : std_logic;
SIGNAL \inst1|inst5|ALT_INV_ACIA_Clk~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxBdDel~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxState.TxStart_State~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxAck~q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxReq~q\ : std_logic;
SIGNAL \inst2|ALT_INV_ReadRR~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxAck~q\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxReq~q\ : std_logic;
SIGNAL \inst2|ALT_INV_WriteTR~q\ : std_logic;
SIGNAL \inst2|RxDev|ALT_INV_RxDout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|ALT_INV_GPS_Port_Enable~2_combout\ : std_logic;
SIGNAL \inst|ALT_INV_GPS_Port_Enable~1_combout\ : std_logic;
SIGNAL \inst|ALT_INV_GPS_Port_Enable~0_combout\ : std_logic;
SIGNAL \inst2|TxDev|ALT_INV_TxBdEdge~q\ : std_logic;

BEGIN

RS232_TxData <= ww_RS232_TxData;
ACIA_IRQ <= ww_ACIA_IRQ;
ww_Clock_50Mhz <= Clock_50Mhz;
ww_Reset_L <= Reset_L;
ww_IOSelect_H <= IOSelect_H;
ww_ByteSelect_L <= ByteSelect_L;
ww_WE_L <= WE_L;
ww_Address <= Address;
ww_DataIn <= DataIn;
ww_GPS_RxData <= GPS_RxData;
GPS_TxData <= ww_GPS_TxData;
BlueTooth_TxData <= ww_BlueTooth_TxData;
TouchScreen_TxData <= ww_TouchScreen_TxData;
DataOut <= ww_DataOut;
ww_RS232_RxData <= RS232_RxData;
ww_BlueTooth_RxData <= BlueTooth_RxData;
ww_TouchScreen_RxData <= TouchScreen_RxData;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst2|TxDev|ALT_INV_Selector0~1_combout\ <= NOT \inst2|TxDev|Selector0~1_combout\;
\inst2|TxDev|ALT_INV_TxState.TxData_State~q\ <= NOT \inst2|TxDev|TxState.TxData_State~q\;
\inst2|TxDev|ALT_INV_Selector0~0_combout\ <= NOT \inst2|TxDev|Selector0~0_combout\;
\inst2|TxDev|ALT_INV_TxState.TxParity_State~q\ <= NOT \inst2|TxDev|TxState.TxParity_State~q\;
\inst2|TxDev|ALT_INV_TxParity~q\ <= NOT \inst2|TxDev|TxParity~q\;
\inst2|ALT_INV_CtrlReg\(2) <= NOT \inst2|CtrlReg\(2);
\inst2|TxDev|ALT_INV_TxState.Tx2Stop_State~q\ <= NOT \inst2|TxDev|TxState.Tx2Stop_State~q\;
\inst2|TxDev|ALT_INV_TxState.Tx1Stop_State~q\ <= NOT \inst2|TxDev|TxState.Tx1Stop_State~q\;
\inst2|RxDev|ALT_INV_RxReady~q\ <= NOT \inst2|RxDev|RxReady~q\;
\inst2|ALT_INV_CtrlReg\(7) <= NOT \inst2|CtrlReg\(7);
\inst2|TxDev|ALT_INV_TxEmp~q\ <= NOT \inst2|TxDev|TxEmp~q\;
\inst2|ALT_INV_Mux1~0_combout\ <= NOT \inst2|Mux1~0_combout\;
\inst2|ALT_INV_CtrlReg\(5) <= NOT \inst2|CtrlReg\(5);
\inst2|ALT_INV_CtrlReg\(6) <= NOT \inst2|CtrlReg\(6);
\inst2|TxDev|ALT_INV_TxDat~q\ <= NOT \inst2|TxDev|TxDat~q\;
\inst2|ALT_INV_StatReg\(7) <= NOT \inst2|StatReg\(7);
\inst2|RxDev|ALT_INV_RxClkCnt\(0) <= NOT \inst2|RxDev|RxClkCnt\(0);
\inst2|RxDev|ALT_INV_RxClkCnt\(1) <= NOT \inst2|RxDev|RxClkCnt\(1);
\inst2|TxDev|ALT_INV_TxShiftReg\(6) <= NOT \inst2|TxDev|TxShiftReg\(6);
\inst2|RxDev|ALT_INV_RxClkCnt\(2) <= NOT \inst2|RxDev|RxClkCnt\(2);
\inst2|RxDev|ALT_INV_RxClkCnt\(4) <= NOT \inst2|RxDev|RxClkCnt\(4);
\inst2|TxDev|ALT_INV_TxShiftReg\(5) <= NOT \inst2|TxDev|TxShiftReg\(5);
\inst2|TxDev|ALT_INV_TxShiftReg\(4) <= NOT \inst2|TxDev|TxShiftReg\(4);
\inst2|TxDev|ALT_INV_TxShiftReg\(3) <= NOT \inst2|TxDev|TxShiftReg\(3);
\inst2|RxDev|ALT_INV_RxClkCnt\(3) <= NOT \inst2|RxDev|RxClkCnt\(3);
\inst2|RxDev|ALT_INV_RxClkCnt\(5) <= NOT \inst2|RxDev|RxClkCnt\(5);
\inst1|inst5|ALT_INV_Add0~41_sumout\ <= NOT \inst1|inst5|Add0~41_sumout\;
\inst1|inst5|ALT_INV_Add0~37_sumout\ <= NOT \inst1|inst5|Add0~37_sumout\;
\inst1|inst5|ALT_INV_Add0~33_sumout\ <= NOT \inst1|inst5|Add0~33_sumout\;
\inst1|inst5|ALT_INV_Add0~29_sumout\ <= NOT \inst1|inst5|Add0~29_sumout\;
\inst1|inst5|ALT_INV_Add0~25_sumout\ <= NOT \inst1|inst5|Add0~25_sumout\;
\inst1|inst5|ALT_INV_Add0~21_sumout\ <= NOT \inst1|inst5|Add0~21_sumout\;
\inst1|inst5|ALT_INV_Add0~17_sumout\ <= NOT \inst1|inst5|Add0~17_sumout\;
\inst1|inst5|ALT_INV_Add0~13_sumout\ <= NOT \inst1|inst5|Add0~13_sumout\;
\inst1|inst5|ALT_INV_Add0~9_sumout\ <= NOT \inst1|inst5|Add0~9_sumout\;
\inst1|inst5|ALT_INV_Add0~5_sumout\ <= NOT \inst1|inst5|Add0~5_sumout\;
\inst1|inst5|ALT_INV_Add0~1_sumout\ <= NOT \inst1|inst5|Add0~1_sumout\;
\inst1|inst5|ALT_INV_Add1~37_sumout\ <= NOT \inst1|inst5|Add1~37_sumout\;
\inst1|inst5|ALT_INV_Add1~33_sumout\ <= NOT \inst1|inst5|Add1~33_sumout\;
\inst1|inst5|ALT_INV_ACIA_Count\(4) <= NOT \inst1|inst5|ACIA_Count\(4);
\inst1|inst5|ALT_INV_ACIA_Count\(3) <= NOT \inst1|inst5|ACIA_Count\(3);
\inst1|inst5|ALT_INV_Add1~29_sumout\ <= NOT \inst1|inst5|Add1~29_sumout\;
\inst1|inst5|ALT_INV_Add1~25_sumout\ <= NOT \inst1|inst5|Add1~25_sumout\;
\inst1|inst5|ALT_INV_Add1~21_sumout\ <= NOT \inst1|inst5|Add1~21_sumout\;
\inst1|inst5|ALT_INV_ACIA_Count\(2) <= NOT \inst1|inst5|ACIA_Count\(2);
\inst1|inst5|ALT_INV_ACIA_Count\(1) <= NOT \inst1|inst5|ACIA_Count\(1);
\inst1|inst5|ALT_INV_ACIA_Count\(0) <= NOT \inst1|inst5|ACIA_Count\(0);
\inst1|inst5|ALT_INV_Add1~17_sumout\ <= NOT \inst1|inst5|Add1~17_sumout\;
\inst1|inst5|ALT_INV_Add1~13_sumout\ <= NOT \inst1|inst5|Add1~13_sumout\;
\inst1|inst5|ALT_INV_ACIA_Count\(6) <= NOT \inst1|inst5|ACIA_Count\(6);
\inst1|inst5|ALT_INV_Add1~9_sumout\ <= NOT \inst1|inst5|Add1~9_sumout\;
\inst1|inst5|ALT_INV_ACIA_Count\(5) <= NOT \inst1|inst5|ACIA_Count\(5);
\inst1|inst5|ALT_INV_ACIA_Count\(7) <= NOT \inst1|inst5|ACIA_Count\(7);
\inst1|inst5|ALT_INV_Add1~5_sumout\ <= NOT \inst1|inst5|Add1~5_sumout\;
\inst1|inst5|ALT_INV_Add1~1_sumout\ <= NOT \inst1|inst5|Add1~1_sumout\;
\inst1|inst5|ALT_INV_ACIA_Count\(11) <= NOT \inst1|inst5|ACIA_Count\(11);
\inst1|inst5|ALT_INV_ACIA_Count\(10) <= NOT \inst1|inst5|ACIA_Count\(10);
\inst1|inst5|ALT_INV_ACIA_Count\(9) <= NOT \inst1|inst5|ACIA_Count\(9);
\inst1|inst5|ALT_INV_ACIA_Count\(8) <= NOT \inst1|inst5|ACIA_Count\(8);
\inst2|TxDev|ALT_INV_TxShiftReg\(2) <= NOT \inst2|TxDev|TxShiftReg\(2);
\inst2|RxDev|ALT_INV_RxShiftReg\(1) <= NOT \inst2|RxDev|RxShiftReg\(1);
\inst2|RxDev|ALT_INV_RxShiftReg\(3) <= NOT \inst2|RxDev|RxShiftReg\(3);
\inst2|RxDev|ALT_INV_RxShiftReg\(4) <= NOT \inst2|RxDev|RxShiftReg\(4);
\inst2|RxDev|ALT_INV_RxShiftReg\(5) <= NOT \inst2|RxDev|RxShiftReg\(5);
\inst2|RxDev|ALT_INV_RxShiftReg\(7) <= NOT \inst2|RxDev|RxShiftReg\(7);
\inst2|TxDev|ALT_INV_TxShiftReg\(1) <= NOT \inst2|TxDev|TxShiftReg\(1);
\inst2|TxDev|ALT_INV_TxBitCount\(1) <= NOT \inst2|TxDev|TxBitCount\(1);
\inst2|TxDev|ALT_INV_TxBitCount\(0) <= NOT \inst2|TxDev|TxBitCount\(0);
\inst2|TxDev|ALT_INV_TxBitCount\(2) <= NOT \inst2|TxDev|TxBitCount\(2);
\inst2|TxDev|ALT_INV_TxShiftReg\(0) <= NOT \inst2|TxDev|TxShiftReg\(0);
\inst2|RxDev|ALT_INV_RxBitCount[0]~DUPLICATE_q\ <= NOT \inst2|RxDev|RxBitCount[0]~DUPLICATE_q\;
\inst2|TxDev|ALT_INV_TxClkCnt[0]~DUPLICATE_q\ <= NOT \inst2|TxDev|TxClkCnt[0]~DUPLICATE_q\;
\inst2|TxDev|ALT_INV_TxClkCnt[2]~DUPLICATE_q\ <= NOT \inst2|TxDev|TxClkCnt[2]~DUPLICATE_q\;
\inst2|RxDev|ALT_INV_RxState.RxParity_state~DUPLICATE_q\ <= NOT \inst2|RxDev|RxState.RxParity_state~DUPLICATE_q\;
\inst2|RxDev|ALT_INV_RxState.RxStop_state~DUPLICATE_q\ <= NOT \inst2|RxDev|RxState.RxStop_state~DUPLICATE_q\;
\inst2|TxDev|ALT_INV_TxClkCnt[3]~DUPLICATE_q\ <= NOT \inst2|TxDev|TxClkCnt[3]~DUPLICATE_q\;
\inst1|inst5|ALT_INV_ACIA_Clk~DUPLICATE_q\ <= NOT \inst1|inst5|ACIA_Clk~DUPLICATE_q\;
\inst2|TxDev|ALT_INV_TxState.TxStart_State~DUPLICATE_q\ <= NOT \inst2|TxDev|TxState.TxStart_State~DUPLICATE_q\;
\inst2|RxDev|ALT_INV_RxAck~DUPLICATE_q\ <= NOT \inst2|RxDev|RxAck~DUPLICATE_q\;
\inst2|TxDev|ALT_INV_TxReq~DUPLICATE_q\ <= NOT \inst2|TxDev|TxReq~DUPLICATE_q\;
\inst2|TxDev|ALT_INV_TxState.Tx1Stop_State~DUPLICATE_q\ <= NOT \inst2|TxDev|TxState.Tx1Stop_State~DUPLICATE_q\;
\inst1|inst5|ALT_INV_ACIA_Count[1]~DUPLICATE_q\ <= NOT \inst1|inst5|ACIA_Count[1]~DUPLICATE_q\;
\inst1|inst5|ALT_INV_ACIA_Count[6]~DUPLICATE_q\ <= NOT \inst1|inst5|ACIA_Count[6]~DUPLICATE_q\;
\inst1|inst5|ALT_INV_ACIA_Count[7]~DUPLICATE_q\ <= NOT \inst1|inst5|ACIA_Count[7]~DUPLICATE_q\;
\inst1|inst5|ALT_INV_ACIA_Count[11]~DUPLICATE_q\ <= NOT \inst1|inst5|ACIA_Count[11]~DUPLICATE_q\;
\inst2|TxDev|ALT_INV_TxBitCount[1]~DUPLICATE_q\ <= NOT \inst2|TxDev|TxBitCount[1]~DUPLICATE_q\;
\inst2|TxDev|ALT_INV_TxBitCount[0]~DUPLICATE_q\ <= NOT \inst2|TxDev|TxBitCount[0]~DUPLICATE_q\;
\inst2|TxDev|ALT_INV_TxBitCount[2]~DUPLICATE_q\ <= NOT \inst2|TxDev|TxBitCount[2]~DUPLICATE_q\;
\ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\ <= NOT \Clock_50Mhz~inputCLKENA0_outclk\;
\ALT_INV_GPS_RxData~input_o\ <= NOT \GPS_RxData~input_o\;
\ALT_INV_DataIn[4]~input_o\ <= NOT \DataIn[4]~input_o\;
\ALT_INV_DataIn[1]~input_o\ <= NOT \DataIn[1]~input_o\;
\ALT_INV_DataIn[7]~input_o\ <= NOT \DataIn[7]~input_o\;
\ALT_INV_Address[6]~input_o\ <= NOT \Address[6]~input_o\;
\ALT_INV_Address[7]~input_o\ <= NOT \Address[7]~input_o\;
\ALT_INV_Address[8]~input_o\ <= NOT \Address[8]~input_o\;
\ALT_INV_Address[9]~input_o\ <= NOT \Address[9]~input_o\;
\ALT_INV_Address[10]~input_o\ <= NOT \Address[10]~input_o\;
\ALT_INV_Address[11]~input_o\ <= NOT \Address[11]~input_o\;
\ALT_INV_Address[12]~input_o\ <= NOT \Address[12]~input_o\;
\ALT_INV_Address[13]~input_o\ <= NOT \Address[13]~input_o\;
\ALT_INV_Address[14]~input_o\ <= NOT \Address[14]~input_o\;
\ALT_INV_Address[15]~input_o\ <= NOT \Address[15]~input_o\;
\ALT_INV_ByteSelect_L~input_o\ <= NOT \ByteSelect_L~input_o\;
\ALT_INV_IOSelect_H~input_o\ <= NOT \IOSelect_H~input_o\;
\ALT_INV_Address[0]~input_o\ <= NOT \Address[0]~input_o\;
\ALT_INV_Address[3]~input_o\ <= NOT \Address[3]~input_o\;
\ALT_INV_Address[4]~input_o\ <= NOT \Address[4]~input_o\;
\ALT_INV_Address[5]~input_o\ <= NOT \Address[5]~input_o\;
\ALT_INV_Address[2]~input_o\ <= NOT \Address[2]~input_o\;
\ALT_INV_WE_L~input_o\ <= NOT \WE_L~input_o\;
\ALT_INV_Address[1]~input_o\ <= NOT \Address[1]~input_o\;
\inst2|ALT_INV_TranReg\(7) <= NOT \inst2|TranReg\(7);
\inst2|RxDev|ALT_INV_RxClkEdge~q\ <= NOT \inst2|RxDev|RxClkEdge~q\;
\inst2|TxDev|ALT_INV_TxShiftReg\(7) <= NOT \inst2|TxDev|TxShiftReg\(7);
\inst2|RxDev|ALT_INV_RxDatDel0~q\ <= NOT \inst2|RxDev|RxDatDel0~q\;
\inst2|TxDev|ALT_INV_TxClkDel~q\ <= NOT \inst2|TxDev|TxClkDel~q\;
\inst1|inst5|ALT_INV_HALF_CYCLE[3]~2_combout\ <= NOT \inst1|inst5|HALF_CYCLE[3]~2_combout\;
\inst1|inst5|ALT_INV_HALF_CYCLE~1_combout\ <= NOT \inst1|inst5|HALF_CYCLE~1_combout\;
\inst1|inst5|ALT_INV_Equal2~0_combout\ <= NOT \inst1|inst5|Equal2~0_combout\;
\inst1|inst5|ALT_INV_Equal0~0_combout\ <= NOT \inst1|inst5|Equal0~0_combout\;
\inst1|inst5|ALT_INV_HALF_CYCLE[3]~0_combout\ <= NOT \inst1|inst5|HALF_CYCLE[3]~0_combout\;
\inst1|inst5|ALT_INV_Equal3~0_combout\ <= NOT \inst1|inst5|Equal3~0_combout\;
\inst1|inst5|ALT_INV_Equal4~0_combout\ <= NOT \inst1|inst5|Equal4~0_combout\;
\inst1|inst6|ALT_INV_Q\(0) <= NOT \inst1|inst6|Q\(0);
\inst1|inst6|ALT_INV_Q\(1) <= NOT \inst1|inst6|Q\(1);
\inst1|inst6|ALT_INV_Q\(2) <= NOT \inst1|inst6|Q\(2);
\inst1|inst5|ALT_INV_Equal5~4_combout\ <= NOT \inst1|inst5|Equal5~4_combout\;
\inst2|RxDev|ALT_INV_RxParity~q\ <= NOT \inst2|RxDev|RxParity~q\;
\inst2|RxDev|ALT_INV_Selector15~0_combout\ <= NOT \inst2|RxDev|Selector15~0_combout\;
\inst2|RxDev|ALT_INV_RxBitCount\(0) <= NOT \inst2|RxDev|RxBitCount\(0);
\inst2|RxDev|ALT_INV_RxBitCount\(1) <= NOT \inst2|RxDev|RxBitCount\(1);
\inst2|RxDev|ALT_INV_RxBitCount\(2) <= NOT \inst2|RxDev|RxBitCount\(2);
\inst2|RxDev|ALT_INV_RxBdDel~q\ <= NOT \inst2|RxDev|RxBdDel~q\;
\inst2|RxDev|ALT_INV_RxDatDel2~q\ <= NOT \inst2|RxDev|RxDatDel2~q\;
\inst2|TxDev|ALT_INV_TxClkCnt[3]~0_combout\ <= NOT \inst2|TxDev|TxClkCnt[3]~0_combout\;
\inst2|TxDev|ALT_INV_TxClkCnt\(0) <= NOT \inst2|TxDev|TxClkCnt\(0);
\inst2|TxDev|ALT_INV_TxClkEdge~q\ <= NOT \inst2|TxDev|TxClkEdge~q\;
\inst2|TxDev|ALT_INV_TxClkCnt\(1) <= NOT \inst2|TxDev|TxClkCnt\(1);
\inst2|TxDev|ALT_INV_TxClkCnt\(2) <= NOT \inst2|TxDev|TxClkCnt\(2);
\inst2|TxDev|ALT_INV_TxClkCnt\(4) <= NOT \inst2|TxDev|TxClkCnt\(4);
\inst1|inst5|ALT_INV_Equal5~3_combout\ <= NOT \inst1|inst5|Equal5~3_combout\;
\inst1|inst5|ALT_INV_Equal5~2_combout\ <= NOT \inst1|inst5|Equal5~2_combout\;
\inst1|inst5|ALT_INV_Equal5~1_combout\ <= NOT \inst1|inst5|Equal5~1_combout\;
\inst1|inst5|ALT_INV_Equal5~0_combout\ <= NOT \inst1|inst5|Equal5~0_combout\;
\inst1|inst5|ALT_INV_ACIA_Clk~3_combout\ <= NOT \inst1|inst5|ACIA_Clk~3_combout\;
\inst1|inst5|ALT_INV_ACIA_Clk~2_combout\ <= NOT \inst1|inst5|ACIA_Clk~2_combout\;
\inst1|inst5|ALT_INV_ACIA_Clk~1_combout\ <= NOT \inst1|inst5|ACIA_Clk~1_combout\;
\inst1|inst5|ALT_INV_Equal6~1_combout\ <= NOT \inst1|inst5|Equal6~1_combout\;
\inst1|inst5|ALT_INV_Equal6~0_combout\ <= NOT \inst1|inst5|Equal6~0_combout\;
\inst1|inst5|ALT_INV_ACIA_Clk~0_combout\ <= NOT \inst1|inst5|ACIA_Clk~0_combout\;
\inst2|RxDev|ALT_INV_RxState.RxParity_state~q\ <= NOT \inst2|RxDev|RxState.RxParity_state~q\;
\inst2|RxDev|ALT_INV_RxState.RxStart_State~q\ <= NOT \inst2|RxDev|RxState.RxStart_State~q\;
\inst2|RxDev|ALT_INV_RxState.RxData_state~q\ <= NOT \inst2|RxDev|RxState.RxData_state~q\;
\inst2|TxDev|ALT_INV_Selector1~0_combout\ <= NOT \inst2|TxDev|Selector1~0_combout\;
\inst2|RxDev|ALT_INV_RxPErr~q\ <= NOT \inst2|RxDev|RxPErr~q\;
\inst2|RxDev|ALT_INV_RxState.RxStop_state~q\ <= NOT \inst2|RxDev|RxState.RxStop_state~q\;
\inst2|RxDev|ALT_INV_RxBdEdge~q\ <= NOT \inst2|RxDev|RxBdEdge~q\;
\inst2|TxDev|ALT_INV_TxClkCnt\(3) <= NOT \inst2|TxDev|TxClkCnt\(3);
\inst2|TxDev|ALT_INV_TxClkCnt\(5) <= NOT \inst2|TxDev|TxClkCnt\(5);
\inst1|inst5|ALT_INV_ACIA_Clk~q\ <= NOT \inst1|inst5|ACIA_Clk~q\;
\inst2|TxDev|ALT_INV_TxBdDel~q\ <= NOT \inst2|TxDev|TxBdDel~q\;
\inst2|TxDev|ALT_INV_TxState.TxStart_State~q\ <= NOT \inst2|TxDev|TxState.TxStart_State~q\;
\inst2|TxDev|ALT_INV_Selector2~0_combout\ <= NOT \inst2|TxDev|Selector2~0_combout\;
\inst2|TxDev|ALT_INV_Equal0~0_combout\ <= NOT \inst2|TxDev|Equal0~0_combout\;
\inst2|ALT_INV_CtrlReg\(4) <= NOT \inst2|CtrlReg\(4);
\inst2|ALT_INV_CtrlReg\(3) <= NOT \inst2|CtrlReg\(3);
\inst2|ALT_INV_CtrlReg\(0) <= NOT \inst2|CtrlReg\(0);
\inst2|ALT_INV_CtrlReg\(1) <= NOT \inst2|CtrlReg\(1);
\inst2|RxDev|ALT_INV_RxAck~q\ <= NOT \inst2|RxDev|RxAck~q\;
\inst2|RxDev|ALT_INV_RxReq~q\ <= NOT \inst2|RxDev|RxReq~q\;
\inst2|ALT_INV_ReadRR~q\ <= NOT \inst2|ReadRR~q\;
\inst2|TxDev|ALT_INV_TxAck~q\ <= NOT \inst2|TxDev|TxAck~q\;
\inst2|TxDev|ALT_INV_TxReq~q\ <= NOT \inst2|TxDev|TxReq~q\;
\inst2|ALT_INV_WriteTR~q\ <= NOT \inst2|WriteTR~q\;
\inst2|ALT_INV_StatReg\(0) <= NOT \inst2|StatReg\(0);
\inst2|RxDev|ALT_INV_RxDout\(0) <= NOT \inst2|RxDev|RxDout\(0);
\inst2|ALT_INV_StatReg\(1) <= NOT \inst2|StatReg\(1);
\inst2|RxDev|ALT_INV_RxDout\(1) <= NOT \inst2|RxDev|RxDout\(1);
\inst2|RxDev|ALT_INV_RxDout\(2) <= NOT \inst2|RxDev|RxDout\(2);
\inst2|RxDev|ALT_INV_RxDout\(3) <= NOT \inst2|RxDev|RxDout\(3);
\inst2|ALT_INV_StatReg\(4) <= NOT \inst2|StatReg\(4);
\inst2|RxDev|ALT_INV_RxDout\(4) <= NOT \inst2|RxDev|RxDout\(4);
\inst2|ALT_INV_StatReg\(5) <= NOT \inst2|StatReg\(5);
\inst2|RxDev|ALT_INV_RxDout\(5) <= NOT \inst2|RxDev|RxDout\(5);
\inst2|ALT_INV_StatReg\(6) <= NOT \inst2|StatReg\(6);
\inst2|RxDev|ALT_INV_RxDout\(6) <= NOT \inst2|RxDev|RxDout\(6);
\inst2|RxDev|ALT_INV_RxDout\(7) <= NOT \inst2|RxDev|RxDout\(7);
\inst|ALT_INV_GPS_Port_Enable~2_combout\ <= NOT \inst|GPS_Port_Enable~2_combout\;
\inst|ALT_INV_GPS_Port_Enable~1_combout\ <= NOT \inst|GPS_Port_Enable~1_combout\;
\inst|ALT_INV_GPS_Port_Enable~0_combout\ <= NOT \inst|GPS_Port_Enable~0_combout\;
\inst2|TxDev|ALT_INV_TxBdEdge~q\ <= NOT \inst2|TxDev|TxBdEdge~q\;

-- Location: IOOBUF_X89_Y13_N5
\DataOut[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|InternalDataOut[7]~0_combout\,
	oe => \inst2|ACIA_DataOut~0_combout\,
	devoe => ww_devoe,
	o => ww_DataOut(7));

-- Location: IOOBUF_X40_Y81_N53
\DataOut[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|InternalDataOut[6]~1_combout\,
	oe => \inst2|ACIA_DataOut~0_combout\,
	devoe => ww_devoe,
	o => ww_DataOut(6));

-- Location: IOOBUF_X89_Y20_N45
\DataOut[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|InternalDataOut[5]~2_combout\,
	oe => \inst2|ACIA_DataOut~0_combout\,
	devoe => ww_devoe,
	o => ww_DataOut(5));

-- Location: IOOBUF_X40_Y81_N36
\DataOut[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|InternalDataOut[4]~3_combout\,
	oe => \inst2|ACIA_DataOut~0_combout\,
	devoe => ww_devoe,
	o => ww_DataOut(4));

-- Location: IOOBUF_X89_Y13_N56
\DataOut[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|InternalDataOut[3]~4_combout\,
	oe => \inst2|ACIA_DataOut~0_combout\,
	devoe => ww_devoe,
	o => ww_DataOut(3));

-- Location: IOOBUF_X89_Y20_N96
\DataOut[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|InternalDataOut[2]~5_combout\,
	oe => \inst2|ACIA_DataOut~0_combout\,
	devoe => ww_devoe,
	o => ww_DataOut(2));

-- Location: IOOBUF_X89_Y13_N39
\DataOut[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|InternalDataOut[1]~6_combout\,
	oe => \inst2|ACIA_DataOut~0_combout\,
	devoe => ww_devoe,
	o => ww_DataOut(1));

-- Location: IOOBUF_X89_Y20_N79
\DataOut[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|InternalDataOut[0]~7_combout\,
	oe => \inst2|ACIA_DataOut~0_combout\,
	devoe => ww_devoe,
	o => ww_DataOut(0));

-- Location: IOOBUF_X34_Y0_N42
\RS232_TxData~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_RS232_TxData);

-- Location: IOOBUF_X89_Y21_N56
\ACIA_IRQ~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|StatReg\(7),
	devoe => ww_devoe,
	o => ww_ACIA_IRQ);

-- Location: IOOBUF_X40_Y81_N2
\GPS_TxData~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_GPS_TxData);

-- Location: IOOBUF_X34_Y0_N93
\BlueTooth_TxData~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_BlueTooth_TxData);

-- Location: IOOBUF_X24_Y0_N2
\TouchScreen_TxData~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_TouchScreen_TxData);

-- Location: IOIBUF_X89_Y25_N38
\Address[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(1),
	o => \Address[1]~input_o\);

-- Location: IOIBUF_X89_Y23_N21
\Clock_50Mhz~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clock_50Mhz,
	o => \Clock_50Mhz~input_o\);

-- Location: CLKCTRL_G11
\Clock_50Mhz~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \Clock_50Mhz~input_o\,
	outclk => \Clock_50Mhz~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y15_N4
\GPS_RxData~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GPS_RxData,
	o => \GPS_RxData~input_o\);

-- Location: IOIBUF_X89_Y23_N55
\DataIn[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DataIn(1),
	o => \DataIn[1]~input_o\);

-- Location: IOIBUF_X89_Y21_N38
\Address[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(2),
	o => \Address[2]~input_o\);

-- Location: IOIBUF_X89_Y25_N21
\WE_L~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WE_L,
	o => \WE_L~input_o\);

-- Location: IOIBUF_X89_Y16_N4
\Address[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(11),
	o => \Address[11]~input_o\);

-- Location: IOIBUF_X89_Y16_N21
\Address[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(9),
	o => \Address[9]~input_o\);

-- Location: IOIBUF_X89_Y15_N21
\Address[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(7),
	o => \Address[7]~input_o\);

-- Location: IOIBUF_X89_Y9_N21
\Address[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(10),
	o => \Address[10]~input_o\);

-- Location: IOIBUF_X89_Y16_N55
\Address[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(8),
	o => \Address[8]~input_o\);

-- Location: IOIBUF_X89_Y16_N38
\Address[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(6),
	o => \Address[6]~input_o\);

-- Location: LABCELL_X88_Y16_N12
\inst|GPS_Port_Enable~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|GPS_Port_Enable~2_combout\ = ( !\Address[8]~input_o\ & ( !\Address[6]~input_o\ & ( (!\Address[11]~input_o\ & (\Address[9]~input_o\ & (!\Address[7]~input_o\ & !\Address[10]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Address[11]~input_o\,
	datab => \ALT_INV_Address[9]~input_o\,
	datac => \ALT_INV_Address[7]~input_o\,
	datad => \ALT_INV_Address[10]~input_o\,
	datae => \ALT_INV_Address[8]~input_o\,
	dataf => \ALT_INV_Address[6]~input_o\,
	combout => \inst|GPS_Port_Enable~2_combout\);

-- Location: IOIBUF_X89_Y25_N4
\Address[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(4),
	o => \Address[4]~input_o\);

-- Location: IOIBUF_X89_Y13_N21
\Address[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(3),
	o => \Address[3]~input_o\);

-- Location: IOIBUF_X89_Y15_N55
\Address[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(5),
	o => \Address[5]~input_o\);

-- Location: IOIBUF_X89_Y15_N38
\Address[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(0),
	o => \Address[0]~input_o\);

-- Location: LABCELL_X75_Y16_N36
\inst|GPS_Port_Enable~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|GPS_Port_Enable~0_combout\ = ( !\Address[0]~input_o\ & ( (\Address[4]~input_o\ & (!\Address[3]~input_o\ & !\Address[5]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001000000000000000000000001000000010000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Address[4]~input_o\,
	datab => \ALT_INV_Address[3]~input_o\,
	datac => \ALT_INV_Address[5]~input_o\,
	datae => \ALT_INV_Address[0]~input_o\,
	combout => \inst|GPS_Port_Enable~0_combout\);

-- Location: IOIBUF_X89_Y11_N61
\Address[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(13),
	o => \Address[13]~input_o\);

-- Location: IOIBUF_X89_Y9_N38
\ByteSelect_L~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ByteSelect_L,
	o => \ByteSelect_L~input_o\);

-- Location: IOIBUF_X89_Y9_N55
\Address[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(15),
	o => \Address[15]~input_o\);

-- Location: IOIBUF_X89_Y11_N44
\IOSelect_H~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IOSelect_H,
	o => \IOSelect_H~input_o\);

-- Location: IOIBUF_X89_Y11_N95
\Address[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(12),
	o => \Address[12]~input_o\);

-- Location: IOIBUF_X89_Y11_N78
\Address[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Address(14),
	o => \Address[14]~input_o\);

-- Location: LABCELL_X88_Y11_N12
\inst|GPS_Port_Enable~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|GPS_Port_Enable~1_combout\ = ( !\Address[12]~input_o\ & ( !\Address[14]~input_o\ & ( (!\Address[13]~input_o\ & (!\ByteSelect_L~input_o\ & (!\Address[15]~input_o\ & \IOSelect_H~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Address[13]~input_o\,
	datab => \ALT_INV_ByteSelect_L~input_o\,
	datac => \ALT_INV_Address[15]~input_o\,
	datad => \ALT_INV_IOSelect_H~input_o\,
	datae => \ALT_INV_Address[12]~input_o\,
	dataf => \ALT_INV_Address[14]~input_o\,
	combout => \inst|GPS_Port_Enable~1_combout\);

-- Location: LABCELL_X81_Y34_N48
\inst2|CtrlReg[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|CtrlReg[6]~0_combout\ = ( \inst|GPS_Port_Enable~1_combout\ & ( !\Address[1]~input_o\ & ( (!\Address[2]~input_o\ & (!\WE_L~input_o\ & (\inst|GPS_Port_Enable~2_combout\ & \inst|GPS_Port_Enable~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Address[2]~input_o\,
	datab => \ALT_INV_WE_L~input_o\,
	datac => \inst|ALT_INV_GPS_Port_Enable~2_combout\,
	datad => \inst|ALT_INV_GPS_Port_Enable~0_combout\,
	datae => \inst|ALT_INV_GPS_Port_Enable~1_combout\,
	dataf => \ALT_INV_Address[1]~input_o\,
	combout => \inst2|CtrlReg[6]~0_combout\);

-- Location: FF_X77_Y34_N46
\inst2|CtrlReg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[1]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|CtrlReg[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|CtrlReg\(1));

-- Location: IOIBUF_X89_Y25_N55
\DataIn[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DataIn(0),
	o => \DataIn[0]~input_o\);

-- Location: FF_X77_Y34_N1
\inst2|CtrlReg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[0]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|CtrlReg[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|CtrlReg\(0));

-- Location: LABCELL_X79_Y34_N24
\inst2|Reset~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Reset~0_combout\ = ( \inst2|CtrlReg\(0) & ( !\inst2|CtrlReg\(1) ) ) # ( !\inst2|CtrlReg\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst2|ALT_INV_CtrlReg\(1),
	dataf => \inst2|ALT_INV_CtrlReg\(0),
	combout => \inst2|Reset~0_combout\);

-- Location: IOIBUF_X89_Y23_N38
\Reset_L~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset_L,
	o => \Reset_L~input_o\);

-- Location: FF_X79_Y34_N26
\inst2|Reset\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|Reset~0_combout\,
	clrn => \Reset_L~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|Reset~q\);

-- Location: FF_X79_Y34_N35
\inst2|RxDev|RxDatDel0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \GPS_RxData~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDatDel0~q\);

-- Location: FF_X79_Y34_N56
\inst2|RxDev|RxDatDel1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxDatDel0~q\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDatDel1~q\);

-- Location: FF_X79_Y34_N14
\inst2|RxDev|RxDatDel2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxDatDel1~q\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDatDel2~q\);

-- Location: IOIBUF_X89_Y20_N61
\DataIn[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DataIn(4),
	o => \DataIn[4]~input_o\);

-- Location: LABCELL_X77_Y34_N36
\inst2|CtrlReg[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|CtrlReg[4]~feeder_combout\ = ( \DataIn[4]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_DataIn[4]~input_o\,
	combout => \inst2|CtrlReg[4]~feeder_combout\);

-- Location: FF_X77_Y34_N38
\inst2|CtrlReg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|CtrlReg[4]~feeder_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|CtrlReg[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|CtrlReg\(4));

-- Location: MLABCELL_X78_Y35_N0
\inst1|inst5|Add2~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~29_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(0) ) + ( VCC ) + ( !VCC ))
-- \inst1|inst5|Add2~30\ = CARRY(( \inst1|inst5|ACIA_Count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(0),
	cin => GND,
	sumout => \inst1|inst5|Add2~29_sumout\,
	cout => \inst1|inst5|Add2~30\);

-- Location: FF_X78_Y35_N20
\inst1|inst5|ACIA_Count[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~25_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count[6]~DUPLICATE_q\);

-- Location: FF_X78_Y35_N23
\inst1|inst5|ACIA_Count[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~17_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count[7]~DUPLICATE_q\);

-- Location: IOIBUF_X89_Y23_N4
\DataIn[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DataIn(2),
	o => \DataIn[2]~input_o\);

-- Location: MLABCELL_X82_Y34_N21
\inst|GPS_Baud_Enable~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|GPS_Baud_Enable~0_combout\ = ( \Address[2]~input_o\ & ( !\Address[1]~input_o\ & ( (\inst|GPS_Port_Enable~2_combout\ & (\inst|GPS_Port_Enable~1_combout\ & \inst|GPS_Port_Enable~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000010000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_GPS_Port_Enable~2_combout\,
	datab => \inst|ALT_INV_GPS_Port_Enable~1_combout\,
	datac => \inst|ALT_INV_GPS_Port_Enable~0_combout\,
	datae => \ALT_INV_Address[2]~input_o\,
	dataf => \ALT_INV_Address[1]~input_o\,
	combout => \inst|GPS_Baud_Enable~0_combout\);

-- Location: FF_X77_Y35_N59
\inst1|inst6|Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[2]~input_o\,
	clrn => \Reset_L~input_o\,
	sload => VCC,
	ena => \inst|GPS_Baud_Enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst6|Q\(2));

-- Location: FF_X77_Y35_N41
\inst1|inst6|Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[0]~input_o\,
	clrn => \Reset_L~input_o\,
	sload => VCC,
	ena => \inst|GPS_Baud_Enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst6|Q\(0));

-- Location: FF_X77_Y35_N56
\inst1|inst6|Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[1]~input_o\,
	clrn => \Reset_L~input_o\,
	sload => VCC,
	ena => \inst|GPS_Baud_Enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst6|Q\(1));

-- Location: LABCELL_X77_Y35_N42
\inst1|inst5|Equal4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal4~0_combout\ = (!\inst1|inst6|Q\(0) & (!\inst1|inst6|Q\(1) & \inst1|inst6|Q\(2)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000000000000110000000000000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|inst6|ALT_INV_Q\(0),
	datac => \inst1|inst6|ALT_INV_Q\(1),
	datad => \inst1|inst6|ALT_INV_Q\(2),
	combout => \inst1|inst5|Equal4~0_combout\);

-- Location: LABCELL_X77_Y35_N39
\inst1|inst5|Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal2~0_combout\ = ( \inst1|inst6|Q\(1) & ( (!\inst1|inst6|Q\(2) & !\inst1|inst6|Q\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst6|ALT_INV_Q\(2),
	datad => \inst1|inst6|ALT_INV_Q\(0),
	dataf => \inst1|inst6|ALT_INV_Q\(1),
	combout => \inst1|inst5|Equal2~0_combout\);

-- Location: LABCELL_X77_Y35_N48
\inst1|inst5|Equal3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal3~0_combout\ = ( \inst1|inst6|Q\(0) & ( (!\inst1|inst6|Q\(2) & \inst1|inst6|Q\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|inst6|ALT_INV_Q\(2),
	datad => \inst1|inst6|ALT_INV_Q\(1),
	dataf => \inst1|inst6|ALT_INV_Q\(0),
	combout => \inst1|inst5|Equal3~0_combout\);

-- Location: LABCELL_X77_Y35_N45
\inst1|inst5|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal0~0_combout\ = ( \inst1|inst6|Q\(0) ) # ( !\inst1|inst6|Q\(0) & ( (\inst1|inst6|Q\(1)) # (\inst1|inst6|Q\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst6|ALT_INV_Q\(2),
	datad => \inst1|inst6|ALT_INV_Q\(1),
	dataf => \inst1|inst6|ALT_INV_Q\(0),
	combout => \inst1|inst5|Equal0~0_combout\);

-- Location: LABCELL_X77_Y35_N57
\inst1|inst5|HALF_CYCLE[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|HALF_CYCLE[3]~2_combout\ = ( \inst1|inst6|Q\(1) & ( (!\inst1|inst6|Q\(0) & !\inst1|inst6|Q\(2)) ) ) # ( !\inst1|inst6|Q\(1) & ( !\inst1|inst6|Q\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst6|ALT_INV_Q\(0),
	datad => \inst1|inst6|ALT_INV_Q\(2),
	dataf => \inst1|inst6|ALT_INV_Q\(1),
	combout => \inst1|inst5|HALF_CYCLE[3]~2_combout\);

-- Location: LABCELL_X77_Y35_N51
\inst1|inst5|HALF_CYCLE~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|HALF_CYCLE~1_combout\ = ( \inst1|inst6|Q\(1) & ( (!\inst1|inst6|Q\(0) & !\inst1|inst6|Q\(2)) ) ) # ( !\inst1|inst6|Q\(1) & ( (!\inst1|inst6|Q\(0) & \inst1|inst6|Q\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst6|ALT_INV_Q\(0),
	datad => \inst1|inst6|ALT_INV_Q\(2),
	dataf => \inst1|inst6|ALT_INV_Q\(1),
	combout => \inst1|inst5|HALF_CYCLE~1_combout\);

-- Location: LABCELL_X77_Y35_N0
\inst1|inst5|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add0~9_sumout\ = SUM(( (!\inst1|inst6|Q\(1) & ((!\inst1|inst6|Q\(2) & ((\inst1|inst5|Equal0~0_combout\))) # (\inst1|inst6|Q\(2) & (\inst1|inst5|HALF_CYCLE~1_combout\)))) # (\inst1|inst6|Q\(1) & (((\inst1|inst5|HALF_CYCLE~1_combout\)))) ) + ( 
-- VCC ) + ( !VCC ))
-- \inst1|inst5|Add0~10\ = CARRY(( (!\inst1|inst6|Q\(1) & ((!\inst1|inst6|Q\(2) & ((\inst1|inst5|Equal0~0_combout\))) # (\inst1|inst6|Q\(2) & (\inst1|inst5|HALF_CYCLE~1_combout\)))) # (\inst1|inst6|Q\(1) & (((\inst1|inst5|HALF_CYCLE~1_combout\)))) ) + ( VCC 
-- ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000011110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst6|ALT_INV_Q\(1),
	datab => \inst1|inst6|ALT_INV_Q\(2),
	datac => \inst1|inst5|ALT_INV_HALF_CYCLE~1_combout\,
	datad => \inst1|inst5|ALT_INV_Equal0~0_combout\,
	cin => GND,
	sumout => \inst1|inst5|Add0~9_sumout\,
	cout => \inst1|inst5|Add0~10\);

-- Location: LABCELL_X77_Y35_N3
\inst1|inst5|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add0~13_sumout\ = SUM(( (!\inst1|inst6|Q\(1)) # (\inst1|inst6|Q\(2)) ) + ( VCC ) + ( \inst1|inst5|Add0~10\ ))
-- \inst1|inst5|Add0~14\ = CARRY(( (!\inst1|inst6|Q\(1)) # (\inst1|inst6|Q\(2)) ) + ( VCC ) + ( \inst1|inst5|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst6|ALT_INV_Q\(1),
	datab => \inst1|inst6|ALT_INV_Q\(2),
	cin => \inst1|inst5|Add0~10\,
	sumout => \inst1|inst5|Add0~13_sumout\,
	cout => \inst1|inst5|Add0~14\);

-- Location: LABCELL_X77_Y35_N6
\inst1|inst5|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add0~17_sumout\ = SUM(( VCC ) + ( (!\inst1|inst6|Q\(2) & ((!\inst1|inst6|Q\(0)))) # (\inst1|inst6|Q\(2) & ((\inst1|inst6|Q\(0)) # (\inst1|inst6|Q\(1)))) ) + ( \inst1|inst5|Add0~14\ ))
-- \inst1|inst5|Add0~18\ = CARRY(( VCC ) + ( (!\inst1|inst6|Q\(2) & ((!\inst1|inst6|Q\(0)))) # (\inst1|inst6|Q\(2) & ((\inst1|inst6|Q\(0)) # (\inst1|inst6|Q\(1)))) ) + ( \inst1|inst5|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100001100110000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|inst6|ALT_INV_Q\(2),
	datac => \inst1|inst6|ALT_INV_Q\(1),
	dataf => \inst1|inst6|ALT_INV_Q\(0),
	cin => \inst1|inst5|Add0~14\,
	sumout => \inst1|inst5|Add0~17_sumout\,
	cout => \inst1|inst5|Add0~18\);

-- Location: LABCELL_X77_Y35_N9
\inst1|inst5|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add0~21_sumout\ = SUM(( (!\inst1|inst6|Q\(1) & !\inst1|inst6|Q\(2)) ) + ( VCC ) + ( \inst1|inst5|Add0~18\ ))
-- \inst1|inst5|Add0~22\ = CARRY(( (!\inst1|inst6|Q\(1) & !\inst1|inst6|Q\(2)) ) + ( VCC ) + ( \inst1|inst5|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst6|ALT_INV_Q\(1),
	datab => \inst1|inst6|ALT_INV_Q\(2),
	cin => \inst1|inst5|Add0~18\,
	sumout => \inst1|inst5|Add0~21_sumout\,
	cout => \inst1|inst5|Add0~22\);

-- Location: LABCELL_X77_Y35_N12
\inst1|inst5|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add0~25_sumout\ = SUM(( (!\inst1|inst5|HALF_CYCLE[3]~2_combout\ & (\inst1|inst5|Equal3~0_combout\)) # (\inst1|inst5|HALF_CYCLE[3]~2_combout\ & ((\inst1|inst5|Equal0~0_combout\))) ) + ( VCC ) + ( \inst1|inst5|Add0~22\ ))
-- \inst1|inst5|Add0~26\ = CARRY(( (!\inst1|inst5|HALF_CYCLE[3]~2_combout\ & (\inst1|inst5|Equal3~0_combout\)) # (\inst1|inst5|HALF_CYCLE[3]~2_combout\ & ((\inst1|inst5|Equal0~0_combout\))) ) + ( VCC ) + ( \inst1|inst5|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101001101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_Equal3~0_combout\,
	datab => \inst1|inst5|ALT_INV_Equal0~0_combout\,
	datac => \inst1|inst5|ALT_INV_HALF_CYCLE[3]~2_combout\,
	cin => \inst1|inst5|Add0~22\,
	sumout => \inst1|inst5|Add0~25_sumout\,
	cout => \inst1|inst5|Add0~26\);

-- Location: LABCELL_X77_Y35_N15
\inst1|inst5|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add0~29_sumout\ = SUM(( (\inst1|inst5|Equal2~0_combout\) # (\inst1|inst5|Equal4~0_combout\) ) + ( VCC ) + ( \inst1|inst5|Add0~26\ ))
-- \inst1|inst5|Add0~30\ = CARRY(( (\inst1|inst5|Equal2~0_combout\) # (\inst1|inst5|Equal4~0_combout\) ) + ( VCC ) + ( \inst1|inst5|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst5|ALT_INV_Equal4~0_combout\,
	datad => \inst1|inst5|ALT_INV_Equal2~0_combout\,
	cin => \inst1|inst5|Add0~26\,
	sumout => \inst1|inst5|Add0~29_sumout\,
	cout => \inst1|inst5|Add0~30\);

-- Location: LABCELL_X77_Y35_N18
\inst1|inst5|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add0~33_sumout\ = SUM(( (!\inst1|inst6|Q\(2) & (\inst1|inst6|Q\(0) & \inst1|inst6|Q\(1))) # (\inst1|inst6|Q\(2) & ((\inst1|inst6|Q\(1)) # (\inst1|inst6|Q\(0)))) ) + ( VCC ) + ( \inst1|inst5|Add0~30\ ))
-- \inst1|inst5|Add0~34\ = CARRY(( (!\inst1|inst6|Q\(2) & (\inst1|inst6|Q\(0) & \inst1|inst6|Q\(1))) # (\inst1|inst6|Q\(2) & ((\inst1|inst6|Q\(1)) # (\inst1|inst6|Q\(0)))) ) + ( VCC ) + ( \inst1|inst5|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst6|ALT_INV_Q\(2),
	datab => \inst1|inst6|ALT_INV_Q\(0),
	datac => \inst1|inst6|ALT_INV_Q\(1),
	cin => \inst1|inst5|Add0~30\,
	sumout => \inst1|inst5|Add0~33_sumout\,
	cout => \inst1|inst5|Add0~34\);

-- Location: LABCELL_X77_Y35_N21
\inst1|inst5|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add0~37_sumout\ = SUM(( \inst1|inst5|Equal4~0_combout\ ) + ( VCC ) + ( \inst1|inst5|Add0~34\ ))
-- \inst1|inst5|Add0~38\ = CARRY(( \inst1|inst5|Equal4~0_combout\ ) + ( VCC ) + ( \inst1|inst5|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_Equal4~0_combout\,
	cin => \inst1|inst5|Add0~34\,
	sumout => \inst1|inst5|Add0~37_sumout\,
	cout => \inst1|inst5|Add0~38\);

-- Location: LABCELL_X77_Y35_N54
\inst1|inst5|HALF_CYCLE[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|HALF_CYCLE[3]~0_combout\ = ( \inst1|inst6|Q\(0) & ( !\inst1|inst6|Q\(1) ) ) # ( !\inst1|inst6|Q\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst6|ALT_INV_Q\(1),
	dataf => \inst1|inst6|ALT_INV_Q\(0),
	combout => \inst1|inst5|HALF_CYCLE[3]~0_combout\);

-- Location: LABCELL_X77_Y35_N24
\inst1|inst5|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add0~41_sumout\ = SUM(( (!\inst1|inst5|Equal3~0_combout\ & (!\inst1|inst5|Equal4~0_combout\ & ((!\inst1|inst5|HALF_CYCLE[3]~0_combout\) # (\inst1|inst6|Q\(2))))) ) + ( VCC ) + ( \inst1|inst5|Add0~38\ ))
-- \inst1|inst5|Add0~42\ = CARRY(( (!\inst1|inst5|Equal3~0_combout\ & (!\inst1|inst5|Equal4~0_combout\ & ((!\inst1|inst5|HALF_CYCLE[3]~0_combout\) # (\inst1|inst6|Q\(2))))) ) + ( VCC ) + ( \inst1|inst5|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_Equal3~0_combout\,
	datab => \inst1|inst5|ALT_INV_Equal4~0_combout\,
	datac => \inst1|inst6|ALT_INV_Q\(2),
	datad => \inst1|inst5|ALT_INV_HALF_CYCLE[3]~0_combout\,
	cin => \inst1|inst5|Add0~38\,
	sumout => \inst1|inst5|Add0~41_sumout\,
	cout => \inst1|inst5|Add0~42\);

-- Location: MLABCELL_X78_Y35_N42
\inst1|inst5|Equal5~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal5~3_combout\ = ( \inst1|inst5|Add0~37_sumout\ & ( \inst1|inst5|Add0~41_sumout\ & ( (\inst1|inst5|ACIA_Count\(8) & (\inst1|inst5|ACIA_Count[7]~DUPLICATE_q\ & (!\inst1|inst5|ACIA_Count[6]~DUPLICATE_q\ $ (\inst1|inst5|Add0~33_sumout\)))) ) 
-- ) ) # ( !\inst1|inst5|Add0~37_sumout\ & ( \inst1|inst5|Add0~41_sumout\ & ( (\inst1|inst5|ACIA_Count\(8) & (!\inst1|inst5|ACIA_Count[7]~DUPLICATE_q\ & (!\inst1|inst5|ACIA_Count[6]~DUPLICATE_q\ $ (\inst1|inst5|Add0~33_sumout\)))) ) ) ) # ( 
-- \inst1|inst5|Add0~37_sumout\ & ( !\inst1|inst5|Add0~41_sumout\ & ( (!\inst1|inst5|ACIA_Count\(8) & (\inst1|inst5|ACIA_Count[7]~DUPLICATE_q\ & (!\inst1|inst5|ACIA_Count[6]~DUPLICATE_q\ $ (\inst1|inst5|Add0~33_sumout\)))) ) ) ) # ( 
-- !\inst1|inst5|Add0~37_sumout\ & ( !\inst1|inst5|Add0~41_sumout\ & ( (!\inst1|inst5|ACIA_Count\(8) & (!\inst1|inst5|ACIA_Count[7]~DUPLICATE_q\ & (!\inst1|inst5|ACIA_Count[6]~DUPLICATE_q\ $ (\inst1|inst5|Add0~33_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000001000000000010000000010000100000000100000000001000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_ACIA_Count[6]~DUPLICATE_q\,
	datab => \inst1|inst5|ALT_INV_ACIA_Count\(8),
	datac => \inst1|inst5|ALT_INV_ACIA_Count[7]~DUPLICATE_q\,
	datad => \inst1|inst5|ALT_INV_Add0~33_sumout\,
	datae => \inst1|inst5|ALT_INV_Add0~37_sumout\,
	dataf => \inst1|inst5|ALT_INV_Add0~41_sumout\,
	combout => \inst1|inst5|Equal5~3_combout\);

-- Location: MLABCELL_X78_Y35_N54
\inst1|inst5|Equal5~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal5~2_combout\ = ( \inst1|inst5|Add0~25_sumout\ & ( \inst1|inst5|Add0~29_sumout\ & ( (\inst1|inst5|ACIA_Count\(4) & (\inst1|inst5|ACIA_Count\(5) & (!\inst1|inst5|ACIA_Count\(3) $ (\inst1|inst5|Add0~21_sumout\)))) ) ) ) # ( 
-- !\inst1|inst5|Add0~25_sumout\ & ( \inst1|inst5|Add0~29_sumout\ & ( (!\inst1|inst5|ACIA_Count\(4) & (\inst1|inst5|ACIA_Count\(5) & (!\inst1|inst5|ACIA_Count\(3) $ (\inst1|inst5|Add0~21_sumout\)))) ) ) ) # ( \inst1|inst5|Add0~25_sumout\ & ( 
-- !\inst1|inst5|Add0~29_sumout\ & ( (\inst1|inst5|ACIA_Count\(4) & (!\inst1|inst5|ACIA_Count\(5) & (!\inst1|inst5|ACIA_Count\(3) $ (\inst1|inst5|Add0~21_sumout\)))) ) ) ) # ( !\inst1|inst5|Add0~25_sumout\ & ( !\inst1|inst5|Add0~29_sumout\ & ( 
-- (!\inst1|inst5|ACIA_Count\(4) & (!\inst1|inst5|ACIA_Count\(5) & (!\inst1|inst5|ACIA_Count\(3) $ (\inst1|inst5|Add0~21_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000001000010000000000010000100000000000100001000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_ACIA_Count\(4),
	datab => \inst1|inst5|ALT_INV_ACIA_Count\(5),
	datac => \inst1|inst5|ALT_INV_ACIA_Count\(3),
	datad => \inst1|inst5|ALT_INV_Add0~21_sumout\,
	datae => \inst1|inst5|ALT_INV_Add0~25_sumout\,
	dataf => \inst1|inst5|ALT_INV_Add0~29_sumout\,
	combout => \inst1|inst5|Equal5~2_combout\);

-- Location: FF_X78_Y35_N5
\inst1|inst5|ACIA_Count[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~33_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count[1]~DUPLICATE_q\);

-- Location: MLABCELL_X78_Y35_N36
\inst1|inst5|Equal5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal5~0_combout\ = ( \inst1|inst5|Add0~17_sumout\ & ( \inst1|inst5|Add0~13_sumout\ & ( (\inst1|inst5|ACIA_Count\(2) & (\inst1|inst5|ACIA_Count[1]~DUPLICATE_q\ & (!\inst1|inst5|ACIA_Count\(0) $ (\inst1|inst5|Add0~9_sumout\)))) ) ) ) # ( 
-- !\inst1|inst5|Add0~17_sumout\ & ( \inst1|inst5|Add0~13_sumout\ & ( (!\inst1|inst5|ACIA_Count\(2) & (\inst1|inst5|ACIA_Count[1]~DUPLICATE_q\ & (!\inst1|inst5|ACIA_Count\(0) $ (\inst1|inst5|Add0~9_sumout\)))) ) ) ) # ( \inst1|inst5|Add0~17_sumout\ & ( 
-- !\inst1|inst5|Add0~13_sumout\ & ( (\inst1|inst5|ACIA_Count\(2) & (!\inst1|inst5|ACIA_Count[1]~DUPLICATE_q\ & (!\inst1|inst5|ACIA_Count\(0) $ (\inst1|inst5|Add0~9_sumout\)))) ) ) ) # ( !\inst1|inst5|Add0~17_sumout\ & ( !\inst1|inst5|Add0~13_sumout\ & ( 
-- (!\inst1|inst5|ACIA_Count\(2) & (!\inst1|inst5|ACIA_Count[1]~DUPLICATE_q\ & (!\inst1|inst5|ACIA_Count\(0) $ (\inst1|inst5|Add0~9_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000001000000001000000001000000001000000001000000001000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_ACIA_Count\(0),
	datab => \inst1|inst5|ALT_INV_ACIA_Count\(2),
	datac => \inst1|inst5|ALT_INV_ACIA_Count[1]~DUPLICATE_q\,
	datad => \inst1|inst5|ALT_INV_Add0~9_sumout\,
	datae => \inst1|inst5|ALT_INV_Add0~17_sumout\,
	dataf => \inst1|inst5|ALT_INV_Add0~13_sumout\,
	combout => \inst1|inst5|Equal5~0_combout\);

-- Location: FF_X78_Y35_N34
\inst1|inst5|ACIA_Count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~13_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(11));

-- Location: MLABCELL_X78_Y35_N30
\inst1|inst5|Add2~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~9_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(10) ) + ( GND ) + ( \inst1|inst5|Add2~6\ ))
-- \inst1|inst5|Add2~10\ = CARRY(( \inst1|inst5|ACIA_Count\(10) ) + ( GND ) + ( \inst1|inst5|Add2~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(10),
	cin => \inst1|inst5|Add2~6\,
	sumout => \inst1|inst5|Add2~9_sumout\,
	cout => \inst1|inst5|Add2~10\);

-- Location: MLABCELL_X78_Y35_N33
\inst1|inst5|Add2~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~13_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(11) ) + ( GND ) + ( \inst1|inst5|Add2~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(11),
	cin => \inst1|inst5|Add2~10\,
	sumout => \inst1|inst5|Add2~13_sumout\);

-- Location: FF_X78_Y35_N35
\inst1|inst5|ACIA_Count[11]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~13_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count[11]~DUPLICATE_q\);

-- Location: LABCELL_X77_Y35_N27
\inst1|inst5|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add0~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \inst1|inst5|Add0~42\ ))
-- \inst1|inst5|Add0~2\ = CARRY(( VCC ) + ( GND ) + ( \inst1|inst5|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \inst1|inst5|Add0~42\,
	sumout => \inst1|inst5|Add0~1_sumout\,
	cout => \inst1|inst5|Add0~2\);

-- Location: LABCELL_X77_Y35_N30
\inst1|inst5|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add0~5_sumout\ = SUM(( VCC ) + ( GND ) + ( \inst1|inst5|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \inst1|inst5|Add0~2\,
	sumout => \inst1|inst5|Add0~5_sumout\);

-- Location: LABCELL_X77_Y35_N36
\inst1|inst5|Equal5~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal5~4_combout\ = ( \inst1|inst5|Add0~5_sumout\ & ( (\inst1|inst5|ACIA_Count\(10) & (\inst1|inst5|ACIA_Count[11]~DUPLICATE_q\ & (!\inst1|inst5|ACIA_Count\(9) $ (\inst1|inst5|Add0~1_sumout\)))) ) ) # ( !\inst1|inst5|Add0~5_sumout\ & ( 
-- (!\inst1|inst5|ACIA_Count\(10) & (!\inst1|inst5|ACIA_Count[11]~DUPLICATE_q\ & (!\inst1|inst5|ACIA_Count\(9) $ (\inst1|inst5|Add0~1_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000001000000100000000100000000000010000000010000001000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_ACIA_Count\(9),
	datab => \inst1|inst5|ALT_INV_ACIA_Count\(10),
	datac => \inst1|inst5|ALT_INV_ACIA_Count[11]~DUPLICATE_q\,
	datad => \inst1|inst5|ALT_INV_Add0~1_sumout\,
	dataf => \inst1|inst5|ALT_INV_Add0~5_sumout\,
	combout => \inst1|inst5|Equal5~4_combout\);

-- Location: MLABCELL_X78_Y35_N51
\inst1|inst5|Equal5~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal5~5_combout\ = ( \inst1|inst5|Equal5~0_combout\ & ( \inst1|inst5|Equal5~4_combout\ & ( (\inst1|inst5|Equal5~3_combout\ & \inst1|inst5|Equal5~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst5|ALT_INV_Equal5~3_combout\,
	datad => \inst1|inst5|ALT_INV_Equal5~2_combout\,
	datae => \inst1|inst5|ALT_INV_Equal5~0_combout\,
	dataf => \inst1|inst5|ALT_INV_Equal5~4_combout\,
	combout => \inst1|inst5|Equal5~5_combout\);

-- Location: FF_X78_Y35_N2
\inst1|inst5|ACIA_Count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~29_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(0));

-- Location: MLABCELL_X78_Y35_N3
\inst1|inst5|Add2~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~33_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(1) ) + ( GND ) + ( \inst1|inst5|Add2~30\ ))
-- \inst1|inst5|Add2~34\ = CARRY(( \inst1|inst5|ACIA_Count\(1) ) + ( GND ) + ( \inst1|inst5|Add2~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(1),
	cin => \inst1|inst5|Add2~30\,
	sumout => \inst1|inst5|Add2~33_sumout\,
	cout => \inst1|inst5|Add2~34\);

-- Location: FF_X78_Y35_N4
\inst1|inst5|ACIA_Count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~33_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(1));

-- Location: MLABCELL_X78_Y35_N6
\inst1|inst5|Add2~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~37_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(2) ) + ( GND ) + ( \inst1|inst5|Add2~34\ ))
-- \inst1|inst5|Add2~38\ = CARRY(( \inst1|inst5|ACIA_Count\(2) ) + ( GND ) + ( \inst1|inst5|Add2~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(2),
	cin => \inst1|inst5|Add2~34\,
	sumout => \inst1|inst5|Add2~37_sumout\,
	cout => \inst1|inst5|Add2~38\);

-- Location: FF_X78_Y35_N8
\inst1|inst5|ACIA_Count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~37_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(2));

-- Location: MLABCELL_X78_Y35_N9
\inst1|inst5|Add2~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~41_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(3) ) + ( GND ) + ( \inst1|inst5|Add2~38\ ))
-- \inst1|inst5|Add2~42\ = CARRY(( \inst1|inst5|ACIA_Count\(3) ) + ( GND ) + ( \inst1|inst5|Add2~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(3),
	cin => \inst1|inst5|Add2~38\,
	sumout => \inst1|inst5|Add2~41_sumout\,
	cout => \inst1|inst5|Add2~42\);

-- Location: FF_X78_Y35_N10
\inst1|inst5|ACIA_Count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~41_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(3));

-- Location: MLABCELL_X78_Y35_N12
\inst1|inst5|Add2~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~45_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(4) ) + ( GND ) + ( \inst1|inst5|Add2~42\ ))
-- \inst1|inst5|Add2~46\ = CARRY(( \inst1|inst5|ACIA_Count\(4) ) + ( GND ) + ( \inst1|inst5|Add2~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(4),
	cin => \inst1|inst5|Add2~42\,
	sumout => \inst1|inst5|Add2~45_sumout\,
	cout => \inst1|inst5|Add2~46\);

-- Location: FF_X78_Y35_N13
\inst1|inst5|ACIA_Count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~45_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(4));

-- Location: MLABCELL_X78_Y35_N15
\inst1|inst5|Add2~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~21_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(5) ) + ( GND ) + ( \inst1|inst5|Add2~46\ ))
-- \inst1|inst5|Add2~22\ = CARRY(( \inst1|inst5|ACIA_Count\(5) ) + ( GND ) + ( \inst1|inst5|Add2~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(5),
	cin => \inst1|inst5|Add2~46\,
	sumout => \inst1|inst5|Add2~21_sumout\,
	cout => \inst1|inst5|Add2~22\);

-- Location: FF_X78_Y35_N16
\inst1|inst5|ACIA_Count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~21_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(5));

-- Location: MLABCELL_X78_Y35_N18
\inst1|inst5|Add2~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~25_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(6) ) + ( GND ) + ( \inst1|inst5|Add2~22\ ))
-- \inst1|inst5|Add2~26\ = CARRY(( \inst1|inst5|ACIA_Count\(6) ) + ( GND ) + ( \inst1|inst5|Add2~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(6),
	cin => \inst1|inst5|Add2~22\,
	sumout => \inst1|inst5|Add2~25_sumout\,
	cout => \inst1|inst5|Add2~26\);

-- Location: FF_X78_Y35_N19
\inst1|inst5|ACIA_Count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~25_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(6));

-- Location: MLABCELL_X78_Y35_N21
\inst1|inst5|Add2~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~17_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(7) ) + ( GND ) + ( \inst1|inst5|Add2~26\ ))
-- \inst1|inst5|Add2~18\ = CARRY(( \inst1|inst5|ACIA_Count\(7) ) + ( GND ) + ( \inst1|inst5|Add2~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(7),
	cin => \inst1|inst5|Add2~26\,
	sumout => \inst1|inst5|Add2~17_sumout\,
	cout => \inst1|inst5|Add2~18\);

-- Location: FF_X78_Y35_N22
\inst1|inst5|ACIA_Count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~17_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(7));

-- Location: MLABCELL_X78_Y35_N24
\inst1|inst5|Add2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~1_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(8) ) + ( GND ) + ( \inst1|inst5|Add2~18\ ))
-- \inst1|inst5|Add2~2\ = CARRY(( \inst1|inst5|ACIA_Count\(8) ) + ( GND ) + ( \inst1|inst5|Add2~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(8),
	cin => \inst1|inst5|Add2~18\,
	sumout => \inst1|inst5|Add2~1_sumout\,
	cout => \inst1|inst5|Add2~2\);

-- Location: FF_X78_Y35_N25
\inst1|inst5|ACIA_Count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~1_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(8));

-- Location: MLABCELL_X78_Y35_N27
\inst1|inst5|Add2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add2~5_sumout\ = SUM(( \inst1|inst5|ACIA_Count\(9) ) + ( GND ) + ( \inst1|inst5|Add2~2\ ))
-- \inst1|inst5|Add2~6\ = CARRY(( \inst1|inst5|ACIA_Count\(9) ) + ( GND ) + ( \inst1|inst5|Add2~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(9),
	cin => \inst1|inst5|Add2~2\,
	sumout => \inst1|inst5|Add2~5_sumout\,
	cout => \inst1|inst5|Add2~6\);

-- Location: FF_X78_Y35_N28
\inst1|inst5|ACIA_Count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~5_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(9));

-- Location: FF_X78_Y35_N31
\inst1|inst5|ACIA_Count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|Add2~9_sumout\,
	sclr => \inst1|inst5|Equal5~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Count\(10));

-- Location: LABCELL_X79_Y35_N30
\inst1|inst5|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add1~21_sumout\ = SUM(( (!\inst1|inst6|Q\(1)) # (\inst1|inst6|Q\(2)) ) + ( VCC ) + ( !VCC ))
-- \inst1|inst5|Add1~22\ = CARRY(( (!\inst1|inst6|Q\(1)) # (\inst1|inst6|Q\(2)) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst6|ALT_INV_Q\(2),
	datad => \inst1|inst6|ALT_INV_Q\(1),
	cin => GND,
	sumout => \inst1|inst5|Add1~21_sumout\,
	cout => \inst1|inst5|Add1~22\);

-- Location: LABCELL_X79_Y35_N33
\inst1|inst5|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add1~25_sumout\ = SUM(( (!\inst1|inst6|Q\(2) & ((!\inst1|inst6|Q\(0)))) # (\inst1|inst6|Q\(2) & ((\inst1|inst6|Q\(0)) # (\inst1|inst6|Q\(1)))) ) + ( VCC ) + ( \inst1|inst5|Add1~22\ ))
-- \inst1|inst5|Add1~26\ = CARRY(( (!\inst1|inst6|Q\(2) & ((!\inst1|inst6|Q\(0)))) # (\inst1|inst6|Q\(2) & ((\inst1|inst6|Q\(0)) # (\inst1|inst6|Q\(1)))) ) + ( VCC ) + ( \inst1|inst5|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst6|ALT_INV_Q\(2),
	datac => \inst1|inst6|ALT_INV_Q\(1),
	datad => \inst1|inst6|ALT_INV_Q\(0),
	cin => \inst1|inst5|Add1~22\,
	sumout => \inst1|inst5|Add1~25_sumout\,
	cout => \inst1|inst5|Add1~26\);

-- Location: LABCELL_X79_Y35_N36
\inst1|inst5|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add1~29_sumout\ = SUM(( (!\inst1|inst6|Q\(2) & !\inst1|inst6|Q\(1)) ) + ( VCC ) + ( \inst1|inst5|Add1~26\ ))
-- \inst1|inst5|Add1~30\ = CARRY(( (!\inst1|inst6|Q\(2) & !\inst1|inst6|Q\(1)) ) + ( VCC ) + ( \inst1|inst5|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst6|ALT_INV_Q\(2),
	datad => \inst1|inst6|ALT_INV_Q\(1),
	cin => \inst1|inst5|Add1~26\,
	sumout => \inst1|inst5|Add1~29_sumout\,
	cout => \inst1|inst5|Add1~30\);

-- Location: LABCELL_X79_Y35_N39
\inst1|inst5|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add1~33_sumout\ = SUM(( (!\inst1|inst6|Q\(2) & ((!\inst1|inst5|HALF_CYCLE[3]~0_combout\ & ((\inst1|inst5|Equal3~0_combout\))) # (\inst1|inst5|HALF_CYCLE[3]~0_combout\ & (\inst1|inst5|Equal0~0_combout\)))) # (\inst1|inst6|Q\(2) & 
-- (((\inst1|inst5|Equal3~0_combout\)))) ) + ( VCC ) + ( \inst1|inst5|Add1~30\ ))
-- \inst1|inst5|Add1~34\ = CARRY(( (!\inst1|inst6|Q\(2) & ((!\inst1|inst5|HALF_CYCLE[3]~0_combout\ & ((\inst1|inst5|Equal3~0_combout\))) # (\inst1|inst5|HALF_CYCLE[3]~0_combout\ & (\inst1|inst5|Equal0~0_combout\)))) # (\inst1|inst6|Q\(2) & 
-- (((\inst1|inst5|Equal3~0_combout\)))) ) + ( VCC ) + ( \inst1|inst5|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111101000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_Equal0~0_combout\,
	datab => \inst1|inst6|ALT_INV_Q\(2),
	datac => \inst1|inst5|ALT_INV_Equal3~0_combout\,
	datad => \inst1|inst5|ALT_INV_HALF_CYCLE[3]~0_combout\,
	cin => \inst1|inst5|Add1~30\,
	sumout => \inst1|inst5|Add1~33_sumout\,
	cout => \inst1|inst5|Add1~34\);

-- Location: LABCELL_X79_Y35_N42
\inst1|inst5|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add1~37_sumout\ = SUM(( (\inst1|inst5|Equal2~0_combout\) # (\inst1|inst5|Equal4~0_combout\) ) + ( VCC ) + ( \inst1|inst5|Add1~34\ ))
-- \inst1|inst5|Add1~38\ = CARRY(( (\inst1|inst5|Equal2~0_combout\) # (\inst1|inst5|Equal4~0_combout\) ) + ( VCC ) + ( \inst1|inst5|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst5|ALT_INV_Equal4~0_combout\,
	datad => \inst1|inst5|ALT_INV_Equal2~0_combout\,
	cin => \inst1|inst5|Add1~34\,
	sumout => \inst1|inst5|Add1~37_sumout\,
	cout => \inst1|inst5|Add1~38\);

-- Location: LABCELL_X79_Y35_N45
\inst1|inst5|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add1~9_sumout\ = SUM(( (!\inst1|inst6|Q\(2) & (\inst1|inst6|Q\(1) & \inst1|inst6|Q\(0))) # (\inst1|inst6|Q\(2) & ((\inst1|inst6|Q\(0)) # (\inst1|inst6|Q\(1)))) ) + ( VCC ) + ( \inst1|inst5|Add1~38\ ))
-- \inst1|inst5|Add1~10\ = CARRY(( (!\inst1|inst6|Q\(2) & (\inst1|inst6|Q\(1) & \inst1|inst6|Q\(0))) # (\inst1|inst6|Q\(2) & ((\inst1|inst6|Q\(0)) # (\inst1|inst6|Q\(1)))) ) + ( VCC ) + ( \inst1|inst5|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst1|inst6|ALT_INV_Q\(2),
	datac => \inst1|inst6|ALT_INV_Q\(1),
	datad => \inst1|inst6|ALT_INV_Q\(0),
	cin => \inst1|inst5|Add1~38\,
	sumout => \inst1|inst5|Add1~9_sumout\,
	cout => \inst1|inst5|Add1~10\);

-- Location: LABCELL_X79_Y35_N48
\inst1|inst5|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add1~13_sumout\ = SUM(( \inst1|inst5|Equal4~0_combout\ ) + ( VCC ) + ( \inst1|inst5|Add1~10\ ))
-- \inst1|inst5|Add1~14\ = CARRY(( \inst1|inst5|Equal4~0_combout\ ) + ( VCC ) + ( \inst1|inst5|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst5|ALT_INV_Equal4~0_combout\,
	cin => \inst1|inst5|Add1~10\,
	sumout => \inst1|inst5|Add1~13_sumout\,
	cout => \inst1|inst5|Add1~14\);

-- Location: LABCELL_X79_Y35_N51
\inst1|inst5|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add1~17_sumout\ = SUM(( (!\inst1|inst5|Equal4~0_combout\ & (!\inst1|inst5|Equal3~0_combout\ & ((!\inst1|inst5|HALF_CYCLE[3]~0_combout\) # (\inst1|inst6|Q\(2))))) ) + ( VCC ) + ( \inst1|inst5|Add1~14\ ))
-- \inst1|inst5|Add1~18\ = CARRY(( (!\inst1|inst5|Equal4~0_combout\ & (!\inst1|inst5|Equal3~0_combout\ & ((!\inst1|inst5|HALF_CYCLE[3]~0_combout\) # (\inst1|inst6|Q\(2))))) ) + ( VCC ) + ( \inst1|inst5|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_Equal4~0_combout\,
	datab => \inst1|inst5|ALT_INV_Equal3~0_combout\,
	datac => \inst1|inst6|ALT_INV_Q\(2),
	datad => \inst1|inst5|ALT_INV_HALF_CYCLE[3]~0_combout\,
	cin => \inst1|inst5|Add1~14\,
	sumout => \inst1|inst5|Add1~17_sumout\,
	cout => \inst1|inst5|Add1~18\);

-- Location: LABCELL_X79_Y35_N54
\inst1|inst5|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add1~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \inst1|inst5|Add1~18\ ))
-- \inst1|inst5|Add1~2\ = CARRY(( VCC ) + ( GND ) + ( \inst1|inst5|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \inst1|inst5|Add1~18\,
	sumout => \inst1|inst5|Add1~1_sumout\,
	cout => \inst1|inst5|Add1~2\);

-- Location: LABCELL_X79_Y35_N57
\inst1|inst5|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Add1~5_sumout\ = SUM(( VCC ) + ( GND ) + ( \inst1|inst5|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \inst1|inst5|Add1~2\,
	sumout => \inst1|inst5|Add1~5_sumout\);

-- Location: LABCELL_X79_Y35_N18
\inst1|inst5|ACIA_Clk~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|ACIA_Clk~0_combout\ = ( \inst1|inst5|Add1~5_sumout\ & ( \inst1|inst5|ACIA_Count\(8) & ( (\inst1|inst5|ACIA_Count\(10) & (\inst1|inst5|ACIA_Count\(9) & (\inst1|inst5|Add1~1_sumout\ & \inst1|inst5|ACIA_Count\(11)))) ) ) ) # ( 
-- !\inst1|inst5|Add1~5_sumout\ & ( \inst1|inst5|ACIA_Count\(8) & ( (!\inst1|inst5|ACIA_Count\(10) & (!\inst1|inst5|ACIA_Count\(9) & (\inst1|inst5|Add1~1_sumout\ & !\inst1|inst5|ACIA_Count\(11)))) ) ) ) # ( \inst1|inst5|Add1~5_sumout\ & ( 
-- !\inst1|inst5|ACIA_Count\(8) & ( (\inst1|inst5|ACIA_Count\(10) & (\inst1|inst5|ACIA_Count\(9) & (!\inst1|inst5|Add1~1_sumout\ & \inst1|inst5|ACIA_Count\(11)))) ) ) ) # ( !\inst1|inst5|Add1~5_sumout\ & ( !\inst1|inst5|ACIA_Count\(8) & ( 
-- (!\inst1|inst5|ACIA_Count\(10) & (!\inst1|inst5|ACIA_Count\(9) & (!\inst1|inst5|Add1~1_sumout\ & !\inst1|inst5|ACIA_Count\(11)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000001000000001000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_ACIA_Count\(10),
	datab => \inst1|inst5|ALT_INV_ACIA_Count\(9),
	datac => \inst1|inst5|ALT_INV_Add1~1_sumout\,
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(11),
	datae => \inst1|inst5|ALT_INV_Add1~5_sumout\,
	dataf => \inst1|inst5|ALT_INV_ACIA_Count\(8),
	combout => \inst1|inst5|ACIA_Clk~0_combout\);

-- Location: LABCELL_X79_Y35_N24
\inst1|inst5|Equal5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal5~1_combout\ = ( \inst1|inst5|Add0~1_sumout\ & ( \inst1|inst5|ACIA_Count\(10) & ( (\inst1|inst5|Equal5~0_combout\ & (\inst1|inst5|ACIA_Count\(9) & (\inst1|inst5|Add0~5_sumout\ & \inst1|inst5|ACIA_Count\(11)))) ) ) ) # ( 
-- !\inst1|inst5|Add0~1_sumout\ & ( \inst1|inst5|ACIA_Count\(10) & ( (\inst1|inst5|Equal5~0_combout\ & (!\inst1|inst5|ACIA_Count\(9) & (\inst1|inst5|Add0~5_sumout\ & \inst1|inst5|ACIA_Count\(11)))) ) ) ) # ( \inst1|inst5|Add0~1_sumout\ & ( 
-- !\inst1|inst5|ACIA_Count\(10) & ( (\inst1|inst5|Equal5~0_combout\ & (\inst1|inst5|ACIA_Count\(9) & (!\inst1|inst5|Add0~5_sumout\ & !\inst1|inst5|ACIA_Count\(11)))) ) ) ) # ( !\inst1|inst5|Add0~1_sumout\ & ( !\inst1|inst5|ACIA_Count\(10) & ( 
-- (\inst1|inst5|Equal5~0_combout\ & (!\inst1|inst5|ACIA_Count\(9) & (!\inst1|inst5|Add0~5_sumout\ & !\inst1|inst5|ACIA_Count\(11)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000000100000000000000000000000001000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_Equal5~0_combout\,
	datab => \inst1|inst5|ALT_INV_ACIA_Count\(9),
	datac => \inst1|inst5|ALT_INV_Add0~5_sumout\,
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(11),
	datae => \inst1|inst5|ALT_INV_Add0~1_sumout\,
	dataf => \inst1|inst5|ALT_INV_ACIA_Count\(10),
	combout => \inst1|inst5|Equal5~1_combout\);

-- Location: FF_X79_Y35_N14
\inst1|inst5|ACIA_Clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|ACIA_Clk~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Clk~q\);

-- Location: LABCELL_X79_Y35_N0
\inst1|inst5|ACIA_Clk~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|ACIA_Clk~2_combout\ = ( \inst1|inst5|Add1~37_sumout\ & ( (\inst1|inst5|ACIA_Count\(4) & (!\inst1|inst5|ACIA_Count\(3) $ (\inst1|inst5|Add1~33_sumout\))) ) ) # ( !\inst1|inst5|Add1~37_sumout\ & ( (!\inst1|inst5|ACIA_Count\(4) & 
-- (!\inst1|inst5|ACIA_Count\(3) $ (\inst1|inst5|Add1~33_sumout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001000010010000100100001001000000001001000010010000100100001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_ACIA_Count\(3),
	datab => \inst1|inst5|ALT_INV_Add1~33_sumout\,
	datac => \inst1|inst5|ALT_INV_ACIA_Count\(4),
	dataf => \inst1|inst5|ALT_INV_Add1~37_sumout\,
	combout => \inst1|inst5|ACIA_Clk~2_combout\);

-- Location: LABCELL_X80_Y35_N42
\inst1|inst5|ACIA_Clk~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|ACIA_Clk~1_combout\ = ( \inst1|inst5|Add1~25_sumout\ & ( \inst1|inst5|Add1~29_sumout\ & ( (\inst1|inst5|ACIA_Count\(1) & (\inst1|inst5|ACIA_Count\(2) & (!\inst1|inst5|Add1~21_sumout\ $ (\inst1|inst5|ACIA_Count\(0))))) ) ) ) # ( 
-- !\inst1|inst5|Add1~25_sumout\ & ( \inst1|inst5|Add1~29_sumout\ & ( (!\inst1|inst5|ACIA_Count\(1) & (\inst1|inst5|ACIA_Count\(2) & (!\inst1|inst5|Add1~21_sumout\ $ (\inst1|inst5|ACIA_Count\(0))))) ) ) ) # ( \inst1|inst5|Add1~25_sumout\ & ( 
-- !\inst1|inst5|Add1~29_sumout\ & ( (\inst1|inst5|ACIA_Count\(1) & (!\inst1|inst5|ACIA_Count\(2) & (!\inst1|inst5|Add1~21_sumout\ $ (\inst1|inst5|ACIA_Count\(0))))) ) ) ) # ( !\inst1|inst5|Add1~25_sumout\ & ( !\inst1|inst5|Add1~29_sumout\ & ( 
-- (!\inst1|inst5|ACIA_Count\(1) & (!\inst1|inst5|ACIA_Count\(2) & (!\inst1|inst5|Add1~21_sumout\ $ (\inst1|inst5|ACIA_Count\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000001000010000000000010000100000000000100001000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_ACIA_Count\(1),
	datab => \inst1|inst5|ALT_INV_ACIA_Count\(2),
	datac => \inst1|inst5|ALT_INV_Add1~21_sumout\,
	datad => \inst1|inst5|ALT_INV_ACIA_Count\(0),
	datae => \inst1|inst5|ALT_INV_Add1~25_sumout\,
	dataf => \inst1|inst5|ALT_INV_Add1~29_sumout\,
	combout => \inst1|inst5|ACIA_Clk~1_combout\);

-- Location: LABCELL_X79_Y35_N3
\inst1|inst5|Equal6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal6~1_combout\ = ( \inst1|inst5|Add1~13_sumout\ & ( !\inst1|inst5|ACIA_Count\(6) ) ) # ( !\inst1|inst5|Add1~13_sumout\ & ( \inst1|inst5|ACIA_Count\(6) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst5|ALT_INV_ACIA_Count\(6),
	dataf => \inst1|inst5|ALT_INV_Add1~13_sumout\,
	combout => \inst1|inst5|Equal6~1_combout\);

-- Location: LABCELL_X80_Y35_N51
\inst1|inst5|Equal6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|Equal6~0_combout\ = ( !\inst1|inst5|ACIA_Count\(5) & ( \inst1|inst5|Add1~9_sumout\ ) ) # ( \inst1|inst5|ACIA_Count\(5) & ( !\inst1|inst5|Add1~9_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst1|inst5|ALT_INV_ACIA_Count\(5),
	dataf => \inst1|inst5|ALT_INV_Add1~9_sumout\,
	combout => \inst1|inst5|Equal6~0_combout\);

-- Location: LABCELL_X79_Y35_N6
\inst1|inst5|ACIA_Clk~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|ACIA_Clk~3_combout\ = ( !\inst1|inst5|Equal6~1_combout\ & ( !\inst1|inst5|Equal6~0_combout\ & ( (\inst1|inst5|ACIA_Clk~2_combout\ & (\inst1|inst5|ACIA_Clk~1_combout\ & (!\inst1|inst5|Add1~17_sumout\ $ (\inst1|inst5|ACIA_Count\(7))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001001000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_Add1~17_sumout\,
	datab => \inst1|inst5|ALT_INV_ACIA_Count\(7),
	datac => \inst1|inst5|ALT_INV_ACIA_Clk~2_combout\,
	datad => \inst1|inst5|ALT_INV_ACIA_Clk~1_combout\,
	datae => \inst1|inst5|ALT_INV_Equal6~1_combout\,
	dataf => \inst1|inst5|ALT_INV_Equal6~0_combout\,
	combout => \inst1|inst5|ACIA_Clk~3_combout\);

-- Location: LABCELL_X79_Y35_N12
\inst1|inst5|ACIA_Clk~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|inst5|ACIA_Clk~4_combout\ = ( \inst1|inst5|ACIA_Clk~q\ & ( \inst1|inst5|ACIA_Clk~3_combout\ & ( (!\inst1|inst5|Equal5~2_combout\) # ((!\inst1|inst5|Equal5~1_combout\) # (!\inst1|inst5|Equal5~3_combout\)) ) ) ) # ( !\inst1|inst5|ACIA_Clk~q\ & ( 
-- \inst1|inst5|ACIA_Clk~3_combout\ & ( (\inst1|inst5|ACIA_Clk~0_combout\ & ((!\inst1|inst5|Equal5~2_combout\) # ((!\inst1|inst5|Equal5~1_combout\) # (!\inst1|inst5|Equal5~3_combout\)))) ) ) ) # ( \inst1|inst5|ACIA_Clk~q\ & ( 
-- !\inst1|inst5|ACIA_Clk~3_combout\ & ( (!\inst1|inst5|Equal5~2_combout\) # ((!\inst1|inst5|Equal5~1_combout\) # (!\inst1|inst5|Equal5~3_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111110001010101010101001111111111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_ACIA_Clk~0_combout\,
	datab => \inst1|inst5|ALT_INV_Equal5~2_combout\,
	datac => \inst1|inst5|ALT_INV_Equal5~1_combout\,
	datad => \inst1|inst5|ALT_INV_Equal5~3_combout\,
	datae => \inst1|inst5|ALT_INV_ACIA_Clk~q\,
	dataf => \inst1|inst5|ALT_INV_ACIA_Clk~3_combout\,
	combout => \inst1|inst5|ACIA_Clk~4_combout\);

-- Location: FF_X79_Y35_N13
\inst1|inst5|ACIA_Clk~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst1|inst5|ACIA_Clk~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst5|ACIA_Clk~DUPLICATE_q\);

-- Location: FF_X80_Y35_N41
\inst2|TxDev|TxClkDel\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst1|inst5|ACIA_Clk~DUPLICATE_q\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxClkDel~q\);

-- Location: LABCELL_X80_Y35_N39
\inst2|RxDev|RxClkEdge~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxClkEdge~0_combout\ = (!\inst2|TxDev|TxClkDel~q\ & \inst1|inst5|ACIA_Clk~DUPLICATE_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|TxDev|ALT_INV_TxClkDel~q\,
	datad => \inst1|inst5|ALT_INV_ACIA_Clk~DUPLICATE_q\,
	combout => \inst2|RxDev|RxClkEdge~0_combout\);

-- Location: FF_X80_Y35_N40
\inst2|RxDev|RxClkEdge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|RxClkEdge~0_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxClkEdge~q\);

-- Location: LABCELL_X80_Y34_N0
\inst2|RxDev|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Add0~21_sumout\ = SUM(( \inst2|RxDev|RxClkCnt\(0) ) + ( \inst2|RxDev|RxClkEdge~q\ ) + ( !VCC ))
-- \inst2|RxDev|Add0~22\ = CARRY(( \inst2|RxDev|RxClkCnt\(0) ) + ( \inst2|RxDev|RxClkEdge~q\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|RxDev|ALT_INV_RxClkEdge~q\,
	datad => \inst2|RxDev|ALT_INV_RxClkCnt\(0),
	cin => GND,
	sumout => \inst2|RxDev|Add0~21_sumout\,
	cout => \inst2|RxDev|Add0~22\);

-- Location: LABCELL_X79_Y34_N3
\inst2|RxDev|RxDatEdge~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxDatEdge~0_combout\ = ( \inst2|RxDev|RxDatDel0~q\ & ( !\GPS_RxData~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_GPS_RxData~input_o\,
	dataf => \inst2|RxDev|ALT_INV_RxDatDel0~q\,
	combout => \inst2|RxDev|RxDatEdge~0_combout\);

-- Location: FF_X79_Y34_N4
\inst2|RxDev|RxDatEdge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|RxDatEdge~0_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDatEdge~q\);

-- Location: FF_X80_Y34_N2
\inst2|RxDev|RxClkCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Add0~21_sumout\,
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|RxDatEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxClkCnt\(0));

-- Location: LABCELL_X80_Y34_N3
\inst2|RxDev|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Add0~17_sumout\ = SUM(( \inst2|RxDev|RxClkCnt\(1) ) + ( GND ) + ( \inst2|RxDev|Add0~22\ ))
-- \inst2|RxDev|Add0~18\ = CARRY(( \inst2|RxDev|RxClkCnt\(1) ) + ( GND ) + ( \inst2|RxDev|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst2|RxDev|ALT_INV_RxClkCnt\(1),
	cin => \inst2|RxDev|Add0~22\,
	sumout => \inst2|RxDev|Add0~17_sumout\,
	cout => \inst2|RxDev|Add0~18\);

-- Location: FF_X80_Y34_N5
\inst2|RxDev|RxClkCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Add0~17_sumout\,
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|RxDatEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxClkCnt\(1));

-- Location: LABCELL_X80_Y34_N6
\inst2|RxDev|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Add0~13_sumout\ = SUM(( \inst2|RxDev|RxClkCnt\(2) ) + ( GND ) + ( \inst2|RxDev|Add0~18\ ))
-- \inst2|RxDev|Add0~14\ = CARRY(( \inst2|RxDev|RxClkCnt\(2) ) + ( GND ) + ( \inst2|RxDev|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst2|RxDev|ALT_INV_RxClkCnt\(2),
	cin => \inst2|RxDev|Add0~18\,
	sumout => \inst2|RxDev|Add0~13_sumout\,
	cout => \inst2|RxDev|Add0~14\);

-- Location: FF_X80_Y34_N8
\inst2|RxDev|RxClkCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Add0~13_sumout\,
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|RxDatEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxClkCnt\(2));

-- Location: LABCELL_X80_Y34_N9
\inst2|RxDev|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Add0~5_sumout\ = SUM(( \inst2|RxDev|RxClkCnt\(3) ) + ( GND ) + ( \inst2|RxDev|Add0~14\ ))
-- \inst2|RxDev|Add0~6\ = CARRY(( \inst2|RxDev|RxClkCnt\(3) ) + ( GND ) + ( \inst2|RxDev|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst2|RxDev|ALT_INV_RxClkCnt\(3),
	cin => \inst2|RxDev|Add0~14\,
	sumout => \inst2|RxDev|Add0~5_sumout\,
	cout => \inst2|RxDev|Add0~6\);

-- Location: FF_X80_Y34_N10
\inst2|RxDev|RxClkCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Add0~5_sumout\,
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|RxDatEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxClkCnt\(3));

-- Location: LABCELL_X80_Y34_N12
\inst2|RxDev|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Add0~9_sumout\ = SUM(( \inst2|RxDev|RxClkCnt\(4) ) + ( GND ) + ( \inst2|RxDev|Add0~6\ ))
-- \inst2|RxDev|Add0~10\ = CARRY(( \inst2|RxDev|RxClkCnt\(4) ) + ( GND ) + ( \inst2|RxDev|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst2|RxDev|ALT_INV_RxClkCnt\(4),
	cin => \inst2|RxDev|Add0~6\,
	sumout => \inst2|RxDev|Add0~9_sumout\,
	cout => \inst2|RxDev|Add0~10\);

-- Location: FF_X80_Y34_N14
\inst2|RxDev|RxClkCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Add0~9_sumout\,
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|RxDatEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxClkCnt\(4));

-- Location: LABCELL_X80_Y34_N15
\inst2|RxDev|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Add0~1_sumout\ = SUM(( \inst2|RxDev|RxClkCnt\(5) ) + ( GND ) + ( \inst2|RxDev|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst2|RxDev|ALT_INV_RxClkCnt\(5),
	cin => \inst2|RxDev|Add0~10\,
	sumout => \inst2|RxDev|Add0~1_sumout\);

-- Location: FF_X80_Y34_N17
\inst2|RxDev|RxClkCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Add0~1_sumout\,
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|RxDatEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxClkCnt\(5));

-- Location: LABCELL_X79_Y34_N42
\inst2|RxDev|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Mux0~0_combout\ = ( \inst1|inst5|ACIA_Clk~q\ & ( (!\inst2|CtrlReg\(0) & (((!\inst2|CtrlReg\(1)) # (\inst2|RxDev|RxClkCnt\(5))))) # (\inst2|CtrlReg\(0) & (\inst2|RxDev|RxClkCnt\(3) & (!\inst2|CtrlReg\(1)))) ) ) # ( !\inst1|inst5|ACIA_Clk~q\ & 
-- ( (!\inst2|CtrlReg\(0) & (((\inst2|CtrlReg\(1) & \inst2|RxDev|RxClkCnt\(5))))) # (\inst2|CtrlReg\(0) & (\inst2|RxDev|RxClkCnt\(3) & (!\inst2|CtrlReg\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000011010000100000001101010110000101110101011000010111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_CtrlReg\(0),
	datab => \inst2|RxDev|ALT_INV_RxClkCnt\(3),
	datac => \inst2|ALT_INV_CtrlReg\(1),
	datad => \inst2|RxDev|ALT_INV_RxClkCnt\(5),
	dataf => \inst1|inst5|ALT_INV_ACIA_Clk~q\,
	combout => \inst2|RxDev|Mux0~0_combout\);

-- Location: FF_X79_Y34_N43
\inst2|RxDev|RxBdDel\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Mux0~0_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxBdDel~q\);

-- Location: LABCELL_X79_Y34_N30
\inst2|RxDev|RxBdEdge~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxBdEdge~0_combout\ = ( !\inst2|RxDev|RxBdDel~q\ & ( \inst1|inst5|ACIA_Clk~q\ & ( (!\inst2|CtrlReg\(1) & (((!\inst2|CtrlReg\(0)) # (\inst2|RxDev|RxClkCnt\(3))))) # (\inst2|CtrlReg\(1) & (\inst2|RxDev|RxClkCnt\(5) & ((!\inst2|CtrlReg\(0))))) ) 
-- ) ) # ( !\inst2|RxDev|RxBdDel~q\ & ( !\inst1|inst5|ACIA_Clk~q\ & ( (!\inst2|CtrlReg\(1) & (((\inst2|RxDev|RxClkCnt\(3) & \inst2|CtrlReg\(0))))) # (\inst2|CtrlReg\(1) & (\inst2|RxDev|RxClkCnt\(5) & ((!\inst2|CtrlReg\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110000000000000000000011110101001100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|RxDev|ALT_INV_RxClkCnt\(5),
	datab => \inst2|RxDev|ALT_INV_RxClkCnt\(3),
	datac => \inst2|ALT_INV_CtrlReg\(1),
	datad => \inst2|ALT_INV_CtrlReg\(0),
	datae => \inst2|RxDev|ALT_INV_RxBdDel~q\,
	dataf => \inst1|inst5|ALT_INV_ACIA_Clk~q\,
	combout => \inst2|RxDev|RxBdEdge~0_combout\);

-- Location: FF_X79_Y34_N32
\inst2|RxDev|RxBdEdge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|RxBdEdge~0_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxBdEdge~q\);

-- Location: FF_X79_Y34_N37
\inst2|RxDev|RxBitCount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Selector11~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxBitCount\(0));

-- Location: MLABCELL_X82_Y34_N27
\inst2|RxDev|Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Selector10~0_combout\ = ( \inst2|RxDev|RxBitCount\(0) & ( (!\inst2|RxDev|RxState.RxData_state~q\) # (\inst2|RxDev|RxBitCount\(1)) ) ) # ( !\inst2|RxDev|RxBitCount\(0) & ( (!\inst2|RxDev|RxState.RxData_state~q\) # 
-- (!\inst2|RxDev|RxBitCount\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111110000111111111111000011110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|RxDev|ALT_INV_RxState.RxData_state~q\,
	datad => \inst2|RxDev|ALT_INV_RxBitCount\(1),
	dataf => \inst2|RxDev|ALT_INV_RxBitCount\(0),
	combout => \inst2|RxDev|Selector10~0_combout\);

-- Location: FF_X79_Y34_N52
\inst2|RxDev|RxState.RxParity_state~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|Selector14~0_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxState.RxParity_state~DUPLICATE_q\);

-- Location: FF_X79_Y34_N7
\inst2|RxDev|RxState.RxStop_state~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Selector15~1_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxState.RxStop_state~DUPLICATE_q\);

-- Location: LABCELL_X81_Y34_N42
\inst2|RxDev|RxBitCount[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxBitCount[2]~0_combout\ = ( \inst2|RxDev|RxBdEdge~q\ & ( (!\inst2|RxDev|RxState.RxParity_state~DUPLICATE_q\ & !\inst2|RxDev|RxState.RxStop_state~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|RxDev|ALT_INV_RxState.RxParity_state~DUPLICATE_q\,
	datad => \inst2|RxDev|ALT_INV_RxState.RxStop_state~DUPLICATE_q\,
	dataf => \inst2|RxDev|ALT_INV_RxBdEdge~q\,
	combout => \inst2|RxDev|RxBitCount[2]~0_combout\);

-- Location: FF_X82_Y34_N28
\inst2|RxDev|RxBitCount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Selector10~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxBitCount[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxBitCount\(1));

-- Location: MLABCELL_X82_Y34_N24
\inst2|RxDev|Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Selector9~0_combout\ = ( \inst2|RxDev|RxBitCount\(1) & ( (!\inst2|RxDev|RxState.RxData_state~q\) # (\inst2|RxDev|RxBitCount\(2)) ) ) # ( !\inst2|RxDev|RxBitCount\(1) & ( (!\inst2|RxDev|RxState.RxData_state~q\) # (!\inst2|RxDev|RxBitCount\(0) 
-- $ (\inst2|RxDev|RxBitCount\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111011011101111011101101110111001100111111111100110011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|RxDev|ALT_INV_RxBitCount\(0),
	datab => \inst2|RxDev|ALT_INV_RxState.RxData_state~q\,
	datad => \inst2|RxDev|ALT_INV_RxBitCount\(2),
	dataf => \inst2|RxDev|ALT_INV_RxBitCount\(1),
	combout => \inst2|RxDev|Selector9~0_combout\);

-- Location: FF_X82_Y34_N26
\inst2|RxDev|RxBitCount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Selector9~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxBitCount[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxBitCount\(2));

-- Location: LABCELL_X79_Y34_N48
\inst2|RxDev|Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Selector13~0_combout\ = ( \inst2|RxDev|RxState.RxData_state~q\ & ( \inst2|RxDev|RxState.RxStart_State~q\ & ( ((\inst2|RxDev|RxBitCount\(2)) # (\inst2|RxDev|RxBitCount\(1))) # (\inst2|RxDev|RxBitCount[0]~DUPLICATE_q\) ) ) ) # ( 
-- \inst2|RxDev|RxState.RxData_state~q\ & ( !\inst2|RxDev|RxState.RxStart_State~q\ & ( (((!\inst2|RxDev|RxDatDel2~q\) # (\inst2|RxDev|RxBitCount\(2))) # (\inst2|RxDev|RxBitCount\(1))) # (\inst2|RxDev|RxBitCount[0]~DUPLICATE_q\) ) ) ) # ( 
-- !\inst2|RxDev|RxState.RxData_state~q\ & ( !\inst2|RxDev|RxState.RxStart_State~q\ & ( !\inst2|RxDev|RxDatDel2~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110111111100000000000000000111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|RxDev|ALT_INV_RxBitCount[0]~DUPLICATE_q\,
	datab => \inst2|RxDev|ALT_INV_RxBitCount\(1),
	datac => \inst2|RxDev|ALT_INV_RxBitCount\(2),
	datad => \inst2|RxDev|ALT_INV_RxDatDel2~q\,
	datae => \inst2|RxDev|ALT_INV_RxState.RxData_state~q\,
	dataf => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	combout => \inst2|RxDev|Selector13~0_combout\);

-- Location: FF_X79_Y34_N50
\inst2|RxDev|RxState.RxData_state\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Selector13~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxState.RxData_state~q\);

-- Location: LABCELL_X79_Y34_N36
\inst2|RxDev|Selector11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Selector11~0_combout\ = ( \inst2|RxDev|RxState.RxStart_State~q\ & ( !\inst2|RxDev|RxState.RxData_state~q\ $ (!\inst2|RxDev|RxBitCount\(0)) ) ) # ( !\inst2|RxDev|RxState.RxStart_State~q\ & ( \inst2|CtrlReg\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111101010101101010100101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|RxDev|ALT_INV_RxState.RxData_state~q\,
	datac => \inst2|ALT_INV_CtrlReg\(4),
	datad => \inst2|RxDev|ALT_INV_RxBitCount\(0),
	dataf => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	combout => \inst2|RxDev|Selector11~0_combout\);

-- Location: FF_X79_Y34_N38
\inst2|RxDev|RxBitCount[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Selector11~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxBitCount[0]~DUPLICATE_q\);

-- Location: IOIBUF_X38_Y81_N35
\DataIn[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DataIn(3),
	o => \DataIn[3]~input_o\);

-- Location: FF_X77_Y34_N56
\inst2|CtrlReg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[3]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|CtrlReg[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|CtrlReg\(3));

-- Location: LABCELL_X79_Y34_N54
\inst2|RxDev|Selector14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Selector14~0_combout\ = ( \inst2|CtrlReg\(4) & ( !\inst2|RxDev|RxBitCount\(1) & ( (!\inst2|RxDev|RxBitCount[0]~DUPLICATE_q\ & (\inst2|CtrlReg\(3) & (!\inst2|RxDev|RxBitCount\(2) & \inst2|RxDev|RxState.RxData_state~q\))) ) ) ) # ( 
-- !\inst2|CtrlReg\(4) & ( !\inst2|RxDev|RxBitCount\(1) & ( (!\inst2|RxDev|RxBitCount[0]~DUPLICATE_q\ & (!\inst2|RxDev|RxBitCount\(2) & \inst2|RxDev|RxState.RxData_state~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010100000000000000010000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|RxDev|ALT_INV_RxBitCount[0]~DUPLICATE_q\,
	datab => \inst2|ALT_INV_CtrlReg\(3),
	datac => \inst2|RxDev|ALT_INV_RxBitCount\(2),
	datad => \inst2|RxDev|ALT_INV_RxState.RxData_state~q\,
	datae => \inst2|ALT_INV_CtrlReg\(4),
	dataf => \inst2|RxDev|ALT_INV_RxBitCount\(1),
	combout => \inst2|RxDev|Selector14~0_combout\);

-- Location: FF_X79_Y34_N53
\inst2|RxDev|RxState.RxParity_state\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|Selector14~0_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxState.RxParity_state~q\);

-- Location: LABCELL_X79_Y34_N9
\inst2|RxDev|Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Selector15~0_combout\ = ( \inst2|RxDev|RxState.RxData_state~q\ & ( (!\inst2|RxDev|RxBitCount[0]~DUPLICATE_q\ & (!\inst2|RxDev|RxBitCount\(1) & !\inst2|RxDev|RxBitCount\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|RxDev|ALT_INV_RxBitCount[0]~DUPLICATE_q\,
	datac => \inst2|RxDev|ALT_INV_RxBitCount\(1),
	datad => \inst2|RxDev|ALT_INV_RxBitCount\(2),
	dataf => \inst2|RxDev|ALT_INV_RxState.RxData_state~q\,
	combout => \inst2|RxDev|Selector15~0_combout\);

-- Location: LABCELL_X79_Y34_N6
\inst2|RxDev|Selector15~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Selector15~1_combout\ = ( \inst2|RxDev|Selector15~0_combout\ & ( ((\inst2|CtrlReg\(4) & !\inst2|CtrlReg\(3))) # (\inst2|RxDev|RxState.RxParity_state~q\) ) ) # ( !\inst2|RxDev|Selector15~0_combout\ & ( \inst2|RxDev|RxState.RxParity_state~q\ ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100111111000011110011111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|ALT_INV_CtrlReg\(4),
	datac => \inst2|RxDev|ALT_INV_RxState.RxParity_state~q\,
	datad => \inst2|ALT_INV_CtrlReg\(3),
	dataf => \inst2|RxDev|ALT_INV_Selector15~0_combout\,
	combout => \inst2|RxDev|Selector15~1_combout\);

-- Location: FF_X79_Y34_N8
\inst2|RxDev|RxState.RxStop_state\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Selector15~1_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxState.RxStop_state~q\);

-- Location: LABCELL_X79_Y34_N21
\inst2|RxDev|Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Selector12~0_combout\ = ( !\inst2|RxDev|RxState.RxStop_state~q\ & ( (!\inst2|RxDev|RxDatDel2~q\) # (\inst2|RxDev|RxState.RxStart_State~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011111111111100001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|RxDev|ALT_INV_RxDatDel2~q\,
	datad => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	dataf => \inst2|RxDev|ALT_INV_RxState.RxStop_state~q\,
	combout => \inst2|RxDev|Selector12~0_combout\);

-- Location: FF_X79_Y34_N23
\inst2|RxDev|RxState.RxStart_State\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Selector12~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxState.RxStart_State~q\);

-- Location: LABCELL_X79_Y34_N0
\inst2|RxDev|RxShiftReg[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxShiftReg[7]~0_combout\ = ( \inst2|CtrlReg\(4) & ( (\inst2|RxDev|RxBdEdge~q\ & (!\inst2|RxDev|RxState.RxParity_state~q\ & !\inst2|RxDev|RxState.RxStop_state~DUPLICATE_q\)) ) ) # ( !\inst2|CtrlReg\(4) & ( (\inst2|RxDev|RxBdEdge~q\ & 
-- !\inst2|RxDev|RxState.RxStop_state~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000000110000000000000011000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|RxDev|ALT_INV_RxBdEdge~q\,
	datac => \inst2|RxDev|ALT_INV_RxState.RxParity_state~q\,
	datad => \inst2|RxDev|ALT_INV_RxState.RxStop_state~DUPLICATE_q\,
	dataf => \inst2|ALT_INV_CtrlReg\(4),
	combout => \inst2|RxDev|RxShiftReg[7]~0_combout\);

-- Location: FF_X78_Y34_N2
\inst2|RxDev|RxShiftReg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxDatDel2~q\,
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxShiftReg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxShiftReg\(7));

-- Location: MLABCELL_X78_Y34_N36
\inst2|RxDev|RxDout[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxDout[7]~0_combout\ = ( \inst2|RxDev|RxState.RxStop_state~DUPLICATE_q\ & ( \inst2|RxDev|RxBdEdge~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|RxDev|ALT_INV_RxBdEdge~q\,
	dataf => \inst2|RxDev|ALT_INV_RxState.RxStop_state~DUPLICATE_q\,
	combout => \inst2|RxDev|RxDout[7]~0_combout\);

-- Location: FF_X78_Y34_N52
\inst2|RxDev|RxDout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxShiftReg\(7),
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxDout[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDout\(7));

-- Location: IOIBUF_X89_Y21_N4
\DataIn[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DataIn(6),
	o => \DataIn[6]~input_o\);

-- Location: FF_X77_Y34_N35
\inst2|CtrlReg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[6]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|CtrlReg[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|CtrlReg\(6));

-- Location: IOIBUF_X89_Y21_N21
\DataIn[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DataIn(7),
	o => \DataIn[7]~input_o\);

-- Location: LABCELL_X77_Y34_N39
\inst2|CtrlReg[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|CtrlReg[7]~feeder_combout\ = ( \DataIn[7]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_DataIn[7]~input_o\,
	combout => \inst2|CtrlReg[7]~feeder_combout\);

-- Location: FF_X77_Y34_N41
\inst2|CtrlReg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|CtrlReg[7]~feeder_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|CtrlReg[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|CtrlReg\(7));

-- Location: IOIBUF_X40_Y81_N18
\DataIn[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DataIn(5),
	o => \DataIn[5]~input_o\);

-- Location: FF_X77_Y34_N32
\inst2|CtrlReg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[5]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|CtrlReg[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|CtrlReg\(5));

-- Location: MLABCELL_X82_Y34_N42
\inst2|ReadRR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|ReadRR~0_combout\ = ( !\Address[2]~input_o\ & ( \inst|GPS_Port_Enable~0_combout\ & ( (\WE_L~input_o\ & (\inst|GPS_Port_Enable~1_combout\ & (\inst|GPS_Port_Enable~2_combout\ & \Address[1]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WE_L~input_o\,
	datab => \inst|ALT_INV_GPS_Port_Enable~1_combout\,
	datac => \inst|ALT_INV_GPS_Port_Enable~2_combout\,
	datad => \ALT_INV_Address[1]~input_o\,
	datae => \ALT_INV_Address[2]~input_o\,
	dataf => \inst|ALT_INV_GPS_Port_Enable~0_combout\,
	combout => \inst2|ReadRR~0_combout\);

-- Location: FF_X81_Y34_N20
\inst2|ReadRR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|ReadRR~0_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|ReadRR~q\);

-- Location: LABCELL_X79_Y34_N18
\inst2|RxDev|Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Selector16~0_combout\ = ( \inst2|RxDev|RxState.RxStart_State~q\ & ( ((\inst2|RxDev|RxState.RxParity_state~q\ & \inst2|RxDev|RxAck~q\)) # (\inst2|RxDev|RxState.RxData_state~q\) ) ) # ( !\inst2|RxDev|RxState.RxStart_State~q\ & ( 
-- (\inst2|RxDev|RxAck~q\) # (\inst2|RxDev|RxState.RxData_state~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111100001111010111110000111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|RxDev|ALT_INV_RxState.RxParity_state~q\,
	datac => \inst2|RxDev|ALT_INV_RxState.RxData_state~q\,
	datad => \inst2|RxDev|ALT_INV_RxAck~q\,
	dataf => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	combout => \inst2|RxDev|Selector16~0_combout\);

-- Location: FF_X79_Y34_N20
\inst2|RxDev|RxAck\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Selector16~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxAck~q\);

-- Location: LABCELL_X79_Y34_N45
\inst2|RxDev|RxReq~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxReq~0_combout\ = ( \inst2|RxDev|RxAck~q\ & ( \inst2|ReadRR~q\ ) ) # ( !\inst2|RxDev|RxAck~q\ & ( (\inst2|RxDev|RxReq~q\) # (\inst2|ReadRR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|ALT_INV_ReadRR~q\,
	datad => \inst2|RxDev|ALT_INV_RxReq~q\,
	dataf => \inst2|RxDev|ALT_INV_RxAck~q\,
	combout => \inst2|RxDev|RxReq~0_combout\);

-- Location: FF_X79_Y34_N46
\inst2|RxDev|RxReq\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|RxReq~0_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxReq~q\);

-- Location: FF_X79_Y34_N19
\inst2|RxDev|RxAck~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Selector16~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxAck~DUPLICATE_q\);

-- Location: LABCELL_X80_Y34_N30
\inst2|RxDev|RxReady~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxReady~0_combout\ = ( \inst2|RxDev|RxReady~q\ & ( !\inst2|ReadRR~q\ ) ) # ( !\inst2|RxDev|RxReady~q\ & ( !\inst2|ReadRR~q\ & ( (!\inst2|RxDev|RxReq~q\ & !\inst2|RxDev|RxAck~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|RxDev|ALT_INV_RxReq~q\,
	datad => \inst2|RxDev|ALT_INV_RxAck~DUPLICATE_q\,
	datae => \inst2|RxDev|ALT_INV_RxReady~q\,
	dataf => \inst2|ALT_INV_ReadRR~q\,
	combout => \inst2|RxDev|RxReady~0_combout\);

-- Location: FF_X80_Y34_N31
\inst2|RxDev|RxReady\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|RxReady~0_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxReady~q\);

-- Location: MLABCELL_X82_Y34_N51
\inst2|WriteTR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|WriteTR~0_combout\ = ( !\Address[2]~input_o\ & ( \Address[1]~input_o\ & ( (\inst|GPS_Port_Enable~2_combout\ & (\inst|GPS_Port_Enable~1_combout\ & (\inst|GPS_Port_Enable~0_combout\ & !\WE_L~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_GPS_Port_Enable~2_combout\,
	datab => \inst|ALT_INV_GPS_Port_Enable~1_combout\,
	datac => \inst|ALT_INV_GPS_Port_Enable~0_combout\,
	datad => \ALT_INV_WE_L~input_o\,
	datae => \ALT_INV_Address[2]~input_o\,
	dataf => \ALT_INV_Address[1]~input_o\,
	combout => \inst2|WriteTR~0_combout\);

-- Location: FF_X80_Y34_N23
\inst2|WriteTR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|WriteTR~0_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|WriteTR~q\);

-- Location: LABCELL_X80_Y35_N36
\inst2|TxDev|TxClkEdge~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxClkEdge~0_combout\ = ( \inst2|TxDev|TxClkDel~q\ & ( !\inst1|inst5|ACIA_Clk~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst5|ALT_INV_ACIA_Clk~DUPLICATE_q\,
	dataf => \inst2|TxDev|ALT_INV_TxClkDel~q\,
	combout => \inst2|TxDev|TxClkEdge~0_combout\);

-- Location: FF_X80_Y35_N38
\inst2|TxDev|TxClkEdge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxClkEdge~0_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxClkEdge~q\);

-- Location: LABCELL_X81_Y34_N45
\inst2|TxDev|TxClkCnt[0]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxClkCnt[0]~6_combout\ = ( \inst2|TxDev|TxClkEdge~q\ & ( !\inst2|TxDev|TxClkCnt\(0) ) ) # ( !\inst2|TxDev|TxClkEdge~q\ & ( \inst2|TxDev|TxClkCnt\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst2|TxDev|ALT_INV_TxClkCnt\(0),
	dataf => \inst2|TxDev|ALT_INV_TxClkEdge~q\,
	combout => \inst2|TxDev|TxClkCnt[0]~6_combout\);

-- Location: FF_X81_Y34_N47
\inst2|TxDev|TxClkCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxClkCnt[0]~6_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxClkCnt\(0));

-- Location: FF_X80_Y34_N40
\inst2|TxDev|TxClkCnt[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|TxDev|TxClkCnt[3]~2_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxClkCnt[3]~DUPLICATE_q\);

-- Location: FF_X81_Y34_N46
\inst2|TxDev|TxClkCnt[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxClkCnt[0]~6_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxClkCnt[0]~DUPLICATE_q\);

-- Location: LABCELL_X81_Y34_N21
\inst2|TxDev|TxClkCnt[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxClkCnt[1]~5_combout\ = ( \inst2|TxDev|TxClkCnt\(1) & ( \inst2|TxDev|TxClkEdge~q\ & ( !\inst2|TxDev|TxClkCnt\(0) ) ) ) # ( !\inst2|TxDev|TxClkCnt\(1) & ( \inst2|TxDev|TxClkEdge~q\ & ( \inst2|TxDev|TxClkCnt\(0) ) ) ) # ( 
-- \inst2|TxDev|TxClkCnt\(1) & ( !\inst2|TxDev|TxClkEdge~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|TxDev|ALT_INV_TxClkCnt\(0),
	datae => \inst2|TxDev|ALT_INV_TxClkCnt\(1),
	dataf => \inst2|TxDev|ALT_INV_TxClkEdge~q\,
	combout => \inst2|TxDev|TxClkCnt[1]~5_combout\);

-- Location: FF_X80_Y34_N50
\inst2|TxDev|TxClkCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|TxDev|TxClkCnt[1]~5_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxClkCnt\(1));

-- Location: FF_X80_Y34_N20
\inst2|TxDev|TxClkCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxClkCnt[2]~4_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxClkCnt\(2));

-- Location: LABCELL_X80_Y34_N18
\inst2|TxDev|TxClkCnt[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxClkCnt[2]~4_combout\ = ( \inst2|TxDev|TxClkEdge~q\ & ( !\inst2|TxDev|TxClkCnt\(2) $ (((!\inst2|TxDev|TxClkCnt[0]~DUPLICATE_q\) # (!\inst2|TxDev|TxClkCnt\(1)))) ) ) # ( !\inst2|TxDev|TxClkEdge~q\ & ( \inst2|TxDev|TxClkCnt\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101111110100000010111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxClkCnt[0]~DUPLICATE_q\,
	datac => \inst2|TxDev|ALT_INV_TxClkCnt\(1),
	datad => \inst2|TxDev|ALT_INV_TxClkCnt\(2),
	dataf => \inst2|TxDev|ALT_INV_TxClkEdge~q\,
	combout => \inst2|TxDev|TxClkCnt[2]~4_combout\);

-- Location: FF_X80_Y34_N19
\inst2|TxDev|TxClkCnt[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxClkCnt[2]~4_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxClkCnt[2]~DUPLICATE_q\);

-- Location: LABCELL_X81_Y34_N36
\inst2|TxDev|TxClkCnt[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxClkCnt[3]~2_combout\ = ( \inst2|TxDev|TxClkCnt\(1) & ( \inst2|TxDev|TxClkEdge~q\ & ( !\inst2|TxDev|TxClkCnt[3]~DUPLICATE_q\ $ (((!\inst2|TxDev|TxClkCnt\(0)) # (!\inst2|TxDev|TxClkCnt[2]~DUPLICATE_q\))) ) ) ) # ( !\inst2|TxDev|TxClkCnt\(1) & 
-- ( \inst2|TxDev|TxClkEdge~q\ & ( \inst2|TxDev|TxClkCnt[3]~DUPLICATE_q\ ) ) ) # ( \inst2|TxDev|TxClkCnt\(1) & ( !\inst2|TxDev|TxClkEdge~q\ & ( \inst2|TxDev|TxClkCnt[3]~DUPLICATE_q\ ) ) ) # ( !\inst2|TxDev|TxClkCnt\(1) & ( !\inst2|TxDev|TxClkEdge~q\ & ( 
-- \inst2|TxDev|TxClkCnt[3]~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|TxDev|ALT_INV_TxClkCnt\(0),
	datac => \inst2|TxDev|ALT_INV_TxClkCnt[3]~DUPLICATE_q\,
	datad => \inst2|TxDev|ALT_INV_TxClkCnt[2]~DUPLICATE_q\,
	datae => \inst2|TxDev|ALT_INV_TxClkCnt\(1),
	dataf => \inst2|TxDev|ALT_INV_TxClkEdge~q\,
	combout => \inst2|TxDev|TxClkCnt[3]~2_combout\);

-- Location: FF_X80_Y34_N41
\inst2|TxDev|TxClkCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|TxDev|TxClkCnt[3]~2_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxClkCnt\(3));

-- Location: LABCELL_X80_Y34_N48
\inst2|TxDev|TxClkCnt[4]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxClkCnt[4]~3_combout\ = ( \inst2|TxDev|TxClkCnt\(1) & ( \inst2|TxDev|TxClkEdge~q\ & ( !\inst2|TxDev|TxClkCnt\(4) $ (((!\inst2|TxDev|TxClkCnt\(2)) # ((!\inst2|TxDev|TxClkCnt[0]~DUPLICATE_q\) # (!\inst2|TxDev|TxClkCnt\(3))))) ) ) ) # ( 
-- !\inst2|TxDev|TxClkCnt\(1) & ( \inst2|TxDev|TxClkEdge~q\ & ( \inst2|TxDev|TxClkCnt\(4) ) ) ) # ( \inst2|TxDev|TxClkCnt\(1) & ( !\inst2|TxDev|TxClkEdge~q\ & ( \inst2|TxDev|TxClkCnt\(4) ) ) ) # ( !\inst2|TxDev|TxClkCnt\(1) & ( !\inst2|TxDev|TxClkEdge~q\ & ( 
-- \inst2|TxDev|TxClkCnt\(4) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxClkCnt\(2),
	datab => \inst2|TxDev|ALT_INV_TxClkCnt\(4),
	datac => \inst2|TxDev|ALT_INV_TxClkCnt[0]~DUPLICATE_q\,
	datad => \inst2|TxDev|ALT_INV_TxClkCnt\(3),
	datae => \inst2|TxDev|ALT_INV_TxClkCnt\(1),
	dataf => \inst2|TxDev|ALT_INV_TxClkEdge~q\,
	combout => \inst2|TxDev|TxClkCnt[4]~3_combout\);

-- Location: FF_X79_Y34_N58
\inst2|TxDev|TxClkCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|TxDev|TxClkCnt[4]~3_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxClkCnt\(4));

-- Location: LABCELL_X83_Y34_N6
\inst2|TxDev|TxClkCnt[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxClkCnt[3]~0_combout\ = ( \inst2|TxDev|TxClkCnt[0]~DUPLICATE_q\ & ( \inst2|TxDev|TxClkEdge~q\ & ( (\inst2|TxDev|TxClkCnt[2]~DUPLICATE_q\ & \inst2|TxDev|TxClkCnt\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|TxDev|ALT_INV_TxClkCnt[2]~DUPLICATE_q\,
	datac => \inst2|TxDev|ALT_INV_TxClkCnt\(1),
	datae => \inst2|TxDev|ALT_INV_TxClkCnt[0]~DUPLICATE_q\,
	dataf => \inst2|TxDev|ALT_INV_TxClkEdge~q\,
	combout => \inst2|TxDev|TxClkCnt[3]~0_combout\);

-- Location: LABCELL_X80_Y34_N57
\inst2|TxDev|TxClkCnt[5]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxClkCnt[5]~1_combout\ = ( \inst2|TxDev|TxClkCnt[3]~0_combout\ & ( !\inst2|TxDev|TxClkCnt\(5) $ (((!\inst2|TxDev|TxClkCnt[3]~DUPLICATE_q\) # (!\inst2|TxDev|TxClkCnt\(4)))) ) ) # ( !\inst2|TxDev|TxClkCnt[3]~0_combout\ & ( 
-- \inst2|TxDev|TxClkCnt\(5) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101111110100000010111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxClkCnt[3]~DUPLICATE_q\,
	datac => \inst2|TxDev|ALT_INV_TxClkCnt\(4),
	datad => \inst2|TxDev|ALT_INV_TxClkCnt\(5),
	dataf => \inst2|TxDev|ALT_INV_TxClkCnt[3]~0_combout\,
	combout => \inst2|TxDev|TxClkCnt[5]~1_combout\);

-- Location: FF_X80_Y34_N59
\inst2|TxDev|TxClkCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxClkCnt[5]~1_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxClkCnt\(5));

-- Location: LABCELL_X80_Y34_N54
\inst2|TxDev|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Mux0~0_combout\ = ( \inst1|inst5|ACIA_Clk~DUPLICATE_q\ & ( (!\inst2|CtrlReg\(1) & (((!\inst2|CtrlReg\(0))) # (\inst2|TxDev|TxClkCnt[3]~DUPLICATE_q\))) # (\inst2|CtrlReg\(1) & (((\inst2|TxDev|TxClkCnt\(5) & !\inst2|CtrlReg\(0))))) ) ) # ( 
-- !\inst1|inst5|ACIA_Clk~DUPLICATE_q\ & ( (!\inst2|CtrlReg\(1) & (\inst2|TxDev|TxClkCnt[3]~DUPLICATE_q\ & ((\inst2|CtrlReg\(0))))) # (\inst2|CtrlReg\(1) & (((\inst2|TxDev|TxClkCnt\(5) & !\inst2|CtrlReg\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001101010000000000110101000011110011010100001111001101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxClkCnt[3]~DUPLICATE_q\,
	datab => \inst2|TxDev|ALT_INV_TxClkCnt\(5),
	datac => \inst2|ALT_INV_CtrlReg\(1),
	datad => \inst2|ALT_INV_CtrlReg\(0),
	dataf => \inst1|inst5|ALT_INV_ACIA_Clk~DUPLICATE_q\,
	combout => \inst2|TxDev|Mux0~0_combout\);

-- Location: FF_X80_Y34_N55
\inst2|TxDev|TxBdDel\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Mux0~0_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxBdDel~q\);

-- Location: LABCELL_X80_Y34_N36
\inst2|TxDev|TxBdEdge~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxBdEdge~0_combout\ = ( \inst2|TxDev|TxBdDel~q\ & ( \inst1|inst5|ACIA_Clk~DUPLICATE_q\ & ( (!\inst2|CtrlReg\(0) & (((\inst2|CtrlReg\(1) & !\inst2|TxDev|TxClkCnt\(5))))) # (\inst2|CtrlReg\(0) & ((!\inst2|TxDev|TxClkCnt\(3)) # 
-- ((\inst2|CtrlReg\(1))))) ) ) ) # ( \inst2|TxDev|TxBdDel~q\ & ( !\inst1|inst5|ACIA_Clk~DUPLICATE_q\ & ( (!\inst2|CtrlReg\(0) & (((!\inst2|CtrlReg\(1)) # (!\inst2|TxDev|TxClkCnt\(5))))) # (\inst2|CtrlReg\(0) & ((!\inst2|TxDev|TxClkCnt\(3)) # 
-- ((\inst2|CtrlReg\(1))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011111110010100000000000000000100111101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_CtrlReg\(0),
	datab => \inst2|TxDev|ALT_INV_TxClkCnt\(3),
	datac => \inst2|ALT_INV_CtrlReg\(1),
	datad => \inst2|TxDev|ALT_INV_TxClkCnt\(5),
	datae => \inst2|TxDev|ALT_INV_TxBdDel~q\,
	dataf => \inst1|inst5|ALT_INV_ACIA_Clk~DUPLICATE_q\,
	combout => \inst2|TxDev|TxBdEdge~0_combout\);

-- Location: FF_X80_Y34_N38
\inst2|TxDev|TxBdEdge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxBdEdge~0_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxBdEdge~q\);

-- Location: FF_X80_Y34_N43
\inst2|TxDev|TxState.TxStart_State\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Selector3~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|TxDev|TxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxState.TxStart_State~q\);

-- Location: LABCELL_X80_Y34_N27
\inst2|TxDev|TxBitCount[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxBitCount[0]~0_combout\ = ( \inst2|TxDev|TxBdEdge~q\ & ( \inst2|TxDev|TxState.TxData_State~q\ ) ) # ( \inst2|TxDev|TxBdEdge~q\ & ( !\inst2|TxDev|TxState.TxData_State~q\ & ( \inst2|TxDev|TxState.TxStart_State~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|TxDev|ALT_INV_TxState.TxStart_State~DUPLICATE_q\,
	datae => \inst2|TxDev|ALT_INV_TxBdEdge~q\,
	dataf => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	combout => \inst2|TxDev|TxBitCount[0]~0_combout\);

-- Location: FF_X83_Y34_N29
\inst2|TxDev|TxBitCount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Add1~1_combout\,
	asdata => VCC,
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxBitCount\(1));

-- Location: LABCELL_X83_Y34_N27
\inst2|TxDev|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Add1~1_combout\ = ( \inst2|TxDev|TxBitCount[0]~DUPLICATE_q\ & ( \inst2|TxDev|TxBitCount\(1) ) ) # ( !\inst2|TxDev|TxBitCount[0]~DUPLICATE_q\ & ( !\inst2|TxDev|TxBitCount\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst2|TxDev|ALT_INV_TxBitCount\(1),
	dataf => \inst2|TxDev|ALT_INV_TxBitCount[0]~DUPLICATE_q\,
	combout => \inst2|TxDev|Add1~1_combout\);

-- Location: FF_X83_Y34_N28
\inst2|TxDev|TxBitCount[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Add1~1_combout\,
	asdata => VCC,
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxBitCount[1]~DUPLICATE_q\);

-- Location: FF_X83_Y34_N26
\inst2|TxDev|TxBitCount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Add1~0_combout\,
	asdata => VCC,
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxBitCount\(2));

-- Location: LABCELL_X83_Y34_N24
\inst2|TxDev|Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Add1~0_combout\ = ( \inst2|TxDev|TxBitCount[1]~DUPLICATE_q\ & ( \inst2|TxDev|TxBitCount\(2) ) ) # ( !\inst2|TxDev|TxBitCount[1]~DUPLICATE_q\ & ( !\inst2|TxDev|TxBitCount[0]~DUPLICATE_q\ $ (\inst2|TxDev|TxBitCount\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000001111111100000000111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|TxDev|ALT_INV_TxBitCount[0]~DUPLICATE_q\,
	datad => \inst2|TxDev|ALT_INV_TxBitCount\(2),
	dataf => \inst2|TxDev|ALT_INV_TxBitCount[1]~DUPLICATE_q\,
	combout => \inst2|TxDev|Add1~0_combout\);

-- Location: FF_X83_Y34_N25
\inst2|TxDev|TxBitCount[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Add1~0_combout\,
	asdata => VCC,
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxBitCount[2]~DUPLICATE_q\);

-- Location: LABCELL_X83_Y34_N51
\inst2|TxDev|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Selector4~0_combout\ = ( \inst2|TxDev|TxBitCount[0]~DUPLICATE_q\ & ( (\inst2|TxDev|TxState.TxData_State~q\) # (\inst2|TxDev|TxState.TxStart_State~q\) ) ) # ( !\inst2|TxDev|TxBitCount[0]~DUPLICATE_q\ & ( ((\inst2|TxDev|TxState.TxData_State~q\ 
-- & ((\inst2|TxDev|TxBitCount[2]~DUPLICATE_q\) # (\inst2|TxDev|TxBitCount[1]~DUPLICATE_q\)))) # (\inst2|TxDev|TxState.TxStart_State~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101111111010101010111111101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxState.TxStart_State~q\,
	datab => \inst2|TxDev|ALT_INV_TxBitCount[1]~DUPLICATE_q\,
	datac => \inst2|TxDev|ALT_INV_TxBitCount[2]~DUPLICATE_q\,
	datad => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	dataf => \inst2|TxDev|ALT_INV_TxBitCount[0]~DUPLICATE_q\,
	combout => \inst2|TxDev|Selector4~0_combout\);

-- Location: FF_X83_Y34_N53
\inst2|TxDev|TxState.TxData_State\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Selector4~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|TxDev|TxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxState.TxData_State~q\);

-- Location: FF_X83_Y34_N55
\inst2|TxDev|TxBitCount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxBitCount[0]~_wirecell_combout\,
	asdata => \inst2|CtrlReg\(4),
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxBitCount\(0));

-- Location: LABCELL_X83_Y34_N54
\inst2|TxDev|TxBitCount[0]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxBitCount[0]~_wirecell_combout\ = !\inst2|TxDev|TxBitCount\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst2|TxDev|ALT_INV_TxBitCount\(0),
	combout => \inst2|TxDev|TxBitCount[0]~_wirecell_combout\);

-- Location: FF_X83_Y34_N56
\inst2|TxDev|TxBitCount[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxBitCount[0]~_wirecell_combout\,
	asdata => \inst2|CtrlReg\(4),
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxBitCount[0]~DUPLICATE_q\);

-- Location: LABCELL_X83_Y34_N36
\inst2|TxDev|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Equal0~0_combout\ = ( !\inst2|TxDev|TxBitCount\(1) & ( !\inst2|TxDev|TxBitCount\(2) & ( !\inst2|TxDev|TxBitCount[0]~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|TxDev|ALT_INV_TxBitCount[0]~DUPLICATE_q\,
	datae => \inst2|TxDev|ALT_INV_TxBitCount\(1),
	dataf => \inst2|TxDev|ALT_INV_TxBitCount\(2),
	combout => \inst2|TxDev|Equal0~0_combout\);

-- Location: FF_X77_Y34_N17
\inst2|CtrlReg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[2]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|CtrlReg[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|CtrlReg\(2));

-- Location: FF_X77_Y34_N23
\inst2|TxDev|TxState.Tx1Stop_State~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Selector2~1_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|TxDev|TxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxState.Tx1Stop_State~DUPLICATE_q\);

-- Location: LABCELL_X83_Y34_N30
\inst2|TxDev|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Selector5~0_combout\ = ( \inst2|CtrlReg\(4) & ( \inst2|CtrlReg\(3) & ( (\inst2|TxDev|TxState.TxData_State~q\ & (!\inst2|TxDev|TxBitCount[2]~DUPLICATE_q\ & (!\inst2|TxDev|TxBitCount\(1) & !\inst2|TxDev|TxBitCount\(0)))) ) ) ) # ( 
-- !\inst2|CtrlReg\(4) & ( \inst2|CtrlReg\(3) & ( (\inst2|TxDev|TxState.TxData_State~q\ & (!\inst2|TxDev|TxBitCount[2]~DUPLICATE_q\ & (!\inst2|TxDev|TxBitCount\(1) & !\inst2|TxDev|TxBitCount\(0)))) ) ) ) # ( !\inst2|CtrlReg\(4) & ( !\inst2|CtrlReg\(3) & ( 
-- (\inst2|TxDev|TxState.TxData_State~q\ & (!\inst2|TxDev|TxBitCount[2]~DUPLICATE_q\ & (!\inst2|TxDev|TxBitCount\(1) & !\inst2|TxDev|TxBitCount\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000000000000000000001000000000000000100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	datab => \inst2|TxDev|ALT_INV_TxBitCount[2]~DUPLICATE_q\,
	datac => \inst2|TxDev|ALT_INV_TxBitCount\(1),
	datad => \inst2|TxDev|ALT_INV_TxBitCount\(0),
	datae => \inst2|ALT_INV_CtrlReg\(4),
	dataf => \inst2|ALT_INV_CtrlReg\(3),
	combout => \inst2|TxDev|Selector5~0_combout\);

-- Location: FF_X80_Y34_N47
\inst2|TxDev|TxState.TxParity_State\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|TxDev|Selector5~0_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|TxDev|TxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxState.TxParity_State~q\);

-- Location: LABCELL_X77_Y34_N3
\inst2|TxDev|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Selector6~0_combout\ = ( \inst2|TxDev|TxState.TxData_State~q\ & ( \inst2|TxDev|Equal0~0_combout\ & ( (!\inst2|CtrlReg\(3) & (((!\inst2|CtrlReg\(2) & \inst2|CtrlReg\(4))) # (\inst2|TxDev|TxState.TxParity_State~q\))) ) ) ) # ( 
-- !\inst2|TxDev|TxState.TxData_State~q\ & ( \inst2|TxDev|Equal0~0_combout\ & ( (!\inst2|CtrlReg\(3) & \inst2|TxDev|TxState.TxParity_State~q\) ) ) ) # ( \inst2|TxDev|TxState.TxData_State~q\ & ( !\inst2|TxDev|Equal0~0_combout\ & ( (!\inst2|CtrlReg\(3) & 
-- \inst2|TxDev|TxState.TxParity_State~q\) ) ) ) # ( !\inst2|TxDev|TxState.TxData_State~q\ & ( !\inst2|TxDev|Equal0~0_combout\ & ( (!\inst2|CtrlReg\(3) & \inst2|TxDev|TxState.TxParity_State~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000001010000010100000101010001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_CtrlReg\(3),
	datab => \inst2|ALT_INV_CtrlReg\(2),
	datac => \inst2|TxDev|ALT_INV_TxState.TxParity_State~q\,
	datad => \inst2|ALT_INV_CtrlReg\(4),
	datae => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	dataf => \inst2|TxDev|ALT_INV_Equal0~0_combout\,
	combout => \inst2|TxDev|Selector6~0_combout\);

-- Location: FF_X80_Y34_N26
\inst2|TxDev|TxState.Tx2Stop_State\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|TxDev|Selector6~0_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|TxDev|TxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxState.Tx2Stop_State~q\);

-- Location: LABCELL_X77_Y34_N9
\inst2|TxDev|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Selector2~0_combout\ = ( !\inst2|TxDev|TxState.Tx2Stop_State~q\ & ( \inst2|TxDev|TxReq~DUPLICATE_q\ & ( (!\inst2|TxDev|TxState.TxParity_State~q\) # (!\inst2|CtrlReg\(3)) ) ) ) # ( !\inst2|TxDev|TxState.Tx2Stop_State~q\ & ( 
-- !\inst2|TxDev|TxReq~DUPLICATE_q\ & ( (\inst2|TxDev|TxState.Tx1Stop_State~DUPLICATE_q\ & ((!\inst2|TxDev|TxState.TxParity_State~q\) # (!\inst2|CtrlReg\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010000000000000000000011111111111100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxState.Tx1Stop_State~DUPLICATE_q\,
	datac => \inst2|TxDev|ALT_INV_TxState.TxParity_State~q\,
	datad => \inst2|ALT_INV_CtrlReg\(3),
	datae => \inst2|TxDev|ALT_INV_TxState.Tx2Stop_State~q\,
	dataf => \inst2|TxDev|ALT_INV_TxReq~DUPLICATE_q\,
	combout => \inst2|TxDev|Selector2~0_combout\);

-- Location: LABCELL_X77_Y34_N21
\inst2|TxDev|Selector2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Selector2~1_combout\ = ( \inst2|TxDev|TxState.TxData_State~q\ & ( \inst2|CtrlReg\(3) & ( \inst2|TxDev|Selector2~0_combout\ ) ) ) # ( !\inst2|TxDev|TxState.TxData_State~q\ & ( \inst2|CtrlReg\(3) & ( \inst2|TxDev|Selector2~0_combout\ ) ) ) # ( 
-- \inst2|TxDev|TxState.TxData_State~q\ & ( !\inst2|CtrlReg\(3) & ( (\inst2|TxDev|Selector2~0_combout\ & ((!\inst2|TxDev|Equal0~0_combout\) # ((!\inst2|CtrlReg\(2)) # (!\inst2|CtrlReg\(4))))) ) ) ) # ( !\inst2|TxDev|TxState.TxData_State~q\ & ( 
-- !\inst2|CtrlReg\(3) & ( \inst2|TxDev|Selector2~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_Equal0~0_combout\,
	datab => \inst2|ALT_INV_CtrlReg\(2),
	datac => \inst2|TxDev|ALT_INV_Selector2~0_combout\,
	datad => \inst2|ALT_INV_CtrlReg\(4),
	datae => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	dataf => \inst2|ALT_INV_CtrlReg\(3),
	combout => \inst2|TxDev|Selector2~1_combout\);

-- Location: FF_X77_Y34_N22
\inst2|TxDev|TxState.Tx1Stop_State\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Selector2~1_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|TxDev|TxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxState.Tx1Stop_State~q\);

-- Location: FF_X80_Y34_N53
\inst2|TxDev|TxReq\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|TxDev|TxReq~0_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxReq~q\);

-- Location: LABCELL_X80_Y34_N42
\inst2|TxDev|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Selector3~0_combout\ = (!\inst2|TxDev|TxState.Tx1Stop_State~q\ & \inst2|TxDev|TxReq~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|TxDev|ALT_INV_TxState.Tx1Stop_State~q\,
	datac => \inst2|TxDev|ALT_INV_TxReq~q\,
	combout => \inst2|TxDev|Selector3~0_combout\);

-- Location: FF_X80_Y34_N44
\inst2|TxDev|TxState.TxStart_State~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Selector3~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|TxDev|TxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxState.TxStart_State~DUPLICATE_q\);

-- Location: LABCELL_X80_Y34_N21
\inst2|TxDev|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Selector1~0_combout\ = ( \inst2|TxDev|TxAck~q\ & ( (\inst2|TxDev|TxState.Tx1Stop_State~q\) # (\inst2|TxDev|TxState.TxStart_State~DUPLICATE_q\) ) ) # ( !\inst2|TxDev|TxAck~q\ & ( \inst2|TxDev|TxState.TxStart_State~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|TxDev|ALT_INV_TxState.TxStart_State~DUPLICATE_q\,
	datac => \inst2|TxDev|ALT_INV_TxState.Tx1Stop_State~q\,
	dataf => \inst2|TxDev|ALT_INV_TxAck~q\,
	combout => \inst2|TxDev|Selector1~0_combout\);

-- Location: LABCELL_X77_Y34_N48
\inst2|TxDev|TxAck~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxAck~feeder_combout\ = ( \inst2|TxDev|Selector1~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst2|TxDev|ALT_INV_Selector1~0_combout\,
	combout => \inst2|TxDev|TxAck~feeder_combout\);

-- Location: FF_X77_Y34_N49
\inst2|TxDev|TxAck\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxAck~feeder_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|TxDev|TxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxAck~q\);

-- Location: LABCELL_X83_Y34_N15
\inst2|TxDev|TxReq~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxReq~0_combout\ = ( \inst2|WriteTR~q\ & ( \inst2|TxDev|TxAck~q\ ) ) # ( \inst2|WriteTR~q\ & ( !\inst2|TxDev|TxAck~q\ ) ) # ( !\inst2|WriteTR~q\ & ( !\inst2|TxDev|TxAck~q\ & ( \inst2|TxDev|TxReq~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|TxDev|ALT_INV_TxReq~DUPLICATE_q\,
	datae => \inst2|ALT_INV_WriteTR~q\,
	dataf => \inst2|TxDev|ALT_INV_TxAck~q\,
	combout => \inst2|TxDev|TxReq~0_combout\);

-- Location: FF_X80_Y34_N52
\inst2|TxDev|TxReq~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|TxDev|TxReq~0_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxReq~DUPLICATE_q\);

-- Location: LABCELL_X83_Y34_N45
\inst2|TxDev|TxEmp~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxEmp~0_combout\ = ( \inst2|WriteTR~q\ & ( \inst2|TxDev|TxAck~q\ ) ) # ( !\inst2|WriteTR~q\ & ( \inst2|TxDev|TxAck~q\ & ( \inst2|TxDev|TxEmp~q\ ) ) ) # ( \inst2|WriteTR~q\ & ( !\inst2|TxDev|TxAck~q\ ) ) # ( !\inst2|WriteTR~q\ & ( 
-- !\inst2|TxDev|TxAck~q\ & ( (\inst2|TxDev|TxEmp~q\ & \inst2|TxDev|TxReq~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011111111111111111100110011001100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|TxDev|ALT_INV_TxEmp~q\,
	datac => \inst2|TxDev|ALT_INV_TxReq~DUPLICATE_q\,
	datae => \inst2|ALT_INV_WriteTR~q\,
	dataf => \inst2|TxDev|ALT_INV_TxAck~q\,
	combout => \inst2|TxDev|TxEmp~0_combout\);

-- Location: FF_X79_Y34_N17
\inst2|TxDev|TxEmp\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|TxDev|TxEmp~0_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxEmp~q\);

-- Location: LABCELL_X77_Y34_N27
\inst2|StatReg~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|StatReg~0_combout\ = ( \inst2|TxDev|TxEmp~q\ & ( (\inst2|CtrlReg\(7) & \inst2|RxDev|RxReady~q\) ) ) # ( !\inst2|TxDev|TxEmp~q\ & ( (!\inst2|CtrlReg\(6) & (((\inst2|CtrlReg\(7) & \inst2|RxDev|RxReady~q\)) # (\inst2|CtrlReg\(5)))) # 
-- (\inst2|CtrlReg\(6) & (\inst2|CtrlReg\(7) & ((\inst2|RxDev|RxReady~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000111011000010100011101100000000001100110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_CtrlReg\(6),
	datab => \inst2|ALT_INV_CtrlReg\(7),
	datac => \inst2|ALT_INV_CtrlReg\(5),
	datad => \inst2|RxDev|ALT_INV_RxReady~q\,
	dataf => \inst2|TxDev|ALT_INV_TxEmp~q\,
	combout => \inst2|StatReg~0_combout\);

-- Location: FF_X77_Y34_N29
\inst2|StatReg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|StatReg~0_combout\,
	clrn => \inst2|Reset~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|StatReg\(7));

-- Location: LABCELL_X81_Y34_N6
\inst2|InternalDataOut[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|InternalDataOut[7]~0_combout\ = ( \inst2|RxDev|RxDout\(7) & ( \inst2|StatReg\(7) ) ) # ( !\inst2|RxDev|RxDout\(7) & ( \inst2|StatReg\(7) & ( !\Address[1]~input_o\ ) ) ) # ( \inst2|RxDev|RxDout\(7) & ( !\inst2|StatReg\(7) & ( \Address[1]~input_o\ ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001111001100110011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Address[1]~input_o\,
	datae => \inst2|RxDev|ALT_INV_RxDout\(7),
	dataf => \inst2|ALT_INV_StatReg\(7),
	combout => \inst2|InternalDataOut[7]~0_combout\);

-- Location: MLABCELL_X82_Y34_N57
\inst2|ACIA_DataOut~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|ACIA_DataOut~0_combout\ = ( \WE_L~input_o\ & ( \inst|GPS_Port_Enable~0_combout\ & ( (\inst|GPS_Port_Enable~2_combout\ & (\inst|GPS_Port_Enable~1_combout\ & !\Address[2]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_GPS_Port_Enable~2_combout\,
	datab => \inst|ALT_INV_GPS_Port_Enable~1_combout\,
	datac => \ALT_INV_Address[2]~input_o\,
	datae => \ALT_INV_WE_L~input_o\,
	dataf => \inst|ALT_INV_GPS_Port_Enable~0_combout\,
	combout => \inst2|ACIA_DataOut~0_combout\);

-- Location: FF_X80_Y34_N35
\inst2|RxDev|RxPErr\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxPErr~0_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxPErr~q\);

-- Location: LABCELL_X79_Y34_N39
\inst2|RxDev|Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|Selector8~0_combout\ = ( \inst2|RxDev|RxState.RxParity_state~q\ & ( ((\inst2|RxDev|RxState.RxData_state~q\ & \inst2|RxDev|RxDatDel2~q\)) # (\inst2|RxDev|RxParity~q\) ) ) # ( !\inst2|RxDev|RxState.RxParity_state~q\ & ( 
-- (!\inst2|RxDev|RxParity~q\ & (\inst2|RxDev|RxState.RxData_state~q\ & (\inst2|RxDev|RxDatDel2~q\))) # (\inst2|RxDev|RxParity~q\ & (((\inst2|RxDev|RxState.RxData_state~q\ & !\inst2|RxDev|RxDatDel2~q\)) # (\inst2|RxDev|RxState.RxStop_state~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000101001111000100010100111100010001111111110001000111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|RxDev|ALT_INV_RxState.RxData_state~q\,
	datab => \inst2|RxDev|ALT_INV_RxDatDel2~q\,
	datac => \inst2|RxDev|ALT_INV_RxState.RxStop_state~q\,
	datad => \inst2|RxDev|ALT_INV_RxParity~q\,
	dataf => \inst2|RxDev|ALT_INV_RxState.RxParity_state~q\,
	combout => \inst2|RxDev|Selector8~0_combout\);

-- Location: FF_X79_Y34_N41
\inst2|RxDev|RxParity\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|Selector8~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxParity~q\);

-- Location: LABCELL_X79_Y34_N12
\inst2|RxDev|RxPErr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxPErr~0_combout\ = ( \inst2|RxDev|RxDatDel2~q\ & ( \inst2|CtrlReg\(2) & ( (!\inst2|RxDev|RxState.RxParity_state~q\ & (\inst2|RxDev|RxPErr~q\)) # (\inst2|RxDev|RxState.RxParity_state~q\ & ((!\inst2|RxDev|RxBdEdge~q\ & 
-- (\inst2|RxDev|RxPErr~q\)) # (\inst2|RxDev|RxBdEdge~q\ & ((!\inst2|RxDev|RxParity~q\))))) ) ) ) # ( !\inst2|RxDev|RxDatDel2~q\ & ( \inst2|CtrlReg\(2) & ( (!\inst2|RxDev|RxState.RxParity_state~q\ & (\inst2|RxDev|RxPErr~q\)) # 
-- (\inst2|RxDev|RxState.RxParity_state~q\ & ((!\inst2|RxDev|RxBdEdge~q\ & (\inst2|RxDev|RxPErr~q\)) # (\inst2|RxDev|RxBdEdge~q\ & ((\inst2|RxDev|RxParity~q\))))) ) ) ) # ( \inst2|RxDev|RxDatDel2~q\ & ( !\inst2|CtrlReg\(2) & ( 
-- (!\inst2|RxDev|RxState.RxParity_state~q\ & (\inst2|RxDev|RxPErr~q\)) # (\inst2|RxDev|RxState.RxParity_state~q\ & ((!\inst2|RxDev|RxBdEdge~q\ & (\inst2|RxDev|RxPErr~q\)) # (\inst2|RxDev|RxBdEdge~q\ & ((\inst2|RxDev|RxParity~q\))))) ) ) ) # ( 
-- !\inst2|RxDev|RxDatDel2~q\ & ( !\inst2|CtrlReg\(2) & ( (!\inst2|RxDev|RxState.RxParity_state~q\ & (\inst2|RxDev|RxPErr~q\)) # (\inst2|RxDev|RxState.RxParity_state~q\ & ((!\inst2|RxDev|RxBdEdge~q\ & (\inst2|RxDev|RxPErr~q\)) # (\inst2|RxDev|RxBdEdge~q\ & 
-- ((!\inst2|RxDev|RxParity~q\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101011100010101010101001101010101010100110101010101011100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|RxDev|ALT_INV_RxPErr~q\,
	datab => \inst2|RxDev|ALT_INV_RxParity~q\,
	datac => \inst2|RxDev|ALT_INV_RxState.RxParity_state~q\,
	datad => \inst2|RxDev|ALT_INV_RxBdEdge~q\,
	datae => \inst2|RxDev|ALT_INV_RxDatDel2~q\,
	dataf => \inst2|ALT_INV_CtrlReg\(2),
	combout => \inst2|RxDev|RxPErr~0_combout\);

-- Location: FF_X80_Y34_N34
\inst2|RxDev|RxPErr~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxPErr~0_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxPErr~DUPLICATE_q\);

-- Location: FF_X81_Y34_N10
\inst2|StatReg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxPErr~DUPLICATE_q\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|StatReg\(6));

-- Location: MLABCELL_X78_Y34_N30
\inst2|RxDev|RxShiftReg[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxShiftReg[6]~feeder_combout\ = \inst2|RxDev|RxShiftReg\(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|RxDev|ALT_INV_RxShiftReg\(7),
	combout => \inst2|RxDev|RxShiftReg[6]~feeder_combout\);

-- Location: FF_X78_Y34_N31
\inst2|RxDev|RxShiftReg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|RxShiftReg[6]~feeder_combout\,
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	ena => \inst2|RxDev|RxShiftReg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxShiftReg\(6));

-- Location: FF_X78_Y34_N43
\inst2|RxDev|RxDout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxShiftReg\(6),
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxDout[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDout\(6));

-- Location: LABCELL_X77_Y34_N24
\inst2|InternalDataOut[6]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|InternalDataOut[6]~1_combout\ = ( \Address[1]~input_o\ & ( \inst2|RxDev|RxDout\(6) ) ) # ( !\Address[1]~input_o\ & ( \inst2|StatReg\(6) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|ALT_INV_StatReg\(6),
	datad => \inst2|RxDev|ALT_INV_RxDout\(6),
	dataf => \ALT_INV_Address[1]~input_o\,
	combout => \inst2|InternalDataOut[6]~1_combout\);

-- Location: FF_X78_Y34_N8
\inst2|RxDev|RxOErr\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxReady~q\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxDout[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxOErr~q\);

-- Location: FF_X77_Y34_N7
\inst2|StatReg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxOErr~q\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|StatReg\(5));

-- Location: FF_X78_Y34_N41
\inst2|RxDev|RxShiftReg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxShiftReg\(6),
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxShiftReg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxShiftReg\(5));

-- Location: MLABCELL_X78_Y34_N12
\inst2|RxDev|RxDout[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxDout[5]~feeder_combout\ = \inst2|RxDev|RxShiftReg\(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|RxDev|ALT_INV_RxShiftReg\(5),
	combout => \inst2|RxDev|RxDout[5]~feeder_combout\);

-- Location: FF_X78_Y34_N13
\inst2|RxDev|RxDout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|RxDout[5]~feeder_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxDout[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDout\(5));

-- Location: LABCELL_X81_Y34_N3
\inst2|InternalDataOut[5]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|InternalDataOut[5]~2_combout\ = (!\Address[1]~input_o\ & (\inst2|StatReg\(5))) # (\Address[1]~input_o\ & ((\inst2|RxDev|RxDout\(5))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001011111010100000101111101010000010111110101000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_StatReg\(5),
	datac => \ALT_INV_Address[1]~input_o\,
	datad => \inst2|RxDev|ALT_INV_RxDout\(5),
	combout => \inst2|InternalDataOut[5]~2_combout\);

-- Location: FF_X78_Y34_N38
\inst2|RxDev|RxShiftReg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxShiftReg\(5),
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxShiftReg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxShiftReg\(4));

-- Location: MLABCELL_X78_Y34_N15
\inst2|RxDev|RxDout[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxDout[4]~feeder_combout\ = ( \inst2|RxDev|RxShiftReg\(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst2|RxDev|ALT_INV_RxShiftReg\(4),
	combout => \inst2|RxDev|RxDout[4]~feeder_combout\);

-- Location: FF_X78_Y34_N17
\inst2|RxDev|RxDout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|RxDout[4]~feeder_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxDout[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDout\(4));

-- Location: MLABCELL_X78_Y34_N9
\inst2|RxDev|RxFErr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxFErr~0_combout\ = !\inst2|RxDev|RxDatDel2~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|RxDev|ALT_INV_RxDatDel2~q\,
	combout => \inst2|RxDev|RxFErr~0_combout\);

-- Location: FF_X78_Y34_N10
\inst2|RxDev|RxFErr\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|RxFErr~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|RxDev|RxDout[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxFErr~q\);

-- Location: FF_X78_Y34_N59
\inst2|StatReg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxFErr~q\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|StatReg\(4));

-- Location: MLABCELL_X78_Y34_N57
\inst2|InternalDataOut[4]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|InternalDataOut[4]~3_combout\ = (!\Address[1]~input_o\ & ((\inst2|StatReg\(4)))) # (\Address[1]~input_o\ & (\inst2|RxDev|RxDout\(4)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110101111000001011010111100000101101011110000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Address[1]~input_o\,
	datac => \inst2|RxDev|ALT_INV_RxDout\(4),
	datad => \inst2|ALT_INV_StatReg\(4),
	combout => \inst2|InternalDataOut[4]~3_combout\);

-- Location: FF_X78_Y34_N20
\inst2|RxDev|RxShiftReg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxShiftReg\(4),
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxShiftReg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxShiftReg\(3));

-- Location: FF_X78_Y34_N47
\inst2|RxDev|RxDout[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxShiftReg\(3),
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxDout[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDout\(3));

-- Location: MLABCELL_X78_Y34_N45
\inst2|InternalDataOut[3]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|InternalDataOut[3]~4_combout\ = ( \inst2|RxDev|RxDout\(3) & ( \Address[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Address[1]~input_o\,
	datae => \inst2|RxDev|ALT_INV_RxDout\(3),
	combout => \inst2|InternalDataOut[3]~4_combout\);

-- Location: MLABCELL_X78_Y34_N21
\inst2|RxDev|RxShiftReg[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxShiftReg[2]~feeder_combout\ = \inst2|RxDev|RxShiftReg\(3)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|RxDev|ALT_INV_RxShiftReg\(3),
	combout => \inst2|RxDev|RxShiftReg[2]~feeder_combout\);

-- Location: FF_X78_Y34_N22
\inst2|RxDev|RxShiftReg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|RxShiftReg[2]~feeder_combout\,
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	ena => \inst2|RxDev|RxShiftReg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxShiftReg\(2));

-- Location: FF_X78_Y34_N50
\inst2|RxDev|RxDout[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxShiftReg\(2),
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxDout[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDout\(2));

-- Location: MLABCELL_X78_Y34_N48
\inst2|InternalDataOut[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|InternalDataOut[2]~5_combout\ = ( \inst2|RxDev|RxDout\(2) & ( \Address[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Address[1]~input_o\,
	datae => \inst2|RxDev|ALT_INV_RxDout\(2),
	combout => \inst2|InternalDataOut[2]~5_combout\);

-- Location: MLABCELL_X78_Y34_N6
\inst2|StatReg[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|StatReg[1]~1_combout\ = !\inst2|TxDev|TxEmp~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|TxDev|ALT_INV_TxEmp~q\,
	combout => \inst2|StatReg[1]~1_combout\);

-- Location: FF_X77_Y34_N10
\inst2|StatReg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|StatReg[1]~1_combout\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|StatReg\(1));

-- Location: FF_X78_Y34_N35
\inst2|RxDev|RxShiftReg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxShiftReg\(2),
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxShiftReg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxShiftReg\(1));

-- Location: FF_X78_Y34_N26
\inst2|RxDev|RxDout[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxShiftReg\(1),
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxDout[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDout\(1));

-- Location: MLABCELL_X78_Y34_N24
\inst2|InternalDataOut[1]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|InternalDataOut[1]~6_combout\ = ( \inst2|RxDev|RxDout\(1) & ( (\Address[1]~input_o\) # (\inst2|StatReg\(1)) ) ) # ( !\inst2|RxDev|RxDout\(1) & ( (\inst2|StatReg\(1) & !\Address[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010111110101111101010000010100000101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_StatReg\(1),
	datac => \ALT_INV_Address[1]~input_o\,
	datae => \inst2|RxDev|ALT_INV_RxDout\(1),
	combout => \inst2|InternalDataOut[1]~6_combout\);

-- Location: MLABCELL_X78_Y34_N3
\inst2|RxDev|RxShiftReg[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|RxDev|RxShiftReg[0]~feeder_combout\ = \inst2|RxDev|RxShiftReg\(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|RxDev|ALT_INV_RxShiftReg\(1),
	combout => \inst2|RxDev|RxShiftReg[0]~feeder_combout\);

-- Location: FF_X78_Y34_N5
\inst2|RxDev|RxShiftReg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|RxDev|RxShiftReg[0]~feeder_combout\,
	clrn => \inst2|Reset~q\,
	sclr => \inst2|RxDev|ALT_INV_RxState.RxStart_State~q\,
	ena => \inst2|RxDev|RxShiftReg[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxShiftReg\(0));

-- Location: FF_X78_Y34_N29
\inst2|RxDev|RxDout[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxShiftReg\(0),
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|RxDev|RxDout[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|RxDev|RxDout\(0));

-- Location: FF_X78_Y34_N56
\inst2|StatReg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \inst2|RxDev|RxReady~q\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|StatReg\(0));

-- Location: MLABCELL_X78_Y34_N54
\inst2|InternalDataOut[0]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|InternalDataOut[0]~7_combout\ = (!\Address[1]~input_o\ & ((\inst2|StatReg\(0)))) # (\Address[1]~input_o\ & (\inst2|RxDev|RxDout\(0)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110101111000001011010111100000101101011110000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Address[1]~input_o\,
	datac => \inst2|RxDev|ALT_INV_RxDout\(0),
	datad => \inst2|ALT_INV_StatReg\(0),
	combout => \inst2|InternalDataOut[0]~7_combout\);

-- Location: FF_X81_Y34_N41
\inst2|TranReg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[7]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|WriteTR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TranReg\(7));

-- Location: LABCELL_X81_Y34_N33
\inst2|TxDev|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Selector7~0_combout\ = ( \inst2|TxDev|TxShiftReg\(7) & ( \inst2|TxDev|TxState.TxStart_State~q\ & ( \inst2|TranReg\(7) ) ) ) # ( !\inst2|TxDev|TxShiftReg\(7) & ( \inst2|TxDev|TxState.TxStart_State~q\ & ( \inst2|TranReg\(7) ) ) ) # ( 
-- \inst2|TxDev|TxShiftReg\(7) & ( !\inst2|TxDev|TxState.TxStart_State~q\ ) ) # ( !\inst2|TxDev|TxShiftReg\(7) & ( !\inst2|TxDev|TxState.TxStart_State~q\ & ( \inst2|TxDev|TxState.TxData_State~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111111111111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	datac => \inst2|ALT_INV_TranReg\(7),
	datae => \inst2|TxDev|ALT_INV_TxShiftReg\(7),
	dataf => \inst2|TxDev|ALT_INV_TxState.TxStart_State~q\,
	combout => \inst2|TxDev|Selector7~0_combout\);

-- Location: FF_X81_Y34_N34
\inst2|TxDev|TxShiftReg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Selector7~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|TxDev|TxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxShiftReg\(7));

-- Location: LABCELL_X83_Y34_N57
\inst2|TxDev|TxShiftReg[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxShiftReg[6]~feeder_combout\ = ( \inst2|TxDev|TxShiftReg\(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst2|TxDev|ALT_INV_TxShiftReg\(7),
	combout => \inst2|TxDev|TxShiftReg[6]~feeder_combout\);

-- Location: FF_X81_Y34_N1
\inst2|TranReg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[6]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|WriteTR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TranReg\(6));

-- Location: FF_X83_Y34_N59
\inst2|TxDev|TxShiftReg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxShiftReg[6]~feeder_combout\,
	asdata => \inst2|TranReg\(6),
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxShiftReg\(6));

-- Location: MLABCELL_X82_Y34_N0
\inst2|TxDev|TxShiftReg[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxShiftReg[5]~feeder_combout\ = \inst2|TxDev|TxShiftReg\(6)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|TxDev|ALT_INV_TxShiftReg\(6),
	combout => \inst2|TxDev|TxShiftReg[5]~feeder_combout\);

-- Location: FF_X81_Y34_N25
\inst2|TranReg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[5]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|WriteTR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TranReg\(5));

-- Location: FF_X82_Y34_N2
\inst2|TxDev|TxShiftReg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxShiftReg[5]~feeder_combout\,
	asdata => \inst2|TranReg\(5),
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxShiftReg\(5));

-- Location: MLABCELL_X82_Y34_N6
\inst2|TxDev|TxShiftReg[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxShiftReg[4]~feeder_combout\ = \inst2|TxDev|TxShiftReg\(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|TxDev|ALT_INV_TxShiftReg\(5),
	combout => \inst2|TxDev|TxShiftReg[4]~feeder_combout\);

-- Location: LABCELL_X81_Y34_N15
\inst2|TranReg[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TranReg[4]~feeder_combout\ = ( \DataIn[4]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_DataIn[4]~input_o\,
	combout => \inst2|TranReg[4]~feeder_combout\);

-- Location: FF_X81_Y34_N16
\inst2|TranReg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TranReg[4]~feeder_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|WriteTR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TranReg\(4));

-- Location: FF_X82_Y34_N8
\inst2|TxDev|TxShiftReg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxShiftReg[4]~feeder_combout\,
	asdata => \inst2|TranReg\(4),
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxShiftReg\(4));

-- Location: MLABCELL_X82_Y34_N9
\inst2|TxDev|TxShiftReg[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxShiftReg[3]~feeder_combout\ = \inst2|TxDev|TxShiftReg\(4)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst2|TxDev|ALT_INV_TxShiftReg\(4),
	combout => \inst2|TxDev|TxShiftReg[3]~feeder_combout\);

-- Location: FF_X81_Y34_N13
\inst2|TranReg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[3]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|WriteTR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TranReg\(3));

-- Location: FF_X82_Y34_N11
\inst2|TxDev|TxShiftReg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxShiftReg[3]~feeder_combout\,
	asdata => \inst2|TranReg\(3),
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxShiftReg\(3));

-- Location: MLABCELL_X82_Y34_N36
\inst2|TxDev|TxShiftReg[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxShiftReg[2]~feeder_combout\ = \inst2|TxDev|TxShiftReg\(3)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst2|TxDev|ALT_INV_TxShiftReg\(3),
	combout => \inst2|TxDev|TxShiftReg[2]~feeder_combout\);

-- Location: FF_X81_Y34_N55
\inst2|TranReg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[2]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|WriteTR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TranReg\(2));

-- Location: FF_X82_Y34_N38
\inst2|TxDev|TxShiftReg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxShiftReg[2]~feeder_combout\,
	asdata => \inst2|TranReg\(2),
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxShiftReg\(2));

-- Location: MLABCELL_X82_Y34_N33
\inst2|TxDev|TxShiftReg[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxShiftReg[1]~feeder_combout\ = \inst2|TxDev|TxShiftReg\(2)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxShiftReg\(2),
	combout => \inst2|TxDev|TxShiftReg[1]~feeder_combout\);

-- Location: LABCELL_X81_Y34_N27
\inst2|TranReg[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TranReg[1]~feeder_combout\ = ( \DataIn[1]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_DataIn[1]~input_o\,
	combout => \inst2|TranReg[1]~feeder_combout\);

-- Location: FF_X81_Y34_N28
\inst2|TranReg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TranReg[1]~feeder_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|WriteTR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TranReg\(1));

-- Location: FF_X82_Y34_N35
\inst2|TxDev|TxShiftReg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxShiftReg[1]~feeder_combout\,
	asdata => \inst2|TranReg\(1),
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxShiftReg\(1));

-- Location: MLABCELL_X82_Y34_N15
\inst2|TxDev|TxShiftReg[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxShiftReg[0]~feeder_combout\ = \inst2|TxDev|TxShiftReg\(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxShiftReg\(1),
	combout => \inst2|TxDev|TxShiftReg[0]~feeder_combout\);

-- Location: FF_X81_Y34_N52
\inst2|TranReg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	asdata => \DataIn[0]~input_o\,
	clrn => \inst2|Reset~q\,
	sload => VCC,
	ena => \inst2|WriteTR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TranReg\(0));

-- Location: FF_X82_Y34_N17
\inst2|TxDev|TxShiftReg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxShiftReg[0]~feeder_combout\,
	asdata => \inst2|TranReg\(0),
	clrn => \inst2|Reset~q\,
	sload => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	ena => \inst2|TxDev|TxBitCount[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxShiftReg\(0));

-- Location: LABCELL_X83_Y34_N48
\inst2|TxDev|Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Selector15~0_combout\ = ( \inst2|TxDev|TxShiftReg\(0) & ( (!\inst2|TxDev|TxState.TxData_State~q\ & (!\inst2|TxDev|TxState.TxStart_State~q\ & \inst2|TxDev|TxParity~q\)) # (\inst2|TxDev|TxState.TxData_State~q\ & ((!\inst2|TxDev|TxParity~q\))) ) 
-- ) # ( !\inst2|TxDev|TxShiftReg\(0) & ( (\inst2|TxDev|TxParity~q\ & ((!\inst2|TxDev|TxState.TxStart_State~q\) # (\inst2|TxDev|TxState.TxData_State~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101111000000001010111100001111101000000000111110100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxState.TxStart_State~q\,
	datac => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	datad => \inst2|TxDev|ALT_INV_TxParity~q\,
	dataf => \inst2|TxDev|ALT_INV_TxShiftReg\(0),
	combout => \inst2|TxDev|Selector15~0_combout\);

-- Location: FF_X83_Y34_N50
\inst2|TxDev|TxParity\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|Selector15~0_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|TxDev|TxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxParity~q\);

-- Location: LABCELL_X79_Y34_N27
\inst2|TxDev|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Selector0~0_combout\ = ( \inst2|TxDev|TxState.TxParity_State~q\ & ( !\inst2|TxDev|TxParity~q\ $ (\inst2|CtrlReg\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010010101011010101001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxParity~q\,
	datad => \inst2|ALT_INV_CtrlReg\(2),
	dataf => \inst2|TxDev|ALT_INV_TxState.TxParity_State~q\,
	combout => \inst2|TxDev|Selector0~0_combout\);

-- Location: LABCELL_X80_Y34_N45
\inst2|TxDev|Selector0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|Selector0~1_combout\ = ( \inst2|TxDev|TxState.TxData_State~q\ & ( (!\inst2|TxDev|TxState.Tx2Stop_State~q\ & (\inst2|TxDev|TxState.Tx1Stop_State~q\ & (!\inst2|TxDev|TxShiftReg\(0) & !\inst2|TxDev|Selector0~0_combout\))) ) ) # ( 
-- !\inst2|TxDev|TxState.TxData_State~q\ & ( (!\inst2|TxDev|TxState.Tx2Stop_State~q\ & (\inst2|TxDev|TxState.Tx1Stop_State~q\ & !\inst2|TxDev|Selector0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000000000001000100000000000100000000000000010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|TxDev|ALT_INV_TxState.Tx2Stop_State~q\,
	datab => \inst2|TxDev|ALT_INV_TxState.Tx1Stop_State~q\,
	datac => \inst2|TxDev|ALT_INV_TxShiftReg\(0),
	datad => \inst2|TxDev|ALT_INV_Selector0~0_combout\,
	dataf => \inst2|TxDev|ALT_INV_TxState.TxData_State~q\,
	combout => \inst2|TxDev|Selector0~1_combout\);

-- Location: LABCELL_X75_Y34_N27
\inst2|TxDev|TxDat~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|TxDev|TxDat~feeder_combout\ = ( \inst2|TxDev|Selector0~1_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst2|TxDev|ALT_INV_Selector0~1_combout\,
	combout => \inst2|TxDev|TxDat~feeder_combout\);

-- Location: FF_X75_Y34_N28
\inst2|TxDev|TxDat\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clock_50Mhz~inputCLKENA0_outclk\,
	d => \inst2|TxDev|TxDat~feeder_combout\,
	clrn => \inst2|Reset~q\,
	ena => \inst2|TxDev|TxBdEdge~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|TxDev|TxDat~q\);

-- Location: LABCELL_X77_Y34_N30
\inst2|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|Mux1~0_combout\ = ( \inst2|CtrlReg\(5) & ( (\inst2|TxDev|TxDat~q\) # (\inst2|CtrlReg\(6)) ) ) # ( !\inst2|CtrlReg\(5) & ( \inst2|TxDev|TxDat~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111010111110101111100001111000011110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_CtrlReg\(6),
	datac => \inst2|TxDev|ALT_INV_TxDat~q\,
	datae => \inst2|ALT_INV_CtrlReg\(5),
	combout => \inst2|Mux1~0_combout\);

-- Location: IOIBUF_X80_Y0_N52
\RS232_RxData~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RS232_RxData,
	o => \RS232_RxData~input_o\);

-- Location: IOIBUF_X26_Y81_N75
\BlueTooth_RxData~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BlueTooth_RxData,
	o => \BlueTooth_RxData~input_o\);

-- Location: IOIBUF_X80_Y0_N1
\TouchScreen_RxData~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TouchScreen_RxData,
	o => \TouchScreen_RxData~input_o\);

-- Location: LABCELL_X18_Y54_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


