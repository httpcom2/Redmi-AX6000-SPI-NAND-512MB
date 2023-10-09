## --------------atf config----------------
## 关闭atf里的NMBM，不然可能与uboot的NMBM冲突，只能启动一次，重启后卡在BL2的NMBM初始化，同时修改spim-nand的类型为spim:4k+256
echo '# CONFIG_NMBM is not set' >> atf-20220606-637ba581b/configs/mt7986_redmi_ax6000_defconfig
echo 'CONFIG_SPIM_NAND_TYPE="spim:4k+256"' >> atf-20220606-637ba581b/configs/mt7986_redmi_ax6000_defconfig
## ----------------------------------------

## --------------uboot config----------------
## 在CONFIG_ENABLE_NAND_NMBM后面增加CONFIG_NMBM_MAX_BLOCKS=64，修改默认mtdparts的ubi为490MB即501760k(ubi)
## sed -i -e '/CONFIG_ENABLE_NAND_NMBM=y/ a\CONFIG_NMBM_MAX_BLOCKS=64' uboot-mtk-20220606/configs/mt7986_redmi_ax6000_multi_layout_defconfig
sed -i 's/112640k(ubi)/501760k(ubi)/' uboot-mtk-20220606/configs/mt7986_redmi_ax6000_multi_layout_defconfig
## sed -i 's/"nmbm0:1024k(bl2),256k(Nvram),256k(Bdata),2048k(factory),2048k(fip),256k(crash),256k(crash_log),112640k(ubi)"/"nmbm0:1024k(bl2),256k(Nvram),256k(Bdata),2048k(factory),2048k(fip),256k(crash),256k(crash_log),112640k(ubi),389120k(ubi2)"/' uboot-mtk-20220606/configs/mt7986_redmi_ax6000_defconfig
## sed -i -e '/CONFIG_ENABLE_NAND_NMBM=y/ a\CONFIG_NMBM_MAX_BLOCKS=64' uboot-mtk-20220606/configs/mt7986_redmi_ax6000_multi_layout_defconfig
## ----------------------------------------

## 修改nandinfo为4k+256，这个可有可无，不影响
## sed -i 's/nandinfo=2k+64/nandinfo=4k+256/' uboot-mtk-20220606/arch/arm/mach-mediatek/Kconfig
