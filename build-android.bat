@echo off
REM Android APK Build Script for Windows
REM This script helps build and prepare the Android APK for distribution

echo.
echo 🎥 Cartoon Video Messenger - Android Build Script
echo ==================================================
echo.

REM Check if EAS CLI is installed
where eas >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Installing EAS CLI...
    call npm install -g eas-cli
)

REM Check if logged in to Expo
echo Checking Expo login status...
eas whoami >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Not logged in to Expo. Please login:
    call eas login
)

echo ✓ Logged in to Expo
echo.

REM Check if eas.json exists
if not exist "eas.json" (
    echo Configuring EAS build...
    call eas build:configure
)

echo Starting Android APK build...
echo This will take 10-20 minutes...
echo.

REM Build APK
call eas build --platform android --profile preview --non-interactive

echo.
echo ✓ Build completed!
echo.
echo Next steps:
echo 1. Visit the build URL shown above
echo 2. Download the APK file
echo 3. See HOSTING.md for free hosting options
echo.

pause
