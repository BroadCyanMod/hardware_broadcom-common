ifneq (,$(filter bcm4325 bcm4329,$(BOARD_WLAN_DEVICE)))
    include $(call all-subdir-makefiles)
endif
