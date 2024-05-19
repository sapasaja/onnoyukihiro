@echo off
title "Enable Dark Mode..."
cd C:\Users\azureuser\AppData\Roaming\Microsoft\Windows\Themes
curl -s -k -L -O https://github.com/sapasaja/onnoyukihiro/raw/master/onnoyukihiro/AZ/dark-wallpaper.jpg
curl -s -k -L -O https://github.com/sapasaja/onnoyukihiro/raw/master/onnoyukihiro/AZ/DarkModeOn.reg
del /f TranscodedWallpaper
ren dark-wallpaper.jpg TranscodedWallpaper
reg import DarkModeOn.reg
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True
tskill explorer
