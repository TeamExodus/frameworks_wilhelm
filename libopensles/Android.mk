LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:=                     \
        OpenSLES_IID.c                \
        MPH_to.c                      \
        devices.c                     \
        locks.c                       \
        sles_cpp.cpp                  \
        sles_to_android.cpp           \
        sles_check_audioplayer.cpp    \
        I3DCommit.c                   \
        I3DDoppler.c                  \
        I3DGrouping.c                 \
        I3DLocation.c                 \
        I3DMacroscopic.c              \
        I3DSource.c                   \
        IAudioDecoderCapabilities.c   \
        IAudioEncoder.c               \
        IAudioEncoderCapabilities.c   \
        IAudioIODeviceCapabilities.c  \
        IBassBoost.c                  \
        IBufferQueue.c                \
        IDeviceVolume.c               \
        IDynamicInterfaceManagement.c \
        IDynamicSource.c              \
        IEffectSend.c                 \
        IEngine.c                     \
        IEngineCapabilities.c         \
        IEnvironmentalReverb.c        \
        IEqualizer.c                  \
        ILEDArray.c                   \
        IMIDIMessage.c                \
        IMIDIMuteSolo.c               \
        IMIDITempo.c                  \
        IMIDITime.c                   \
        IMetadataExtraction.c         \
        IMetadataTraversal.c          \
        IMuteSolo.c                   \
        IObject.c                     \
        IOutputMix.c                  \
        IPitch.c                      \
        IPlay.c                       \
        IPlaybackRate.c               \
        IPrefetchStatus.c             \
        IPresetReverb.c               \
        IRatePitch.c                  \
        IRecord.c                     \
        ISeek.c                       \
        IThreadSync.c                 \
        IVibra.c                      \
        IVirtualizer.c                \
        IVisualization.c              \
        IVolume.c

LOCAL_C_INCLUDES:= \
	$(JNI_H_INCLUDE) \
	$(TOP)/system/media/opensles/include

LOCAL_CFLAGS += -DUSE_ANDROID

LOCAL_SHARED_LIBRARIES := \
        libmedia          \
        libutils          \
        libcutils

ifeq ($(TARGET_OS)-$(TARGET_SIMULATOR),linux-true)
        LOCAL_LDLIBS += -lpthread -ldl
        LOCAL_SHARED_LIBRARIES += libdvm
        LOCAL_CPPFLAGS += -DANDROID_SIMULATOR
endif

LOCAL_CFLAGS += -Wno-override-init

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_SHARED_LIBRARIES += libdl
endif

ifeq ($(TARGET_OS)-$(TARGET_SIMULATOR),linux-true)
        LOCAL_LDLIBS += -lpthread
endif

LOCAL_PRELINK_MODULE:= false

LOCAL_MODULE:= libopensles

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))
