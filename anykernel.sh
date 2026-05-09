### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=JandaX Kernel for garnet
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=garnet
device.name2=garnet
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
# boot shell variables
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
split_boot;
flash_boot;
## end boot install


## dtbo install
BLOCK=dtbo;
IS_SLOT_DEVICE=1;

reset_ak;
flash_boot;
## end dtbo install


## vendor_dlkm install
BLOCK=vendor_dlkm;
IS_SLOT_DEVICE=1;

reset_ak;
flash_boot;
## end vendor_dlkm install
