:start
cls
echo Select a utility to execute:
echo 1. IP Configuration (ipconfig)
echo 2. Task List and Kill Processes (tasklist/taskkill)
echo 3. Check Disk (chkdsk)
echo 4. Format Disk (format)
echo 5. Defragment Disk (defrag)
echo 6. Search File (find)
echo 7. Change File Attributes (attrib)
echo 8. Exit
echo.

set /P Choice=Enter your input [1-8]: 
if "%Choice%"=="1" goto ipconfig
if "%Choice%"=="2" goto viewtasks
if "%Choice%"=="3" goto checkdisk
if "%Choice%"=="4" goto format
if "%Choice%"=="5" goto defragment
if "%Choice%"=="6" goto search
if "%Choice%"=="7" goto attribute
if "%Choice%"=="8" goto exit

echo Invalid choice
pause
goto start

:ipconfig
ipconfig /all
pause
goto start

:viewtasks
echo 1. View tasks (tasklist)
echo 2. Kill a task (taskkill)
set /P TaskChoice=Enter your input [1-2]: 
if "%TaskChoice%"=="1" (
    echo Displaying current tasks:
    TASKLIST [/S system [/U username [/P [password]]]] [/M [module] | /SVC | /V] [/FI filter]
[/FO format] [/NH]
    pause
) else if "%TaskChoice%"=="2" (
    set /P PID=Enter the Process ID (PID) to kill: 
    echo Attempting to kill process with PID: %PID%
    taskkill /F /PID %PID%
    if errorlevel 1 (
        echo Failed to kill the process. Ensure the Process ID is correct and you have necessary permissions.
    ) else (
        echo Process with PID %PID% has been successfully terminated.
    )
    pause
)
goto start

:checkdisk
set /P Drive=Enter the drive letter to check (e.g., C:): 
chkdsk %Drive% /f
echo.
echo If errors were found, run CHKDSK again with /r to fix them.
pause
goto start

:format
set /P Drive=WARNING: Formatting will erase all data. Enter the drive letter to format (e.g., D:): 
format %Drive% /q /x
pause
goto start

:defragment
set /P Drive=Enter the drive to defragment (e.g., C:): 
defrag %Drive%
pause
goto start

:search
set /P Directory=Enter the directory to search files in (e.g., C:\Windows): 
set /P SearchString=Enter the text to search for: 
find "%SearchString%" %Directory%
pause
goto start

:attribute
set /P FilePath=Enter the full path of the file to change attributes (e.g., C:\file.txt): 
set /P Attributes=Enter attributes to change (+R, -R, +H, -H, +S, -S): 
attrib %Attributes% %FilePath%
pause
goto start

:exit
echo Exiting...
timeout /t 10 >nul
exit
