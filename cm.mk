$(call inherit-product, device/samsung/ks01lte/full_ks01lte.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Custom unofficial build tag
TARGET_UNOFFICIAL_BUILD_ID := temasek

PRODUCT_DEVICE := ks01lte
PRODUCT_NAME := cm_ks01lte

