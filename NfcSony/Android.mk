LOCAL_PATH:= $(call my-dir)

#####################################
# Sony Configuration
#####################################
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
        $(call all-java-files-under, src)

LOCAL_SRC_FILES += \
        $(call all-java-files-under, sony)

LOCAL_PACKAGE_NAME := NfcSony
LOCAL_OVERRIDES_PACKAGES := Nfc
LOCAL_CERTIFICATE := platform

LOCAL_PROGUARD_ENABLED := disabled

include $(BUILD_PACKAGE)

include $(call all-makefiles-under,$(LOCAL_PATH))
