$(call inherit-product, vendor/cvpcs/products/cvpcs_gem.mk)

# set up version info
include vendor/cvpcs/products/cvpcs_version.mk
build_name := Ruby
build_version := $(build_version_major).$(build_version_minor).$(build_version_revision)_alpha4

PRODUCT_NAME := cvpcs_ruby_inc
PRODUCT_BRAND := htc
PRODUCT_DEVICE := inc
PRODUCT_MODEL := ADR6300
PRODUCT_MANUFACTURER := HTC

product_version := $(build_name)-$(build_version)-$(PRODUCT_MODEL)

PRODUCT_BUILD_PROP_OVERRIDES := \
        BUILD_DATE_UTC=1278156269 \
        BUILD_DISPLAY_ID=FRF91 \
        BUILD_FINGERPRINT=verizon_wwe/inc/inc/inc:2.2/FRF91/212490:user/release-keys \
        BUILD_ID=FRF91 \
        BUILD_NUMBER=204569 \
        BUILD_VERSION_TAGS=release-keys \
        PRIVATE_BUILD_DESC="3.16.605.0 CL203589 release-keys" \
        PRODUCT_NAME=inc \
        PRODUCT_BRAND=verizon_wwe \
        TARGET_DEVICE=inc \
        TARGET_BUILD_TYPE=user \
        USER=android-build

# copy some prebuilts
PRODUCT_COPY_FILES +=  \
	vendor/cvpcs/prebuilt/htc/inc/system/media/bootanimation.zip:system/media/bootanimation.zip

# some standard overrides
PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=$(product_version) \
	ro.rommanager.developerid=cvpcs \
	ro.cvpcs.build.name=$(build_name) \
	ro.cvpcs.build.version=$(build_version) \
	ro.cvpcs.scriptybox.files_url=http://files.ccroms.net/ruby/froyo/$(build_version)

# use edify ota script (for whatever reason)
TARGET_OTA_SCRIPT_MODE := edify

# disable building/inclusion of a recovery image
TARGET_NO_RECOVERY := true

# we have a camera, don't stubbify
USE_CAMERA_STUB := false

# include proprietaries for now
USE_PROPRIETARIES := \
	htc

# include the device makefile
$(call inherit-product, device/htc/inc/device.mk)
