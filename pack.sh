# Script Pack zImage + Randisk
# By Rachit Rawat
# @XDA
tput setaf 6
setterm -bold 
echo "**** IMAGE PACKER SCRIPT ****"
echo "**** FOR Xperia ****"
echo "**** By Rachit Rawat ****"
tput sgr0 
setterm -bold
echo "Checking zImage in kernel/zImage"
if test -e kernel/zImage
   then echo "zImage found"
else echo "Kernel not found!"
   tput sgr0
   exit 
fi
echo "Checking Ramdisk"
if test -d ramdisk 
then echo "Ramdisk found" 
else echo "Ramdisk not found!"
tput sgr0
exit 
fi

echo "zImage + ramdisk found, preparing ramdisk"
sleep 2 
./tools/mkbootfs ramdisk | gzip > ramdisk.gz
sleep 2
echo "Packing final Kernel (boot.img) "
mkdir -p out
./tools/mkbootimg --kernel kernel/zImage --ramdisk ramdisk.gz -o out/boot.img --base 0x00200000 --pagesize 4096
sleep 2
setterm -bold 
rm ramdisk.gz
echo "boot.img ready!"
tput sgr0
setterm -bold
echo "All Done, press enter to exit"
tput sgr0
read ANS
