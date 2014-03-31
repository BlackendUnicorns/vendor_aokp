# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell vendor/sinful/tools/getdate)

ifneq ($(SINFUL_BUILD),)
	# AOKP_BUILD=<goo version int>/<build string>
	PRODUCT_PROPERTY_OVERRIDES += \
	    ro.goo.developerid=sinful \
	    ro.goo.rom=sinful-unicorns \
	    ro.goo.version=$(shell echo $(SINFUL_BUILD) | cut -d/ -f1) \
		ro.sinful.version=$(TARGET_PRODUCT)_jb_$(shell echo $(SINFUL_BUILD) | cut -d/ -f2)
else
	PRODUCT_PROPERTY_OVERRIDES += \
		ro.sinful.version=$(TARGET_PRODUCT)_unofficial_$(DATE)
endif

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.camera-sound=1
