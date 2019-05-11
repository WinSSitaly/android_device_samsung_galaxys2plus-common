# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libbrcm_ril.so \
    ro.telephony.ril_class=SamsungBCMRIL \
    ro.telephony.call_ring.multiple=0 \
    ro.telephony.call_ring=0

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    debug.hwui.render_dirty_regions=false \
    ro.zygote.disable_gl_preload=1 \
    ro.sf.lcd_density=240

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    persist.brcm.log=none \
    persist.brcm.ap_crash=none \
    persist.brcm.cp_crash=none \
    persist.brcm.gralloc.force_hdcp=1 \
    config.disable_atlas=true \
    persist.media.treble_omx=false \
    wifi.interface=wlan0 

# Dalvik heap
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=56m

# Disable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0
	
# KSM
PRODUCT_PROPERTY_OVERRIDES += \
ro.ksm.default=1

# Art
PRODUCT_PROPERTY_OVERRIDES += \
dalvik.vm.dex2oat-swap=false \
dalvik.vm.dex2oat-Xmx=256m

# RAM optimizations
ro.sys.fw.trim_enable_memory=536870912 \
ro.sys.fw.use_trim_settings=true \
ro.sys.fw.empty_app_percent=25 \
ro.sys.fw.trim_empty_percent=50 \
ro.sys.fw.trim_cache_percent=50 \
ro.sys.fw.bg_apps_limit=16 \
ro.sys.fw.bservice_limit=3 \
ro.sys.fw.bservice_age=3000 \
ro.sys.fw.bservice_enable=true	
