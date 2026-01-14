# GitHub Repository Setup Guide

This guide will help you set up the `funny-face-mobile` repository on GitHub and host your APK for free.

## Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `funny-face-mobile`
3. Description: "Cartoon Video Messenger - Record video messages with real-time cartoon face filters"
4. Set to **Public** (for free hosting)
5. **Don't** initialize with README (we already have one)
6. Click "Create repository"

## Step 2: Push Code to GitHub

```bash
cd mobile-app

# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Cartoon Video Messenger mobile app"

# Add remote (replace YOUR_USERNAME if needed)
git remote add origin https://github.com/afloareioanb-afk/funny-face-mobile.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 3: Build APK

### Option A: Build Locally

```bash
# Install EAS CLI
npm install -g eas-cli

# Login to Expo
eas login

# Build APK
npm run build:android
```

### Option B: Use GitHub Actions (Coming Soon)

The `.github/workflows/build-android.yml` file is set up for automated builds, but requires:
- EXPO_TOKEN secret in GitHub repository settings
- EXPO_USERNAME secret in GitHub repository settings

## Step 4: Create GitHub Release

1. Go to your repository: https://github.com/afloareioanb-afk/funny-face-mobile
2. Click "Releases" → "Create a new release"
3. **Tag version:** `v1.0.0`
4. **Release title:** `Funny Face Mobile v1.0.0`
5. **Description:**
   ```markdown
   ## 🎥 Funny Face Mobile - First Release
   
   Record video messages with real-time cartoon face filters!
   
   ### Features
   - Real-time cartoon face filters
   - Face movement tracking
   - Video recording up to 60 seconds
   - Save and share videos
   
   ### Installation
   1. Download the APK file below
   2. Enable "Install from Unknown Sources" in Android Settings
   3. Tap the APK to install
   4. Grant camera/microphone permissions
   ```
6. **Upload APK:** Drag and drop your `app-release.apk` file
7. Click "Publish release"

## Step 5: Enable GitHub Pages (Optional)

1. Go to repository Settings → Pages
2. Source: Deploy from a branch
3. Branch: `main` → `/docs` folder
4. Click "Save"
5. Your download page will be available at:
   `https://afloareioanb-afk.github.io/funny-face-mobile/`

## Step 6: Share Your App

### Direct Download Link
```
https://github.com/afloareioanb-afk/funny-face-mobile/releases/latest/download/app-release.apk
```

### Release Page
```
https://github.com/afloareioanb-afk/funny-face-mobile/releases/latest
```

### GitHub Pages (if enabled)
```
https://afloareioanb-afk.github.io/funny-face-mobile/
```

## Quick Commands Summary

```bash
# 1. Initialize and push to GitHub
cd mobile-app
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/afloareioanb-afk/funny-face-mobile.git
git branch -M main
git push -u origin main

# 2. Build APK
npm install -g eas-cli
eas login
npm run build:android

# 3. Download APK from build URL, then create GitHub Release
# 4. Upload APK to GitHub Release
# 5. Share the release URL!
```

## Troubleshooting

### Git Push Fails
- Check you're logged into GitHub: `gh auth login`
- Verify repository exists and is accessible
- Check remote URL: `git remote -v`

### Build Fails
- Ensure Expo account is set up: https://expo.dev
- Check login: `eas whoami`
- Verify `eas.json` exists

### Release Not Showing
- Check repository is public
- Verify APK file uploaded successfully
- Check release is published (not draft)

## Next Steps

After setup:
1. ✅ Code is on GitHub
2. ✅ APK is built and released
3. ✅ Download page is live (if Pages enabled)
4. 📱 Share with users!

## Maintenance

### Updating the App

1. Make changes to code
2. Update version in `app.json`
3. Build new APK: `npm run build:android`
4. Create new release with new version tag
5. Upload new APK

### Version Tags

Use semantic versioning:
- `v1.0.0` - Initial release
- `v1.0.1` - Bug fixes
- `v1.1.0` - New features
- `v2.0.0` - Major changes

---

**Your app is now hosted on GitHub! 🎉**
