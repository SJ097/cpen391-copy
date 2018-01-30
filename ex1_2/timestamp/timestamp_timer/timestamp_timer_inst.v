	timestamp_timer u0 (
		.clk_clk                    (<connected-to-clk_clk>),                    //             clk.clk
		.timestamp_timer_address    (<connected-to-timestamp_timer_address>),    // timestamp_timer.address
		.timestamp_timer_writedata  (<connected-to-timestamp_timer_writedata>),  //                .writedata
		.timestamp_timer_readdata   (<connected-to-timestamp_timer_readdata>),   //                .readdata
		.timestamp_timer_chipselect (<connected-to-timestamp_timer_chipselect>), //                .chipselect
		.timestamp_timer_write_n    (<connected-to-timestamp_timer_write_n>),    //                .write_n
		.reset_reset_n              (<connected-to-reset_reset_n>),              //           reset.reset_n
		.sdram_wire_addr            (<connected-to-sdram_wire_addr>),            //      sdram_wire.addr
		.sdram_wire_ba              (<connected-to-sdram_wire_ba>),              //                .ba
		.sdram_wire_cas_n           (<connected-to-sdram_wire_cas_n>),           //                .cas_n
		.sdram_wire_cke             (<connected-to-sdram_wire_cke>),             //                .cke
		.sdram_wire_cs_n            (<connected-to-sdram_wire_cs_n>),            //                .cs_n
		.sdram_wire_dq              (<connected-to-sdram_wire_dq>),              //                .dq
		.sdram_wire_dqm             (<connected-to-sdram_wire_dqm>),             //                .dqm
		.sdram_wire_ras_n           (<connected-to-sdram_wire_ras_n>),           //                .ras_n
		.sdram_wire_we_n            (<connected-to-sdram_wire_we_n>)             //                .we_n
	);

