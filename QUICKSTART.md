# Quick Start Guide

Get your Cartoon Video Messenger app running in 5 minutes!

## Step 1: Install Prerequisites

Make sure you have:
- ✅ Node.js 14+ installed
- ✅ npm or yarn
- ✅ Expo Go app on your phone ([iOS](https://apps.apple.com/app/expo-go/id982107779) | [Android](https://play.google.com/store/apps/details?id=host.exp.exponent))

## Step 2: Install Dependencies

```bash
cd mobile-app
npm install
```

## Step 3: Start the App

```bash
npm start
```

This will:
1. Start the Expo development server
2. Show a QR code in your terminal
3. Open Expo DevTools in your browser

## Step 4: Run on Your Phone

### Using Expo Go (Easiest)

1. Open **Expo Go** app on your phone
2. Scan the QR code from the terminal:
   - **iOS**: Use the Camera app to scan
   - **Android**: Use the Expo Go app to scan
3. Wait for the app to load

### Using Simulator/Emulator

**iOS (Mac only):**
```bash
npm run ios
```

**Android:**
```bash
npm run android
```

## Step 5: Test the App

1. **Grant Permissions**: Allow camera and microphone access when prompted
2. **Test Camera**: The camera should open showing your face
3. **Test Recording**: 
   - Tap the red record button
   - Record a short video (up to 60 seconds)
   - Tap again to stop
4. **Preview**: Review your video
5. **Save**: Tap "Send" to save to your gallery

## Troubleshooting

### "Unable to resolve module" errors
```bash
rm -rf node_modules
npm install
expo start -c
```

### Camera not working
- Check device permissions in Settings
- Make sure no other app is using the camera
- Restart the app

### App won't load
- Make sure your phone and computer are on the same WiFi network
- Try closing and reopening Expo Go
- Check the terminal for error messages

## Next Steps

1. **Add Face Detection Model**: See `SETUP.md` for instructions
2. **Customize Filters**: Edit `src/utils/CartoonEffect.js`
3. **Add Features**: Check `README.md` for enhancement ideas

## Need Help?

- Check `SETUP.md` for detailed setup instructions
- See `README.md` for full documentation
- Review code comments in source files

Happy coding! 🎥✨
