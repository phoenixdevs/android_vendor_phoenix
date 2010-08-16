$(call inherit-product, vendor/cvpcs/products/cvpcs_generic.mk)

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

# grab hdpi versions of this stuff
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	MagicSmokeWallpapers \
	SoundRecorder \
	VisualizationWallpapers \
	VoiceDialer \
	libRS \
	librs_jni

# include cvpcs-specific packages
PRODUCT_PACKAGES += \
	ADWLauncher \
	CytownPhone \
	EliotStockerMusic \
	GEMSettings

# copy some prebuilts
PRODUCT_COPY_FILES +=  \
	vendor/cvpcs/CHANGELOG:system/etc/CHANGELOG-GEM \
	vendor/cvpcs/prebuilt/common/system/etc/apns-conf.xml:system/etc/apns-conf.xml \
	vendor/cvpcs/prebuilt/common/system/etc/init.d/00_banner:system/etc/init.d/00_banner \
	vendor/cvpcs/prebuilt/common/system/etc/init.d/01_cpufreq:system/etc/init.d/01_cpufreq \
	vendor/cvpcs/prebuilt/common/system/etc/init.d/10_sysrw:system/etc/init.d/10_sysrw \
	vendor/cvpcs/prebuilt/common/system/etc/init.d/11_depmod:system/etc/init.d/11_depmod \
	vendor/cvpcs/prebuilt/common/system/etc/init.d/19_sysro:system/etc/init.d/19_sysro \
	vendor/cvpcs/prebuilt/common/system/etc/init.d/98_cron:system/etc/init.d/98_cron \
	vendor/cvpcs/prebuilt/common/system/etc/init.d/99_ready:system/etc/init.d/99_ready \
	vendor/cvpcs/prebuilt/common/system/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
	vendor/cvpcs/prebuilt/common/system/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
	vendor/cvpcs/prebuilt/common/system/media/audio/ringtones/Hana_Maru_Caramell.ogg:system/media/audio/ringtones/Hana_Maru_Caramell.ogg \
	vendor/cvpcs/prebuilt/common/system/media/audio/notifications/Incoming_Message.ogg:system/media/audio/notifications/Incoming_Message.ogg \
	vendor/cvpcs/prebuilt/inc/system/media/bootanimation.zip:system/media/bootanimation.zip \
	vendor/cvpcs/prebuilt/inc/initrd/init.rc:$(TARGET_ROOT_OUT)/root/init.rc

# some standard overrides
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.notification_sound=Incoming_Message.ogg \
	ro.config.ringtone=Hana_Maru_Caramell.ogg \
	ro.config.alarm_alert=Alarm_Classic.ogg \
	ro.modversion=$(product_version) \
	ro.rommanager.developerid=cvpcs \
	ro.cvpcs.build.name=$(build_name) \
	ro.cvpcs.build.version=$(build_version) \
	ro.cvpcs.scriptybox.files_url=http://files.ccroms.net/ruby/froyo/1.0.0

# use our custom init.rc script for our rootdir
TARGET_PROVIDES_INIT_RC := true

# use edify ota script (for whatever reason)
TARGET_OTA_SCRIPT_MODE := edify

# disable building/inclusion of a recovery image
TARGET_NO_RECOVERY := true

# we have a camera, don't stubbify
USE_CAMERA_STUB := false

# include superuser
PRODUCT_PACKAGES += Superuser

# include proprietaries for now
USE_PROPRIETARIES := \
	htc

# grab some sounds
include frameworks/base/data/sounds/OriginalAudio.mk
include frameworks/base/data/sounds/AudioPackage4.mk

# locales!
PRODUCT_LOCALES := \
	en_US \
	ar_EG \
	ar_IL \
	bg_BG \
	ca_ES \
	cs_CZ \
	da_DK \
	de_AT \
	de_CH \
	de_DE \
	de_LI \
	el_GR \
	en_AU \
	en_CA \
	en_GB \
	en_IE \
	en_IN \
	en_NZ \
	en_SG \
	en_ZA \
	es_ES \
	es_US \
	fi_FI \
	fr_BE \
	fr_CA \
	fr_CH \
	fr_FR \
	he_IL \
	hi_IN \
	hr_HR \
	hu_HU \
	id_ID \
	it_CH \
	it_IT \
	iw_IL \
	ja_JP \
	ko_KR \
	lt_LT \
	lv_LV \
	nb_NO \
	nl_BE \
	nl_NL \
	pl_PL \
	pt_BR \
	pt_PT \
	ro_RO \
	ru_RU \
	sk_SK \
	sl_SI \
	sr_RS \
	sv_SE \
	th_TH \
	tl_PH \
	tr_TR \
	uk_UA \
	vi_VN \
	zh_CN \
	zh_TW

# include the device makefile
$(call inherit-product, device/htc/inc/device.mk)
