@echo off
md pngImages 2>nul
md DATS 2>nul
del pngList.txt 2>nul
cd Input
for %%f in (*.png) do (
md "..\Output\%%f_out" 2>nul
echo %%f%>>..\pngList.txt
cls
echo %%f
)
cls
for %%f in (*.png) do (
..\offzip -a "%%f" "..\Output\%%f_out"
ren "..\Output\%%f_out\*" "%%f.dat" >nul
move "..\Output\%%f_out\*" "..\DATS\" >nul

)
cd ..\
rmdir /s /q Output
start /wait KHUxPNG2BMP.exe
rmdir /s /q DATS
del pngList.txt 2>nul
cls
echo Your BMPs are in pngImages Folder.
pause >nul