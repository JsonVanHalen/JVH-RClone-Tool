@echo off
REM 🛠️ Build script for JVH-RClone-Tool executable
REM This script uses PyInstaller to create a standalone executable for the GUI application.

REM Ensure the script is run from the directory where it is located
cd /d "%~dp0"

REM Activate virtual environment
call .venv\Scripts\activate.bat

REM Clean previous builds
rmdir /s /q build
rmdir /s /q dist
del /q folder_selector.spec

REM Run PyInstaller with options
pyinstaller gui\folder_selector.py ^
    --onefile ^
    --windowed ^
    --name JVH-SyncConfig ^
    --icon=assets\sync.ico

echo.
echo ✅ Build complete: dist\JVH-SyncConfig.exe
pause
