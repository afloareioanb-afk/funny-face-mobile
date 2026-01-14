# Script to create GitHub release with APK
param(
    [string]$APKPath = "",
    [string]$Version = "1.0.0",
    [string]$Tag = "v1.0.0"
)

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  Create GitHub Release" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

# Check if APK path provided
if (-not $APKPath -or -not (Test-Path $APKPath)) {
    Write-Host "APK file not found at: $APKPath" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please provide the APK file path:" -ForegroundColor Yellow
    Write-Host "  .\create-release.ps1 -APKPath 'C:\path\to\app-release.apk'" -ForegroundColor White
    Write-Host ""
    Write-Host "Or download from Expo build URL and provide path." -ForegroundColor Gray
    exit 1
}

Write-Host "APK found: $APKPath" -ForegroundColor Green
Write-Host "File size: $((Get-Item $APKPath).Length / 1MB) MB" -ForegroundColor Gray
Write-Host ""

# Create release using GitHub CLI
Write-Host "Creating GitHub release..." -ForegroundColor Yellow

$releaseNotes = @"
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
4. Grant camera/microphone permissions when asked

### Requirements
- Android 6.0 (Marshmallow) or higher

### Version
$Version
"@

# Create release
$releaseNotes | gh release create $Tag "$APKPath" `
    --title "Funny Face Mobile v$Version" `
    --notes "$releaseNotes" `
    --repo afloareioanb-afk/funny-face-mobile

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "✓ Release created successfully!" -ForegroundColor Green
    Write-Host "========================================`n" -ForegroundColor Green
    Write-Host "Release URL:" -ForegroundColor Cyan
    Write-Host "https://github.com/afloareioanb-afk/funny-face-mobile/releases/latest`n" -ForegroundColor White
    Write-Host "Direct Download:" -ForegroundColor Cyan
    Write-Host "https://github.com/afloareioanb-afk/funny-face-mobile/releases/latest/download/app-release.apk`n" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "✗ Release creation failed." -ForegroundColor Red
    Write-Host "You can create it manually at:" -ForegroundColor Yellow
    Write-Host "https://github.com/afloareioanb-afk/funny-face-mobile/releases/new`n" -ForegroundColor White
}
