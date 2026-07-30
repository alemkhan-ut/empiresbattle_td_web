@echo off
cd /d "%~dp0"

echo Prefix detected, searching files...

for %%f in (*.data.unityweb) do (
    echo Renaming "%%f" -^> "content.data.unityweb"
    ren "%%f" "content.data.unityweb"
)

for %%f in (*.framework.js.unityweb) do (
    echo Renaming "%%f" -^> "framework.js.unityweb"
    ren "%%f" "framework.js.unityweb"
)

for %%f in (*.loader.js) do (
    echo Renaming "%%f" -^> "unityLoader.js"
    ren "%%f" "unityLoader.js"
)

for %%f in (*.wasm.unityweb) do (
    echo Renaming "%%f" -^> "content.wasm.unityweb"
    ren "%%f" "content.wasm.unityweb"
)

echo.
echo Done!
pause
