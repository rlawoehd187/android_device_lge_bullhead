LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

LOCAL_MODULE                  := libqservice
LOCAL_PROPRIETARY_MODULE      := true
LOCAL_LICENSE_KINDS           := SPDX-license-identifier-Apache-2.0 SPDX-license-identifier-BSD legacy_not_a_contribution
LOCAL_LICENSE_CONDITIONS      := by_exception_only not_allowed notice
LOCAL_MODULE_TAGS             := optional

ifneq ($(TARGET_IS_HEADLESS), true)
LOCAL_MODULE_PATH_32          := $(TARGET_OUT_VENDOR)/lib
LOCAL_MODULE_PATH_64          := $(TARGET_OUT_VENDOR)/lib64
endif

LOCAL_HEADER_LIBRARIES        := display_headers generated_kernel_headers
LOCAL_SHARED_LIBRARIES        := $(common_libs) libbinder
LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"qdqservice\" -DDO_NOT_CHECK_MANUAL_BINDER_INTERFACES
LOCAL_CFLAGS                  += -Wno-error
LOCAL_SRC_FILES               := QService.cpp \
                                 IQService.cpp \
                                 IQClient.cpp


include $(BUILD_SHARED_LIBRARY)
