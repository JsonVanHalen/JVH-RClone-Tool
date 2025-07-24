@echo off
echo Current dir: %cd%
cd /d "%~dp0"
echo After cd, dir: %cd%

REM Print presence of critical folders/files
if exist "gui\folder_selector.py" (echo ✅ folder_selector.py found) else (echo ❌ Missing: folder_selector.py)
if exist "assets\sync.ico" (echo ✅ sync.ico found) else (echo ⚠️ Missing: sync.ico)
if exist ".venv\Scripts\pyinstaller.exe" (echo ✅ PyInstaller found) else (echo ❌ Missing: pyinstaller.exe)

REM Skip actual build
pause

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
