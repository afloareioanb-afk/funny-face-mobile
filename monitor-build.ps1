# Script to monitor build progress
param(
    [int]$CheckInterval = 60,  # Check every 60 seconds
    [int]$MaxChecks = 20        # Check up to 20 times (20 minutes)
)

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  Monitoring Build Progress" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

Write-Host "Checking build status every $CheckInterval seconds..." -ForegroundColor Yellow
Write-Host "Maximum wait time: $($MaxChecks * $CheckInterval / 60) minutes`n" -ForegroundColor Gray

$checkCount = 0
$buildFound = $false

while ($checkCount -lt $MaxChecks) {
    $checkCount++
    Write-Host "[Check $checkCount/$MaxChecks] Checking build status..." -ForegroundColor Cyan
    
    $builds = eas build:list --platform android --limit 1 2>&1
    
    # Check if build appears in list
    if ($builds -match "finished" -or $builds -match "complete") {
        Write-Host "✓ Build completed!" -ForegroundColor Green
        $buildFound = $true
        break
    } elseif ($builds -match "in progress" -or $builds -match "building") {
        Write-Host "⏳ Build in progress..." -ForegroundColor Yellow
    } elseif ($builds -match "error" -or $builds -match "failed") {
        Write-Host "✗ Build failed!" -ForegroundColor Red
        Write-Host $builds -ForegroundColor Red
        break
    } else {
        Write-Host "⏳ Build queued or starting..." -ForegroundColor Gray
    }
    
    if ($checkCount -lt $MaxChecks) {
        Write-Host "Waiting $CheckInterval seconds before next check...`n" -ForegroundColor Gray
        Start-Sleep -Seconds $CheckInterval
    }
}

if ($buildFound) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "Build Complete! Next Steps:" -ForegroundColor Green
    Write-Host "========================================`n" -ForegroundColor Green
    
    Write-Host "1. Get build URL:" -ForegroundColor Yellow
    Write-Host "   eas build:list --platform android" -ForegroundColor White
    Write-Host "   OR visit: https://expo.dev/accounts/croisant1987/builds`n" -ForegroundColor Gray
    
    Write-Host "2. Download APK and create release:" -ForegroundColor Yellow
    Write-Host "   .\download-and-release.ps1 -BuildURL 'YOUR_BUILD_URL'`n" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "Build still processing or not found." -ForegroundColor Yellow
    Write-Host "Check manually: eas build:list --platform android" -ForegroundColor White
    Write-Host "Or visit: https://expo.dev/accounts/croisant1987/builds" -ForegroundColor White
}
