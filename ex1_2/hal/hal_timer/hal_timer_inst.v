	hal_timer u0 (
		.clk_clk              (<connected-to-clk_clk>),              //        clk.clk
		.reset_reset_n        (<connected-to-reset_reset_n>),        //      reset.reset_n
		.sdram_wire_addr      (<connected-to-sdram_wire_addr>),      // sdram_wire.addr
		.sdram_wire_ba        (<connected-to-sdram_wire_ba>),        //           .ba
		.sdram_wire_cas_n     (<connected-to-sdram_wire_cas_n>),     //           .cas_n
		.sdram_wire_cke       (<connected-to-sdram_wire_cke>),       //           .cke
		.sdram_wire_cs_n      (<connected-to-sdram_wire_cs_n>),      //           .cs_n
		.sdram_wire_dq        (<connected-to-sdram_wire_dq>),        //           .dq
		.sdram_wire_dqm       (<connected-to-sdram_wire_dqm>),       //           .dqm
		.sdram_wire_ras_n     (<connected-to-sdram_wire_ras_n>),     //           .ras_n
		.sdram_wire_we_n      (<connected-to-sdram_wire_we_n>),      //           .we_n
		.hal_timer_address    (<connected-to-hal_timer_address>),    //  hal_timer.address
		.hal_timer_writedata  (<connected-to-hal_timer_writedata>),  //           .writedata
		.hal_timer_readdata   (<connected-to-hal_timer_readdata>),   //           .readdata
		.hal_timer_chipselect (<connected-to-hal_timer_chipselect>), //           .chipselect
		.hal_timer_write_n    (<connected-to-hal_timer_write_n>)     //           .write_n
	);

