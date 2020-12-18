# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

DEVICE_PATH := device/samsung/js01lte

TARGET_OTA_ASSERT_DEVICE := js01lte,js01ltedcm,hltejs01dcm,sc02f,SC-02F,SGH-N075

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974

# Filesystem
TARGET_FS_CONFIG_GEN += $(DEVICE_PATH)/config.fs

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
ifeq ($(RECOVERY_VARIANT),twrp)
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
endif
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_RAMDISK_USE_XZ := true
ifneq ($(RECOVERY_VARIANT),twrp)
TARGET_KERNEL_CONFIG := lineage_js01lte_defconfig
endif
ifeq ($(RECOVERY_VARIANT),twrp)
TARGET_KERNEL_CONFIG := twrp_js01lte_defconfig
endif
TARGET_KERNEL_SOURCE := kernel/samsung/msm8974


# Audio
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/vnd_js01lte.txt
BOARD_HAVE_BLUETOOTH_BCM := true

# Encryption
TARGET_KEYMASTER_SKIP_WAITING_FOR_QSEE := true

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Legacy BLOB Support
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib/hw/camera.vendor.msm8974.so|libshim_camera.so \
    /system/vendor/lib/libperipheral_client.so|libshim_binder.so
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/hw/android.hardware.sensors@1.0-service.samsung8974=22 \
    /system/vendor/bin/mm-qcamera-daemon=22 \
    /system/vendor/bin/hw/rild=27

# NFC
#BOARD_NFC_HAL_SUFFIX := msm8974

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336
BOARD_CACHEIMAGE_PARTITION_SIZE := 322122752
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13631488
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2480344064
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28273097728 # 28273114112 - 16384
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ROOT_EXTRA_FOLDERS := efs firmware firmware-modem
BOARD_ROOT_EXTRA_SYMLINKS := \
    /data/tombstones:/tombstones
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Radio
BOARD_PROVIDES_LIBRIL := true

#RECOVERY_VARIANT := twrp
# Recovery
ifneq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
endif
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
# TWRP Recovery
ifeq ($(RECOVERY_VARIANT),twrp)
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.sys.usb.config=adb
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.twrp
DEVICE_RESOLUTION := 1080x1920
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_THEME := portrait_hdpi
#TW_EXTRA_LANGUAGES := true
#TW_DEFAULT_LANGUAGE := ja
# BRIGHTNESS causes twrp not booting up
#TW_BRIGHTNESS_PATH := "/sys/devices/mdp.0/qcom\x2cmdss_fb_primary.190/leds/lcd-backlight/brightness"
#TW_MAX_BRIGHTNESS := 255
TW_MTP_DEVICE := "/dev/mtp_usb"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_SUPERSU := true
TW_USE_MINUI_CUSTOM_FONTS := true
TW_USE_TOOLBOX := true
BOARD_GLOBAL_CFLAGS += -DTW_USE_MINUI_CUSTOM_FONTS
endif

# SELinux
include $(DEVICE_PATH)/sepolicy/sepolicy.mk

# Wifi
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/vendor/etc/wifi/bcmdhd_sta.bin nvram_path=/vendor/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/vendor/etc/wifi/bcmdhd_apsta.bin nvram_path=/vendor/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/etc/wifi/bcmdhd_apsta.bin"

# inherit from the proprietary version
-include vendor/samsung/js01lte/BoardConfigVendor.mk
