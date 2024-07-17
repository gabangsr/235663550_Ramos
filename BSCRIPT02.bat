@echo off

echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p choice="Choose a shape[1/2/3] : " 

if "%choice%"=="1" goto Circle
if "%choice%"=="2" goto Triangle
if "%choice%"=="3" goto Quadrilateral

:Circle
set /p radius="Enter the radius of the circle: "
if "%radius%"=="" echo You must input a number to start. & goto Circle
set /a area=314159 * radius * radius / 100000
echo The area of the circle is %area%.
goto end

:Triangle
set /p a="Enter the length of the first side: "
if "%a%"=="" echo You must input a number to start. & goto Triangle
set /p b="Enter the length of the second side: "
if "%b%"=="" echo You must input a number to start. & goto Triangle
set /p c="Enter the length of the third side: "
if "%c%"=="" echo You must input a number to start. & goto Triangle

::Use powershell for the square root formula
for /f "delims=" %%a in ('powershell.exe -Command "$s=(%a% + %b% + %c%) / 2; [Math]::Round([Math]::Sqrt($s*($s-%a%)*($s-%b%)*($s-%c%)), 2)"') do set area=%%a
echo The area of the triangle is %area%.
if "%a%"=="%b%" (
    if "%b%"=="%c%" (
        echo The triangle is classified as equilateral.
    ) 
    if not "%b%"=="%c%" (
        echo The triangle is classified as isosceles.
    )
) 
if not "%a%"=="%b%" (
    if "%b%"=="%c%" (
        echo The triangle is classified as isosceles.
    ) 
    if not "%b%"=="%c%" (
        echo The triangle is classified as scalene.
    )
)
goto end


:Quadrilateral
set /p length="Enter the length of the quadrilateral: "
if "%length%"=="" echo You must input a number to start. & goto Quadrilateral
set /p width="Enter the width of the quadrilateral: "
if "%width%"=="" echo You must input a number to start. & goto Quadrilateral
set /a area=length * width
echo The area of the quadrilateral is %area%.

if "%length%"=="%width%" (
    echo The quadrilateral is classified as a square.
) 
if not "%length%"=="%width%" (
    echo The quadrilateral is classified as a rectangle.
)
goto end

:end
echo Finished Calculations.
timeout /t 10 >nul
exit
