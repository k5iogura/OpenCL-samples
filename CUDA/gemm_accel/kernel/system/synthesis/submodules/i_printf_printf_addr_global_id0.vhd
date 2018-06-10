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

-- VHDL created from i_printf_printf_addr_global_id0
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

entity i_printf_printf_addr_global_id0 is
    port (
        in_printf_addr_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_burstcount : out std_logic_vector(5 downto 0);  -- ufix6
        in_i_globalid0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_increment : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_predicate : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_result : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_printf_addr_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        in_printf_addr_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        in_printf_addr_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        out_printf_addr_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_printf_printf_addr_global_id0;

architecture normal of i_printf_printf_addr_global_id0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_printf_buffer_address_generator is
        port (
            avm_readdata : in std_logic_vector(255 downto 0);
            avm_readdatavalid : in std_logic;
            avm_waitrequest : in std_logic;
            avm_writeack : in std_logic;
            i_globalid0 : in std_logic_vector(31 downto 0);
            i_increment : in std_logic_vector(31 downto 0);
            i_predicate : in std_logic;
            i_stall : in std_logic;
            i_valid : in std_logic;
            avm_address : out std_logic_vector(31 downto 0);
            avm_burstcount : out std_logic_vector(5 downto 0);
            avm_byteenable : out std_logic_vector(31 downto 0);
            avm_enable : out std_logic;
            avm_read : out std_logic;
            avm_write : out std_logic;
            avm_writedata : out std_logic_vector(255 downto 0);
            o_result : out std_logic_vector(63 downto 0);
            o_stall : out std_logic;
            o_valid : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal i_printf_printf_addr_global_id1_avm_readdata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_printf_printf_addr_global_id1_avm_readdatavalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id1_avm_readdatavalid_bitsignaltemp : std_logic;
    signal i_printf_printf_addr_global_id1_avm_waitrequest : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id1_avm_waitrequest_bitsignaltemp : std_logic;
    signal i_printf_printf_addr_global_id1_avm_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id1_avm_writeack_bitsignaltemp : std_logic;
    signal i_printf_printf_addr_global_id1_i_globalid0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_printf_printf_addr_global_id1_i_increment : STD_LOGIC_VECTOR (31 downto 0);
    signal i_printf_printf_addr_global_id1_i_predicate : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id1_i_predicate_bitsignaltemp : std_logic;
    signal i_printf_printf_addr_global_id1_i_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id1_i_stall_bitsignaltemp : std_logic;
    signal i_printf_printf_addr_global_id1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id1_i_valid_bitsignaltemp : std_logic;
    signal i_printf_printf_addr_global_id1_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_printf_printf_addr_global_id1_avm_burstcount : STD_LOGIC_VECTOR (5 downto 0);
    signal i_printf_printf_addr_global_id1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_printf_printf_addr_global_id1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id1_avm_enable_bitsignaltemp : std_logic;
    signal i_printf_printf_addr_global_id1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id1_avm_read_bitsignaltemp : std_logic;
    signal i_printf_printf_addr_global_id1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id1_avm_write_bitsignaltemp : std_logic;
    signal i_printf_printf_addr_global_id1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_printf_printf_addr_global_id1_o_result : STD_LOGIC_VECTOR (63 downto 0);
    signal i_printf_printf_addr_global_id1_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id1_o_stall_bitsignaltemp : std_logic;
    signal i_printf_printf_addr_global_id1_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_printf_printf_addr_global_id1_o_valid_bitsignaltemp : std_logic;

begin


    -- i_printf_printf_addr_global_id1(EXTIFACE,13)
    i_printf_printf_addr_global_id1_avm_readdata <= in_printf_addr_avm_readdata;
    i_printf_printf_addr_global_id1_avm_readdatavalid <= in_printf_addr_avm_readdatavalid;
    i_printf_printf_addr_global_id1_avm_waitrequest <= in_printf_addr_avm_waitrequest;
    i_printf_printf_addr_global_id1_avm_writeack <= in_printf_addr_avm_writeack;
    i_printf_printf_addr_global_id1_i_globalid0 <= in_i_globalid0;
    i_printf_printf_addr_global_id1_i_increment <= in_i_increment;
    i_printf_printf_addr_global_id1_i_predicate <= in_i_predicate;
    i_printf_printf_addr_global_id1_i_stall <= in_i_stall;
    i_printf_printf_addr_global_id1_i_valid <= in_i_valid;
    i_printf_printf_addr_global_id1_avm_readdatavalid_bitsignaltemp <= i_printf_printf_addr_global_id1_avm_readdatavalid(0);
    i_printf_printf_addr_global_id1_avm_waitrequest_bitsignaltemp <= i_printf_printf_addr_global_id1_avm_waitrequest(0);
    i_printf_printf_addr_global_id1_avm_writeack_bitsignaltemp <= i_printf_printf_addr_global_id1_avm_writeack(0);
    i_printf_printf_addr_global_id1_i_predicate_bitsignaltemp <= i_printf_printf_addr_global_id1_i_predicate(0);
    i_printf_printf_addr_global_id1_i_stall_bitsignaltemp <= i_printf_printf_addr_global_id1_i_stall(0);
    i_printf_printf_addr_global_id1_i_valid_bitsignaltemp <= i_printf_printf_addr_global_id1_i_valid(0);
    i_printf_printf_addr_global_id1_avm_enable(0) <= i_printf_printf_addr_global_id1_avm_enable_bitsignaltemp;
    i_printf_printf_addr_global_id1_avm_read(0) <= i_printf_printf_addr_global_id1_avm_read_bitsignaltemp;
    i_printf_printf_addr_global_id1_avm_write(0) <= i_printf_printf_addr_global_id1_avm_write_bitsignaltemp;
    i_printf_printf_addr_global_id1_o_stall(0) <= i_printf_printf_addr_global_id1_o_stall_bitsignaltemp;
    i_printf_printf_addr_global_id1_o_valid(0) <= i_printf_printf_addr_global_id1_o_valid_bitsignaltemp;
    thei_printf_printf_addr_global_id1 : acl_printf_buffer_address_generator
    PORT MAP (
        avm_readdata => in_printf_addr_avm_readdata,
        avm_readdatavalid => i_printf_printf_addr_global_id1_avm_readdatavalid_bitsignaltemp,
        avm_waitrequest => i_printf_printf_addr_global_id1_avm_waitrequest_bitsignaltemp,
        avm_writeack => i_printf_printf_addr_global_id1_avm_writeack_bitsignaltemp,
        i_globalid0 => in_i_globalid0,
        i_increment => in_i_increment,
        i_predicate => i_printf_printf_addr_global_id1_i_predicate_bitsignaltemp,
        i_stall => i_printf_printf_addr_global_id1_i_stall_bitsignaltemp,
        i_valid => i_printf_printf_addr_global_id1_i_valid_bitsignaltemp,
        avm_address => i_printf_printf_addr_global_id1_avm_address,
        avm_burstcount => i_printf_printf_addr_global_id1_avm_burstcount,
        avm_byteenable => i_printf_printf_addr_global_id1_avm_byteenable,
        avm_enable => i_printf_printf_addr_global_id1_avm_enable_bitsignaltemp,
        avm_read => i_printf_printf_addr_global_id1_avm_read_bitsignaltemp,
        avm_write => i_printf_printf_addr_global_id1_avm_write_bitsignaltemp,
        avm_writedata => i_printf_printf_addr_global_id1_avm_writedata,
        o_result => i_printf_printf_addr_global_id1_o_result,
        o_stall => i_printf_printf_addr_global_id1_o_stall_bitsignaltemp,
        o_valid => i_printf_printf_addr_global_id1_o_valid_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_regfree_osync_x(GPOUT,3)
    out_printf_addr_avm_burstcount <= i_printf_printf_addr_global_id1_avm_burstcount;

    -- dupName_0_sync_out_x(GPOUT,5)@3
    out_o_result <= i_printf_printf_addr_global_id1_o_result;
    out_o_valid <= i_printf_printf_addr_global_id1_o_valid;

    -- dupName_1_regfree_osync_x(GPOUT,7)
    out_printf_addr_avm_byteenable <= i_printf_printf_addr_global_id1_avm_byteenable;

    -- dupName_2_regfree_osync_x(GPOUT,9)
    out_printf_addr_avm_enable <= i_printf_printf_addr_global_id1_avm_enable;

    -- dupName_3_regfree_osync_x(GPOUT,10)
    out_printf_addr_avm_read <= i_printf_printf_addr_global_id1_avm_read;

    -- dupName_4_regfree_osync_x(GPOUT,11)
    out_printf_addr_avm_write <= i_printf_printf_addr_global_id1_avm_write;

    -- dupName_5_regfree_osync_x(GPOUT,12)
    out_printf_addr_avm_writedata <= i_printf_printf_addr_global_id1_avm_writedata;

    -- regfree_osync(GPOUT,15)
    out_printf_addr_avm_address <= i_printf_printf_addr_global_id1_avm_address;

    -- sync_out(GPOUT,17)@20000000
    out_o_stall <= i_printf_printf_addr_global_id1_o_stall;

END normal;
