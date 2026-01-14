# Automated Expo login and build script
param(
    [string]$Username = "croisant1987",
    [string]$Password = "*bR8-(Dqv/?8GsS."
)

Write-Host "`n=== Expo Login and Build ===" -ForegroundColor Cyan
Write-Host ""

# Step 1: Login to Expo
Write-Host "Step 1: Logging in to Expo..." -ForegroundColor Yellow
Write-Host "Username: $Username" -ForegroundColor Gray

# Create a temporary file with credentials
$tempFile = [System.IO.Path]::GetTempFileName()
"$Username`n$Password" | Out-File -FilePath $tempFile -Encoding ASCII -NoNewline

# Try to login using the credentials file
try {
    Get-Content $tempFile | eas login 2>&1 | Out-Null
    
    # Check login status
    Start-Sleep -Seconds 2
    $whoami = eas whoami 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Successfully logged in!" -ForegroundColor Green
        Write-Host "  $whoami" -ForegroundColor Gray
    } else {
        Write-Host "⚠ Login may require manual input" -ForegroundColor Yellow
        Write-Host "Please run manually: eas login" -ForegroundColor Yellow
        Write-Host "Then enter:" -ForegroundColor Yellow
        Write-Host "  Username: $Username" -ForegroundColor Gray
        Write-Host "  Password: $Password" -ForegroundColor Gray
        exit 1
    }
} catch {
    Write-Host "✗ Login failed: $_" -ForegroundColor Red
    Write-Host "Please run manually: eas login" -ForegroundColor Yellow
    exit 1
} finally {
    # Clean up temp file
    if (Test-Path $tempFile) {
        Remove-Item $tempFile -Force
    }
}

# Step 2: Build APK
Write-Host ""
Write-Host "Step 2: Building Android APK..." -ForegroundColor Yellow
Write-Host "This will take 10-20 minutes..." -ForegroundColor Gray
Write-Host ""

npm run build:android

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✓ Build completed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next step: Download APK and create GitHub Release" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "✗ Build failed. Check the error messages above." -ForegroundColor Red
}
