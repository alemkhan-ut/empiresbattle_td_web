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
echo Creating archive...

"C:\Program Files\7-Zip\7z.exe" a -tzip "build.zip" Build StreamingAssets

echo.
echo =====================================
echo Done!
echo Archive created:
echo %VERSION%.zip
echo =====================================

pause