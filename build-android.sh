#!/bin/bash

# Android APK Build Script
# This script helps build and prepare the Android APK for distribution

set -e

echo "🎥 Cartoon Video Messenger - Android Build Script"
echo "=================================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if EAS CLI is installed
if ! command -v eas &> /dev/null; then
    echo -e "${YELLOW}EAS CLI not found. Installing...${NC}"
    npm install -g eas-cli
fi

# Check if logged in to Expo
echo -e "${YELLOW}Checking Expo login status...${NC}"
if ! eas whoami &> /dev/null; then
    echo -e "${RED}Not logged in to Expo. Please login:${NC}"
    eas login
fi

echo -e "${GREEN}✓ Logged in to Expo${NC}"
echo ""

# Check if eas.json exists
if [ ! -f "eas.json" ]; then
    echo -e "${YELLOW}Configuring EAS build...${NC}"
    eas build:configure
fi

echo -e "${GREEN}Starting Android APK build...${NC}"
echo "This will take 10-20 minutes..."
echo ""

# Build APK
eas build --platform android --profile preview --non-interactive

echo ""
echo -e "${GREEN}✓ Build completed!${NC}"
echo ""
echo "Next steps:"
echo "1. Visit the build URL shown above"
echo "2. Download the APK file"
echo "3. See HOSTING.md for free hosting options"
echo ""
