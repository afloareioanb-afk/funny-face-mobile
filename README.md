# Cartoon Video Messenger Mobile App

A React Native mobile application that allows users to record video messages with real-time cartoon face filters. The app uses the phone's camera to detect faces and applies a cartoon-style filter that mimics facial movements in real-time.

## Features

- 📱 **Cross-Platform**: Works on both Android and iOS
- 🎥 **Camera Integration**: Uses device camera for video recording
- 🎨 **Real-Time Cartoon Filter**: Applies cartoon effect to faces in real-time
- 👤 **Face Tracking**: Detects and tracks facial movements
- 📹 **Video Recording**: Record video messages up to 60 seconds
- 💾 **Save & Share**: Save videos to device gallery

## Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- Expo CLI (`npm install -g expo-cli`)
- For iOS: Xcode (Mac only)
- For Android: Android Studio

## Installation

1. Navigate to the mobile app directory:
```bash
cd mobile-app
```

2. Install dependencies:
```bash
npm install
```

3. Start the Expo development server:
```bash
npm start
```

4. Run on your device:
   - **iOS**: Press `i` in the terminal or scan QR code with Expo Go app
   - **Android**: Press `a` in the terminal or scan QR code with Expo Go app

## Project Structure

```
mobile-app/
├── App.js                 # Main app component
├── app.json               # Expo configuration
├── package.json           # Dependencies
├── src/
│   ├── components/
│   │   ├── CartoonCameraView.js    # Camera view with cartoon filter
│   │   ├── CartoonFilter.js         # Cartoon filter component
│   │   └── VideoPreview.js          # Video preview and controls
│   └── utils/
│       ├── FaceDetector.js          # Face detection utilities
│       └── CartoonEffect.js         # Cartoon effect algorithms
└── assets/                # App icons and images
```

## How It Works

1. **Camera Access**: The app requests camera and microphone permissions
2. **Face Detection**: Uses TensorFlow.js or MediaPipe to detect faces in real-time
3. **Cartoon Filter**: Applies edge detection and color quantization to create cartoon effect
4. **Face Tracking**: Tracks facial landmarks to maintain filter alignment
5. **Video Recording**: Records the filtered video with audio
6. **Preview & Send**: Allows preview and saving of recorded videos

## Face Detection Models

The app uses TensorFlow.js for face detection. You'll need to:

1. Download a face detection model (e.g., BlazeFace or MediaPipe Face Detection)
2. Place model files in `mobile-app/assets/models/`
3. Update `FaceDetector.js` to load the correct model

### Recommended Models:
- **BlazeFace**: Lightweight, fast face detection
- **MediaPipe Face Detection**: Google's face detection solution
- **TensorFlow Lite Face Detection**: Optimized for mobile

## Cartoon Filter Algorithm

The cartoon effect is achieved through:

1. **Edge Detection**: Uses Sobel operator to detect edges
2. **Color Quantization**: Reduces color palette for cartoon-like appearance
3. **Edge Enhancement**: Combines edges with quantized colors
4. **Face-Aware Smoothing**: Preserves facial features while applying effect

## Configuration

### iOS Configuration

The `app.json` file includes iOS-specific settings:
- Camera permissions
- Microphone permissions
- Photo library access

### Android Configuration

Android permissions are configured in `app.json`:
- CAMERA
- RECORD_AUDIO
- READ_EXTERNAL_STORAGE
- WRITE_EXTERNAL_STORAGE

## Building for Production

### iOS Build

```bash
expo build:ios
```

### Android Build

```bash
expo build:android
```

Or use EAS Build:

```bash
eas build --platform ios
eas build --platform android
```

## Performance Optimization

- Face detection runs on a separate thread to avoid blocking UI
- Video processing is optimized for mobile devices
- Cartoon filter uses efficient algorithms for real-time performance

## Troubleshooting

### Camera Not Working
- Check device permissions in Settings
- Ensure camera is not being used by another app
- Restart the app

### Face Detection Issues
- Ensure good lighting conditions
- Face should be clearly visible
- Check that model files are properly loaded

### Performance Issues
- Reduce video quality in `CartoonCameraView.js`
- Lower face detection resolution
- Close other apps to free up memory

## Future Enhancements

- [ ] Multiple cartoon filter styles
- [ ] Real-time filter intensity adjustment
- [ ] Multiple face support
- [ ] Video editing features
- [ ] Direct sharing to social media
- [ ] Cloud storage integration
- [ ] AR effects integration

## License

MIT License - See LICENSE file for details

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Support

For issues and questions, please open an issue on the repository.
