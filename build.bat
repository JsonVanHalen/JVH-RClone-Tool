@echo off
REM 🛠️ Build script for JVH-RClone-Tool executable

REM Force working directory to script location
cd /d "%~dp0"

REM Activate virtual environment
call "%~dp0.venv\Scripts\activate.bat"

REM Clean previous builds
rmdir /s /q "%~dp0build"
rmdir /s /q "%~dp0dist"
del /q "%~dp0folder_selector.spec"

REM Check if icon exists before including it
IF EXIST "%~dp0assets\sync.ico" (
    SET ICON_FLAG=--icon="%~dp0assets\sync.ico"
) ELSE (
    SET ICON_FLAG=
)

REM Run PyInstaller with options
pyinstaller "%~dp0gui\folder_selector.py" ^
    --onefile ^
    --windowed ^
    --name JVH-SyncConfig ^
    %ICON_FLAG%

echo.
echo ✅ Build complete: dist\JVH-SyncConfig.exe (if no errors above)
pause
