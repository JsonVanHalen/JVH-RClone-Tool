@echo off
cd /d "%~dp0"
call "%~dp0.venv\Scripts\activate.bat"

REM Clean previous builds
rmdir /s /q "%~dp0build"
rmdir /s /q "%~dp0dist"
del /q "%~dp0gui\folder_selector.spec"

REM Check if icon exists
IF EXIST "%~dp0assets\sync.ico" (
    SET ICON_FLAG=--icon="%~dp0assets\sync.ico"
) ELSE (
    SET ICON_FLAG=
)

REM Run PyInstaller from .venv
"%~dp0.venv\Scripts\pyinstaller.exe" "%~dp0gui\folder_selector.py" ^
    --onefile ^
    --windowed ^
    --name JVH-SyncConfig ^
    %ICON_FLAG%

echo.
echo ✅ Build complete: dist\JVH-SyncConfig.exe (if no errors above)
pause
