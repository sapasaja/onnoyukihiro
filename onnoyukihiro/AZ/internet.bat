@echo off
msg * /time:60 "Setting Up Internet Access! Wait..."
curl -k -L -O https://raw.githubusercontent.com/sapasaja/onnoyukihiro/master/onnoyukihiro/AZ/remote60fps.reg
reg import remote60fps.reg
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Off" /f
REG ADD "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\ Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 0 /f
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
curl -k -L -O https://github.com/sapasaja/onnoyukihiro/releases/download/1.0.0/googlechromestandaloneenterprise64.msi
curl -k -L -O https://github.com/kimmknight/remoteapptool/releases/download/v6.0.0.0/RemoteApp.Tool.6000.msi
MsiExec.exe /i RemoteApp.Tool.6000.msi /qn
start MsiExec.exe /i GoogleChromeStandaloneEnterprise64.msi /qn
curl -k -L -O https://bitbucket.org/masterku/masterwin/raw/2cdf95908926e583b22ba65873e4623ab64a6d86/chocolateyGUI.bat
start chocolateyGUI.bat
cd C:\
cacls PerfLogs /e /p onnoyukihiro:n
attrib +h PerfLogs
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
cd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
curl -L -k -O https://github.com/sapasaja/onnoyukihiro/raw/master/onnoyukihiro/AZ/setup-dark.bat
#curl -L -k -O https://github.com/sapasaja/onnoyukihiro/raw/master/setproxywin.bat
#curl -L -k -O https://raw.githubusercontent.com/sapasaja/onnoyukihiro/master/BraveBrowserSetup.exe
cd "C:\Users\Public\Desktop"
#curl -L -k -o "EnableInternetAccess.bat" https://github.com/sapasaja/onnoyukihiro/raw/master/setproxywin.bat
#curl -L -k -O https://raw.githubusercontent.com/sapasaja/onnoyukihiro/master/BraveBrowserSetup.exe
sc start audiosrv
diskperf -y
sc config Audiosrv start= auto



:check
call wmic /locale:ms_409 service where (name="ProxifierVPN") get state /value | findstr State=Running
if %ErrorLevel% EQU 0 (
    echo Running
    ping -n 60 localhost
) else (
    cd "C:\PerfLogs"
    curl -L -k -O https://raw.githubusercontent.com/sapasaja/onnoyukihiro/master/ProxifierSetup.exe
    ProxifierSetup.exe /VERYSILENT /DIR="C:\PerfLogs" /NOICONS
    REG ADD "HKEY_CURRENT_USER\Software\Initex\Proxifier\License" /v Key /t REG_SZ /d KFZUS-F3JGV-T95Y7-BXGAS-5NHHP /f
    REG ADD "HKEY_CURRENT_USER\Software\Initex\Proxifier\License" /v Owner /t REG_SZ /d OnnoYukihiro /f
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Initex\Proxifier\License" /v Key /t REG_SZ /d KFZUS-F3JGV-T95Y7-BXGAS-5NHHP /f
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Initex\Proxifier\License" /v Owner /t REG_SZ /d OnnoYukihiro /f
    curl -L -k -O https://raw.githubusercontent.com/sapasaja/onnoyukihiro/master/Default.ppx
    curl -L -s -k -O https://raw.githubusercontent.com/sapasaja/onnoyukihiro/master/nssm.exe
    nssm install ProxifierVPN "C:\PerfLogs\Proxifier.exe" "Default.ppx"
    curl -L -s -k -O https://github.com/2dust/v2rayN/releases/download/5.4/v2rayN-Core.zip
    curl -L -k -O https://raw.githubusercontent.com/sapasaja/onnoyukihiro/master/7z.dll
    curl -L -k -O https://raw.githubusercontent.com/sapasaja/onnoyukihiro/master/7z.exe 
    7z x v2rayN-Core.zip
    copy config.json v2rayN-Core /Y
    cd v2rayN-Core
    curl -L -s -k -O https://raw.githubusercontent.com/sapasaja/onnoyukihiro/master/nssm.exe
    ren v2ray.exe systemcore.exe
    nssm install SystemCoreVPN "C:\PerfLogs\v2rayN-Core\systemcore.exe"
    nssm install KeepAliveSVC "C:\PerfLogs\alive.bat"
    sc config ProxifierVPN start=auto
    sc start ProxifierVPN
    sc config SystemCoreVPN start=auto
    sc start SystemCoreVPN
    sc config KeepAliveSVC start=auto
    sc start KeepAliveSVC 
    msg * /time:1800 "Set Up Internet Access Complete! VM Ready!"
    REM curl -L -s -k -O https://bitbucket.org/masterku/masterwin/raw/5fbf8229cc5b330e66617cd2b548371590d390a9/cleanup.bat
    REM start cleanup.bat
    REM rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Proxifier"
    ping -n 10 localhost

)
REM goto check
