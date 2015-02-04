$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/samsung/galaxys2plus-common/galaxys2plus-common-vendor.mk)

COMMON_PATH := device/samsung/galaxys2plus-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

PRODUCT_LOCALES += hdpi

# Boot animation
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Ramdisk
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/ramdisk/init.bcm281x5.usb.rc:root/init.bcm281x5.usb.rc \
	$(COMMON_PATH)/ramdisk/init.log.rc:root/init.log.rc

# Filesystem management tools
PRODUCT_PACKAGES += \
	setup_fs

# Wi-Fi
PRODUCT_PACKAGES += \
	dhcpcd.conf \
	hostapd \
	wpa_supplicant \
	wpa_supplicant.conf

PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

# GPS
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/configs/gps.cer:system/bin/gps.cer \
	$(COMMON_PATH)/configs/gps.conf:system/etc/gps.conf \
	$(COMMON_PATH)/configs/glconfig.xml:system/etc/gps/glconfig.xml

# Audio modules
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default

# Audio configuration
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

USE_CUSTOM_AUDIO_POLICY := 1

# Media
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(COMMON_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/keylayouts/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	$(COMMON_PATH)/keylayouts/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
	$(COMMON_PATH)/keylayouts/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(COMMON_PATH)/keylayouts/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
	$(COMMON_PATH)/keylayouts/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
	$(COMMON_PATH)/keylayouts/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl

# Packages
PRODUCT_PACKAGES += \
	SamsungServiceMode \
	charger_res_images \
	com.android.future.usb.accessory

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Properties
# Camera
PRODUCT_PROPERTY_OVERRIDES += \
	camera2.portability.force_api=1

# Logging
PRODUCT_PROPERTY_OVERRIDES += \
	persist.brcm.log=none \
	persist.brcm.ap_crash=none \
	persist.brcm.cp_crash=none

# HDCP on
PRODUCT_PROPERTY_OVERRIDES += \
	persist.brcm.gralloc.force_hdcp=1

# Media
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.media.use-awesome=true

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
	mobiledata.interfaces=rmnet0 \
	ro.telephony.ril_class=SamsungBCMRIL \
	ro.ril.hsxpa=1 \
	ro.ril.gprsclass=10 \
	ro.telephony.call_ring=0 \
	ro.telephony.call_ring.multiple=0

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
	brcm.hwc.no-hdmi-trans=1 \
	debug.hwui.render_dirty_regions=false \
	ro.opengles.version=131072 \
	ro.zygote.disable_gl_preload=1

# TV out
PRODUCT_PROPERTY_OVERRIDES += \
	ro.tvout.enable=true

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0

# FM Radio SNR
PRODUCT_PROPERTY_OVERRIDES += \
	service.brcm.fm.start_snr=41 \
	service.brcm.fm.stop_snr=20

# Override phone-hdpi-512-dalvik-heap to match value on stock
# - helps pass CTS com.squareup.okhttp.internal.spdy.Spdy3Test#tooLargeDataFrame)
# (property override must come before included property)
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapgrowthlimit=56m

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.checkjni=false \
	ro.kernel.android.checkjni=0

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

