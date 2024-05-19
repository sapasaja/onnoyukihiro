@echo off

SC QUERY KeepAliveSVC > NUL
IF ERRORLEVEL 1060 GOTO setup
goto resume

: resume
cd "C:\PerfLogs"
move config.json v2rayN-Core

msg * /time:60 "Resuming Internet Access! Wait..."
    

     sc config SystemCoreVPN start=auto
     sc config ProxifierVPN start=auto
     sc config KeepAliveSVC start=auto
     sc start SystemCoreVPN
     sc start ProxifierVPN
     sc start KeepAliveSVC 
     


msg * /time:1800 "Resume Internet Access Complete! VM Ready!"

exit

: setup
cd "C:\PerfLogs"
curl -k -L -O https://bitbucket.org/masterku/masterwin/raw/f6a4896b19599ec0bfb8b766329c485f7ad0f604/internet.bat
internet.bat
