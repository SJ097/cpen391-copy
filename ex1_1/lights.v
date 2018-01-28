module lights(
	input CLOCK_50,
	input [3:0] KEY,
	output [6:0] HEX0,
	inout [15:0] DRAM_DQ,
	output [12:0] DRAM_ADDR,
	output [1:0] DRAM_BA,
	output DRAM_CAS_N, DRAM_RAS_N, DRAM_CLK,
	output DRAM_CKE, DRAM_CS_N, DRAM_WE_N,
	output DRAM_UDQM, DRAM_LDQM
);

	nios_system NiosII(
		.clk_clk(CLOCK_50),
		.reset_reset(),			//leave this empty. Don't want reset on sdram
		.sdram_clk_clk(DRAM_CLK),
		.key_export(KEY),
		.hex0_export(HEX0),
		.sdram_wire_addr(DRAM_ADDR),
		.sdram_wire_ba(DRAM_BA),
		.sdram_wire_cas_n(DRAM_CAS_N),
		.sdram_wire_cke(DRAM_CKE),
		.sdram_wire_cs_n(DRAM_CS_N),
		.sdram_wire_dq(DRAM_DQ),
		.sdram_wire_dqm({DRAM_UDQM, DRAM_LDQM}),
		.sdram_wire_ras_n(DRAM_RAS_N),
		.sdram_wire_we_n(DRAM_WE_N)
	);
endmodule