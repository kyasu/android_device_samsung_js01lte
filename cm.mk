$(call inherit-product, device/samsung/hltedcm/full_hltedcm.mk)

# Enhanced NFC
#$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_DEVICE := hltedcm
PRODUCT_NAME := cm_hltedcm

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=hltedcm \
    PRODUCT_DEVICE=hltedcm \
    TARGET_DEVICE=hltedcm \
    PRODUCT_MODEL=SC-01F \
    BUILD_FINGERPRINT=samsung/SC-01F/SC-01F:5.0/LRX21V/SC01FOMUGOI4:user/release-keys \
    PRIVATE_BUILD_DESC="hltedcm-user 5.0 LRX21V SC01FOMUGOI4 release-keys"
