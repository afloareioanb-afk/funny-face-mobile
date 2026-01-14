# 🚀 Quick Deploy Guide - Funny Face Mobile

Get your app built and hosted on GitHub in minutes!

## ⚡ Super Quick (4 Steps)

### Step 1: Create GitHub Repository

1. Go to: https://github.com/new
2. Repository name: **funny-face-mobile**
3. Description: "Cartoon Video Messenger - Record video messages with real-time cartoon face filters"
4. Set to **Public** ✅
5. **Don't** check "Initialize with README"
6. Click **"Create repository"**

### Step 2: Push Code to GitHub

```powershell
cd mobile-app
git push -u origin main
```

If you get an error, the repository might not exist yet. Create it first in Step 1.

### Step 3: Build APK

```powershell
# Install EAS CLI (if not installed)
npm install -g eas-cli

# Login to Expo (create free account at https://expo.dev if needed)
eas login

# Build APK
npm run build:android
```

**Or use the PowerShell script:**
```powershell
.\build-android.ps1
```

Wait 10-20 minutes for the build to complete.

### Step 4: Create GitHub Release

1. Go to: https://github.com/afloareioanb-afk/funny-face-mobile/releases/new
2. **Tag:** `v1.0.0`
3. **Title:** `Funny Face Mobile v1.0.0`
4. **Description:**
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
5. **Upload APK:** Drag and drop your downloaded `app-release.apk`
6. Click **"Publish release"**

## 🎉 Done!

Your app is now available at:
- **Download:** https://github.com/afloareioanb-afk/funny-face-mobile/releases/latest
- **Repository:** https://github.com/afloareioanb-afk/funny-face-mobile

## 📱 Enable GitHub Pages (Optional)

For a nice download page:

1. Go to: https://github.com/afloareioanb-afk/funny-face-mobile/settings/pages
2. Source: **Deploy from a branch**
3. Branch: **main** → **/docs** folder
4. Click **"Save"**

Your download page will be at:
**https://afloareioanb-afk.github.io/funny-face-mobile/**

## 🔗 Share Your App

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

## 🆘 Troubleshooting

### "Repository not found"
- Make sure you created the repository on GitHub first
- Check the repository name is exactly: `funny-face-mobile`
- Verify you're logged into GitHub: `gh auth login`

### Build Fails
- Ensure Expo account exists: https://expo.dev
- Check login: `eas whoami`
- Verify `eas.json` exists

### Push Fails
- Check remote: `git remote -v`
- Verify repository exists on GitHub
- Make sure you have write access

## 📋 Checklist

- [ ] GitHub repository created
- [ ] Code pushed to GitHub
- [ ] APK built successfully
- [ ] GitHub Release created
- [ ] APK uploaded to release
- [ ] Download link tested
- [ ] GitHub Pages enabled (optional)

---

**Need help?** See `GITHUB_SETUP.md` for detailed instructions.
