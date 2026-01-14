# Manual Login Steps (Required)

Due to EAS CLI requiring interactive input, please follow these steps:

## Step 1: Login to Expo

Open PowerShell and run:

```powershell
cd C:\Users\ferwo\Desktop\web_application_SRE_MA\mobile-app
eas login
```

**When prompted, enter:**
- **Username:** `croisant1987`
- **Password:** `*bR8-(Dqv/?8GsS.`

This will save your credentials for future builds.

## Step 2: Build APK

After successful login, run:

```powershell
npm run build:android
```

The build will take 10-20 minutes.

## Step 3: Create GitHub Release

Once build completes:
1. Download APK from the build URL
2. Go to: https://github.com/afloareioanb-afk/funny-face-mobile/releases/new
3. Tag: `v1.0.0`
4. Upload APK
5. Publish release

---

**Note:** Once you login once, credentials are saved and you won't need to login again for future builds.
