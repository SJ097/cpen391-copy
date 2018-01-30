
module hal_timer (
	clk_clk,
	reset_reset_n,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	hal_timer_address,
	hal_timer_writedata,
	hal_timer_readdata,
	hal_timer_chipselect,
	hal_timer_write_n);	

	input		clk_clk;
	input		reset_reset_n;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input	[2:0]	hal_timer_address;
	input	[15:0]	hal_timer_writedata;
	output	[15:0]	hal_timer_readdata;
	input		hal_timer_chipselect;
	input		hal_timer_write_n;
endmodule
