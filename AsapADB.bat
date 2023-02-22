@echo off
set /P c=I to google's terms/conditions https://developer.android.com/studio/releases/platform-tools(Y/N)?  

if /I "%c%"=="y" goto START
if /I "%c%"=="n" goto BYE

:START
echo downloading
curl --output-dir %userprofile%\Desktop -L -O https://dl.google.com/android/repository/platform-tools-latest-windows.zip
echo download done

echo unzip
tar --directory %userprofile%\Desktop -xf %userprofile%\Desktop\platform-tools-latest-windows.zip
echo unzip done

md C:\adb
robocopy %userprofile%\Desktop\platform-tools C:\adb /E /MOVE

echo system variables
setx Path C:\adb\
setx Path C:\adb /m




echo done
pause
:BYE
exit