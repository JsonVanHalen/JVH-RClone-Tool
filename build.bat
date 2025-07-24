@echo off
REM 📦 JVH-SyncConfig build script (stable, minimal, explicit)

REM 1. Move to repo root
cd /d "%~dp0"

REM 2. Activate Python 3.10 environment
call ".venv\Scripts\activate.bat"

REM 3. Clean build artifacts (skip folder_selector.spec entirely)
rmdir /s /q build 2>nul
rmdir /s /q dist 2>nul

REM 4. Run PyInstaller directly from .venv (no reliance on PATH)
".venv\Scripts\pyinstaller.exe" "gui\folder_selector.py" ^
    --onefile ^
    --windowed ^
    --name JVH-SyncConfig ^
    --icon="assets\sync.ico"

echo.
echo ✅ Done. Check dist\JVH-SyncConfig.exe
pause
