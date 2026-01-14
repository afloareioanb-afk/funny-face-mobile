# 🚀 Quick Build & Host Guide

Get your Android APK built and hosted in 15 minutes!

## ⚡ Super Quick (3 Commands)

```bash
# 1. Install EAS CLI
npm install -g eas-cli

# 2. Login and build
eas login && eas build --platform android --profile preview

# 3. Setup hosting
npm run setup:hosting
```

Then upload `hosting` folder to Netlify Drop: https://app.netlify.com/drop

## 📋 Step-by-Step

### 1️⃣ Build APK (10-20 min)

```bash
cd mobile-app
npm install
npm install -g eas-cli
eas login
npm run build:android
```

**What happens:**
- Builds APK in the cloud
- You'll get a download URL
- APK is ready to use

### 2️⃣ Host for Free (2 min)

**Option A: GitHub Releases (Best)**
1. Create GitHub repo
2. Go to Releases → New release
3. Upload APK
4. Copy download URL

**Option B: Netlify Drop (Easiest)**
1. Run: `npm run setup:hosting`
2. Go to https://app.netlify.com/drop
3. Drag `hosting` folder
4. Get instant URL

**Option C: Firebase Hosting**
```bash
npm install -g firebase-tools
firebase login
firebase init hosting
firebase deploy
```

### 3️⃣ Share Link

Users can:
- Click link → Download → Install
- Scan QR code (generate at qr-code-generator.com)
- Enable "Unknown Sources" if needed

## 🎯 Recommended Flow

1. **Build:** `npm run build:android`
2. **Download APK** from build URL
3. **Create GitHub Release:**
   - Upload APK
   - Tag: v1.0.0
   - Copy release URL
4. **Share:** Give users the release URL

## 📱 User Installation

1. Download APK
2. Settings → Security → Enable "Unknown Sources"
3. Tap APK → Install
4. Open app → Grant permissions

## ✅ Checklist

- [ ] EAS CLI installed
- [ ] Logged into Expo
- [ ] APK built successfully
- [ ] APK downloaded
- [ ] Hosted on free platform
- [ ] Download link tested
- [ ] QR code generated (optional)

## 🆘 Troubleshooting

**Build fails?**
- Check: `eas whoami`
- Verify: `eas.json` exists
- See: `BUILD_ANDROID.md`

**APK won't install?**
- Android 6.0+ required
- Enable "Unknown Sources"
- Check storage space

**Need help?**
- See `INSTALL_ANDROID.md` for details
- Check `HOSTING.md` for options
- Review `BUILD_ANDROID.md` for build help

## 🎉 Done!

Your app is now:
- ✅ Built as APK
- ✅ Hosted for free
- ✅ Ready to share
- ✅ Easy to install

Share the download link and enjoy! 🎥✨
