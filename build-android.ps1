# PowerShell script to build Android APK
# This script helps build the Android APK using EAS Build

Write-Host "🎥 Cartoon Video Messenger - Android Build Script" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# Check if EAS CLI is installed
try {
    $easVersion = eas --version 2>$null
    Write-Host "✓ EAS CLI found: $easVersion" -ForegroundColor Green
} catch {
    Write-Host "⚠️  EAS CLI not found. Installing..." -ForegroundColor Yellow
    npm install -g eas-cli
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Failed to install EAS CLI" -ForegroundColor Red
        exit 1
    }
}

# Check if logged in to Expo
Write-Host ""
Write-Host "Checking Expo login status..." -ForegroundColor Yellow
try {
    $whoami = eas whoami 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Logged in to Expo" -ForegroundColor Green
    } else {
        Write-Host "⚠️  Not logged in to Expo. Please login:" -ForegroundColor Yellow
        eas login
    }
} catch {
    Write-Host "⚠️  Not logged in to Expo. Please login:" -ForegroundColor Yellow
    eas login
}

# Check if eas.json exists
if (-not (Test-Path "eas.json")) {
    Write-Host ""
    Write-Host "Configuring EAS build..." -ForegroundColor Yellow
    eas build:configure
}

Write-Host ""
Write-Host "Starting Android APK build..." -ForegroundColor Yellow
Write-Host "This will take 10-20 minutes..." -ForegroundColor Gray
Write-Host ""

# Build APK
eas build --platform android --profile preview --non-interactive

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Build completed!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Visit the build URL shown above" -ForegroundColor White
    Write-Host "2. Download the APK file" -ForegroundColor White
    Write-Host "3. Create a GitHub Release and upload the APK" -ForegroundColor White
    Write-Host "4. See GITHUB_SETUP.md for detailed instructions" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "❌ Build failed. Check the error messages above." -ForegroundColor Red
    Write-Host "See BUILD_ANDROID.md for troubleshooting" -ForegroundColor Yellow
}
