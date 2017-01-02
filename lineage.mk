$(call inherit-product, device/samsung/js01lte/full_js01lte.mk)

$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_DEVICE := js01lte
PRODUCT_NAME := lineage_js01lte

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=js01lte \
    PRODUCT_DEVICE=js01lte \
    TARGET_DEVICE=js01lte \
    PRODUCT_MODEL=SC-02F \
    BUILD_FINGERPRINT=samsung/SC-02F/SC-02F:5.0/LRX21V/SC02FOMSGPL2:user/release-keys \
    PRIVATE_BUILD_DESC="hltejs01dcm-user 5.0 LRX21V SC02FOMSGPL2 release-keys"
