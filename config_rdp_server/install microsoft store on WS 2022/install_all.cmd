@echo off

rem Installing requirenments and WhatsApp application.

for /r "source" %%i in (*.appx *.appxbundle *.msixbundle) do (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-AppxPackage -Path '%%~fi'"
)
cd ..

pause