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

-- VHDL created from bb_hello_B0_stall_region
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

entity bb_hello_B0_stall_region is
    port (
        out_lsu_memdep_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_string : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memdep_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_hello_B0_stall_region;

architecture normal of bb_hello_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_store_memdep_hello4 is
        port (
            in_i_writedata_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_2 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_3 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_4 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_5 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_6 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_7 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_8 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_9 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_10 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_11 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_12 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_13 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_writedata_14 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_memdep_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component hello_B0_merge_reg is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_throttle_pop_hello0 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_throttle_push_hello6 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_string_sync_buffer_hello2 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_hello_aunroll_x_out_lsu_memdep_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_hello_aunroll_x_out_memdep_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_store_memdep_hello_aunroll_x_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_memdep_hello_aunroll_x_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_hello_aunroll_x_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_hello_aunroll_x_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_hello_aunroll_x_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_hello_aunroll_x_out_memdep_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_store_memdep_hello_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_hello_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_hello_aunroll_x_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i16_undef_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i8_0gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_100_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_101_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_108_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_111_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_114_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_32_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_33_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_44_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_72_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_87_q : STD_LOGIC_VECTOR (7 downto 0);
    signal hello_B0_merge_reg_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal hello_B0_merge_reg_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_hello_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_hello_out_feedback_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_hello_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_hello_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_hello_out_feedback_out_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_throttle_push_hello_out_feedback_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_hello_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_hello_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_string_sync_buffer_hello_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_string_sync_buffer_hello_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_string_sync_buffer_hello_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_store_memdep_hello_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_store_memdep_hello_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_acl_pop_i1_throttle_pop_hello_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_throttle_pop_hello_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_syncbuf_string_sync_buffer_hello_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_string_sync_buffer_hello_b : STD_LOGIC_VECTOR (63 downto 0);
    signal SE_out_i_store_memdep_hello_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_hello_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_hello_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_hello_B0_merge_reg_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_throttle_push_hello_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_throttle_push_hello_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_throttle_push_hello_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_string_sync_buffer_hello_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_string_sync_buffer_hello_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_string_sync_buffer_hello_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_string_sync_buffer_hello_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_hello_B0_merge_reg_2_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_hello_B0_merge_reg_2_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_hello_B0_merge_reg_2_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_hello_B0_merge_reg_2_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_hello_B0_merge_reg_2_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_hello_B0_merge_reg_2_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- bubble_out_hello_B0_merge_reg_2_reg(STALLENABLE,91)
    -- Valid signal propagation
    bubble_out_hello_B0_merge_reg_2_reg_V0 <= bubble_out_hello_B0_merge_reg_2_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_hello_B0_merge_reg_2_reg_s_tv_0 <= i_syncbuf_string_sync_buffer_hello_out_stall_out and bubble_out_hello_B0_merge_reg_2_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_hello_B0_merge_reg_2_reg_backEN <= not (bubble_out_hello_B0_merge_reg_2_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_hello_B0_merge_reg_2_reg_v_s_0 <= bubble_out_hello_B0_merge_reg_2_reg_backEN and SE_out_hello_B0_merge_reg_V1;
    -- Backward Stall generation
    bubble_out_hello_B0_merge_reg_2_reg_backStall <= not (bubble_out_hello_B0_merge_reg_2_reg_v_s_0);
    bubble_out_hello_B0_merge_reg_2_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_hello_B0_merge_reg_2_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_hello_B0_merge_reg_2_reg_backEN = "0") THEN
                bubble_out_hello_B0_merge_reg_2_reg_R_v_0 <= bubble_out_hello_B0_merge_reg_2_reg_R_v_0 and bubble_out_hello_B0_merge_reg_2_reg_s_tv_0;
            ELSE
                bubble_out_hello_B0_merge_reg_2_reg_R_v_0 <= bubble_out_hello_B0_merge_reg_2_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_stall_entry(STALLENABLE,69)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= hello_B0_merge_reg_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- hello_B0_merge_reg(BLACKBOX,34)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thehello_B0_merge_reg : hello_B0_merge_reg
    PORT MAP (
        in_data_in => GND_q,
        in_stall_in => SE_out_hello_B0_merge_reg_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_stall_out => hello_B0_merge_reg_out_stall_out,
        out_valid_out => hello_B0_merge_reg_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_hello_B0_merge_reg(STALLENABLE,62)
    SE_out_hello_B0_merge_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_hello_B0_merge_reg_fromReg0 <= (others => '0');
            SE_out_hello_B0_merge_reg_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_hello_B0_merge_reg_fromReg0 <= SE_out_hello_B0_merge_reg_toReg0;
            -- Succesor 1
            SE_out_hello_B0_merge_reg_fromReg1 <= SE_out_hello_B0_merge_reg_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_hello_B0_merge_reg_consumed0 <= (not (i_acl_pop_i1_throttle_pop_hello_out_stall_out) and SE_out_hello_B0_merge_reg_wireValid) or SE_out_hello_B0_merge_reg_fromReg0;
    SE_out_hello_B0_merge_reg_consumed1 <= (not (bubble_out_hello_B0_merge_reg_2_reg_backStall) and SE_out_hello_B0_merge_reg_wireValid) or SE_out_hello_B0_merge_reg_fromReg1;
    -- Consuming
    SE_out_hello_B0_merge_reg_StallValid <= SE_out_hello_B0_merge_reg_backStall and SE_out_hello_B0_merge_reg_wireValid;
    SE_out_hello_B0_merge_reg_toReg0 <= SE_out_hello_B0_merge_reg_StallValid and SE_out_hello_B0_merge_reg_consumed0;
    SE_out_hello_B0_merge_reg_toReg1 <= SE_out_hello_B0_merge_reg_StallValid and SE_out_hello_B0_merge_reg_consumed1;
    -- Backward Stall generation
    SE_out_hello_B0_merge_reg_or0 <= SE_out_hello_B0_merge_reg_consumed0;
    SE_out_hello_B0_merge_reg_wireStall <= not (SE_out_hello_B0_merge_reg_consumed1 and SE_out_hello_B0_merge_reg_or0);
    SE_out_hello_B0_merge_reg_backStall <= SE_out_hello_B0_merge_reg_wireStall;
    -- Valid signal propagation
    SE_out_hello_B0_merge_reg_V0 <= SE_out_hello_B0_merge_reg_wireValid and not (SE_out_hello_B0_merge_reg_fromReg0);
    SE_out_hello_B0_merge_reg_V1 <= SE_out_hello_B0_merge_reg_wireValid and not (SE_out_hello_B0_merge_reg_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_hello_B0_merge_reg_wireValid <= hello_B0_merge_reg_out_valid_out;

    -- SE_out_i_acl_push_i1_throttle_push_hello(STALLENABLE,66)
    -- Valid signal propagation
    SE_out_i_acl_push_i1_throttle_push_hello_V0 <= SE_out_i_acl_push_i1_throttle_push_hello_wireValid;
    -- Backward Stall generation
    SE_out_i_acl_push_i1_throttle_push_hello_backStall <= in_stall_in or not (SE_out_i_acl_push_i1_throttle_push_hello_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i1_throttle_push_hello_wireValid <= i_acl_push_i1_throttle_push_hello_out_valid_out;

    -- bubble_join_i_store_memdep_hello_aunroll_x(BITJOIN,47)
    bubble_join_i_store_memdep_hello_aunroll_x_q <= i_store_memdep_hello_aunroll_x_out_o_writeack;

    -- bubble_select_i_store_memdep_hello_aunroll_x(BITSELECT,48)
    bubble_select_i_store_memdep_hello_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_store_memdep_hello_aunroll_x_q(0 downto 0));

    -- i_acl_push_i1_throttle_push_hello(BLACKBOX,36)@3
    -- in in_stall_in@20000000
    -- out out_data_out@4
    -- out out_feedback_out_0@20000000
    -- out out_feedback_valid_out_0@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@4
    thei_acl_push_i1_throttle_push_hello : i_acl_push_i1_throttle_push_hello6
    PORT MAP (
        in_data_in => bubble_select_i_store_memdep_hello_aunroll_x_b,
        in_feedback_stall_in_0 => i_acl_pop_i1_throttle_pop_hello_out_feedback_stall_out_0,
        in_stall_in => SE_out_i_acl_push_i1_throttle_push_hello_backStall,
        in_valid_in => SE_out_i_store_memdep_hello_aunroll_x_V0,
        out_feedback_out_0 => i_acl_push_i1_throttle_push_hello_out_feedback_out_0,
        out_feedback_valid_out_0 => i_acl_push_i1_throttle_push_hello_out_feedback_valid_out_0,
        out_stall_out => i_acl_push_i1_throttle_push_hello_out_stall_out,
        out_valid_out => i_acl_push_i1_throttle_push_hello_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_throttle_pop_hello(BLACKBOX,35)@1
    -- in in_stall_in@20000000
    -- out out_data_out@2
    -- out out_feedback_stall_out_0@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@2
    thei_acl_pop_i1_throttle_pop_hello : i_acl_pop_i1_throttle_pop_hello0
    PORT MAP (
        in_data_in => GND_q,
        in_dir => GND_q,
        in_feedback_in_0 => i_acl_push_i1_throttle_push_hello_out_feedback_out_0,
        in_feedback_valid_in_0 => i_acl_push_i1_throttle_push_hello_out_feedback_valid_out_0,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_syncbuf_string_sync_buffer_hello_backStall,
        in_valid_in => SE_out_hello_B0_merge_reg_V0,
        out_data_out => i_acl_pop_i1_throttle_pop_hello_out_data_out,
        out_feedback_stall_out_0 => i_acl_pop_i1_throttle_pop_hello_out_feedback_stall_out_0,
        out_stall_out => i_acl_pop_i1_throttle_pop_hello_out_stall_out,
        out_valid_out => i_acl_pop_i1_throttle_pop_hello_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_string_sync_buffer_hello(BLACKBOX,38)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_string_sync_buffer_hello : i_syncbuf_string_sync_buffer_hello2
    PORT MAP (
        in_buffer_in => in_string,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_string_sync_buffer_hello_backStall,
        in_valid_in => bubble_out_hello_B0_merge_reg_2_reg_V0,
        out_buffer_out => i_syncbuf_string_sync_buffer_hello_out_buffer_out,
        out_stall_out => i_syncbuf_string_sync_buffer_hello_out_stall_out,
        out_valid_out => i_syncbuf_string_sync_buffer_hello_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_string_sync_buffer_hello(STALLENABLE,68)
    -- Valid signal propagation
    SE_out_i_syncbuf_string_sync_buffer_hello_V0 <= SE_out_i_syncbuf_string_sync_buffer_hello_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_string_sync_buffer_hello_backStall <= i_store_memdep_hello_aunroll_x_out_o_stall or not (SE_out_i_syncbuf_string_sync_buffer_hello_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_string_sync_buffer_hello_and0 <= i_syncbuf_string_sync_buffer_hello_out_valid_out;
    SE_out_i_syncbuf_string_sync_buffer_hello_wireValid <= i_acl_pop_i1_throttle_pop_hello_out_valid_out and SE_out_i_syncbuf_string_sync_buffer_hello_and0;

    -- SE_out_i_store_memdep_hello_aunroll_x(STALLENABLE,60)
    -- Valid signal propagation
    SE_out_i_store_memdep_hello_aunroll_x_V0 <= SE_out_i_store_memdep_hello_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_store_memdep_hello_aunroll_x_backStall <= i_acl_push_i1_throttle_push_hello_out_stall_out or not (SE_out_i_store_memdep_hello_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_memdep_hello_aunroll_x_wireValid <= i_store_memdep_hello_aunroll_x_out_o_valid;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bubble_join_i_acl_pop_i1_throttle_pop_hello(BITJOIN,52)
    bubble_join_i_acl_pop_i1_throttle_pop_hello_q <= i_acl_pop_i1_throttle_pop_hello_out_data_out;

    -- bubble_select_i_acl_pop_i1_throttle_pop_hello(BITSELECT,53)
    bubble_select_i_acl_pop_i1_throttle_pop_hello_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_throttle_pop_hello_q(0 downto 0));

    -- bubble_join_i_syncbuf_string_sync_buffer_hello(BITJOIN,56)
    bubble_join_i_syncbuf_string_sync_buffer_hello_q <= i_syncbuf_string_sync_buffer_hello_out_buffer_out;

    -- bubble_select_i_syncbuf_string_sync_buffer_hello(BITSELECT,57)
    bubble_select_i_syncbuf_string_sync_buffer_hello_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_string_sync_buffer_hello_q(63 downto 0));

    -- c_i16_undef(CONSTANT,15)
    c_i16_undef_q <= "0000000000000000";

    -- c_i8_0gr(CONSTANT,18)
    c_i8_0gr_q <= "00000000";

    -- c_i8_33(CONSTANT,25)
    c_i8_33_q <= "00100001";

    -- c_i8_100(CONSTANT,19)
    c_i8_100_q <= "01100100";

    -- c_i8_114(CONSTANT,23)
    c_i8_114_q <= "01110010";

    -- c_i8_87(CONSTANT,28)
    c_i8_87_q <= "01010111";

    -- c_i8_32(CONSTANT,24)
    c_i8_32_q <= "00100000";

    -- c_i8_44(CONSTANT,26)
    c_i8_44_q <= "00101100";

    -- c_i8_111(CONSTANT,22)
    c_i8_111_q <= "01101111";

    -- c_i8_108(CONSTANT,21)
    c_i8_108_q <= "01101100";

    -- c_i8_101(CONSTANT,20)
    c_i8_101_q <= "01100101";

    -- c_i8_72(CONSTANT,27)
    c_i8_72_q <= "01001000";

    -- i_store_memdep_hello_aunroll_x(BLACKBOX,14)@2
    -- in in_i_stall@20000000
    -- out out_lsu_memdep_o_active@20000000
    -- out out_memdep_avm_address@20000000
    -- out out_memdep_avm_burstcount@20000000
    -- out out_memdep_avm_byteenable@20000000
    -- out out_memdep_avm_enable@20000000
    -- out out_memdep_avm_read@20000000
    -- out out_memdep_avm_write@20000000
    -- out out_memdep_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@3
    -- out out_o_writeack@3
    thei_store_memdep_hello_aunroll_x : i_store_memdep_hello4
    PORT MAP (
        in_i_writedata_0 => c_i8_72_q,
        in_i_writedata_1 => c_i8_101_q,
        in_i_writedata_2 => c_i8_108_q,
        in_i_writedata_3 => c_i8_108_q,
        in_i_writedata_4 => c_i8_111_q,
        in_i_writedata_5 => c_i8_44_q,
        in_i_writedata_6 => c_i8_32_q,
        in_i_writedata_7 => c_i8_87_q,
        in_i_writedata_8 => c_i8_111_q,
        in_i_writedata_9 => c_i8_114_q,
        in_i_writedata_10 => c_i8_108_q,
        in_i_writedata_11 => c_i8_100_q,
        in_i_writedata_12 => c_i8_33_q,
        in_i_writedata_13 => c_i8_0gr_q,
        in_i_writedata_14 => c_i16_undef_q,
        in_flush => in_flush,
        in_i_address => bubble_select_i_syncbuf_string_sync_buffer_hello_b,
        in_i_dependence => bubble_select_i_acl_pop_i1_throttle_pop_hello_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_store_memdep_hello_aunroll_x_backStall,
        in_i_valid => SE_out_i_syncbuf_string_sync_buffer_hello_V0,
        in_memdep_avm_readdata => in_memdep_avm_readdata,
        in_memdep_avm_readdatavalid => in_memdep_avm_readdatavalid,
        in_memdep_avm_waitrequest => in_memdep_avm_waitrequest,
        in_memdep_avm_writeack => in_memdep_avm_writeack,
        out_lsu_memdep_o_active => i_store_memdep_hello_aunroll_x_out_lsu_memdep_o_active,
        out_memdep_avm_address => i_store_memdep_hello_aunroll_x_out_memdep_avm_address,
        out_memdep_avm_burstcount => i_store_memdep_hello_aunroll_x_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => i_store_memdep_hello_aunroll_x_out_memdep_avm_byteenable,
        out_memdep_avm_enable => i_store_memdep_hello_aunroll_x_out_memdep_avm_enable,
        out_memdep_avm_read => i_store_memdep_hello_aunroll_x_out_memdep_avm_read,
        out_memdep_avm_write => i_store_memdep_hello_aunroll_x_out_memdep_avm_write,
        out_memdep_avm_writedata => i_store_memdep_hello_aunroll_x_out_memdep_avm_writedata,
        out_o_stall => i_store_memdep_hello_aunroll_x_out_o_stall,
        out_o_valid => i_store_memdep_hello_aunroll_x_out_o_valid,
        out_o_writeack => i_store_memdep_hello_aunroll_x_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,2)
    out_lsu_memdep_o_active <= i_store_memdep_hello_aunroll_x_out_lsu_memdep_o_active;

    -- dupName_0_sync_out_x(GPOUT,7)@4
    out_valid_out <= SE_out_i_acl_push_i1_throttle_push_hello_V0;

    -- ext_sig_sync_out(GPOUT,33)
    out_memdep_avm_address <= i_store_memdep_hello_aunroll_x_out_memdep_avm_address;
    out_memdep_avm_enable <= i_store_memdep_hello_aunroll_x_out_memdep_avm_enable;
    out_memdep_avm_read <= i_store_memdep_hello_aunroll_x_out_memdep_avm_read;
    out_memdep_avm_write <= i_store_memdep_hello_aunroll_x_out_memdep_avm_write;
    out_memdep_avm_writedata <= i_store_memdep_hello_aunroll_x_out_memdep_avm_writedata;
    out_memdep_avm_byteenable <= i_store_memdep_hello_aunroll_x_out_memdep_avm_byteenable;
    out_memdep_avm_burstcount <= i_store_memdep_hello_aunroll_x_out_memdep_avm_burstcount;

    -- sync_out(GPOUT,45)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
