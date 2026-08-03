@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

echo =====================================
echo Unity WebGL Packager
echo =====================================

if not exist Build (
    echo ERROR: Build folder not found.
    pause
    exit /b 1
)

if not exist index.html (
    echo ERROR: index.html not found.
    pause
    exit /b 1
)

echo.
echo Renaming files...

pushd Build

for %%f in (*.data.unityweb) do ren "%%f" "content.data.unityweb"
for %%f in (*.framework.js.unityweb) do ren "%%f" "framework.js.unityweb"
for %%f in (*.loader.js) do ren "%%f" "unityLoader.js"
for %%f in (*.wasm.unityweb) do ren "%%f" "content.wasm.unityweb"

popd

echo.
echo Reading version...

set VERSION=

for /f "tokens=2 delims=\"" %%a in ('findstr /c:"productVersion:" index.html') do (
    set VERSION=%%a
)

if "%VERSION%"=="" (
    echo ERROR: Cannot determine productVersion.
    pause
    exit /b 1
)

echo Version: %VERSION%

if exist "%VERSION%.zip" del "%VERSION%.zip"

echo.
echo Creating archive...

powershell -NoProfile -Command ^
"Compress-Archive -Path 'Build','StreamingAssets' -DestinationPath '%VERSION%.zip' -Force"

echo.
echo =====================================
echo Done!
echo Archive created:
echo %VERSION%.zip
echo =====================================

pause