display-hals := libgralloc libcopybit libmemtrack libqservice
display-hals += libhwcomposer liboverlay libqdutils libhdmi
ifneq ($(TARGET_PROVIDES_LIBLIGHT),true)
    display-hals += liblight
endif

ifeq ($(call is-vendor-board-platform,QCOM),true)
    include $(call all-named-subdir-makefiles,$(display-hals))
else
ifneq ($(filter msm% apq%,$(TARGET_BOARD_PLATFORM)),)
    include $(call all-named-subdir-makefiles,$(display-hals))
endif
endif

include $(CLEAR_VARS)
LOCAL_MODULE := display_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := \
    $(display_top)/libgralloc \
    $(display_top)/liboverlay \
    $(display_top)/libcopybit \
    $(display_top)/libqdutils \
    $(display_top)/libhwcomposer \
    $(display_top)/libhdmi \
    $(display_top)/libqservice

include $(BUILD_HEADER_LIBRARY)
