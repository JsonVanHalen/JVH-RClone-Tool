@echo off
SET PYI=..\..\jvh-rclone-tool\.venv\Scripts\pyinstaller.exe
SET SCRIPT=gui\folder_selector.py
SET ICON=assets\sync.ico

REM Check PyInstaller exists
IF NOT EXIST "%PYI%" (
    echo ❌ PyInstaller not found at %PYI%
    pause
    exit /b
)

REM Check script exists
IF NOT EXIST "%SCRIPT%" (
    echo ❌ Script not found at %SCRIPT%
    pause
    exit /b
)

REM Check icon exists
IF NOT EXIST "%ICON%" (
    echo ⚠️ Icon not found at %ICON%
    echo Continuing without icon...
    SET ICON=
) ELSE (
    SET ICON=--icon="%ICON%"
)

REM Run PyInstaller
"%PYI%" %SCRIPT% --noconfirm --clean --windowed %ICON%
echo ✅ Build completed
pause
