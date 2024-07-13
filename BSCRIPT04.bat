@echo off
mkdir "Z:\archive"
forfiles /P "C:\" /S /M *.txt /D -30 /C "cmd /c echo Moving @path && move @path E:\archive"
for /f "tokens=*" %%a in ('dir "Z:\archive\*.txt" /s /o-s') do echo %%a

set /p delete="Do you want to delete these files? [y/n]: "
if /i "%delete%"=="y" (
    del /q "Z:\archive\*.*"
    echo Files successfully deleted.
)
if /i "%delete%"=="n" (
    echo Process terminated.  
)
if /i "%delete%"=="" (
    echo Process terminated due to invalid input.  
)

timeout /t 10 >nul
exit
