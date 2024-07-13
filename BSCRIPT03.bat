@echo off
:start
cls
echo Select a utility to execute:
echo 1. IP Configuration [ipconfig]
echo 2. View Task List [tasklist]
echo 3. Kill a Task [taskkill]
echo 4. Check Disk [chkdsk]
echo 5. Format Disk [format]
echo 6. Defragment Disk [defrag]
echo 7. Search File [find]
echo 8. Change File Attributes [attrib]
echo 9. Exit
echo.

set /P Choice=Enter your input [1-9]: 
if "%Choice%"=="1" goto ipconfig
if "%Choice%"=="2" goto tasklist
if "%Choice%"=="3" goto taskkill
if "%Choice%"=="4" goto checkdisk
if "%Choice%"=="5" goto format
if "%Choice%"=="6" goto defragment
if "%Choice%"=="7" goto search
if "%Choice%"=="8" goto attribute
if "%Choice%"=="9" goto exit
echo Invalid Input...
pause
goto start

:ipconfig
ipconfig /all
pause
goto start

:tasklist
tasklist
pause
goto start

:taskkill
set /P PID=Enter the Process ID (PID) to kill: 
taskkill /PID %PID%
pause
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
