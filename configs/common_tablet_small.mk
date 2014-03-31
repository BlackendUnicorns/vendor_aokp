# Inherit common tuff
$(call inherit-product, vendor/sinful/configs/common.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/sinful/overlay/common_tablets_small

PRODUCT_PACKAGES += \
    NovaLauncher

# Inherit drm blobs
-include vendor/sinful/configs/common_drm_tablet.mk

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf
