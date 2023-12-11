@echo off
setlocal

REM Define the destination directory for browser data
set "DEST_DIR=C:\path\to\destination_directory"

REM Define the source directory (default Chrome profile path)
set "SOURCE_DIR=%LOCALAPPDATA%\Google\Chrome\User Data\Default"

REM Confirm before proceeding
echo Are you sure you want to copy the Chrome data to %DEST_DIR%? (Y/N)
set /p confirm=
if /I "%confirm%" neq "Y" goto end

REM Check if the source directory exists and copy
if exist "%SOURCE_DIR%" (
    echo Collecting Chrome data...
    xcopy "%SOURCE_DIR%" "%DEST_DIR%" /E /H /C /I
    echo Data collection complete. Data copied to %DEST_DIR%.
) else (
    echo Chrome data directory not found.
)

:end
endlocal
