# Copyright (C) 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

# The default audio HAL module, which is a stub, that is loaded if no other
# device specific modules are present. The exact load order can be seen in
# libhardware/hardware.c
#
# The format of the name is audio.<type>.<hardware/etc>.so where the only
# required type is 'primary'. Other possibilites are 'a2dp', 'usb', etc.
include $(CLEAR_VARS)

LOCAL_MODULE := hwcomposer.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH := hw/
LOCAL_SRC_FILES :=HwComposer.cpp
LOCAL_SHARED_LIBRARIES := liblog \
			libcutils \
			libbinder \
			libhardware \
			 libsync \
			 libutils \
			 libsync \
			 libion \
			 libEGL \
			 libGLESv2

LOCAL_CFLAGS := -Wno-unused-parameter
LOCAL_C_INCLUDES += \
        $(TOP)/hardware/libhardware/modules/gralloc \
	$(TOP)/hardware/libhardware/include/hardware

include $(BUILD_SHARED_LIBRARY)

