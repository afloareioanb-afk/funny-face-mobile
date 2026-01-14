# Complete script to download APK and create GitHub release
param(
    [string]$BuildURL = "",
    [string]$APKPath = "",
    [string]$Version = "1.0.0"
)

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  Download APK & Create Release" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

# If build URL provided, download APK
if ($BuildURL) {
    Write-Host "Downloading APK from: $BuildURL" -ForegroundColor Yellow
    
    $downloadPath = Join-Path $PSScriptRoot "app-release.apk"
    
    try {
        Invoke-WebRequest -Uri $BuildURL -OutFile $downloadPath -ErrorAction Stop
        Write-Host "✓ APK downloaded: $downloadPath" -ForegroundColor Green
        $APKPath = $downloadPath
    } catch {
        Write-Host "✗ Download failed: $_" -ForegroundColor Red
        Write-Host "Please download manually and provide path." -ForegroundColor Yellow
        exit 1
    }
}

# Verify APK exists
if (-not $APKPath -or -not (Test-Path $APKPath)) {
    Write-Host "APK file not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Usage:" -ForegroundColor Yellow
    Write-Host "  .\download-and-release.ps1 -BuildURL 'https://expo.dev/...'" -ForegroundColor White
    Write-Host "  OR" -ForegroundColor White
    Write-Host "  .\download-and-release.ps1 -APKPath 'C:\path\to\app-release.apk'`n" -ForegroundColor White
    exit 1
}

Write-Host "APK found: $APKPath" -ForegroundColor Green
$fileSize = (Get-Item $APKPath).Length / 1MB
Write-Host "File size: $([math]::Round($fileSize, 2)) MB" -ForegroundColor Gray
Write-Host ""

# Create GitHub release
Write-Host "Creating GitHub release..." -ForegroundColor Yellow

$tag = "v$Version"
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

# Check if gh CLI is available
$ghAvailable = Get-Command gh -ErrorAction SilentlyContinue

if ($ghAvailable) {
    Write-Host "Using GitHub CLI to create release..." -ForegroundColor Gray
    
    $releaseNotes | gh release create $tag "$APKPath" `
        --title "Funny Face Mobile v$Version" `
        --notes "$releaseNotes" `
        --repo afloareioanb-afk/funny-face-mobile 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "✓ Release created successfully!" -ForegroundColor Green
        Write-Host "========================================`n" -ForegroundColor Green
    } else {
        Write-Host "GitHub CLI failed, will provide manual instructions" -ForegroundColor Yellow
        $ghAvailable = $false
    }
}

if (-not $ghAvailable) {
    Write-Host ""
    Write-Host "Please create release manually:" -ForegroundColor Yellow
    Write-Host "1. Go to: https://github.com/afloareioanb-afk/funny-face-mobile/releases/new" -ForegroundColor White
    Write-Host "2. Tag: $tag" -ForegroundColor White
    Write-Host "3. Title: Funny Face Mobile v$Version" -ForegroundColor White
    Write-Host "4. Upload APK: $APKPath" -ForegroundColor White
    Write-Host "5. Description: (copy from above)" -ForegroundColor White
    Write-Host ""
}

Write-Host "Release URL:" -ForegroundColor Cyan
Write-Host "https://github.com/afloareioanb-afk/funny-face-mobile/releases/latest`n" -ForegroundColor White

Write-Host "Direct Download:" -ForegroundColor Cyan
Write-Host "https://github.com/afloareioanb-afk/funny-face-mobile/releases/latest/download/app-release.apk`n" -ForegroundColor White
