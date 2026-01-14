# Complete build and release script
# Run this script to login, build, and prepare for release

param(
    [string]$Username = "croisant1987",
    [string]$Password = "*bR8-(Dqv/?8GsS."
)

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  Funny Face Mobile - Build Script" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

# Check if already logged in
Write-Host "Checking login status..." -ForegroundColor Yellow
$whoami = eas whoami 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Already logged in as: $whoami" -ForegroundColor Green
    $loggedIn = $true
} else {
    Write-Host "⚠ Not logged in. Login required." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please run this command in a NEW terminal window:" -ForegroundColor Cyan
    Write-Host "  eas login" -ForegroundColor White
    Write-Host ""
    Write-Host "When prompted, enter:" -ForegroundColor Yellow
    Write-Host "  Username: $Username" -ForegroundColor Gray
    Write-Host "  Password: $Password" -ForegroundColor Gray
    Write-Host ""
    Write-Host "After logging in, come back here and press any key to continue..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    $loggedIn = $false
}

# Verify login before building
if (-not $loggedIn) {
    $whoami = eas whoami 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "✗ Still not logged in. Please login first." -ForegroundColor Red
        exit 1
    }
    Write-Host "✓ Login verified!" -ForegroundColor Green
}

# Build APK
Write-Host ""
Write-Host "Starting Android APK build..." -ForegroundColor Yellow
Write-Host "This will take 10-20 minutes..." -ForegroundColor Gray
Write-Host ""

npm run build:android

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "✓ Build completed successfully!" -ForegroundColor Green
    Write-Host "========================================`n" -ForegroundColor Green
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Download the APK from the build URL above" -ForegroundColor White
    Write-Host "2. Create GitHub Release at:" -ForegroundColor White
    Write-Host "   https://github.com/afloareioanb-afk/funny-face-mobile/releases/new" -ForegroundColor Gray
    Write-Host "3. Upload the APK and publish`n" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "✗ Build failed. Check error messages above." -ForegroundColor Red
    exit 1
}
