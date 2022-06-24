#! /bin/sh
cd ~
git clone https://github.com/thepriyanshujangid/repo
cd ~/repo
sudo mv repo /bin

sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\*
sudo apt-get update
sudo apt-get install openjdk-8-jdk

sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig bison g++-multilib git gperf libxml2-utils make zlib1g-dev zip liblz4-tool

cd ~

mkdir  ~/local_manifests/
echo '<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="LineageOS/android_device_motorola_titan" path="device/motorola/titan" remote="github" />
  <project name="LineageOS/android_device_motorola_msm8226-common" path="device/motorola/msm8226-common" remote="github" />
  <project name="LineageOS/android_device_qcom_common" path="device/qcom/common" remote="github" />
  <project name="LineageOS/android_kernel_motorola_msm8226" path="kernel/motorola/msm8226" remote="github" />
  <project name="LineageOS/android_packages_resources_devicesettings" path="packages/resources/devicesettings" remote="github" />

  <project name="TheMuppets/proprietary_vendor_motorola" path="vendor/motorola" remote="github" />
  <project name="TheMuppets/proprietary_vendor_qcom_binaries" path="vendor/qcom/binaries" remote="github" />
</manifest>' >>   ~/local_manifests/roomservice.xml


cd ~
mkdir android
cd android 
git config --global user.email "priyanshu199917@gmail.com"
git config --global user.name "priyanshu jangid"
repo init -u https://github.com/LineageOS/android.git -b cm-14.1 --depth=1
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
ccache -o compression=true
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

repo sync -j$(nproc)
exit

