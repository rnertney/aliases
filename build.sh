#!/bin/tcsh

rm dump.txt

if ( $1 == {clean} ) then
    bar
    echo "cleaning"
    make clean
endif
bar2
make zynq_zc70x_config
make -j15

cp u-boot u-boot.elf

arm-xilinx-eabi-objdump -h u-boot.elf > dump.txt
grep text dump.txt
##############----UBOOT DEBUG------##############
# get size of .text, put into offset size in SDK
# get VMA, add to "bdinfo" line for  reloc_offset from u-boot
# final box is .text

# repeat above for all sections except debug*

# ADDR/0x10_0000 = 1MB page number
# (ADDR/0x10_0000 * 4) TLB address with ADDR's attributes
#
#
#
#

# rea


#void mmu_forbid_region(u32 start, int size)
#{
#  u32 *page_table = (u32 *)gd->arch.tlb_addr;
#  u32 upto, end;
#
#  end = ALIGN(start + size, MMU_SECTION_SIZE) >> MMU_SECTION_SHIFT;
#  start = start >> MMU_SECTION_SHIFT;
#  debug("%s: start=%x, size=%x, option=FORBID\n", __func__, start, size);
#  for (upto = start; upto < end; upto++)
#    forbid_section_dcache(upto);
#  mmu_page_table_flush((u32)&page_table[start], (u32)&page_table[end]);
#}
#
#//TODO:check the shifted
#void forbid_section_dcache(int section)
#{
#   u32 *page_table = (u32 *)gd->arch.tlb_addr;
#   u32 value;
#
#   value = (section << MMU_SECTION_SHIFT);
#   page_table[section] = value;
#}
#
