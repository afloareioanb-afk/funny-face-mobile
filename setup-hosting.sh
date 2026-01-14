#!/bin/bash

# Setup Hosting Script
# Prepares files for free hosting

set -e

echo "🌐 Setting up hosting files..."
echo ""

# Create hosting directory
mkdir -p hosting
cd hosting

# Copy download page
cp ../download-page.html index.html

# Check if APK exists
if [ -f "../app-release.apk" ]; then
    cp ../app-release.apk app-release.apk
    echo "✓ APK file found and copied"
elif [ -f "../android/app/build/outputs/apk/release/app-release.apk" ]; then
    cp ../android/app/build/outputs/apk/release/app-release.apk app-release.apk
    echo "✓ APK file found and copied"
else
    echo "⚠️  APK file not found. Please build the app first."
    echo "   Run: npm run build:android"
fi

echo ""
echo "✓ Hosting files ready in 'hosting' directory"
echo ""
echo "You can now:"
echo "1. Upload the 'hosting' folder to:"
echo "   - Netlify Drop: https://app.netlify.com/drop"
echo "   - GitHub Pages"
echo "   - Firebase Hosting"
echo "   - Any static hosting service"
echo ""
echo "2. Or use GitHub Releases (recommended):"
echo "   - Create a release in your GitHub repo"
echo "   - Upload the APK file"
echo "   - Share the release URL"
echo ""
