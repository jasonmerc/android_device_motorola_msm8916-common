LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
    system/media/camera/include \
    frameworks/native/include/media/openmax

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libutils libcutils

ifneq ($(filter harpia lux, $(TARGET_DEVICE)),)
LOCAL_CFLAGS += -DCLOSE_NATIVE_HANDLE
endif

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
