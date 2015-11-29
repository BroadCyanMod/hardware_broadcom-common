ifneq ($(filter bcm21553,$(TARGET_BOARD_PLATFORM)),)
include $(call all-named-subdir-makefiles,libbt-vendor)
endif
