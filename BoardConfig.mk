# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common msm8974
-include device/samsung/msm8974-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/ks01lte

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Compiler
# L1/L2 cache size parameters by @JustArchi
BOARD_GLOBAL_CFLAGS := --param l1-cache-size=16 --param l1-cache-line-size=16 --param l2-cache-size=2048

TARGET_OTA_ASSERT_DEVICE := ks01ltexx,GT-I9506,ks01lte,ks01lteskt,ks01ltektt

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974

# Kernel
TARGET_KERNEL_CONFIG := msm8974_sec_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8974_sec_hlte_eur_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/hlte
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000 --second_offset 0x00f00000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/ks01lte/mkbootimg.mk
#KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/linaro-lto/bin
#KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

# Audio
QCOM_CSDCLIENT_ENABLED := false
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := false
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := false

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Bluetooth
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bluetooth/vnd_ks01lte.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
BOARD_HAVE_BLUETOOTH_BCM := true

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# CMHW
BOARD_HARDWARE_CLASS += device/samsung/ks01lte/cmhw
BOARD_HARDWARE_CLASS += hardware/samsung/cmhw

# RIL Class (for correct tech assignment)
BOARD_RIL_CLASS := ../../../device/samsung/ks01lte/ril

# Graphics
TARGET_HAVE_NEW_GRALLOC := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
BOARD_NFC_HAL_SUFFIX := msm8974

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
ifeq ($(HOST_OS),linux)
TARGET_USERIMAGES_USE_F2FS := true
endif
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2390753280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12685655040
BOARD_FLASH_BLOCK_SIZE := 131072

# Power HAL
TARGET_POWERHAL_VARIANT := qcom
TARGET_USES_CPU_BOOST_HINT := true
TARGET_POWERHAL_SET_INTERACTIVE_EXT := device/samsung/ks01lte/power/power_ext.c

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# SELinux
-include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/samsung/ks01lte/sepolicy
BOARD_SEPOLICY_UNION += \
    bluetooth.te \
    device.te \
    file_contexts \
    file.te \
    genfs_contexts \
    healthd.te \
    hostapd.te \
    init.te \
    insthk.te \
    keystore.te \
    macloader.te \
    mediaserver.te \
    mm-pp-daemon.te \
    mm-qcamerad.te \
    mpdecision.te \
    property_contexts \
    property.te \
    rild.te \
    rmt_storage.te \
    sensorhubservice.te \
    service.te \
    service_contexts \
    system_app.te \
    system_server.te \
    tee.te \
    thermal-engine.te \
    time_daemon.te \
    ueventd.te \
    vold.te \
    wpa.te

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"

# inherit from the proprietary version
-include vendor/samsung/ks01lte/BoardConfigVendor.mk
