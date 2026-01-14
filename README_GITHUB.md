# 🎥 Funny Face Mobile - Cartoon Video Messenger

A React Native mobile app that lets you record video messages with real-time cartoon face filters. Transform yourself into a cartoon character while recording videos!

## 📱 Features

- ✨ **Real-time Cartoon Filters** - Apply cartoon effects to your face in real-time
- 🎭 **Face Tracking** - Filters follow your facial movements
- 📹 **Video Recording** - Record videos up to 60 seconds
- 💾 **Save & Share** - Save videos to your gallery
- 📱 **Cross-Platform** - Works on Android and iOS

## 🚀 Quick Start

### Download APK (Android)

**Latest Release:** [Download APK v1.0.0](https://github.com/afloareioanb-afk/funny-face-mobile/releases/latest)

1. Click the download link above
2. Download the APK file
3. Enable "Install from Unknown Sources" in Android Settings
4. Tap the APK file to install
5. Open the app and grant camera/microphone permissions

### Installation Instructions

#### Android

1. **Download the APK:**
   - Go to [Releases](https://github.com/afloareioanb-afk/funny-face-mobile/releases)
   - Download the latest `app-release.apk`

2. **Enable Unknown Sources:**
   - Go to Settings → Security
   - Enable "Install from Unknown Sources"
   - (Or Settings → Apps → Special Access → Install Unknown Apps)

3. **Install:**
   - Open Downloads folder
   - Tap the APK file
   - Tap "Install"
   - Wait for installation

4. **Open App:**
   - Find "Cartoon Video Messenger" in app drawer
   - Tap to open
   - Grant camera/microphone permissions when asked

## 📋 Requirements

- **Android:** 6.0 (Marshmallow) or higher
- **iOS:** Coming soon
- **Permissions:** Camera and Microphone access

## 🛠️ Development

### Prerequisites

- Node.js 14+
- npm or yarn
- Expo CLI
- Expo account (free)

### Setup

```bash
# Clone repository
git clone https://github.com/afloareioanb-afk/funny-face-mobile.git
cd funny-face-mobile

# Install dependencies
npm install

# Start development server
npm start
```

### Build APK

```bash
# Install EAS CLI
npm install -g eas-cli

# Login to Expo
eas login

# Build Android APK
npm run build:android
```

See [BUILD_ANDROID.md](./BUILD_ANDROID.md) for detailed build instructions.

## 📖 Documentation

- [Quick Start Guide](./QUICKSTART.md)
- [Build Instructions](./BUILD_ANDROID.md)
- [Setup Guide](./SETUP.md)
- [Installation Guide](./INSTALL_ANDROID.md)

## 🎯 How It Works

1. **Camera Access** - App requests camera and microphone permissions
2. **Face Detection** - Uses TensorFlow.js to detect faces in real-time
3. **Cartoon Filter** - Applies edge detection and color quantization
4. **Face Tracking** - Tracks facial landmarks to maintain filter alignment
5. **Video Recording** - Records the filtered video with audio
6. **Preview & Save** - Allows preview and saving of recorded videos

## 🔧 Technical Details

- **Framework:** React Native with Expo
- **Face Detection:** TensorFlow.js
- **Camera:** Expo Camera
- **Video:** Expo AV
- **Platforms:** Android, iOS (coming soon)

## 📝 License

MIT License - See LICENSE file for details

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 🐛 Issues

Found a bug? Please [open an issue](https://github.com/afloareioanb-afk/funny-face-mobile/issues).

## 📞 Support

For questions or support, please [open an issue](https://github.com/afloareioanb-afk/funny-face-mobile/issues).

## 🙏 Acknowledgments

Built with:
- [React Native](https://reactnative.dev/)
- [Expo](https://expo.dev/)
- [TensorFlow.js](https://www.tensorflow.org/js)

---

**Made with ❤️ for fun video messaging**
