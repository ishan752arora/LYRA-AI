@echo off
echo ========================================
echo    Lyra Voice Assistant - APK Builder
echo ========================================
echo.

echo Checking Gradle...
if not exist "gradlew.bat" (
    echo ERROR: gradlew.bat not found!
    echo Please run this from LyraVoiceAssistant folder
    pause
    exit /b 1
)

echo.
echo Select build type:
echo 1. Debug APK (for testing)
echo 2. Release APK (for distribution)
echo.
set /p choice="Enter choice (1 or 2): "

if "%choice%"=="1" (
    echo.
    echo Building Debug APK...
    echo.
    call gradlew.bat assembleDebug
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ========================================
        echo SUCCESS! Debug APK built successfully!
        echo ========================================
        echo.
        echo APK Location:
        echo app\build\outputs\apk\debug\app-debug.apk
        echo.
        echo To install on connected device:
        echo adb install app\build\outputs\apk\debug\app-debug.apk
        echo.
    ) else (
        echo.
        echo ========================================
        echo BUILD FAILED!
        echo ========================================
        echo.
        echo Try: gradlew.bat clean
        echo Then run this script again
        echo.
    )
) else if "%choice%"=="2" (
    echo.
    echo Building Release APK...
    echo.
    call gradlew.bat assembleRelease
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ========================================
        echo SUCCESS! Release APK built successfully!
        echo ========================================
        echo.
        echo APK Location:
        echo app\build\outputs\apk\release\app-release.apk
        echo.
        echo This APK is ready for distribution!
        echo.
    ) else (
        echo.
        echo ========================================
        echo BUILD FAILED!
        echo ========================================
        echo.
        echo Make sure you have configured signing key!
        echo See BUILD_INSTRUCTIONS.md for details
        echo.
    )
) else (
    echo Invalid choice!
)

echo.
pause
