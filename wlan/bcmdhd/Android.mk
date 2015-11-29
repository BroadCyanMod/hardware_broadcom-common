ifneq (,$(filter bcm4330 bcmdhd,$(BOARD_WLAN_DEVICE)))
    include $(call all-subdir-makefiles)
endif
