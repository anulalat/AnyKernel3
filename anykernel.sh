### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=Caca 5.4 Kernel for Redmi Note 9 Pro [joyeuse]
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=joyeuse
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# boot shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

## AnyKernel boot install
# Keep the stock ramdisk untouched so the vendor edl/charger binary survives,
# then let magiskboot unpack/repack: it re-signs AVB exactly like the vendor
# boot.img. A raw dd of an unsigned image trips "System has been destroyed".
KEEPVERITY=true;
KEEPFORCEENCRYPT=true;
export KEEPVERITY KEEPFORCEENCRYPT;

dump_boot;
write_boot;
## end boot install
