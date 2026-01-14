module.exports = {
  expo: {
    name: "Cartoon Video Messenger",
    slug: "cartoon-video-messenger",
    version: "1.0.0",
    orientation: "portrait",
    userInterfaceStyle: "light",
    assetBundlePatterns: ["**/*"],
    ios: {
      supportsTablet: true,
      bundleIdentifier: "com.cartoonvideomessenger.app",
      infoPlist: {
        NSCameraUsageDescription: "This app needs access to your camera to record video messages with cartoon filters.",
        NSMicrophoneUsageDescription: "This app needs access to your microphone to record audio with video messages.",
        NSPhotoLibraryUsageDescription: "This app needs access to your photo library to save recorded videos.",
      },
    },
    android: {
      adaptiveIcon: {
        backgroundColor: "#ffffff",
      },
      package: "com.cartoonvideomessenger.app",
      versionCode: 1,
      permissions: [
        "CAMERA",
        "RECORD_AUDIO",
        "READ_EXTERNAL_STORAGE",
        "WRITE_EXTERNAL_STORAGE",
      ],
    },
    web: {},
    plugins: [
      [
        "expo-camera",
        {
          cameraPermission: "Allow $(PRODUCT_NAME) to access your camera",
          microphonePermission: "Allow $(PRODUCT_NAME) to access your microphone",
          recordAudioAndroid: true,
        },
      ],
      [
        "expo-av",
        {
          microphonePermission: "Allow $(PRODUCT_NAME) to access your microphone.",
        },
      ],
      "expo-media-library",
    ],
    extra: {
      eas: {
        projectId: "f9b52177-1aa2-4dc7-8c14-dd696be9b5ec",
      },
    },
  },
};
