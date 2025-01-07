@echo off
setlocal enabledelayedexpansion

rem Define the port you want to check
set PORT=8000

rem Check if the server is running
echo Checking if server is running on port %PORT%...
netstat -aon | findstr :%PORT% >nul
if %ERRORLEVEL% equ 0 (
    rem Server is running, so stop it
    echo Server is running. Stopping the server...
    FOR /F "tokens=5" %%a IN ('netstat -aon ^| findstr :%PORT%') DO (
        echo Found process with PID %%a
        taskkill /F /PID %%a
        echo Server stopped.
    )
) else (
    rem Server is not running, so start it
    echo Server is not running. Starting the server...
    cd /d C:\Users\kilometrage\Desktop\kilometraje
    start /B cmd /c "node server.js"
    echo Server started.
)

endlocal
