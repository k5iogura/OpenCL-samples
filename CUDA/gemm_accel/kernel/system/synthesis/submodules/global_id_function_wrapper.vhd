-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.0 (Release Build #614)
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from global_id_function_wrapper
-- VHDL created on Fri Jun  8 22:34:53 2018


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity global_id_function_wrapper is
    port (
        avm_unnamed_global_id0_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_global_id0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_global_id0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_global_id0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        clock2x : in std_logic_vector(0 downto 0);  -- ufix1
        global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        kernel_arguments : in std_logic_vector(95 downto 0);  -- ufix96
        kernel_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        local_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        local_router_hang : in std_logic_vector(0 downto 0);  -- ufix1
        local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_0 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_1 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_2 : in std_logic_vector(31 downto 0);  -- ufix32
        p_avm_printf_addr_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        p_avm_printf_addr_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        p_avm_printf_addr_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        p_avm_printf_addr_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        work_dim : in std_logic_vector(31 downto 0);  -- ufix32
        workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_global_id0_address : out std_logic_vector(30 downto 0);  -- ufix31
        avm_unnamed_global_id0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_global_id0_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_global_id0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_global_id0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_global_id0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_global_id0_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        p_avm_printf_addr_address : out std_logic_vector(31 downto 0);  -- ufix32
        p_avm_printf_addr_burstcount : out std_logic_vector(5 downto 0);  -- ufix6
        p_avm_printf_addr_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        p_avm_printf_addr_enable : out std_logic_vector(0 downto 0);  -- ufix1
        p_avm_printf_addr_read : out std_logic_vector(0 downto 0);  -- ufix1
        p_avm_printf_addr_write : out std_logic_vector(0 downto 0);  -- ufix1
        p_avm_printf_addr_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        clock : in std_logic;
        resetn : in std_logic
    );
end global_id_function_wrapper;

architecture normal of global_id_function_wrapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_clock2x_holder is
        port (
            clock2x : in std_logic;
            myout : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component global_id_function is
        port (
            in_arg_acl_printf_buffer_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_acl_printf_buffer_start : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_id_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_printf_addr_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_printf_addr_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_printf_addr_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_printf_addr_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_active_unnamed_global_id0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_printf_addr_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_printf_addr_avm_burstcount : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_printf_addr_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_printf_addr_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_printf_addr_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_printf_addr_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_printf_addr_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_acl_printf_buffer_size_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_acl_printf_buffer_start_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal global_id_function_out_o_active_unnamed_global_id0 : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_function_out_printf_addr_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal global_id_function_out_printf_addr_avm_burstcount : STD_LOGIC_VECTOR (5 downto 0);
    signal global_id_function_out_printf_addr_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal global_id_function_out_printf_addr_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_function_out_printf_addr_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_function_out_printf_addr_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_function_out_printf_addr_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal global_id_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_function_out_unnamed_global_id0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal global_id_function_out_unnamed_global_id0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal global_id_function_out_unnamed_global_id0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal global_id_function_out_unnamed_global_id0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_function_out_unnamed_global_id0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_function_out_unnamed_global_id0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_function_out_unnamed_global_id0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal global_id_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_acl_printf_buffer_start_select(BITSELECT,5)
    arg_acl_printf_buffer_start_select_b <= kernel_arguments(63 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,47)
    ip_dsdk_adapt_cast_b <= arg_acl_printf_buffer_start_select_b(63 downto 0);

    -- arg_acl_printf_buffer_size_select(BITSELECT,4)
    arg_acl_printf_buffer_size_select_b <= kernel_arguments(95 downto 64);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_acl_printf_buffer_size_select_b(31 downto 0);

    -- global_id_function(BLACKBOX,7)
    theglobal_id_function : global_id_function
    PORT MAP (
        in_arg_acl_printf_buffer_size => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_arg_acl_printf_buffer_start => ip_dsdk_adapt_cast_b,
        in_arg_global_id_0 => global_id_0,
        in_arg_global_id_1 => global_id_1,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_printf_addr_avm_readdata => p_avm_printf_addr_readdata,
        in_printf_addr_avm_readdatavalid => p_avm_printf_addr_readdatavalid,
        in_printf_addr_avm_waitrequest => p_avm_printf_addr_waitrequest,
        in_printf_addr_avm_writeack => p_avm_printf_addr_writeack,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_global_id0_avm_readdata => avm_unnamed_global_id0_readdata,
        in_unnamed_global_id0_avm_readdatavalid => avm_unnamed_global_id0_readdatavalid,
        in_unnamed_global_id0_avm_waitrequest => avm_unnamed_global_id0_waitrequest,
        in_unnamed_global_id0_avm_writeack => avm_unnamed_global_id0_writeack,
        in_valid_in => kernel_valid_in,
        out_o_active_unnamed_global_id0 => global_id_function_out_o_active_unnamed_global_id0,
        out_printf_addr_avm_address => global_id_function_out_printf_addr_avm_address,
        out_printf_addr_avm_burstcount => global_id_function_out_printf_addr_avm_burstcount,
        out_printf_addr_avm_byteenable => global_id_function_out_printf_addr_avm_byteenable,
        out_printf_addr_avm_enable => global_id_function_out_printf_addr_avm_enable,
        out_printf_addr_avm_read => global_id_function_out_printf_addr_avm_read,
        out_printf_addr_avm_write => global_id_function_out_printf_addr_avm_write,
        out_printf_addr_avm_writedata => global_id_function_out_printf_addr_avm_writedata,
        out_stall_out => global_id_function_out_stall_out,
        out_unnamed_global_id0_avm_address => global_id_function_out_unnamed_global_id0_avm_address,
        out_unnamed_global_id0_avm_burstcount => global_id_function_out_unnamed_global_id0_avm_burstcount,
        out_unnamed_global_id0_avm_byteenable => global_id_function_out_unnamed_global_id0_avm_byteenable,
        out_unnamed_global_id0_avm_enable => global_id_function_out_unnamed_global_id0_avm_enable,
        out_unnamed_global_id0_avm_read => global_id_function_out_unnamed_global_id0_avm_read,
        out_unnamed_global_id0_avm_write => global_id_function_out_unnamed_global_id0_avm_write,
        out_unnamed_global_id0_avm_writedata => global_id_function_out_unnamed_global_id0_avm_writedata,
        out_valid_out => global_id_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_unnamed_global_id0_address(GPOUT,48)
    avm_unnamed_global_id0_address <= global_id_function_out_unnamed_global_id0_avm_address;

    -- avm_unnamed_global_id0_burstcount(GPOUT,49)
    avm_unnamed_global_id0_burstcount <= global_id_function_out_unnamed_global_id0_avm_burstcount;

    -- avm_unnamed_global_id0_byteenable(GPOUT,50)
    avm_unnamed_global_id0_byteenable <= global_id_function_out_unnamed_global_id0_avm_byteenable;

    -- avm_unnamed_global_id0_enable(GPOUT,51)
    avm_unnamed_global_id0_enable <= global_id_function_out_unnamed_global_id0_avm_enable;

    -- avm_unnamed_global_id0_read(GPOUT,52)
    avm_unnamed_global_id0_read <= global_id_function_out_unnamed_global_id0_avm_read;

    -- avm_unnamed_global_id0_write(GPOUT,53)
    avm_unnamed_global_id0_write <= global_id_function_out_unnamed_global_id0_avm_write;

    -- avm_unnamed_global_id0_writedata(GPOUT,54)
    avm_unnamed_global_id0_writedata <= global_id_function_out_unnamed_global_id0_avm_writedata;

    -- acl_clock2x_dummy_consumer(EXTIFACE,3)
    acl_clock2x_dummy_consumer_clock2x <= clock2x;
    acl_clock2x_dummy_consumer_clock2x_bitsignaltemp <= acl_clock2x_dummy_consumer_clock2x(0);
    acl_clock2x_dummy_consumer_myout(0) <= acl_clock2x_dummy_consumer_myout_bitsignaltemp;
    theacl_clock2x_dummy_consumer : acl_clock2x_holder
    PORT MAP (
        clock2x => acl_clock2x_dummy_consumer_clock2x_bitsignaltemp,
        myout => acl_clock2x_dummy_consumer_myout_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- clock2x_output(GPOUT,55)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,56)
    has_a_lsu_active <= global_id_function_out_o_active_unnamed_global_id0;

    -- has_a_write_pending(GPOUT,57)
    has_a_write_pending <= global_id_function_out_o_active_unnamed_global_id0;

    -- kernel_stall_out(GPOUT,58)
    kernel_stall_out <= global_id_function_out_stall_out;

    -- kernel_valid_out(GPOUT,59)
    kernel_valid_out <= global_id_function_out_valid_out;

    -- p_avm_printf_addr_address(GPOUT,60)
    p_avm_printf_addr_address <= global_id_function_out_printf_addr_avm_address;

    -- p_avm_printf_addr_burstcount(GPOUT,61)
    p_avm_printf_addr_burstcount <= global_id_function_out_printf_addr_avm_burstcount;

    -- p_avm_printf_addr_byteenable(GPOUT,62)
    p_avm_printf_addr_byteenable <= global_id_function_out_printf_addr_avm_byteenable;

    -- p_avm_printf_addr_enable(GPOUT,63)
    p_avm_printf_addr_enable <= global_id_function_out_printf_addr_avm_enable;

    -- p_avm_printf_addr_read(GPOUT,64)
    p_avm_printf_addr_read <= global_id_function_out_printf_addr_avm_read;

    -- p_avm_printf_addr_write(GPOUT,65)
    p_avm_printf_addr_write <= global_id_function_out_printf_addr_avm_write;

    -- p_avm_printf_addr_writedata(GPOUT,66)
    p_avm_printf_addr_writedata <= global_id_function_out_printf_addr_avm_writedata;

END normal;
