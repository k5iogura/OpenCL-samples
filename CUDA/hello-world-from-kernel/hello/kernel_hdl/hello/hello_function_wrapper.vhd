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

-- VHDL created from hello_function_wrapper
-- VHDL created on Sat Jun  9 13:50:27 2018


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

entity hello_function_wrapper is
    port (
        avm_memdep_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_memdep_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_writeack : in std_logic_vector(0 downto 0);  -- ufix1
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
        kernel_arguments : in std_logic_vector(63 downto 0);  -- ufix64
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
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        work_dim : in std_logic_vector(31 downto 0);  -- ufix32
        workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_memdep_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memdep_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end hello_function_wrapper;

architecture normal of hello_function_wrapper is

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


    component hello_function is
        port (
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_string : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_active_memdep : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_string_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal hello_function_out_memdep_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal hello_function_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal hello_function_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal hello_function_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal hello_function_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal hello_function_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal hello_function_out_memdep_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal hello_function_out_o_active_memdep : STD_LOGIC_VECTOR (0 downto 0);
    signal hello_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal hello_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_string_select(BITSELECT,3)
    arg_string_select_b <= kernel_arguments(63 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,41)
    ip_dsdk_adapt_cast_b <= arg_string_select_b(63 downto 0);

    -- hello_function(BLACKBOX,5)
    thehello_function : hello_function
    PORT MAP (
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_arg_string => ip_dsdk_adapt_cast_b,
        in_memdep_avm_readdata => avm_memdep_readdata,
        in_memdep_avm_readdatavalid => avm_memdep_readdatavalid,
        in_memdep_avm_waitrequest => avm_memdep_waitrequest,
        in_memdep_avm_writeack => avm_memdep_writeack,
        in_stall_in => GND_q,
        in_start => start,
        in_valid_in => kernel_valid_in,
        out_memdep_avm_address => hello_function_out_memdep_avm_address,
        out_memdep_avm_burstcount => hello_function_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => hello_function_out_memdep_avm_byteenable,
        out_memdep_avm_enable => hello_function_out_memdep_avm_enable,
        out_memdep_avm_read => hello_function_out_memdep_avm_read,
        out_memdep_avm_write => hello_function_out_memdep_avm_write,
        out_memdep_avm_writedata => hello_function_out_memdep_avm_writedata,
        out_o_active_memdep => hello_function_out_o_active_memdep,
        out_stall_out => hello_function_out_stall_out,
        out_valid_out => hello_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_memdep_address(GPOUT,42)
    avm_memdep_address <= hello_function_out_memdep_avm_address;

    -- avm_memdep_burstcount(GPOUT,43)
    avm_memdep_burstcount <= hello_function_out_memdep_avm_burstcount;

    -- avm_memdep_byteenable(GPOUT,44)
    avm_memdep_byteenable <= hello_function_out_memdep_avm_byteenable;

    -- avm_memdep_enable(GPOUT,45)
    avm_memdep_enable <= hello_function_out_memdep_avm_enable;

    -- avm_memdep_read(GPOUT,46)
    avm_memdep_read <= hello_function_out_memdep_avm_read;

    -- avm_memdep_write(GPOUT,47)
    avm_memdep_write <= hello_function_out_memdep_avm_write;

    -- avm_memdep_writedata(GPOUT,48)
    avm_memdep_writedata <= hello_function_out_memdep_avm_writedata;

    -- acl_clock2x_dummy_consumer(EXTIFACE,2)
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

    -- clock2x_output(GPOUT,49)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,50)
    has_a_lsu_active <= hello_function_out_o_active_memdep;

    -- has_a_write_pending(GPOUT,51)
    has_a_write_pending <= hello_function_out_o_active_memdep;

    -- kernel_stall_out(GPOUT,52)
    kernel_stall_out <= hello_function_out_stall_out;

    -- kernel_valid_out(GPOUT,53)
    kernel_valid_out <= hello_function_out_valid_out;

END normal;
