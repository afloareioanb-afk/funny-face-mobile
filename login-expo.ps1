# PowerShell script to login to Expo
$username = "croisant1987"
$password = "*bR8-(Dqv/?8GsS."

Write-Host "Logging in to Expo..." -ForegroundColor Yellow

# Create a here-string with credentials
$credentials = @"
$username
$password
"@

# Try to login
$credentials | eas login 2>&1

# Check if login was successful
$whoami = eas whoami 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Successfully logged in!" -ForegroundColor Green
    Write-Host $whoami -ForegroundColor Gray
} else {
    Write-Host "✗ Login failed. Please try manually:" -ForegroundColor Red
    Write-Host "  eas login" -ForegroundColor Yellow
}
