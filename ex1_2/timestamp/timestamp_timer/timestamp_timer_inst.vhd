	component timestamp_timer is
		port (
			clk_clk                    : in    std_logic                     := 'X';             -- clk
			timestamp_timer_address    : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			timestamp_timer_writedata  : in    std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			timestamp_timer_readdata   : out   std_logic_vector(15 downto 0);                    -- readdata
			timestamp_timer_chipselect : in    std_logic                     := 'X';             -- chipselect
			timestamp_timer_write_n    : in    std_logic                     := 'X';             -- write_n
			reset_reset_n              : in    std_logic                     := 'X';             -- reset_n
			sdram_wire_addr            : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba              : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n           : out   std_logic;                                        -- cas_n
			sdram_wire_cke             : out   std_logic;                                        -- cke
			sdram_wire_cs_n            : out   std_logic;                                        -- cs_n
			sdram_wire_dq              : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm             : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n           : out   std_logic;                                        -- ras_n
			sdram_wire_we_n            : out   std_logic                                         -- we_n
		);
	end component timestamp_timer;

	u0 : component timestamp_timer
		port map (
			clk_clk                    => CONNECTED_TO_clk_clk,                    --             clk.clk
			timestamp_timer_address    => CONNECTED_TO_timestamp_timer_address,    -- timestamp_timer.address
			timestamp_timer_writedata  => CONNECTED_TO_timestamp_timer_writedata,  --                .writedata
			timestamp_timer_readdata   => CONNECTED_TO_timestamp_timer_readdata,   --                .readdata
			timestamp_timer_chipselect => CONNECTED_TO_timestamp_timer_chipselect, --                .chipselect
			timestamp_timer_write_n    => CONNECTED_TO_timestamp_timer_write_n,    --                .write_n
			reset_reset_n              => CONNECTED_TO_reset_reset_n,              --           reset.reset_n
			sdram_wire_addr            => CONNECTED_TO_sdram_wire_addr,            --      sdram_wire.addr
			sdram_wire_ba              => CONNECTED_TO_sdram_wire_ba,              --                .ba
			sdram_wire_cas_n           => CONNECTED_TO_sdram_wire_cas_n,           --                .cas_n
			sdram_wire_cke             => CONNECTED_TO_sdram_wire_cke,             --                .cke
			sdram_wire_cs_n            => CONNECTED_TO_sdram_wire_cs_n,            --                .cs_n
			sdram_wire_dq              => CONNECTED_TO_sdram_wire_dq,              --                .dq
			sdram_wire_dqm             => CONNECTED_TO_sdram_wire_dqm,             --                .dqm
			sdram_wire_ras_n           => CONNECTED_TO_sdram_wire_ras_n,           --                .ras_n
			sdram_wire_we_n            => CONNECTED_TO_sdram_wire_we_n             --                .we_n
		);

