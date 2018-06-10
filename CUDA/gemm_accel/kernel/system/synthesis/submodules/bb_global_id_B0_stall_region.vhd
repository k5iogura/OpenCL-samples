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

-- VHDL created from bb_global_id_B0_stall_region
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

entity bb_global_id_B0_stall_region is
    port (
        in_unnamed_global_id0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_global_id0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_global_id0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_global_id0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_global_id0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_global_id0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_global_id0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_global_id0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_global_id0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_global_id0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_global_id0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_global_id0_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_printf_addr_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_printf_addr_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_printf_addr_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_printf_addr_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_printf_addr_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_printf_addr_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_printf_addr_avm_burstcount : out std_logic_vector(5 downto 0);  -- ufix6
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_global_id_B0_stall_region;

architecture normal of bb_global_id_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component global_id_B0_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_global_id0_global_id3 is
        port (
            in_i_writedata_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_writedata_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_writedata_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_global_id0_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_global_id0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_printf_printf_addr_global_id0 is
        port (
            in_i_globalid0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_increment : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_printf_addr_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_printf_addr_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_printf_addr_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_printf_addr_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_result : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_printf_addr_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_printf_addr_avm_burstcount : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_printf_addr_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_printf_addr_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_printf_addr_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_printf_addr_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_printf_addr_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_B0_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal global_id_B0_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal global_id_B0_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_B0_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_result_i2_global_id_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_result_i_global_id_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_store_unnamed_global_id0_global_id_aunroll_x_out_lsu_unnamed_global_id0_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_global_id0_global_id_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_global_id0_global_id_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_32_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i64_undef_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_printf_printf_addr_global_id_out_o_result : STD_LOGIC_VECTOR (63 downto 0);
    signal i_printf_printf_addr_global_id_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id_out_printf_addr_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_printf_printf_addr_global_id_out_printf_addr_avm_burstcount : STD_LOGIC_VECTOR (5 downto 0);
    signal i_printf_printf_addr_global_id_out_printf_addr_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_printf_printf_addr_global_id_out_printf_addr_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id_out_printf_addr_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id_out_printf_addr_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id_out_printf_addr_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_result_i2_global_id_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_result_i2_global_id_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_result_i_global_id_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_result_i_global_id_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_result_i_global_id_vt_select_31_b_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_result_i_global_id_vt_select_31_b_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_result_i2_global_id_vt_select_31_b_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_result_i2_global_id_vt_select_31_b_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_global_id_B0_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_global_id_B0_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_global_id_B0_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_printf_printf_addr_global_id_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_printf_printf_addr_global_id_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_global_id_B0_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_global_id0_global_id_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_global_id0_global_id_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_global_id0_global_id_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_printf_printf_addr_global_id_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_printf_printf_addr_global_id_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_printf_printf_addr_global_id_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_printf_printf_addr_global_id_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_printf_printf_addr_global_id_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_printf_printf_addr_global_id_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_printf_printf_addr_global_id_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_printf_printf_addr_global_id_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_printf_printf_addr_global_id_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_printf_printf_addr_global_id_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_printf_printf_addr_global_id_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_printf_printf_addr_global_id_data_reg_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_out_i_printf_printf_addr_global_id_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_printf_printf_addr_global_id_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_printf_printf_addr_global_id_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_printf_printf_addr_global_id_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_printf_printf_addr_global_id_data_reg_data_out : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- SE_out_i_printf_printf_addr_global_id(STALLENABLE,67)
    -- Valid signal propagation
    SE_out_i_printf_printf_addr_global_id_V0 <= SE_out_i_printf_printf_addr_global_id_wireValid;
    -- Backward Stall generation
    SE_out_i_printf_printf_addr_global_id_backStall <= bubble_out_i_printf_printf_addr_global_id_data_reg_stall_out or not (SE_out_i_printf_printf_addr_global_id_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_printf_printf_addr_global_id_wireValid <= i_printf_printf_addr_global_id_out_o_valid;

    -- c_i32_32(CONSTANT,17)
    c_i32_32_q <= "00000000000000000000000000100000";

    -- bubble_join_global_id_B0_merge_reg_aunroll_x(BITJOIN,50)
    bubble_join_global_id_B0_merge_reg_aunroll_x_q <= global_id_B0_merge_reg_aunroll_x_out_data_out_1 & global_id_B0_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_global_id_B0_merge_reg_aunroll_x(BITSELECT,51)
    bubble_select_global_id_B0_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_global_id_B0_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_global_id_B0_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_global_id_B0_merge_reg_aunroll_x_q(63 downto 32));

    -- i_printf_printf_addr_global_id(BLACKBOX,24)@1
    -- in in_i_stall@20000000
    -- out out_o_result@3
    -- out out_o_stall@20000000
    -- out out_o_valid@3
    -- out out_printf_addr_avm_address@20000000
    -- out out_printf_addr_avm_burstcount@20000000
    -- out out_printf_addr_avm_byteenable@20000000
    -- out out_printf_addr_avm_enable@20000000
    -- out out_printf_addr_avm_read@20000000
    -- out out_printf_addr_avm_write@20000000
    -- out out_printf_addr_avm_writedata@20000000
    thei_printf_printf_addr_global_id : i_printf_printf_addr_global_id0
    PORT MAP (
        in_i_globalid0 => bubble_select_global_id_B0_merge_reg_aunroll_x_b,
        in_i_increment => c_i32_32_q,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_printf_printf_addr_global_id_backStall,
        in_i_valid => SE_out_global_id_B0_merge_reg_aunroll_x_V0,
        in_printf_addr_avm_readdata => in_printf_addr_avm_readdata,
        in_printf_addr_avm_readdatavalid => in_printf_addr_avm_readdatavalid,
        in_printf_addr_avm_waitrequest => in_printf_addr_avm_waitrequest,
        in_printf_addr_avm_writeack => in_printf_addr_avm_writeack,
        out_o_result => i_printf_printf_addr_global_id_out_o_result,
        out_o_stall => i_printf_printf_addr_global_id_out_o_stall,
        out_o_valid => i_printf_printf_addr_global_id_out_o_valid,
        out_printf_addr_avm_address => i_printf_printf_addr_global_id_out_printf_addr_avm_address,
        out_printf_addr_avm_burstcount => i_printf_printf_addr_global_id_out_printf_addr_avm_burstcount,
        out_printf_addr_avm_byteenable => i_printf_printf_addr_global_id_out_printf_addr_avm_byteenable,
        out_printf_addr_avm_enable => i_printf_printf_addr_global_id_out_printf_addr_avm_enable,
        out_printf_addr_avm_read => i_printf_printf_addr_global_id_out_printf_addr_avm_read,
        out_printf_addr_avm_write => i_printf_printf_addr_global_id_out_printf_addr_avm_write,
        out_printf_addr_avm_writedata => i_printf_printf_addr_global_id_out_printf_addr_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,72)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= global_id_B0_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,57)
    bubble_join_stall_entry_q <= in_global_id_1 & in_global_id_0;

    -- bubble_select_stall_entry(BITSELECT,58)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));

    -- global_id_B0_merge_reg_aunroll_x(BLACKBOX,11)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theglobal_id_B0_merge_reg_aunroll_x : global_id_B0_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_data_in_1 => bubble_select_stall_entry_c,
        in_stall_in => SE_out_global_id_B0_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => global_id_B0_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => global_id_B0_merge_reg_aunroll_x_out_data_out_1,
        out_stall_out => global_id_B0_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => global_id_B0_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_global_id_B0_merge_reg_aunroll_x(STALLENABLE,61)
    SE_out_global_id_B0_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_global_id_B0_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_global_id_B0_merge_reg_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_global_id_B0_merge_reg_aunroll_x_fromReg0 <= SE_out_global_id_B0_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_global_id_B0_merge_reg_aunroll_x_fromReg1 <= SE_out_global_id_B0_merge_reg_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_global_id_B0_merge_reg_aunroll_x_consumed0 <= (not (i_printf_printf_addr_global_id_out_o_stall) and SE_out_global_id_B0_merge_reg_aunroll_x_wireValid) or SE_out_global_id_B0_merge_reg_aunroll_x_fromReg0;
    SE_out_global_id_B0_merge_reg_aunroll_x_consumed1 <= (not (SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_backStall) and SE_out_global_id_B0_merge_reg_aunroll_x_wireValid) or SE_out_global_id_B0_merge_reg_aunroll_x_fromReg1;
    -- Consuming
    SE_out_global_id_B0_merge_reg_aunroll_x_StallValid <= SE_out_global_id_B0_merge_reg_aunroll_x_backStall and SE_out_global_id_B0_merge_reg_aunroll_x_wireValid;
    SE_out_global_id_B0_merge_reg_aunroll_x_toReg0 <= SE_out_global_id_B0_merge_reg_aunroll_x_StallValid and SE_out_global_id_B0_merge_reg_aunroll_x_consumed0;
    SE_out_global_id_B0_merge_reg_aunroll_x_toReg1 <= SE_out_global_id_B0_merge_reg_aunroll_x_StallValid and SE_out_global_id_B0_merge_reg_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_global_id_B0_merge_reg_aunroll_x_or0 <= SE_out_global_id_B0_merge_reg_aunroll_x_consumed0;
    SE_out_global_id_B0_merge_reg_aunroll_x_wireStall <= not (SE_out_global_id_B0_merge_reg_aunroll_x_consumed1 and SE_out_global_id_B0_merge_reg_aunroll_x_or0);
    SE_out_global_id_B0_merge_reg_aunroll_x_backStall <= SE_out_global_id_B0_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_global_id_B0_merge_reg_aunroll_x_V0 <= SE_out_global_id_B0_merge_reg_aunroll_x_wireValid and not (SE_out_global_id_B0_merge_reg_aunroll_x_fromReg0);
    SE_out_global_id_B0_merge_reg_aunroll_x_V1 <= SE_out_global_id_B0_merge_reg_aunroll_x_wireValid and not (SE_out_global_id_B0_merge_reg_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_global_id_B0_merge_reg_aunroll_x_wireValid <= global_id_B0_merge_reg_aunroll_x_out_valid_out;

    -- SE_redist0_i_result_i_global_id_vt_select_31_b_2_0(STALLENABLE,74)
    -- Valid signal propagation
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_V0 <= SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_s_tv_0 <= SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_backStall and SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_backEN <= not (SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_v_s_0 <= SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_backEN and SE_out_global_id_B0_merge_reg_aunroll_x_V1;
    -- Backward Stall generation
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_backStall <= not (SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_v_s_0);
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_backEN = "0") THEN
                SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_R_v_0 <= SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_R_v_0 and SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_s_tv_0;
            ELSE
                SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_R_v_0 <= SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_i_result_i_global_id_vt_select_31_b_2_1(STALLENABLE,75)
    -- Valid signal propagation
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_V0 <= SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_s_tv_0 <= SE_out_bubble_out_i_printf_printf_addr_global_id_data_backStall and SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_backEN <= not (SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_v_s_0 <= SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_backEN and SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_V0;
    -- Backward Stall generation
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_backStall <= not (SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_v_s_0);
    SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_backEN = "0") THEN
                SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_R_v_0 <= SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_R_v_0 and SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_s_tv_0;
            ELSE
                SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_R_v_0 <= SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_i_printf_printf_addr_global_id(BITJOIN,54)
    bubble_join_i_printf_printf_addr_global_id_q <= i_printf_printf_addr_global_id_out_o_result;

    -- bubble_out_i_printf_printf_addr_global_id_data_reg(STALLFIFO,94)
    bubble_out_i_printf_printf_addr_global_id_data_reg_valid_in <= SE_out_i_printf_printf_addr_global_id_V0;
    bubble_out_i_printf_printf_addr_global_id_data_reg_stall_in <= SE_out_bubble_out_i_printf_printf_addr_global_id_data_backStall;
    bubble_out_i_printf_printf_addr_global_id_data_reg_data_in <= bubble_join_i_printf_printf_addr_global_id_q;
    bubble_out_i_printf_printf_addr_global_id_data_reg_valid_in_bitsignaltemp <= bubble_out_i_printf_printf_addr_global_id_data_reg_valid_in(0);
    bubble_out_i_printf_printf_addr_global_id_data_reg_stall_in_bitsignaltemp <= bubble_out_i_printf_printf_addr_global_id_data_reg_stall_in(0);
    bubble_out_i_printf_printf_addr_global_id_data_reg_valid_out(0) <= bubble_out_i_printf_printf_addr_global_id_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_printf_printf_addr_global_id_data_reg_stall_out(0) <= bubble_out_i_printf_printf_addr_global_id_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_printf_printf_addr_global_id_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_printf_printf_addr_global_id_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_printf_printf_addr_global_id_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_printf_printf_addr_global_id_q,
        valid_out => bubble_out_i_printf_printf_addr_global_id_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_printf_printf_addr_global_id_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_printf_printf_addr_global_id_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_printf_printf_addr_global_id_data(STALLENABLE,85)
    -- Valid signal propagation
    SE_out_bubble_out_i_printf_printf_addr_global_id_data_V0 <= SE_out_bubble_out_i_printf_printf_addr_global_id_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_printf_printf_addr_global_id_data_backStall <= i_store_unnamed_global_id0_global_id_aunroll_x_out_o_stall or not (SE_out_bubble_out_i_printf_printf_addr_global_id_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_printf_printf_addr_global_id_data_and0 <= bubble_out_i_printf_printf_addr_global_id_data_reg_valid_out;
    SE_out_bubble_out_i_printf_printf_addr_global_id_data_wireValid <= SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_V0 and SE_out_bubble_out_i_printf_printf_addr_global_id_data_and0;

    -- SE_out_i_store_unnamed_global_id0_global_id_aunroll_x(STALLENABLE,65)
    -- Valid signal propagation
    SE_out_i_store_unnamed_global_id0_global_id_aunroll_x_V0 <= SE_out_i_store_unnamed_global_id0_global_id_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_store_unnamed_global_id0_global_id_aunroll_x_backStall <= in_stall_in or not (SE_out_i_store_unnamed_global_id0_global_id_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_unnamed_global_id0_global_id_aunroll_x_wireValid <= i_store_unnamed_global_id0_global_id_aunroll_x_out_o_valid;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bubble_select_i_printf_printf_addr_global_id(BITSELECT,55)
    bubble_select_i_printf_printf_addr_global_id_b <= STD_LOGIC_VECTOR(bubble_out_i_printf_printf_addr_global_id_data_reg_data_out(63 downto 0));

    -- c_i64_undef(CONSTANT,19)
    c_i64_undef_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- i_result_i2_global_id_sel_x(BITSELECT,12)@1
    i_result_i2_global_id_sel_x_b <= std_logic_vector(resize(unsigned(bubble_select_global_id_B0_merge_reg_aunroll_x_c(31 downto 0)), 64));

    -- i_result_i2_global_id_vt_select_31(BITSELECT,28)@1
    i_result_i2_global_id_vt_select_31_b <= i_result_i2_global_id_sel_x_b(31 downto 0);

    -- redist1_i_result_i2_global_id_vt_select_31_b_2_0(REG,47)
    redist1_i_result_i2_global_id_vt_select_31_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_result_i2_global_id_vt_select_31_b_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_backEN = "1") THEN
                redist1_i_result_i2_global_id_vt_select_31_b_2_0_q <= STD_LOGIC_VECTOR(i_result_i2_global_id_vt_select_31_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_result_i2_global_id_vt_select_31_b_2_1(REG,48)
    redist1_i_result_i2_global_id_vt_select_31_b_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_result_i2_global_id_vt_select_31_b_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_backEN = "1") THEN
                redist1_i_result_i2_global_id_vt_select_31_b_2_1_q <= STD_LOGIC_VECTOR(redist1_i_result_i2_global_id_vt_select_31_b_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_result_i2_global_id_vt_join(BITJOIN,27)@3
    i_result_i2_global_id_vt_join_q <= c_i32_0gr_q & redist1_i_result_i2_global_id_vt_select_31_b_2_1_q;

    -- i_result_i_global_id_sel_x(BITSELECT,13)@1
    i_result_i_global_id_sel_x_b <= std_logic_vector(resize(unsigned(bubble_select_global_id_B0_merge_reg_aunroll_x_b(31 downto 0)), 64));

    -- i_result_i_global_id_vt_select_31(BITSELECT,32)@1
    i_result_i_global_id_vt_select_31_b <= i_result_i_global_id_sel_x_b(31 downto 0);

    -- redist0_i_result_i_global_id_vt_select_31_b_2_0(REG,45)
    redist0_i_result_i_global_id_vt_select_31_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_result_i_global_id_vt_select_31_b_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_result_i_global_id_vt_select_31_b_2_0_backEN = "1") THEN
                redist0_i_result_i_global_id_vt_select_31_b_2_0_q <= STD_LOGIC_VECTOR(i_result_i_global_id_vt_select_31_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_result_i_global_id_vt_select_31_b_2_1(REG,46)
    redist0_i_result_i_global_id_vt_select_31_b_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_result_i_global_id_vt_select_31_b_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_result_i_global_id_vt_select_31_b_2_1_backEN = "1") THEN
                redist0_i_result_i_global_id_vt_select_31_b_2_1_q <= STD_LOGIC_VECTOR(redist0_i_result_i_global_id_vt_select_31_b_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_result_i_global_id_vt_join(BITJOIN,31)@3
    i_result_i_global_id_vt_join_q <= c_i32_0gr_q & redist0_i_result_i_global_id_vt_select_31_b_2_1_q;

    -- c_i32_0gr(CONSTANT,16)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_store_unnamed_global_id0_global_id_aunroll_x(BLACKBOX,14)@3
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_global_id0_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@5
    -- out out_unnamed_global_id0_avm_address@20000000
    -- out out_unnamed_global_id0_avm_burstcount@20000000
    -- out out_unnamed_global_id0_avm_byteenable@20000000
    -- out out_unnamed_global_id0_avm_enable@20000000
    -- out out_unnamed_global_id0_avm_read@20000000
    -- out out_unnamed_global_id0_avm_write@20000000
    -- out out_unnamed_global_id0_avm_writedata@20000000
    thei_store_unnamed_global_id0_global_id_aunroll_x : i_store_unnamed_global_id0_global_id3
    PORT MAP (
        in_i_writedata_0 => c_i32_0gr_q,
        in_i_writedata_1 => c_i32_0gr_q,
        in_i_writedata_2 => i_result_i_global_id_vt_join_q,
        in_i_writedata_3 => i_result_i2_global_id_vt_join_q,
        in_i_writedata_4 => c_i64_undef_q,
        in_flush => in_flush,
        in_i_address => bubble_select_i_printf_printf_addr_global_id_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_store_unnamed_global_id0_global_id_aunroll_x_backStall,
        in_i_valid => SE_out_bubble_out_i_printf_printf_addr_global_id_data_V0,
        in_unnamed_global_id0_avm_readdata => in_unnamed_global_id0_avm_readdata,
        in_unnamed_global_id0_avm_readdatavalid => in_unnamed_global_id0_avm_readdatavalid,
        in_unnamed_global_id0_avm_waitrequest => in_unnamed_global_id0_avm_waitrequest,
        in_unnamed_global_id0_avm_writeack => in_unnamed_global_id0_avm_writeack,
        out_lsu_unnamed_global_id0_o_active => i_store_unnamed_global_id0_global_id_aunroll_x_out_lsu_unnamed_global_id0_o_active,
        out_o_stall => i_store_unnamed_global_id0_global_id_aunroll_x_out_o_stall,
        out_o_valid => i_store_unnamed_global_id0_global_id_aunroll_x_out_o_valid,
        out_unnamed_global_id0_avm_address => i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_address,
        out_unnamed_global_id0_avm_burstcount => i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_burstcount,
        out_unnamed_global_id0_avm_byteenable => i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_byteenable,
        out_unnamed_global_id0_avm_enable => i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_enable,
        out_unnamed_global_id0_avm_read => i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_read,
        out_unnamed_global_id0_avm_write => i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_write,
        out_unnamed_global_id0_avm_writedata => i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_unnamed_global_id0_avm_address <= i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_address;
    out_unnamed_global_id0_avm_enable <= i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_enable;
    out_unnamed_global_id0_avm_read <= i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_read;
    out_unnamed_global_id0_avm_write <= i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_write;
    out_unnamed_global_id0_avm_writedata <= i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_writedata;
    out_unnamed_global_id0_avm_byteenable <= i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_byteenable;
    out_unnamed_global_id0_avm_burstcount <= i_store_unnamed_global_id0_global_id_aunroll_x_out_unnamed_global_id0_avm_burstcount;

    -- dupName_0_sync_out_x(GPOUT,7)@5
    out_valid_out <= SE_out_i_store_unnamed_global_id0_global_id_aunroll_x_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,8)
    out_lsu_unnamed_global_id0_o_active <= i_store_unnamed_global_id0_global_id_aunroll_x_out_lsu_unnamed_global_id0_o_active;

    -- ext_sig_sync_out(GPOUT,23)
    out_printf_addr_avm_address <= i_printf_printf_addr_global_id_out_printf_addr_avm_address;
    out_printf_addr_avm_enable <= i_printf_printf_addr_global_id_out_printf_addr_avm_enable;
    out_printf_addr_avm_read <= i_printf_printf_addr_global_id_out_printf_addr_avm_read;
    out_printf_addr_avm_write <= i_printf_printf_addr_global_id_out_printf_addr_avm_write;
    out_printf_addr_avm_writedata <= i_printf_printf_addr_global_id_out_printf_addr_avm_writedata;
    out_printf_addr_avm_byteenable <= i_printf_printf_addr_global_id_out_printf_addr_avm_byteenable;
    out_printf_addr_avm_burstcount <= i_printf_printf_addr_global_id_out_printf_addr_avm_burstcount;

    -- sync_out(GPOUT,40)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
