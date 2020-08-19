#!/data/data/com.termux/files/usr/bin/bash

directory="$(pwd)"
ECHO=$(true)
for arg in $@; do
  case "$arg" in
    -q); ECHO=$(false) ;;
esac;done

if [ $ECHO ]; then
  echo
  echo -e "\e[93mThis script will install ADB & FastBoot Tools in Termux."
  echo
fi
echo -e "\e[32m[*] \e[34mDownloading wrapper and binaries..."

downpath="$PREFIX/tmp/adbtemp"
mkdir "$downpath"
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/adb -P $downpath/ -q
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/adb.bin -P $downpath/ -q
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/fastboot -P $downpath/ -q
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/fastboot-armeabi -P $downpath/ -q

if [ $ECHO ]; then echo -e "\e[32m[*] \e[34mCopying files to bin...";fi
cp $downpath/* $PREFIX/bin 
files="$(ls $downpath)"
cd $PREFIX/bin
chmod +x $files

if [ $ECHO ]; then echo -e "\e[32m[*] \e[34mCreating workspace directory...";fi
cd $HOME
if [ ! -d "adbfiles" ]; then
  mkdir adbfiles
fi

if [ $ECHO ]; then echo -e "\e[32m[*] \e[34mCleaning up...";fi
cd $directory
rm -rf $downpath
rm -rf InstallTools.sh
echo
echo -e "\e[32mTools were successfully installed!\e[39m"
echo
