LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

LOCAL_MODULE                  := hwcomposer.$(TARGET_BOARD_PLATFORM)
LOCAL_LICENSE_KINDS           := SPDX-license-identifier-Apache-2.0 SPDX-license-identifier-BSD legacy_not_a_contribution
LOCAL_LICENSE_CONDITIONS      := by_exception_only not_allowed notice

ifneq ($(TARGET_IS_HEADLESS), true)
LOCAL_MODULE_PATH_32          := $(TARGET_OUT_VENDOR)/lib
LOCAL_MODULE_PATH_64          := $(TARGET_OUT_VENDOR)/lib64
endif

LOCAL_MODULE_RELATIVE_PATH    := hw
LOCAL_PROPRIETARY_MODULE      := true
LOCAL_MODULE_TAGS             := optional
LOCAL_SHARED_LIBRARIES        := $(common_libs) libEGL liboverlay \
                                 libhdmi libqdutils libhardware_legacy \
                                 libdl libmemalloc libqservice libsync \
                                 libbinder libmedia libhwui

LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"qdhwcomposer\" \
                                 -Wno-sign-conversion -Wno-float-conversion -Wno-sizeof-array-argument -Wno-pointer-bool-conversion
LOCAL_HEADER_LIBRARIES        := display_headers generated_kernel_headers

#Enable Dynamic FPS if PHASE_OFFSET is not set
ifeq ($(VSYNC_EVENT_PHASE_OFFSET_NS),)
    LOCAL_CFLAGS += -DDYNAMIC_FPS
endif

LOCAL_SRC_FILES               := hwc.cpp          \
                                 hwc_utils.cpp    \
                                 hwc_uevents.cpp  \
                                 hwc_vsync.cpp    \
                                 hwc_fbupdate.cpp \
                                 hwc_mdpcomp.cpp  \
                                 hwc_copybit.cpp  \
                                 hwc_qclient.cpp  \
                                 hwc_dump_layers.cpp \
                                 hwc_ad.cpp \
                                 hwc_virtual.cpp
include $(BUILD_SHARED_LIBRARY)
