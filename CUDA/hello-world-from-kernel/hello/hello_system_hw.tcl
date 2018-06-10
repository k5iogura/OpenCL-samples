package require -exact qsys 14.0
set_module_property NAME hello_system
set_module_property VERSION 14.0
set_module_property INTERNAL false
set_module_property GROUP Accelerators
set_module_property DISPLAY_NAME hello_system
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true

add_interface clock_reset clock end
set_interface_property clock_reset ENABLED true
add_interface_port clock_reset clock clk Input 1
add_interface_port clock_reset resetn reset_n Input 1
add_interface clock_reset2x clock end
set_interface_property clock_reset2x ENABLED true
add_interface_port clock_reset2x clock2x clk Input 1

#### Slave interface avs_hello_cra
add_interface avs_hello_cra avalon end
set_interface_property avs_hello_cra ENABLED true
set_interface_property avs_hello_cra associatedClock clock_reset
set_interface_property avs_hello_cra addressAlignment DYNAMIC
set_interface_property avs_hello_cra burstOnBurstBoundariesOnly false
set_interface_property avs_hello_cra explicitAddressSpan 0
set_interface_property avs_hello_cra holdTime 0
set_interface_property avs_hello_cra isMemoryDevice false
set_interface_property avs_hello_cra isNonVolatileStorage false
set_interface_property avs_hello_cra linewrapBursts false
set_interface_property avs_hello_cra maximumPendingReadTransactions 1
set_interface_property avs_hello_cra printableDevice false
set_interface_property avs_hello_cra readLatency 0
set_interface_property avs_hello_cra readWaitTime 0
set_interface_property avs_hello_cra setupTime 0
set_interface_property avs_hello_cra timingUnits Cycles
set_interface_property avs_hello_cra writeWaitTime 0
set_interface_assignment avs_hello_cra hls.cosim.name {}
add_interface_port avs_hello_cra avs_hello_cra_read read input 1
add_interface_port avs_hello_cra avs_hello_cra_write write input 1
add_interface_port avs_hello_cra avs_hello_cra_address address input 4
add_interface_port avs_hello_cra avs_hello_cra_writedata writedata input 64
add_interface_port avs_hello_cra avs_hello_cra_byteenable byteenable input 8
add_interface_port avs_hello_cra avs_hello_cra_readdata readdata output 64
add_interface_port avs_hello_cra avs_hello_cra_readdatavalid readdatavalid output 1

#### IRQ interfaces kernel_irq
add_interface kernel_irq interrupt end
set_interface_property kernel_irq ENABLED true
set_interface_property kernel_irq associatedClock clock_reset
add_interface_port kernel_irq kernel_irq irq output 1

#### Master interface avm_mem_gmem0_port_0_0_rw with base address 0
add_interface avm_mem_gmem0_port_0_0_rw avalon start
set_interface_property avm_mem_gmem0_port_0_0_rw ENABLED true
set_interface_property avm_mem_gmem0_port_0_0_rw associatedClock clock_reset
set_interface_property avm_mem_gmem0_port_0_0_rw burstOnBurstBoundariesOnly false
set_interface_property avm_mem_gmem0_port_0_0_rw doStreamReads false
set_interface_property avm_mem_gmem0_port_0_0_rw doStreamWrites false
set_interface_property avm_mem_gmem0_port_0_0_rw linewrapBursts false
set_interface_property avm_mem_gmem0_port_0_0_rw readWaitTime 0
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_address address output 30
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_byteenable byteenable output 32
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_readdatavalid readdatavalid input 1
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_read read output 1
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_readdata readdata input 256
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_write write output 1
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_writedata writedata output 256
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_waitrequest waitrequest input 1
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_burstcount burstcount output 5

add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL hello_system
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file acl_shift_register.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_shift_register.v TOP_LEVEL_FILE
add_fileset_file acl_work_group_dispatcher.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_work_group_dispatcher.v TOP_LEVEL_FILE
add_fileset_file acl_kernel_finish_detector.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_kernel_finish_detector.v TOP_LEVEL_FILE
add_fileset_file acl_multistage_accumulator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_multistage_accumulator.v TOP_LEVEL_FILE
add_fileset_file acl_reset_handler.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_reset_handler.sv TOP_LEVEL_FILE
add_fileset_file acl_std_synchronizer_nocut.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_std_synchronizer_nocut.v TOP_LEVEL_FILE
add_fileset_file acl_fanout_pipeline.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fanout_pipeline.sv TOP_LEVEL_FILE
add_fileset_file acl_id_iterator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_id_iterator.v TOP_LEVEL_FILE
add_fileset_file acl_work_item_iterator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_work_item_iterator.v TOP_LEVEL_FILE
add_fileset_file acl_multistage_adder.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_multistage_adder.v TOP_LEVEL_FILE
add_fileset_file acl_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_fifo_stall_valid_lookahead.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fifo_stall_valid_lookahead.sv TOP_LEVEL_FILE
add_fileset_file hello_system.v SYSTEM_VERILOG PATH hello_system.v TOP_LEVEL_FILE
add_fileset_file dspba_library_package.vhd VHDL PATH $::env(INTELFPGAOCLSDKROOT)/linux64/lib/dspba/Libraries/vhdl/base/dspba_library_package.vhd TOP_LEVEL_FILE
add_fileset_file dspba_library.vhd VHDL PATH $::env(INTELFPGAOCLSDKROOT)/linux64/lib/dspba/Libraries/vhdl/base/dspba_library.vhd TOP_LEVEL_FILE
add_fileset_file acl_data_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_data_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_ll_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ll_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_ll_ram_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ll_ram_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_valid_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_valid_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_dspba_valid_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_dspba_valid_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_staging_reg.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_staging_reg.v TOP_LEVEL_FILE
add_fileset_file hld_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/hld_fifo.sv TOP_LEVEL_FILE
add_fileset_file hld_fifo_zero_width.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/hld_fifo_zero_width.sv TOP_LEVEL_FILE
add_fileset_file acl_high_speed_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_high_speed_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_low_latency_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_low_latency_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_zero_latency_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_zero_latency_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_tessellated_incr_decr_threshold.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_tessellated_incr_decr_threshold.sv TOP_LEVEL_FILE
add_fileset_file acl_tessellated_incr_lookahead.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_tessellated_incr_lookahead.sv TOP_LEVEL_FILE
add_fileset_file acl_lfsr.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_lfsr.sv TOP_LEVEL_FILE
add_fileset_file acl_pop.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_pop.v TOP_LEVEL_FILE
add_fileset_file acl_dspba_buffer.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_dspba_buffer.v TOP_LEVEL_FILE
add_fileset_file lsu_top.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_top.v TOP_LEVEL_FILE
add_fileset_file lsu_permute_address.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_permute_address.v TOP_LEVEL_FILE
add_fileset_file lsu_pipelined.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_pipelined.v TOP_LEVEL_FILE
add_fileset_file lsu_enabled.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_enabled.v TOP_LEVEL_FILE
add_fileset_file lsu_basic_coalescer.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_basic_coalescer.v TOP_LEVEL_FILE
add_fileset_file lsu_simple.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_simple.v TOP_LEVEL_FILE
add_fileset_file lsu_streaming.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_streaming.v TOP_LEVEL_FILE
add_fileset_file lsu_burst_master.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_master.v TOP_LEVEL_FILE
add_fileset_file lsu_bursting_load_stores.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_bursting_load_stores.v TOP_LEVEL_FILE
add_fileset_file lsu_non_aligned_write.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_non_aligned_write.v TOP_LEVEL_FILE
add_fileset_file lsu_read_cache.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_read_cache.v TOP_LEVEL_FILE
add_fileset_file lsu_atomic.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_atomic.v TOP_LEVEL_FILE
add_fileset_file lsu_prefetch_block.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_prefetch_block.v TOP_LEVEL_FILE
add_fileset_file lsu_wide_wrapper.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_wide_wrapper.v TOP_LEVEL_FILE
add_fileset_file lsu_streaming_prefetch.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_streaming_prefetch.v TOP_LEVEL_FILE
add_fileset_file acl_aligned_burst_coalesced_lsu.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_aligned_burst_coalesced_lsu.v TOP_LEVEL_FILE
add_fileset_file acl_toggle_detect.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_toggle_detect.v TOP_LEVEL_FILE
add_fileset_file acl_debug_mem.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_debug_mem.v TOP_LEVEL_FILE
add_fileset_file lsu_burst_coalesced_pipelined_write.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_coalesced_pipelined_write.sv TOP_LEVEL_FILE
add_fileset_file lsu_burst_coalesced_pipelined_read.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_coalesced_pipelined_read.sv TOP_LEVEL_FILE
add_fileset_file acl_push.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_push.v TOP_LEVEL_FILE
add_fileset_file acl_token_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_token_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_clock2x_holder.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_clock2x_holder.v TOP_LEVEL_FILE
add_fileset_file hello_function_wrapper.vhd VHDL PATH kernel_hdl/hello/hello_function_wrapper.vhd TOP_LEVEL_FILE
add_fileset_file hello_function.vhd VHDL PATH kernel_hdl/hello/hello_function.vhd TOP_LEVEL_FILE
add_fileset_file bb_hello_B0.vhd VHDL PATH kernel_hdl/hello/bb_hello_B0.vhd TOP_LEVEL_FILE
add_fileset_file bb_hello_B0_stall_region.vhd VHDL PATH kernel_hdl/hello/bb_hello_B0_stall_region.vhd TOP_LEVEL_FILE
add_fileset_file i_store_memdep_hello4.vhd VHDL PATH kernel_hdl/hello/i_store_memdep_hello4.vhd TOP_LEVEL_FILE
add_fileset_file hello_B0_merge_reg.vhd VHDL PATH kernel_hdl/hello/hello_B0_merge_reg.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_pop_i1_throttle_pop_hello0.vhd VHDL PATH kernel_hdl/hello/i_acl_pop_i1_throttle_pop_hello0.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_pop_i1_throttle_pop_hello_reg.vhd VHDL PATH kernel_hdl/hello/i_acl_pop_i1_throttle_pop_hello_reg.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_push_i1_throttle_push_hello6.vhd VHDL PATH kernel_hdl/hello/i_acl_push_i1_throttle_push_hello6.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_push_i1_throttle_push_hello_reg.vhd VHDL PATH kernel_hdl/hello/i_acl_push_i1_throttle_push_hello_reg.vhd TOP_LEVEL_FILE
add_fileset_file i_syncbuf_string_sync_buffer_hello2.vhd VHDL PATH kernel_hdl/hello/i_syncbuf_string_sync_buffer_hello2.vhd TOP_LEVEL_FILE
add_fileset_file hello_B0_branch.vhd VHDL PATH kernel_hdl/hello/hello_B0_branch.vhd TOP_LEVEL_FILE
add_fileset_file hello_B0_merge.vhd VHDL PATH kernel_hdl/hello/hello_B0_merge.vhd TOP_LEVEL_FILE
add_fileset_file hello_function_cra_slave.vhd VHDL PATH kernel_hdl/hello/hello_function_cra_slave.vhd TOP_LEVEL_FILE
add_fileset_file acl_start_signal_chain_element.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_start_signal_chain_element.v TOP_LEVEL_FILE
add_fileset_file acl_avm_to_ic.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_avm_to_ic.v TOP_LEVEL_FILE
add_fileset_file acl_ic_master_endpoint.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_master_endpoint.v TOP_LEVEL_FILE
add_fileset_file acl_arb_intf.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_arb_intf.v TOP_LEVEL_FILE
add_fileset_file acl_ic_intf.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_intf.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_endpoint.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_endpoint.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_rrp.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_rrp.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_wrp.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_wrp.v TOP_LEVEL_FILE
add_fileset_file acl_ic_mem_router.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_mem_router.v TOP_LEVEL_FILE
add_fileset_file acl_ic_to_avm.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_to_avm.v TOP_LEVEL_FILE


add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL hello_system
add_fileset_file acl_shift_register.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_shift_register.v TOP_LEVEL_FILE
add_fileset_file acl_work_group_dispatcher.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_work_group_dispatcher.v TOP_LEVEL_FILE
add_fileset_file acl_kernel_finish_detector.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_kernel_finish_detector.v TOP_LEVEL_FILE
add_fileset_file acl_multistage_accumulator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_multistage_accumulator.v TOP_LEVEL_FILE
add_fileset_file acl_reset_handler.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_reset_handler.sv TOP_LEVEL_FILE
add_fileset_file acl_std_synchronizer_nocut.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_std_synchronizer_nocut.v TOP_LEVEL_FILE
add_fileset_file acl_fanout_pipeline.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fanout_pipeline.sv TOP_LEVEL_FILE
add_fileset_file acl_id_iterator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_id_iterator.v TOP_LEVEL_FILE
add_fileset_file acl_work_item_iterator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_work_item_iterator.v TOP_LEVEL_FILE
add_fileset_file acl_multistage_adder.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_multistage_adder.v TOP_LEVEL_FILE
add_fileset_file acl_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_fifo_stall_valid_lookahead.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fifo_stall_valid_lookahead.sv TOP_LEVEL_FILE
add_fileset_file hello_system.v SYSTEM_VERILOG PATH hello_system.v TOP_LEVEL_FILE
add_fileset_file dspba_library_package.vhd VHDL PATH $::env(INTELFPGAOCLSDKROOT)/linux64/lib/dspba/Libraries/vhdl/base/dspba_library_package.vhd TOP_LEVEL_FILE
add_fileset_file dspba_library.vhd VHDL PATH $::env(INTELFPGAOCLSDKROOT)/linux64/lib/dspba/Libraries/vhdl/base/dspba_library.vhd TOP_LEVEL_FILE
add_fileset_file acl_data_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_data_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_ll_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ll_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_ll_ram_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ll_ram_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_valid_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_valid_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_dspba_valid_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_dspba_valid_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_staging_reg.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_staging_reg.v TOP_LEVEL_FILE
add_fileset_file hld_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/hld_fifo.sv TOP_LEVEL_FILE
add_fileset_file hld_fifo_zero_width.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/hld_fifo_zero_width.sv TOP_LEVEL_FILE
add_fileset_file acl_high_speed_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_high_speed_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_low_latency_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_low_latency_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_zero_latency_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_zero_latency_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_tessellated_incr_decr_threshold.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_tessellated_incr_decr_threshold.sv TOP_LEVEL_FILE
add_fileset_file acl_tessellated_incr_lookahead.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_tessellated_incr_lookahead.sv TOP_LEVEL_FILE
add_fileset_file acl_lfsr.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_lfsr.sv TOP_LEVEL_FILE
add_fileset_file acl_pop.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_pop.v TOP_LEVEL_FILE
add_fileset_file acl_dspba_buffer.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_dspba_buffer.v TOP_LEVEL_FILE
add_fileset_file lsu_top.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_top.v TOP_LEVEL_FILE
add_fileset_file lsu_permute_address.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_permute_address.v TOP_LEVEL_FILE
add_fileset_file lsu_pipelined.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_pipelined.v TOP_LEVEL_FILE
add_fileset_file lsu_enabled.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_enabled.v TOP_LEVEL_FILE
add_fileset_file lsu_basic_coalescer.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_basic_coalescer.v TOP_LEVEL_FILE
add_fileset_file lsu_simple.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_simple.v TOP_LEVEL_FILE
add_fileset_file lsu_streaming.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_streaming.v TOP_LEVEL_FILE
add_fileset_file lsu_burst_master.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_master.v TOP_LEVEL_FILE
add_fileset_file lsu_bursting_load_stores.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_bursting_load_stores.v TOP_LEVEL_FILE
add_fileset_file lsu_non_aligned_write.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_non_aligned_write.v TOP_LEVEL_FILE
add_fileset_file lsu_read_cache.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_read_cache.v TOP_LEVEL_FILE
add_fileset_file lsu_atomic.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_atomic.v TOP_LEVEL_FILE
add_fileset_file lsu_prefetch_block.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_prefetch_block.v TOP_LEVEL_FILE
add_fileset_file lsu_wide_wrapper.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_wide_wrapper.v TOP_LEVEL_FILE
add_fileset_file lsu_streaming_prefetch.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_streaming_prefetch.v TOP_LEVEL_FILE
add_fileset_file acl_aligned_burst_coalesced_lsu.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_aligned_burst_coalesced_lsu.v TOP_LEVEL_FILE
add_fileset_file acl_toggle_detect.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_toggle_detect.v TOP_LEVEL_FILE
add_fileset_file acl_debug_mem.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_debug_mem.v TOP_LEVEL_FILE
add_fileset_file lsu_burst_coalesced_pipelined_write.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_coalesced_pipelined_write.sv TOP_LEVEL_FILE
add_fileset_file lsu_burst_coalesced_pipelined_read.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_coalesced_pipelined_read.sv TOP_LEVEL_FILE
add_fileset_file acl_push.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_push.v TOP_LEVEL_FILE
add_fileset_file acl_token_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_token_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_clock2x_holder.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_clock2x_holder.v TOP_LEVEL_FILE
add_fileset_file hello_function_wrapper.vhd VHDL PATH kernel_hdl/hello/hello_function_wrapper.vhd TOP_LEVEL_FILE
add_fileset_file hello_function.vhd VHDL PATH kernel_hdl/hello/hello_function.vhd TOP_LEVEL_FILE
add_fileset_file bb_hello_B0.vhd VHDL PATH kernel_hdl/hello/bb_hello_B0.vhd TOP_LEVEL_FILE
add_fileset_file bb_hello_B0_stall_region.vhd VHDL PATH kernel_hdl/hello/bb_hello_B0_stall_region.vhd TOP_LEVEL_FILE
add_fileset_file i_store_memdep_hello4.vhd VHDL PATH kernel_hdl/hello/i_store_memdep_hello4.vhd TOP_LEVEL_FILE
add_fileset_file hello_B0_merge_reg.vhd VHDL PATH kernel_hdl/hello/hello_B0_merge_reg.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_pop_i1_throttle_pop_hello0.vhd VHDL PATH kernel_hdl/hello/i_acl_pop_i1_throttle_pop_hello0.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_pop_i1_throttle_pop_hello_reg.vhd VHDL PATH kernel_hdl/hello/i_acl_pop_i1_throttle_pop_hello_reg.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_push_i1_throttle_push_hello6.vhd VHDL PATH kernel_hdl/hello/i_acl_push_i1_throttle_push_hello6.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_push_i1_throttle_push_hello_reg.vhd VHDL PATH kernel_hdl/hello/i_acl_push_i1_throttle_push_hello_reg.vhd TOP_LEVEL_FILE
add_fileset_file i_syncbuf_string_sync_buffer_hello2.vhd VHDL PATH kernel_hdl/hello/i_syncbuf_string_sync_buffer_hello2.vhd TOP_LEVEL_FILE
add_fileset_file hello_B0_branch.vhd VHDL PATH kernel_hdl/hello/hello_B0_branch.vhd TOP_LEVEL_FILE
add_fileset_file hello_B0_merge.vhd VHDL PATH kernel_hdl/hello/hello_B0_merge.vhd TOP_LEVEL_FILE
add_fileset_file hello_function_cra_slave.vhd VHDL PATH kernel_hdl/hello/hello_function_cra_slave.vhd TOP_LEVEL_FILE
add_fileset_file acl_start_signal_chain_element.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_start_signal_chain_element.v TOP_LEVEL_FILE
add_fileset_file acl_avm_to_ic.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_avm_to_ic.v TOP_LEVEL_FILE
add_fileset_file acl_ic_master_endpoint.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_master_endpoint.v TOP_LEVEL_FILE
add_fileset_file acl_arb_intf.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_arb_intf.v TOP_LEVEL_FILE
add_fileset_file acl_ic_intf.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_intf.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_endpoint.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_endpoint.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_rrp.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_rrp.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_wrp.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_wrp.v TOP_LEVEL_FILE
add_fileset_file acl_ic_mem_router.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_mem_router.v TOP_LEVEL_FILE
add_fileset_file acl_ic_to_avm.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_to_avm.v TOP_LEVEL_FILE
