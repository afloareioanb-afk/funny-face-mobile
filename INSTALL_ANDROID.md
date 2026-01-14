# Easy Android Installation Guide

This guide will help you build, host, and distribute your Android APK for free.

## Quick Start (3 Steps)

### Step 1: Build the APK

**Option A: Using EAS Build (Cloud - Recommended)**
```bash
# Install EAS CLI
npm install -g eas-cli

# Login to Expo
eas login

# Build APK
npm run build:android
```

**Option B: Using Build Script**
```bash
# Windows
build-android.bat

# Mac/Linux
chmod +x build-android.sh
./build-android.sh
```

### Step 2: Host for Free

**Recommended: GitHub Releases**

1. Create a GitHub repository
2. Go to Releases → Create a new release
3. Upload your APK file
4. Copy the download URL

**Or use Netlify Drop (No account needed):**

1. Run: `npm run setup:hosting`
2. Go to https://app.netlify.com/drop
3. Drag the `hosting` folder
4. Share the URL

### Step 3: Share the Link

Users can:
1. Click the download link
2. Install the APK
3. Enable "Unknown Sources" if needed
4. Open and use the app!

## Detailed Instructions

### Building the APK

#### Prerequisites:
- Node.js installed
- Free Expo account (create at https://expo.dev)

#### Build Process:

1. **Install dependencies:**
   ```bash
   cd mobile-app
   npm install
   ```

2. **Login to Expo:**
   ```bash
   eas login
   ```

3. **Build:**
   ```bash
   eas build --platform android --profile preview
   ```

4. **Wait for completion:**
   - Build takes 10-20 minutes
   - You'll get a download URL
   - Or check: `eas build:list`

### Hosting Options

#### Option 1: GitHub Releases (Best)

**Pros:**
- Free forever
- No bandwidth limits
- Version management
- Professional

**Steps:**
1. Create GitHub repo
2. Create release (v1.0.0)
3. Upload APK
4. Share release URL

**Download URL Format:**
```
https://github.com/USERNAME/REPO/releases/download/v1.0.0/app-release.apk
```

#### Option 2: Netlify Drop (Easiest)

**Pros:**
- No account needed
- Instant deployment
- HTTPS included

**Steps:**
1. Run: `npm run setup:hosting`
2. Go to https://app.netlify.com/drop
3. Drag `hosting` folder
4. Get instant URL

#### Option 3: Firebase Hosting

**Pros:**
- Free tier: 10GB storage
- Fast CDN
- Custom domain

**Steps:**
```bash
npm install -g firebase-tools
firebase login
firebase init hosting
firebase deploy
```

### User Installation Instructions

Create a simple page with these instructions:

1. **Download the APK:**
   - Click the download link
   - Wait for download to complete

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
   - Grant camera/microphone permissions

### QR Code for Easy Download

Generate a QR code linking to your APK:
1. Use https://qr-code-generator.com
2. Enter your APK download URL
3. Download QR code image
4. Add to download page

### Complete Setup Script

Run this to do everything:

```bash
# 1. Build APK
npm run build:android

# 2. Setup hosting files
npm run setup:hosting

# 3. Deploy (choose one):
#    - Upload to GitHub Releases
#    - Drag to Netlify Drop
#    - Deploy to Firebase
```

## Troubleshooting

### Build Fails
- Check: `eas whoami` (must be logged in)
- Verify: `eas.json` exists
- Check build logs: `eas build:view`

### APK Won't Install
- Ensure Android 6.0+ (API 23+)
- Enable "Unknown Sources"
- Check device storage space
- Verify APK isn't corrupted

### Download Issues
- Check hosting URL is accessible
- Verify APK file size
- Test on different networks

## Security Best Practices

1. **Sign your APK:**
   - EAS Build signs automatically
   - Or sign manually with `jarsigner`

2. **Provide Checksums:**
   - Generate SHA-256 hash
   - Share for verification

3. **Warn Users:**
   - Explain "Unknown Sources" requirement
   - Provide clear installation steps

## Next Steps

After hosting:
1. Test the download link
2. Create QR code
3. Share with users
4. Monitor downloads
5. Collect feedback

## Support

For issues:
- Check `BUILD_ANDROID.md` for build help
- See `HOSTING.md` for hosting options
- Review `README.md` for app details
