# PowerShell script to set up GitHub repository
# Run this script to prepare and push to GitHub

Write-Host "🎥 Funny Face Mobile - GitHub Setup" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
try {
    git --version | Out-Null
} catch {
    Write-Host "❌ Git is not installed. Please install Git first." -ForegroundColor Red
    exit 1
}

# Check if in mobile-app directory
if (-not (Test-Path "package.json")) {
    Write-Host "❌ Please run this script from the mobile-app directory" -ForegroundColor Red
    exit 1
}

# Initialize git if needed
if (-not (Test-Path ".git")) {
    Write-Host "Initializing git repository..." -ForegroundColor Yellow
    git init
}

# Check if remote exists
$remoteExists = git remote -v 2>$null
if (-not $remoteExists) {
    Write-Host ""
    Write-Host "📝 Setting up GitHub remote..." -ForegroundColor Yellow
    Write-Host "Repository URL: https://github.com/afloareioanb-afk/funny-face-mobile.git" -ForegroundColor Gray
    git remote add origin https://github.com/afloareioanb-afk/funny-face-mobile.git
}

# Add all files
Write-Host ""
Write-Host "📦 Adding files to git..." -ForegroundColor Yellow
git add .

# Check if there are changes to commit
$status = git status --porcelain
if ($status) {
    Write-Host ""
    Write-Host "💾 Committing changes..." -ForegroundColor Yellow
    git commit -m "Initial commit: Cartoon Video Messenger mobile app"
} else {
    Write-Host ""
    Write-Host "ℹ️  No changes to commit" -ForegroundColor Gray
}

# Set main branch
Write-Host ""
Write-Host "🌿 Setting up main branch..." -ForegroundColor Yellow
git branch -M main

Write-Host ""
Write-Host "✅ Git repository is ready!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Create the repository on GitHub:" -ForegroundColor White
Write-Host "   https://github.com/new" -ForegroundColor Gray
Write-Host "   Name: funny-face-mobile" -ForegroundColor Gray
Write-Host "   Set to Public" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Push to GitHub:" -ForegroundColor White
Write-Host "   git push -u origin main" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Build APK:" -ForegroundColor White
Write-Host "   npm install -g eas-cli" -ForegroundColor Gray
Write-Host "   eas login" -ForegroundColor Gray
Write-Host "   npm run build:android" -ForegroundColor Gray
Write-Host ""
Write-Host "4. Create GitHub Release and upload APK" -ForegroundColor White
Write-Host ""
