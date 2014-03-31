$(call inherit-product-if-exists, vendor/sinful/prebuilt/prebuilts.mk)

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/sinful/overlay/common

# T-Mobile theme engine
include vendor/sinful/configs/themes_common.mk

PRODUCT_PACKAGES += \
    AOKPtips \
    AppWidgetPicker \
    LatinImeDictionary \
    Microbes \
    MusicFX \
    MusicVisualization \
    NoiseField \
    PhaseBeam \
    ROMControl \
    SuperSU \
    SwagPapers \
    UnicornPorn

# Use prebuilt su until fixed when built
PRODUCT_COPY_FILES += \
    vendor/sinful/prebuilt/common/xbin/su:system/xbin/su

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enterprise_mode=1 \
    windowsmgr.max_events_per_sec=240 \
    ro.kernel.android.checkjni=0

PRODUCT_COPY_FILES += \
    vendor/sinful/prebuilt/common/lib/libmicrobes_jni.so:system/lib/libmicrobes_jni.so \
    vendor/sinful/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/sinful/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# init.d
PRODUCT_COPY_FILES += \
    vendor/sinful/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/sinful/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/sinful/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/sinful/prebuilt/common/bin/sysinit:system/bin/sysinit

# backuptool
PRODUCT_COPY_FILES += \
    vendor/sinful/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/sinful/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/sinful/prebuilt/common/addon.d/70-backup.sh:system/addon.d/70-backup.sh

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    libssh \
    ssh \
    sshd \
    sshd-config \
    ssh-keygen \
    sftp \
    scp

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Scarabaeus.ogg \
    ro.config.notification_sound=Antimony.ogg \
    ro.config.alarm_alert=Scandium.ogg

PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Paranoid Android Features
PRODUCT_COPY_FILES += \
    vendor/sinful/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/sinful/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

# ParanoidAndroid Packages
PRODUCT_PACKAGES += \
    ParanoidPreferences \

# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/sinful/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/sinful/overlay/$(TARGET_PRODUCT)

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/sinful/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

PRODUCT_COPY_FILES += \
    vendor/sinful/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/sinful/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

# Inherit common build.prop overrides
-include vendor/sinful/configs/common_versions.mk
