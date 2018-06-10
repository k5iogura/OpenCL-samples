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

-- VHDL created from bb_global_id_B0
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

entity bb_global_id_B0 is
    port (
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_1_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_printf_addr_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_printf_addr_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_printf_addr_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_printf_addr_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_global_id0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_global_id0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_global_id0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_global_id0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_global_id0_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_printf_addr_avm_burstcount : out std_logic_vector(5 downto 0);  -- ufix6
        out_printf_addr_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_printf_addr_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_printf_addr_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_global_id0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_global_id0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_global_id0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_global_id0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_global_id0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_global_id0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_global_id0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_global_id_B0;

architecture normal of bb_global_id_B0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_global_id_B0_stall_region is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_printf_addr_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_printf_addr_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_printf_addr_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_printf_addr_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_global_id0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_global_id0_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
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


    component global_id_B0_branch is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component global_id_B0_merge is
        port (
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_global_id_B0_stall_region_out_lsu_unnamed_global_id0_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_global_id_B0_stall_region_out_printf_addr_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_global_id_B0_stall_region_out_printf_addr_avm_burstcount : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_global_id_B0_stall_region_out_printf_addr_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_global_id_B0_stall_region_out_printf_addr_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_global_id_B0_stall_region_out_printf_addr_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_global_id_B0_stall_region_out_printf_addr_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_global_id_B0_stall_region_out_printf_addr_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_global_id_B0_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_global_id_B0_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_B0_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_B0_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_B0_merge_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal global_id_B0_merge_out_global_id_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal global_id_B0_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_B0_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- global_id_B0_branch(BLACKBOX,3)
    theglobal_id_B0_branch : global_id_B0_branch
    PORT MAP (
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_global_id_B0_stall_region_out_valid_out,
        out_stall_out => global_id_B0_branch_out_stall_out,
        out_valid_out_0 => global_id_B0_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- global_id_B0_merge(BLACKBOX,4)
    theglobal_id_B0_merge : global_id_B0_merge
    PORT MAP (
        in_global_id_0_0 => in_global_id_0_0,
        in_global_id_1_0 => in_global_id_1_0,
        in_stall_in => bb_global_id_B0_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_global_id_0 => global_id_B0_merge_out_global_id_0,
        out_global_id_1 => global_id_B0_merge_out_global_id_1,
        out_stall_out_0 => global_id_B0_merge_out_stall_out_0,
        out_valid_out => global_id_B0_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_global_id_B0_stall_region(BLACKBOX,2)
    thebb_global_id_B0_stall_region : bb_global_id_B0_stall_region
    PORT MAP (
        in_flush => in_flush,
        in_global_id_0 => global_id_B0_merge_out_global_id_0,
        in_global_id_1 => global_id_B0_merge_out_global_id_1,
        in_printf_addr_avm_readdata => in_printf_addr_avm_readdata,
        in_printf_addr_avm_readdatavalid => in_printf_addr_avm_readdatavalid,
        in_printf_addr_avm_waitrequest => in_printf_addr_avm_waitrequest,
        in_printf_addr_avm_writeack => in_printf_addr_avm_writeack,
        in_stall_in => global_id_B0_branch_out_stall_out,
        in_unnamed_global_id0_avm_readdata => in_unnamed_global_id0_avm_readdata,
        in_unnamed_global_id0_avm_readdatavalid => in_unnamed_global_id0_avm_readdatavalid,
        in_unnamed_global_id0_avm_waitrequest => in_unnamed_global_id0_avm_waitrequest,
        in_unnamed_global_id0_avm_writeack => in_unnamed_global_id0_avm_writeack,
        in_valid_in => global_id_B0_merge_out_valid_out,
        out_lsu_unnamed_global_id0_o_active => bb_global_id_B0_stall_region_out_lsu_unnamed_global_id0_o_active,
        out_printf_addr_avm_address => bb_global_id_B0_stall_region_out_printf_addr_avm_address,
        out_printf_addr_avm_burstcount => bb_global_id_B0_stall_region_out_printf_addr_avm_burstcount,
        out_printf_addr_avm_byteenable => bb_global_id_B0_stall_region_out_printf_addr_avm_byteenable,
        out_printf_addr_avm_enable => bb_global_id_B0_stall_region_out_printf_addr_avm_enable,
        out_printf_addr_avm_read => bb_global_id_B0_stall_region_out_printf_addr_avm_read,
        out_printf_addr_avm_write => bb_global_id_B0_stall_region_out_printf_addr_avm_write,
        out_printf_addr_avm_writedata => bb_global_id_B0_stall_region_out_printf_addr_avm_writedata,
        out_stall_out => bb_global_id_B0_stall_region_out_stall_out,
        out_unnamed_global_id0_avm_address => bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_address,
        out_unnamed_global_id0_avm_burstcount => bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_burstcount,
        out_unnamed_global_id0_avm_byteenable => bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_byteenable,
        out_unnamed_global_id0_avm_enable => bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_enable,
        out_unnamed_global_id0_avm_read => bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_read,
        out_unnamed_global_id0_avm_write => bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_write,
        out_unnamed_global_id0_avm_writedata => bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_writedata,
        out_valid_out => bb_global_id_B0_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- out_lsu_unnamed_global_id0_o_active(GPOUT,18)
    out_lsu_unnamed_global_id0_o_active <= bb_global_id_B0_stall_region_out_lsu_unnamed_global_id0_o_active;

    -- out_printf_addr_avm_address(GPOUT,19)
    out_printf_addr_avm_address <= bb_global_id_B0_stall_region_out_printf_addr_avm_address;

    -- out_printf_addr_avm_burstcount(GPOUT,20)
    out_printf_addr_avm_burstcount <= bb_global_id_B0_stall_region_out_printf_addr_avm_burstcount;

    -- out_printf_addr_avm_byteenable(GPOUT,21)
    out_printf_addr_avm_byteenable <= bb_global_id_B0_stall_region_out_printf_addr_avm_byteenable;

    -- out_printf_addr_avm_enable(GPOUT,22)
    out_printf_addr_avm_enable <= bb_global_id_B0_stall_region_out_printf_addr_avm_enable;

    -- out_printf_addr_avm_read(GPOUT,23)
    out_printf_addr_avm_read <= bb_global_id_B0_stall_region_out_printf_addr_avm_read;

    -- out_printf_addr_avm_write(GPOUT,24)
    out_printf_addr_avm_write <= bb_global_id_B0_stall_region_out_printf_addr_avm_write;

    -- out_printf_addr_avm_writedata(GPOUT,25)
    out_printf_addr_avm_writedata <= bb_global_id_B0_stall_region_out_printf_addr_avm_writedata;

    -- out_stall_out_0(GPOUT,26)
    out_stall_out_0 <= global_id_B0_merge_out_stall_out_0;

    -- out_unnamed_global_id0_avm_address(GPOUT,27)
    out_unnamed_global_id0_avm_address <= bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_address;

    -- out_unnamed_global_id0_avm_burstcount(GPOUT,28)
    out_unnamed_global_id0_avm_burstcount <= bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_burstcount;

    -- out_unnamed_global_id0_avm_byteenable(GPOUT,29)
    out_unnamed_global_id0_avm_byteenable <= bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_byteenable;

    -- out_unnamed_global_id0_avm_enable(GPOUT,30)
    out_unnamed_global_id0_avm_enable <= bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_enable;

    -- out_unnamed_global_id0_avm_read(GPOUT,31)
    out_unnamed_global_id0_avm_read <= bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_read;

    -- out_unnamed_global_id0_avm_write(GPOUT,32)
    out_unnamed_global_id0_avm_write <= bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_write;

    -- out_unnamed_global_id0_avm_writedata(GPOUT,33)
    out_unnamed_global_id0_avm_writedata <= bb_global_id_B0_stall_region_out_unnamed_global_id0_avm_writedata;

    -- out_valid_out_0(GPOUT,34)
    out_valid_out_0 <= global_id_B0_branch_out_valid_out_0;

END normal;
