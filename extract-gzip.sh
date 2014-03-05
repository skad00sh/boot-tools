# Script to unpack Xperia Kernel
# Rachit Rawat
# @XDA
tput setaf 6
setterm -bold 
echo "******************************"
echo "**** Kernel Unpack Script ****"
echo "**** For Xperia **************"
echo "**** By Shivam Kuchhal *******"
echo "******************************"
tput sgr0 
setterm -bold 
tput setaf 1
echo "**** Delete existing files ****"
if test -d ramdisk
then rm -rf ramdisk
fi
if test -d kernel
then rm -rf kernel
fi
if test -d out
then rm -rf out
fi
tput setaf 6
echo "* Place boot.img in working directory and press enter"
echo "* Ignore if already placed"
read ANS
if test -e boot.img
  then
   mkdir kernel
   mkdir ramdisk
   mkdir -p unpack
   echo "Extracting zImage + Ramdisk" 
   ./tools/unpackbootimg -i boot.img -o unpack 
   cp unpack/boot.img-zImage kernel/zImage 
   rm unpack/boot.img-zImage
   echo "Extracting Ramdisk" 
   cd ramdisk
   gzip -dc ../unpack/boot.img-ramdisk.gz | cpio -i 
   cd .. 
   rm -rf unpack
   tput setaf 2
   echo "Extracted zImage is in kernel/zImage"
   echo "Extracted Ramdisk is in ramdisk folder" 
tput sgr0
else echo "boot.img not found! (TIP:Try renaming xyz.img to boot.img)"
fi
echo "All Done, press enter to exit"
read ANS
