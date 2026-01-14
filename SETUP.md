# Setup Guide for Cartoon Video Messenger Mobile App

## Quick Start

### 1. Install Dependencies

```bash
cd mobile-app
npm install
```

### 2. Install Expo CLI (if not already installed)

```bash
npm install -g expo-cli
```

### 3. Start Development Server

```bash
npm start
```

### 4. Run on Device

#### Option A: Using Expo Go App (Recommended for Development)

1. Install **Expo Go** app on your phone:
   - iOS: [App Store](https://apps.apple.com/app/expo-go/id982107779)
   - Android: [Google Play](https://play.google.com/store/apps/details?id=host.exp.exponent)

2. Scan the QR code shown in the terminal with:
   - iOS: Camera app
   - Android: Expo Go app

#### Option B: Using iOS Simulator (Mac only)

```bash
npm run ios
```

#### Option C: Using Android Emulator

```bash
npm run android
```

## Face Detection Model Setup

The app uses TensorFlow.js for face detection. To enable full functionality:

### Option 1: Use BlazeFace Model (Recommended)

1. Download BlazeFace model:
   ```bash
   mkdir -p mobile-app/assets/models
   # Download model files and place in assets/models/
   ```

2. Update `src/utils/FaceDetector.js` to load the model:
   ```javascript
   const modelUrl = bundleResourceIO('models/blazeface/model.json');
   this.model = await tf.loadLayersModel(modelUrl);
   ```

### Option 2: Use MediaPipe Face Detection

MediaPipe provides a more robust solution but requires additional setup:

1. Install MediaPipe dependencies (if using native modules)
2. Configure native modules in `app.json`
3. Update face detection code to use MediaPipe API

### Option 3: Development Mode (Mock Data)

The app includes mock face detection data for development. This allows you to test the UI and video recording without a full model setup.

## Building for Production

### Prerequisites

- **iOS**: Apple Developer account ($99/year)
- **Android**: Google Play Developer account ($25 one-time)

### Build with Expo

#### iOS Build

```bash
expo build:ios
```

#### Android Build

```bash
expo build:android
```

### Build with EAS (Expo Application Services) - Recommended

1. Install EAS CLI:
   ```bash
   npm install -g eas-cli
   ```

2. Login:
   ```bash
   eas login
   ```

3. Configure project:
   ```bash
   eas build:configure
   ```

4. Build:
   ```bash
   eas build --platform ios
   eas build --platform android
   ```

## Troubleshooting

### Camera Permission Issues

**iOS:**
- Check `Info.plist` has correct permission descriptions
- Reset permissions: Settings > General > Reset > Reset Location & Privacy

**Android:**
- Check `AndroidManifest.xml` has required permissions
- Grant permissions manually in device Settings

### Face Detection Not Working

1. Ensure model files are in correct location
2. Check console for model loading errors
3. Verify TensorFlow.js is properly initialized
4. Test with mock data first to isolate issues

### Performance Issues

1. Reduce video quality in `CartoonCameraView.js`
2. Lower face detection resolution
3. Optimize cartoon filter algorithm
4. Use native modules for better performance

### Build Errors

1. Clear cache:
   ```bash
   expo start -c
   ```

2. Reinstall dependencies:
   ```bash
   rm -rf node_modules
   npm install
   ```

3. Reset Expo:
   ```bash
   expo r -c
   ```

## Development Tips

1. **Hot Reloading**: Changes automatically reload in Expo Go
2. **Debugging**: Use React Native Debugger or Chrome DevTools
3. **Performance**: Use `react-native-reanimated` for smooth animations
4. **Testing**: Test on real devices for accurate camera behavior

## Next Steps

1. Add face detection model files
2. Fine-tune cartoon filter parameters
3. Add more filter styles
4. Implement video sharing features
5. Add user preferences and settings
