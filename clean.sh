tput setaf 6
setterm -bold 
echo "**** Cleaning ****"
if test -d ramdisk
then rm -rf ramdisk
fi
if test -d kernel
then rm -rf kernel
fi
if test -d out
then rm -rf out
fi
if test -f boot.img
then rm boot.img
fi
echo "* All done! Press enter key to exit!"
read ANS
