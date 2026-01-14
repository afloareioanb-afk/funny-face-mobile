# Building Android APK - Step by Step Guide

This guide will help you build an Android APK that can be easily installed and hosted for free.

## Option 1: Build with EAS Build (Recommended - Cloud Build)

### Prerequisites
1. Create a free Expo account at https://expo.dev
2. Install EAS CLI:
   ```bash
   npm install -g eas-cli
   ```

### Steps

1. **Login to Expo:**
   ```bash
   eas login
   ```

2. **Configure the project:**
   ```bash
   eas build:configure
   ```
   This will create/update `eas.json` configuration file.

3. **Build Android APK:**
   ```bash
   npm run build:android
   ```
   Or directly:
   ```bash
   eas build --platform android --profile preview
   ```

4. **Wait for build to complete:**
   - The build runs in the cloud (takes 10-20 minutes)
   - You'll get a URL to download the APK when done
   - Check status: `eas build:list`

5. **Download the APK:**
   - Visit the build URL provided
   - Download the `.apk` file

## Option 2: Build Locally (Requires Android Studio)

### Prerequisites
1. Install Android Studio: https://developer.android.com/studio
2. Set up Android SDK and environment variables
3. Install Java JDK 11+

### Steps

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Prebuild native code:**
   ```bash
   npx expo prebuild --platform android
   ```

3. **Build APK:**
   ```bash
   cd android
   ./gradlew assembleRelease
   ```

4. **Find your APK:**
   - Location: `android/app/build/outputs/apk/release/app-release.apk`

## Option 3: Quick Build Script (Automated)

Run the provided build script:
```bash
npm run build:android
```

This will:
1. Check prerequisites
2. Build the APK
3. Provide download instructions

## After Building

Once you have the APK file:

1. **Test Installation:**
   - Transfer APK to Android device
   - Enable "Install from Unknown Sources" in Settings
   - Tap the APK file to install

2. **Host for Free:**
   - See `HOSTING.md` for free hosting options
   - Or use the provided download page template

## Troubleshooting

### Build Fails
- Check Expo account is logged in: `eas whoami`
- Verify `eas.json` configuration
- Check build logs: `eas build:view`

### APK Too Large
- Enable ProGuard in `android/app/build.gradle`
- Remove unused dependencies
- Optimize assets

### Installation Issues
- Ensure Android 6.0+ (API 23+)
- Check device has enough storage
- Verify APK signature

## Next Steps

After building:
1. Test the APK on a real device
2. Host it using free hosting (see `HOSTING.md`)
3. Share the download link
