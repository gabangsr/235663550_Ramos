@echo off
REM Prompt user to select a utility
echo Select a Windows utility to execute:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
set /p choice=Enter your choice (1-8): 

if %choice%==1 (
    ipconfig
) else if %choice%==2 (
    tasklist
) else if %choice%==3 (
    set /p pid=Enter the PID of the process to kill: 
    taskkill /PID %pid%
) else if %choice%==4 (
    set /p drive=Enter the drive letter (e.g., C:): 
    chkdsk %drive%
) else if %choice%==5 (
    set /p drive=Enter the drive letter to format (e.g., D:): 
    echo WARNING: This will erase all data on the drive!
    pause
    format %drive%
) else if %choice%==6 (
    set /p drive=Enter the drive letter to defrag (e.g., C:): 
    defrag %drive%
) else if %choice%==7 (
    set /p search=Enter the search string: 
    set /p file=Enter the file to search in: 
    find "%search%" %file%
) else if %choice%==8 (
    set /p file=Enter the file or directory: 
    attrib %file%
) else (
    echo Mali mhiema. Exiting...
)
pause
exit
