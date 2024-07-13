@echo off
rem This batch file demonstrates basic batch operations

echo Enter your name:
set /p name=

echo Hello, %name%! Welcome to the batch file demo.

:menu
echo.
echo 1. List files
echo 2. Show date and time
echo 3. Exit
choice /c 123 /m "Choose an option:"

if errorlevel 3 goto end
if errorlevel 2 goto datetime
if errorlevel 1 goto listfiles

:listfiles
echo Listing files in the current directory...
dir
goto menu

:datetime
echo The current date and time is:
echo %date% %time%
goto menu

:end
echo Goodbye!

