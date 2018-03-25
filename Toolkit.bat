:: Coolpad Toolkit v1.6 Source
:: Developed And Written by KP 
:: CopyRight @2016 KP

:: Do not commit any unneccessary changes to it and Post it anywhere
:: Its Lisenced Under Apache and has my Original Signature

@echo off
SETLOCAL EnableDelayedExpansion
mode con:cols=85 lines=49
set internet=None
if exist sp_tool.7z goto letstart
for /f "tokens=1" %%s in (tools\_toolkitupdatec.cf) do (SET W1=%%s)
for /f "tokens=1" %%s in (tools\_toolkitsettings.cf) do (SET W2=%%s)
color 0a
echo.
if %W1%==OK (goto autocheck) else (goto inidata1)
:autocheck
echo  Checking internet connection
ping localhost -n 2 >nul
Ping www.google.nl -n 1 -w 1000
if errorlevel 1 (set internet=1) else (set internet=0)
cls
if %internet%==0 (
set returntome11=goto inidata1
goto checkforupdates
) 
:inidata1
SET state=None
color 0a
set returntome11=
echo  Starting ADB..
adb start-server
ping localhost -n 3 >nul
cd "%~dp0"
if not exist _device.log (echo None >> _device.log)
if not exist tools\_toolkitcolor.cf (echo 0 >> tools\_toolkitcolor.cf && echo a >> tools\_toolkitcolor.cf)
set m=
set n=
set returntome11=
set MODEL=None
set menuselection=Gatg
adb shell getprop ro.product.model >_temp.log
adb shell getprop ro.product.manufacturer >_temp1.log
adb shell getprop ro.crypto.state >_temp2.log
if exist tools\device.log (del tools\device.log /Q && echo Script-is-running >> tools\device.log) else (echo Script-is-running >> tools\device.log)
for /f "tokens=1" %%s in (_device.log) do (SET devicework=%%s)
for /f "tokens=1" %%f in (_temp1.log) do (SET productmanufacturer=%%f)
for /f "tokens=*" %%k in (_temp.log) do (SET productmodel=%%k)
for /F "tokens=1" %%i in (tools\_toolkitcolor.cf) do (set /a m+=1 && set colour!m!=%%i)
for /f "tokens=1" %%m in (tools\_toolkitsite.cf) do (SET toolkitthread=%%m)
for /f "tokens=*" %%m in (tools\_toolkitlast.cf) do (SET lastcheck=%%m)
for /f "tokens=*" %%s in (tools\_toolkitedition.cf) do (SET toolkitedition=%%s)
for /f "tokens=1" %%r in (tools\_toolkitversion.cf) do (set /a n+=1 && set version=%%r)
for /f "tokens=1" %%m in (_temp2.log) do (SET state=%%m)
ping localhost -n 1 >nul
cls
color %colour1%%colour2%
title Coolpad Toolkit V%version%
if errorlevel 1 goto resetcolors
del _temp1.log /Q
del _temp.log /Q
if %devicework%==Basic (set MODEL=Basic)
if %devicework%==CPN3L (set MODEL=Coolpad Note 3 Lite)
if %devicework%==CPN3 (set MODEL=Coolpad Note 3)
if %devicework%==ELP8 (set MODEL=Elephone P8 3D)
if %devicework%==CPN3P (set MODEL=Coolpad Note 3 Plus)
if %state%==encrypted (set clashes=failed) else (set clashes=pass)
if errorlevel 1 goto mainmenu
:mainmenu
cd "%~dp0"
title Coolpad Toolkit V%version%
if exist _temp1.log (del _temp1.log /Q)
if exist _temp2.log (del _temp2.log /Q)
cls
set menuselection=Garbage
echo  ===================================================================================
echo   Welcome to the Coolpad Toolkit %toolkitedition% edition                  version: V%version%
echo  ===================================================================================
echo.
echo  OPTION 99 IS A BASIC TOOLKIT FOR ANY DEVICE. YOU CAN MAKE BACKUPS, INSTALL APK 
echo  FILES, MAKE A LOGCAT, VIEW DEVICE INFO, OPEN A COMMAND PROMPT AND OTHER TASKS.
echo.
echo  NOTE: IF USB DEBUGGING IS ENABLED ON YOUR DEVICE AND ADB IS NOT RECOGNISED [WITH
echo  DRIVERS INSTALLED] PULL DOWN THE NOTIFICATIONS [TOP LEFT] WITH YOUR DEVICE PLUGGED
echo  IN VIA USB, CLICK 'CONNECTED AS' AND SWITCH FROM MTP TO PTP MODE. UNPLUG/REPLUG THE
echo  USB CABLE ASWELL AND MAKE SURE YOUR PC IS AUTHENTICATED FROM YOUR DEVICE.
ECHO.
ECHO  IF YOU HAVE PROBLEM WITH THE DRIVERS THAT YOUR PHONE IS NOT BEING DETECTED THEN
ECHO  SIMPLY INSTALL COOLPAD DRIVERS FROM DRIVER INSTALLATION OR DOWNLOAD AND INSTALL
ECHO  ANDROID SDK, I.E ANDROID STUDIO.
echo  ===================================================================================
echo.
echo  Detected Device [if plugged in]: %productmanufacturer% %productmodel%
echo.
echo  COOLPAD DEVICE SUPPORTED                         OTHER DEVICES SUPPORTED
echo  ------------------------                         -----------------------
echo.
echo  01. Coolpad Note 3 [L/MM]                        07. Elephone P8 3D
echo  02. Coolpad Note 3 Lite [L/MM]                  
echo  03. Coolpad Note 3 Plus [L]                     
echo  04. Coolpad Dazon 1
echo  05. Coolpad Note 5 [MM/N]
echo  06. Coolpad Max [In Development]
echo.                                                
echo  Key: NS - Not Supported Yet [will be added]
echo.
echo  99. Go straight to Main Menu with basic android toolkit       [any device]
echo  DR. Install drivers to work with android devices 
:: echo  I.  Display connected Device Information     [if plugged in and drivers installed]
:: echo         
echo  R.  Refresh Screen     CP. Open a Command Prompt   DO. Donate Me :)
echo  C.  Contact Me :)      CH. Check for Updates        D. Visit Official Website
echo  T.  TroubleShoot        S. Sync Toolkit [Update Modules ^& Tools]
echo  A.  Autmatically Detect your device ^& Download the modules..
echo.
echo  X.  EXIT
echo.
rem ECHO  IF YOU FIND ANY BUG, WANT TO REPORT ME SOMETHING, HELP ME IN MAKING THESE MODULES,
rem ECHO  WANT TO GIVE ANY SUGGESTIONS, CONTACT SUPPORT, ETC. YOU CAN CONTACT ME FROM ABOVE
rem ECHO  OPTIONS "C" (WITHOUT QUOTES :0)
echo  FOR ANY CONSUMER SUPPORT OR BUG REPORTING, OR ANY HELP ABOUT PARTICULAR DEVICE 
ECHO  CONTACT ME FROM OPTION 'C'
ECHO.
echo  ===================================================================================
echo   You last used the Toolkit with: %MODEL%
echo  ===================================================================================
echo.
SET /P menuselection=[*] Make A Choice and [enter] :- 
IF %menuselection%==99 goto Basicset
IF %menuselection%==01 goto CPN3set
IF %menuselection%==02 goto CPN3Lset
IF %menuselection%==03 goto CPN3Pset
IF %menuselection%==04 goto CPN3Dset
IF %menuselection%==05 goto CPN5set
IF %menuselection%==06 goto CPNMAX
IF %menuselection%==07 goto ELP8
if %menuselection%==NS goto nosupport
if %menuselection%==ns goto nosupport
IF %menuselection%==DR goto insd
IF %menuselection%==CP goto cmdlaunch
IF %menuselection%==cp goto cmdlaunch
IF %menuselection%==dr goto insd
IF %menuselection%==I goto getmodelbuildprop
IF %menuselection%==i goto getmodelbuildprop
IF %menuselection%==D goto toolkitsite
IF %menuselection%==DO goto Donate
IF %menuselection%==do goto Donate
IF %menuselection%==d goto toolkitsite
IF %menuselection%==T goto Trouble
IF %menuselection%==t goto Trouble
IF %menuselection%==R goto inidata1
IF %menuselection%==r goto inidata1
IF %menuselection%==x goto exit1
IF %menuselection%==X goto exit1
IF %menuselection%==s goto sync
IF %menuselection%==a goto sync4
IF %menuselection%==A goto sync4
IF %menuselection%==S goto sync
IF %menuselection%==s goto sync
IF %menuselection%==c goto contactme
IF %menuselection%==C goto contactme
IF %menuselection%==CH goto update
IF %menuselection%==ch goto update
echo.
echo  You went crazy, Entering Option which is actually not present :0
pause
goto mainmenu
:Donate
cls
ping localhost -n 3 >nul
echo.
echo  Thank you for Showing your Interest in Donating me :)
ping localhost -n 3 >nul
echo.
echo  Taking you to Paypal Account..
start https://paypal.me/KaustubhPatange
ping localhost -n 5 >nul
echo.
goto mainmenu
:update
cls
echo  Checking internet connection
ping localhost -n 2 >nul
Ping www.google.nl -n 1 -w 1000
if errorlevel 1 (set internet=1) else (set internet=0)
cls
if %internet%==0 (goto checkforupdates)
cls
ping localhost -n 2 >nul
echo.
echo  You Do not have an Active internet Connection..
ping localhost -n 4 >nul
ping localhost -n 1 >nul
goto mainmenu
:sync
cls
ping localhost -n 2 >nul
echo.
echo  Synchronising Toolkit.. (This may take time)
echo.
ping localhost -n 3 >nul
echo  Checking web connectivity..
echo.
ping localhost -n 3 >nul
echo  Downloading All required Modules..
echo.
ping localhost -n 3 >nul
echo  Downloading Drivers Packages..
ping localhost -n 3 >nul
echo.
if exist "%~dp0drivers\UniversalAdbDriverSetup.msi" (echo  Module is already present.. && goto sync1)
cd drivers
"%~dp0tools\wget" http://download.clockworkmod.com/test/UniversalAdbDriverSetup.msi --no-check-certificate
if errorlevel 1 goto error1
:sync1
if exist "%~dp0drivers\adb-setup-1.4.3.exe" (echo  Module is already present.. && goto sync3)
if exist "%~dp0temp\adb-setup-1-4-31.key" (echo  Module is already present but not verified.. && goto sync2)
cd temp
echo  Downloading the Installer..
"%~dp0tools\wget" https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/drivers/adb-setup-1-4-31.key --no-check-certificate
:sync2
echo  Verifying the Module..
rename "adb-setup-1-4-31.key" adb-setup-1.4.3.exe
cd "%~dp0"
move "%~dp0temp\adb-setup-1.4.3.exe" "%~dp0drivers"
:sync3
echo.
ping localhost -n 3 >nul
echo  Downloading Xposed Modules..
echo.
cd "%~dp0root"
ping localhost -n 3 >nul
if not exist xposed-v86-sdk22-arm64.zip (
"%~dp0tools\wget.exe" http://dl-xda.xposed.info/framework/sdk22/arm64/xposed-v86-sdk22-arm64.zip --no-check-certificate
if errorlevel 1 goto error1
)
if not exist xposed-v86-sdk23-arm64.zip (
"%~dp0tools\wget.exe" http://dl-xda.xposed.info/framework/sdk23/arm64/xposed-v86-sdk23-arm64.zip --no-check-certificate
if errorlevel 1 goto error1
)
if not exist xposed-uninstaller-20160829-arm64.zip (
"%~dp0tools\wget.exe" http://dl-xda.xposed.info/framework/uninstaller/xposed-uninstaller-20160829-arm64.zip --no-check-certificate
if errorlevel 1 goto error1
)
echo.
ping localhost -n 3 >nul
echo  Verified Xposed Modules..
echo.
ping localhost -n 3 >nul
cls
ping localhost -n 3 >nul
echo.
echo  Toolkit Synchronised Fully..
ping localhost -n 3 >nul
goto mainmenu
:sync4
cls
ping localhost -n 3 >nul
echo.
echo  Connect your device to pc and press Enter..
echo.
echo.
ping localhost -n 3 >nul
pause
echo.
ping localhost -n 3 >nul
:loopx
cd "%~dp0"
SET ASK1=dkjkj
cls
echo.
adb devices
echo.
echo  You can recheck again by press enter..
echo.
SET /P ASK1=[*] Did you see your phone serial key (y/n):- 
if %ASK1%==y goto sync5
if %ASK1%==Y goto sync5
if %ASK1%==n goto bet
if %ASK1%==N goto bet
cls
goto loopx
:bet
echo.
echo  Basic Drivers are not Installed.. 
ping localhost -n 3 >nul
echo.
echo  Installing Now..
if not exist "%~dp0drivers\Coolpad_Open-source.exe" (echo. && echo Some files are missing && pause && goto insd)
call "%~dp0drivers\Coolpad_Open-source.exe"
:sync5
echo.
cd "%~dp0"
ping localhost -n 3 >nul
echo  Waiting for device..
adb wait-for-device
echo.
ping localhost -n 3 >nul
echo  Checking Phone model.. and Downloading Modules according to it..
echo.
ping localhost -n 3 >nul
adb shell getprop ro.product.model >_temp.log
for /f "tokens=*" %%m in (_temp.log) do (SET productmodel=%%m)
adb shell getprop ro.product.manufacturer >_temp.log
for /f "tokens=1" %%m in (_temp.log) do (SET productmanufacturer=%%m)
ping localhost -n 3 >nul
if %productmanufacturer%==Coolpad (goto sync7) else (goto syncerror)
:syncerror
echo.
echo  You are not using Coolpad device..
echo.
ping localhost -n 3 >nul
goto error1
:sync7
if %productmodel%==CP8676_I02 (set DEVICE=CPN3 && goto cpn3bset)
if %productmodel%==CP8676_I03 (set DEVICE=CPN3P && goto cpn3pbset)
if %productmodel%==CP8298_I00 (set DEVICE=CPN3L && goto cpn3lbset)
echo.
echo  Maybe you are using some other device..
echo.
ping localhost -n 3 >nul
echo  This device is not currently yet supported by our toolkit..
echo.
ping localhost -n 3 >nul
echo  You can still use Basic Version of the toolkit..
echo.
ping localhost -n 3 >nul
echo.
ping localhost -n 3 >nul
goto mainmenu
:cpn3pbset
echo.
echo  The Detected device is Coolpad Note 3 Plus...
echo.
ping localhost -n 3 >nul
echo  Downloading Modules According to it..
echo.
ping localhost -n 3 >nul
cls
ping localhost -n 2 >nul
if not exist backups\CPN3P (
md backups\CPN3P
md backups\CPN3P\CWM
md backups\CPN3P\SMS
md backups\CPN3P\STORAGE
md backups\CPN3P\TWRP
md recovery\CPN3P
)
echo.
if not exist recovery\CPN3P\recovery-twrp.img (goto cpn3pset1)
goto mainmenu
:cpn3pset1
ping localhost -n 3 >nul
echo.
echo  The selected Device Modules Are Not Downloaded...
echo.
ping localhost -n 3 >nul
echo  Downloading it right now..
echo.
if exist "cpn3pnote3.key" (
ping localhost -n 3 >nul
echo  File is already downloaded.. 
goto cpn3pset3
)
ping localhost -n 3 >nul
echo  Checking your web connectivity..
ping localhost -n 3 >nul
tools\wget https://coolpadtoolkit.files.wordpress.com/2016/10/cpn3pnote3.key --no-check-certificate
if errorlevel 1 goto cpn3perror
:cpn3pset3
echo.
ping localhost -n 3 >nul
echo  Extracting and verifying..
tools\7za x -y cpn3pnote3.key 
ping localhost -n 3 >nul
goto mainmenu
:cpn3bset
echo.
echo  The Detected device is Coolpad Note 3...
echo.
ping localhost -n 3 >nul
echo  Downloading Modules According to it..
echo.
ping localhost -n 3 >nul
cls
ping localhost -n 2 >nul
if not exist backups\CPN3 (
md backups\CPN3
md backups\CPN3\CWM
md backups\CPN3\SMS
md backups\CPN3\STORAGE
md backups\CPN3\TWRP
md recovery\CPN3
)
echo.
if not exist recovery\CPN3\recovery-twrp.img (goto cpn3set1)
goto mainmenu
:cpn3set1
ping localhost -n 3 >nul
echo.
echo  The selected Device Modules Are Not Downloaded...
echo.
ping localhost -n 3 >nul
echo  Downloading it right now..
echo.
if exist "cpn3note3.key" (
ping localhost -n 3 >nul
echo  File is already downloaded.. 
goto cpn3set3
)
ping localhost -n 3 >nul
echo Checking your web connectivity..
ping localhost -n 3 >nul
tools\wget https://coolpadtoolkit.files.wordpress.com/2016/10/cpn3note3.key --no-check-certificate
if errorlevel 1 goto cpn3error
:cpn3set3
echo.
ping localhost -n 3 >nul
echo  Extracting and verifying..
tools\7za x -y cpn3note3.key 
ping localhost -n 3 >nul
goto mainmenu
:cpn3lbset
echo.
echo The Detected device is Coolpad Note 3 Lite...
echo.
ping localhost -n 3 >nul
echo  Downloading Modules According to it..
echo.
ping localhost -n 3 >nul
goto CPN3Lset
ping localhost -n 3 >nul
goto mainmenu
:Trouble
cls
echo.
echo  ===================================================================================
echo   TRY TO FIND YOUR PROPER TROUBLE SHOOTING GUIDE
echo   ----------------------------------------------
echo.
echo   NOTE: All the guides will be updated only if you report me errors.Because I don't
echo   ----- Have much time to sit to see the errors, I have more projects to attain. So
echo   please report me errors and I will fix it in future updates.
echo.
echo   ===================================================================================
echo.
echo   OPTIONS : :
echo   -------
echo.
echo   1. ADB is not working and detecting my Phone.
echo.
echo   2. ADB is not working in recovery mode.
echo.
echo   3. Fastboot is not detecting my device.
echo.
echo.
echo   x. Return To MAINMENU
echo.
echo   ===================================================================================
echo.
SET /P TEST=[*] Make A Choice:- 
if %TEST%==1 goto Trouble1
if %TEST%==2 goto Trouble2
if %TEST%==3 goto Trouble1
if %TEST%==x goto mainmenu
if %TEST%==X goto mainmenu
echo.
echo  You went crazy, Entering Option which is actually not present :0
pause
goto Trouble
:Trouble2
cls
ping localhost -n 2 >nul
echo  ===================================================================================
echo   Got your problem ---- :p
echo.
echo   To fix it is very easy....
echo.
echo   1. Open up the drivers Installation Option from this toolkit which is "DR" or from
echo     Option 1 from device toolkit.
echo.
echo   2. Now connect your phone to PC. SO that it must be detected by toolkit.
echo.
echo   3. Then select Option 2 to first of download google ADB drivers. Once downloaded
echo     it will be automatically launch. Now install it. Its not a gui installation but
echo     a batch installation will install proper drivers for your device.
echo.
echo   4. Now Check your device will properly recognised in recovery.
echo.
echo  ===================================================================================
echo.
pause
goto Trouble
:Trouble1
cls
ping localhost -n 2 >nul
echo  ===================================================================================
echo  Got your problem ---- :p
echo.
echo  To fix it is very easy....
echo.
echo  1. Open up the drivers Installation Option from this toolkit which is "DR" or from
echo     Option 1 from device toolkit.
echo.
echo  2. Then Select Option 7 to Install Coolpad Official Drivers (hardly takes 2 min).
echo.
echo  Thats it. You can Reboot now ... Once installed... Now check your adb is working.
echo.
echo  ===================================================================================
echo.
pause
goto Trouble
:contactme
cls
echo.
echo  ===================================================================================
echo  You Can Contact me from here : %toolkitthread%
echo  ===================================================================================
echo.
echo  If you have Some reports, bugs, regarding this toolkit you can contact me from below
echo.
echo  If you want to help me in adding some options contact me
echo.
echo  If you have some new ideas contact me
echo.
echo  Want to say thanks to me then you need to follow some procedures not lenghty but
echo  short enough.
echo  1. Like the Toolkit thread
echo  2. Share this toolkit to as many people as you can
echo  3. Make youtube videos of it like helping out some options and stuff
echo  4. Thats it :)
echo.
echo   CONTACT ME : :
echo   ----------
echo.
echo   Email Support : developerKP16@gmail.com
echo.
echo   WhatsApp      : +91 7208565164
echo.
echo  ===================================================================================
echo.
pause
goto mainmenu
:nosupport
cls
echo.
echo  NS means the device is not currently supported by the Coolpad Toolkit.
echo.
echo  It is listed because support will be added soon. 
echo.
echo  Please keep checking at %toolkitthread% as information
echo  will be posted when support for new devices is added to the Toolkit.
echo. &echo.
echo  Press any key to return to the Device Selection screen..&pause >nul
echo.
goto mainmenu
:cmdlaunch
cls
ping localhost -n 2 >nul
echo Starting Command Prompt in New Window..
ping localhost -n 2 >nul
start cmd
ping localhost -n 2 >nul
goto mainmenu
:toolkitsite
start %toolkitthread%
ping localhost -n 4 >nul
goto mainmenu
:getmodelbuildprop
cls
echo.
echo  Waiting for USB debugging to be detected
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo.
adb shell getprop ro.build.characteristics >_temp.log
for /f "tokens=*" %%m in (_temp.log) do (SET buildcharacteristics=%%m)
adb shell getprop ro.bootloader >_temp.log
for /f %%m in (_temp.log) do (SET productbootloader=%%m)
adb shell getprop ro.build.PDA >_temp.log
for /f %%m in (_temp.log) do (SET buildpda=%%m)
adb shell getprop ro.build.description >_temp.log
for /f "tokens=*" %%m in (_temp.log) do (SET builddescription=%%m)
adb shell getprop ro.crypto.state >_temp.log
for /f "tokens=*" %%m in (_temp.log) do (SET cryptostate=%%m)
adb shell getprop ro.build.id >_temp.log
for /f %%m in (_temp.log) do (SET productbuildid=%%m)
adb shell getprop ro.secure >_temp.log
for /f %%m in (_temp.log) do (SET rosecure=%%m)
adb shell getprop ro.adb.secure >_temp.log
for /f %%m in (_temp.log) do (SET roadbsecure=%%m)
adb shell getprop ro.build.selinux.enforce >_temp.log
for /f %%m in (_temp.log) do (SET selinuxenforce=%%m)
adb shell getprop ro.build.selinux >_temp.log
for /f %%m in (_temp.log) do (SET selinux=%%m)
adb shell getprop ro.build.version.release >_temp.log
for /f %%m in (_temp.log) do (SET buildversionrelease=%%m)
adb shell getprop ro.config.alarm_alert >_temp.log
for /f %%m in (_temp.log) do (SET configalarmalert=%%m)
adb shell getprop ro.config.notification_sound >_temp.log
for /f %%m in (_temp.log) do (SET confignotificationsound=%%m)
adb shell getprop ro.config.ringtone >_temp.log
for /f %%m in (_temp.log) do (SET configringtone=%%m)
adb shell getprop ro.csc.sales_code >_temp.log
for /f %%m in (_temp.log) do (SET cscsalescode=%%m)
adb shell getprop ro.board.platform >_temp.log
for /f %%m in (_temp.log) do (SET productboard=%%m)
adb shell getprop ro.product.locale.region >_temp.log
for /f %%m in (_temp.log) do (SET productlocalregion=%%m)
adb shell getprop ro.product.model >_temp.log
for /f "tokens=*" %%m in (_temp.log) do (SET productmodel=%%m)
adb shell getprop ro.serialno >_temp.log
for /f %%m in (_temp.log) do (SET productserialnumber=%%m)
adb shell getprop ril.model_id >_temp.log
for /f %%m in (_temp.log) do (SET modelid=%%m)
adb shell getprop ro.product.device >_temp.log
for /f %%m in (_temp.log) do (SET producttype=%%m)
adb shell getprop ro.hardware >_temp.log
for /f "tokens=1" %%m in (_temp.log) do (SET hardwaremanufacturer=%%m)
adb shell getprop ro.product.manufacturer >_temp.log
for /f "tokens=1" %%m in (_temp.log) do (SET productmanufacturer=%%m)
adb shell getprop ro.build.date >_temp.log
for /f "tokens=*" %%m in (_temp.log) do (SET builddate=%%m)
adb shell getprop sys.usb.config >_temp.log
for /f "tokens=*" %%m in (_temp.log) do (SET connectionstate=%%m)
adb shell getprop ro.secure >_temp.log
for /f "tokens=1" %%m in (_temp.log) do (SET productsecure1=%%m)
ping -n 3 127.0.0.1 >nul
IF %productsecure1%==0 (
SET productadbstatus=INSECURE
) ELSE (SET productadbstatus=SECURE)
IF EXIST _temp.log (del _temp.log /F /Q)
cls
ping -n 3 127.0.0.1 >nul
echo.
echo   DEVICE INFORMATION - WORKING ENVIRONMENT ADB MODE
echo   ==============================================
echo.
echo   Product Manufacturer:   %productmanufacturer%
echo   Product Model:          %productmodel%
echo   Model ID:               %modelid%
echo   Device Type:            %producttype%
echo   Device Characteristics: %buildcharacteristics%
echo   Product Serial Number:  %productserialnumber%
echo.
echo   Build Description:      %builddescription%
echo   Build Date:             %builddate%
echo   Hardware:               %hardwaremanufacturer%
echo   Board Platform:         %productboard%
echo   Build Version Release:  %buildversionrelease%
echo   Build ID:               %productbuildid%
echo.
echo   USB Connection Type:    %connectionstate%
echo.
echo   Bootloader:             %productbootloader%
echo   Build PDA:              %buildpda%
echo   CSC Sales Code:         %cscsalescode%
echo   Region Code:            %productlocalregion%
echo   Encryption State:       %cryptostate%
echo   Ro.secure Level:        %rosecure%
echo   Ro.adb.secure Level:    %roadbsecure%
echo   Selinux.enforce Level:  %selinuxenforce%
echo   Selinux Level:          %selinux%
echo   Alarm Alert:            %configalarmalert%
echo   Notification Sound:     %confignotificationsound%
echo   Ringtone:               %configringtone%
echo.
echo  -----------------------------------------------------------------------------------
echo  Boot Image Status is: %productadbstatus% [based on ro.secure value]
echo  Note: This is only an indictation if the boot image files have been modified
echo  -----------------------------------------------------------------------------------
echo.&echo.
pause
goto mainmenu
:insd
cd "%~dp0"
set LOOP=garbage
title Coolpad Toolkit V%version%
if exist "drivers\UniversalAdbDriverSetup.msi" (SET info1=OK) else (SET info1=None)
if exist "drivers\adb-setup-1.4.3.exe" (SET info2=OK) else (SET info2=None)
cls
echo  ===================================================================================
echo   TO INSTALL UNIVERSAL USB DRIVERS (OPTIONAL)
echo   -------------------------------------------
echo  1. This will install the latest Universal USB/ADB drivers on to your pc. By doing 
echo     this the existing one will be overwritted.
echo  2. To proceed, select option 1 from below (Make sure you have an active internet 
echo     connection) to download the latest Universal Drivers Package.
echo  3. Once its downloaded, toolkit will automatically launch setup.
echo  4. Follow the setup, once its completed, reboot the system once and you have your
echo     latest USB/ADB Drivers.
ECHO.
echo    TO INSTALL GOOGLE USB\ADB\FASTBOOT DRIVERS (ONE OF THE BEST)
ECHO    ------------------------------------------------------------
ECHO  1. This will install the latest Google USB\ADB\FASTBOOT drivers onto your pc, this
echo     installer will work on almost every coolui system, even mine :p.
echo  2. To proceed, go ahead and choose option 2 from below, a package will be launch.
echo  3. This package is provided by Snoop05 and recognised xda member.
echo  4. Follow the onscreen instruction by Entering "y" all the times (Make sure to read
echo     the stuff whats going on :p).
echo  5. Once its done, you have your adb drivers installed.
echo.
echo    TO INSTALL\FIX THE DRIVERS PROBLEMS OF COOLPAD (MOST EFFECTIVE)
ECHO    ---------------------------------------------------------------
ECHO  1. To Fix it, choose option 3 from below. This will launch an installer.
echo  2. Connect your phone to pc with usb debugging mode on (hope so you know it, if not
echo     go to help section from mainmenu.
echo  3. Now Select install the drivers, if some error causes there. There is an option 
echo     for how to fix it, Follow the instructions carefully.
echo  4. For some reasons they might tell you to disable driver signature enforcement. Now
echo     what is this? You can google it, but to do it in Win8,10 boot into advanced 
echo     recovery ^> Troubleshoot ^> Advanced Options ^> Startup settings ^> Restart Now 
echo     and then press F7 key. 
echo.
echo  ===================================================================================
echo  OPTIONS
echo  -------
if %info1%==OK (
echo  1. Install Universal USB/ADB drivers to your pc
) else (
echo  1. Install Universal USB/ADB drivers to your pc                          [DOWNLOAD]
)
if %info2%==OK (
echo  2. Install Google USB ^& ADB drivers including fastboot
) else (
echo  2. Install Google USB ^& ADB drivers including fastboot                   [DOWNLOAD]
)
echo  3. Install\Fix Device Drivers (disabling DSVM)
echo  4. Install SP Flash Tool Drivers (Mainly use for flashing)
echo  5. SMARTLY Install ADB ^& FASTBOOT drivers                                [ADVANCED]
echo  6. Help Screen (for Installing SP Drivers)
echo  7. Install Coolpad USB\ADB\FASTBOOT Drivers                          [MUST INSTALL]
echo.
echo  x. Back to Mainmenu
echo ------------------------------------------------------------------------------------
echo.
set /P LOOP=[*] Make your decision:- 
if %LOOP%==1 goto dua
if %LOOP%==2 goto adx
if %LOOP%==3 goto insp
if %LOOP%==4 goto fixa
if %LOOP%==5 goto Lw
if %LOOP%==6 goto chaf
if %LOOP%==7 goto Installcp
if %LOOP%==x goto mainmenu
if %LOOP%==X goto mainmenu
echo You went crazy, Entering Option which is actually not present :0
echo.
pause
goto insd
:Installcp
echo.
echo  This will Install Perfect USB\ADB\FASTBOOT drivers for All Universal coolpad phones.
echo.
pause
ping localhost -n 2 >nul
echo I: Checking the installer..
ping localhost -n 2 >nul
if not exist "%~dp0drivers\Coolpad_Open-source.exe" (echo. && echo Some files are missing && pause && goto insd)
echo I: Launching package..
call "%~dp0drivers\Coolpad_Open-source.exe"
echo I: Done..
echo.
ping localhost -n 2 >nul
echo Restart your pc now..
pause
goto insd
:chaf
set loop=garbage
title Coolpad Toolkit
cls
echo  ===================================================================================
echo   HOW TO INSTALL SP TOOL DRIVERS PROPERLY
ECHO   ---------------------------------------
ECHO.
ECHO  1. First of all from The Drivers Installer Screen choose 4, to launch the package.
echo  2. Continue with the installation.
echo  3. Once its done it will ask you to reboot your system. Do that and then you have
echo     your SP Flash drivers install on pc.
echo  NOTE THAT WITHOUT SP FLASH DRIVERS YOU WONT BE ABLE TO FLASH ANY KIND OF RECOVERY 
ECHO  ---- IMAGE ON YOUR COOLPAD, AS THIS DRIVERS ARE NEED TO RECOGNISE YOUR PHONE IN 
ECHO  SHUTDOWN MODE.
ECHO.
PAUSE
GOTO INSD
:Lw
cd "%~dp0"
echo.
echo I: Checking Adb drivers are installed or not..
cd..
:loop1
set ASK1=Garbage
adb devices
echo.
SET /P ASK1=[*] Did you see your phone serial key (y/n):- 
if %ASK1%==y goto beta2
if %ASK1%==Y goto beta2
if %ASK1%==n goto beta1
if %ASK1%==N goto beta1
echo.
cls
goto loop1
:beta1
echo.
echo  Basic Drivers are not Installed.. 
ping localhost -n 3 >nul
echo.
echo  Installing Now..
if not exist "%~dp0drivers\Coolpad_Open-source.exe" (echo. && echo Some files are missing && pause && goto insd)
call "%~dp0drivers\Coolpad_Open-source.exe"
:beta2
echo.
echo  Test Occurred.. (1/3)
echo.
ping localhost -n 3 >nul
echo  Reboot to recovery..
echo.
adb reboot recovery
ping localhost -n 7 >nul
echo.
echo  Once you are in recovery press enter..
pause
echo.
:loop2
cls
set option1=djdh
ping localhost -n 2 >nul
echo.
adb devices
echo.
SET /P option1=[*] Did you see your phone serial key (y/n):- 
if %option1%==y goto beta3
if %option1%==Y goto beta3
if %option1%==n goto beta4
if %option1%==N goto beta4
echo.
goto loop2
:beta4
echo.
set recovery1=none
echo Recovery Drivers are installed...
ping localhost -n 3 >nul
echo.
echo  Will be installed when you will be boot up to android..
ping localhost -n 3 >nul
echo.
echo  Saving..
ping localhost -n 3 >nul
echo  You need to manually boot into boot loader..
echo.
echo Use your recovery to boot into bootloader.. Once done..Press enter..
echo.
pause
:beta3
echo.
ping localhost -n 3 >nul
echo  Test occured (2/3)
echo.
ping localhost -n 3 >nul
echo  Checking Fastboot Drivers..
echo.
:loop3
echo.
fastboot -i 0x1EBF devices
echo.
SET /P option2=[*] Did you see your phone serial key (y/n):- 
if %option2%==y goto beta5
if %option2%==Y goto beta5
if %option2%==n goto beta6
if %option2%==N goto beta6
echo.
set option2=Garbage
goto loop3
:beta6
set fastboot1=none
echo.
echo  Fastboot drivers are not installed..
echo.
ping localhost -n 3 >nul
echo  Will be installed when you will be boot up to android..
ping localhost -n 3 >nul
echo.
echo  Saving..
ping localhost -n 3 >nul
echo  You need to manually boot into android..
echo.
echo  Press your power key for 15 secs...Once done..Press Enter..
echo.
pause
:beta5
echo.
ping localhost -n 3 >nul
echo  Test Occurred (3/3)
ping localhost -n 3 >nul
echo.
echo  Waiting for device..
adb wait-for-device
echo.
ping localhost -n 3 >nul
echo  Analyisng The result..
if %fastboot1%==none (set b1=ERROR) else (SET b1=PRESENT)
if %recovery1%==none (set b2=ERROR) else (SET b2=PRESENT)
ping localhost -n 3 >nul
echo.
echo  Basic ADB drivers -- PRESENT
ping localhost -n 3 >nul
echo.
echo  Recovery drivers  -- %b2%
echo.
ping localhost -n 3 >nul
echo  Fastboot drivers  -- %b1%
ping localhost -n 3 >nul
echo.
ping localhost -n 3 >nul
ping localhost -n 3 >nul
echo.
echo I: Installing Drivers According to it..
if %fastboot%==none (
goto adx
)
if %recovery%==none (
goto adx
)
echo.
echo  All drivers are perfectly Installed..
echo.
call tools\ctext.exe 0b "Device verified Successfully"
echo.
echo.
ping localhost -n 3 >nul
echo.
echo I: RETURNING TO MAINMENU..
ping localhost -n 3 >nul
goto inidata1
:insp
echo.
echo  Please connect your phone to pc via cable and usb debugging mode should be enabled.
echo.
pause
echo I: Checking the installer..
ping localhost -n 2 >nul
if not exist "%~dp0drivers\ADBDriverInstaller.exe" (echo. && echo Some Files Are Missing.. && pause && goto insd)
echo I: Launching the package..
echo.
echo  Install the correct drivers from the toolkit
call "%~dp0drivers\ADBDriverInstaller.exe"
echo I: Done..
echo.
pause
goto insd
:fixa
echo.
echo I: Checking the installer..
ping localhost -n 2 >nul
if not exist "%~dp0drivers\SP-Drivers.exe" (echo. && echo Some files are missing && pause && goto insd)
echo I: Launching package..
call "%~dp0drivers\SP-Drivers.exe"
echo I: Done..
echo.
echo  Restart your pc now..
pause
goto insd
:adx
echo.
echo I: Checking Installer..
ping localhost -n 2 >nul
if exist "%~dp0drivers\adb-setup-1.4.3.exe" (echo Installer is present.. && goto laus1)
if exist "%~dp0temp\adb-setup-1-4-31.key" (echo Installer is present.. && goto test1)
cd temp
echo I: Downloading the Installer..
"%~dp0tools\wget" https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/drivers/adb-setup-1-4-31.key --no-check-certificate
:test1
echo I: Verifying the installer..
rename "%~dp0temp\adb-setup-1-4-31.key" adb-setup-1.4.3.exe
cd "%~dp0"
move "%~dp0temp\adb-setup-1.4.3.exe" drivers
if not exist "%~dp0drivers\adb-setup-1.4.3.exe" (echo I: Error while downloading.. && pause && goto insd)
:laus1
cd "%~dp0"
echo I: Launching Installer..
call drivers\adb-setup-1.4.3.exe
pause
echo I: Done..
goto insd
:dua
echo.
echo I: Checking the Installer..
ping localhost -n 2 >nul
if exist "%~dp0drivers\UniversalAdbDriverSetup.msi" (echo Installer is present.. && goto laus)
cd temp
echo I: Downloading the Installer..
"%~dp0tools\wget" http://download.clockworkmod.com/test/UniversalAdbDriverSetup.msi --no-check-certificate
echo I: Verifying the installer..
if not exist "%~dp0temp\UniversalAdbDriverSetup.msi" (echo I: Error while downloading.. && pause && goto insd)
copy "%~dp0temp\UniversalAdbDriverSetup.msi" "%~dp0drivers"
:laus
cd "%~dp0"
echo I: Launching Installer..
call drivers\UniversalAdbDriverSetup.msi
pause
echo I: Done..
goto insd
:resetcolors
echo. 
echo  Background and text are the same colours...
ping localhost -n 4 >nul
echo.
echo  Resetting the colours..
ping localhost -n 2 >nul
if exist tools\_toolkitcolor.cf (del tools\_toolkitcolor.cf /Q)
echo 0 >> tools\_toolkitcolor.cf
echo a >> tools\_toolkitcolor.cf
ping localhost -n 2 >nul
goto inidata1
:exit1
adb kill-server
del tools\device.log /Q
ping -n 1 127.0.0.1 >nul
taskkill /F /IM cmd.exe >nul
EXIT
:Basicset
cls
ping localhost -n 2 >nul
if exist _device.log del _device.log /Q
echo Basic >> _device.log
set MODEL=Basic
if not exist backups\Basic (
md backups\Basic
md backups\Basic\CWM
md backups\Basic\SMS
md backups\Basic\STORAGE
md backups\Basic\TWRP
md recovery\Basic
)
echo.
echo  You are Using Basic Version of Toolkit..
ping localhost -n 3 >nul
echo.
echo  Some Features are disabled for you.. Because of some incompabilty..
ping localhost -n 3 >nul

if exist configdevice.bat (call configdevice.bat) else (call configdevice.exe)
goto mainmenu
exit

:CPN3set
cls
ping localhost -n 2 >nul
if not exist backups\CPN3 (
md backups\CPN3
md backups\CPN3\CWM
md backups\CPN3\SMS
md backups\CPN3\STORAGE
md backups\CPN3\TWRP
md recovery\CPN3
)
echo.
if not exist recovery\CPN3\recovery-twrp.img (goto cpn3set1) else (goto cpn3set2)
:cpn3set1
ping localhost -n 3 >nul
echo.
echo  The selected Device Modules Are Not Downloaded...
echo.
ping localhost -n 3 >nul
echo  Downloading it right now..
echo.
if exist "cpn3note3.key" (
ping localhost -n 3 >nul
echo  File is already downloaded.. 
goto cpn3set3
)
ping localhost -n 3 >nul
echo  Checking your web connectivity..
ping localhost -n 3 >nul
tools\wget https://coolpadtoolkit.files.wordpress.com/2016/10/cpn3note3.key --no-check-certificate
if errorlevel 1 goto cpn3error
:cpn3set3
echo.
ping localhost -n 3 >nul
echo  Extracting and verifying..
tools\7za x -y cpn3note3.key 
goto cpn3set2
:cpn3set2
ping localhost -n 3 >nul
if not exist recovery\CPN3\recovery-twrp.img (goto error1)
if exist _device.log del _device.log /Q
echo CPN3 >> _device.log
set MODEL=Coolpad Note 3
::MAKE SURE TO CHANGE THIS
if exist configdevice.bat (call configdevice.bat) else (call configdevice.exe)
goto mainmenu
exit
:cpn3error
echo.
echo  We are not able to download required module.. because some connectivity issues..
ping localhost -n 3 >nul
echo  You can also manually download it from the given below link..
ping localhost -n 3 >nul
echo.
echo  link : https://coolpadtoolkit.files.wordpress.com/2016/10/cpn3note3.key 
echo.
echo  Once downloaded you can place this file into this directory and run this
echo  option again..
ping localhost -n 3 >nul
echo.
pause
goto mainmenu
:error1
echo.
echo  An Error Occured
ping -n 3 127.0.0.1 >nul
echo.
echo  Press any key to return to the Main Menu..
pause >nul
echo.
echo I: Returning to Main Menu..
ping -n 3 127.0.0.1 >nul
goto mainmenu
:CPN3Lset
cls
ping localhost -n 2 >nul
if not exist backups\CPN3L (
md backups\CPN3L
md backups\CPN3L\CWM
md backups\CPN3L\SMS
md backups\CPN3L\STORAGE
md backups\CPN3L\TWRP
md recovery\CPN3L
)
echo.
if not exist recovery\CPN3L\recovery-twrp.img (goto cpn3lset1) else (goto cpn3lset2)
:cpn3lset1
ping localhost -n 3 >nul
echo.
echo  The selected Device Modules Are Not Downloaded...
echo.
ping localhost -n 3 >nul
echo  Downloading it right now..
echo.
if exist "cpn3lnote3.key" (
ping localhost -n 3 >nul
echo  File is already downloaded.. 
goto cpn3lset3
)
ping localhost -n 3 >nul
echo  Checking your web connectivity..
ping localhost -n 3 >nul
tools\wget https://coolpadtoolkit.files.wordpress.com/2016/10/cpn3lnote3.key --no-check-certificate
if errorlevel 1 goto cpn3lerror
:cpn3lset3
echo.
ping localhost -n 3 >nul
echo  Extracting and verifying..
tools\7za x -y cpn3lnote3.key 
goto cpn3lset2
:cpn3lset2
ping localhost -n 3 >nul
if not exist recovery\CPN3L\recovery-twrp.img (goto error1)
if exist _device.log del _device.log /Q
echo CPN3L >> _device.log
set MODEL=Coolpad Note 3 Lite
if exist configdevice.bat (call configdevice.bat) else (call configdevice.exe)
goto mainmenu
exit
:cpn3lerror
echo.
echo  We are not able to download required module.. because some connectivity issues..
ping localhost -n 3 >nul
echo  You can also manually download it from the given below link..
ping localhost -n 3 >nul
echo.
echo  link : https://coolpadtoolkit.files.wordpress.com/2016/10/cpn3lnote3.key 
echo.
echo  Once downloaded you can place this file into this directory and run this
echo  option again..
ping localhost -n 3 >nul
echo.
pause
goto mainmenu
:CPN3Pset

cls
ping localhost -n 2 >nul
if not exist backups\CPN3P (
md backups\CPN3P
md backups\CPN3P\CWM
md backups\CPN3P\SMS
md backups\CPN3P\STORAGE
md backups\CPN3P\TWRP
md recovery\CPN3P
)
echo.
if not exist recovery\CPN3P\recovery-twrp.img (goto cpn3pset1) else (goto cpn3pset2)
:cpn3pset1
ping localhost -n 3 >nul
echo.
echo  The selected Device Modules Are Not Downloaded...
echo.
ping localhost -n 3 >nul
echo  Downloading it right now..
echo.
if exist "cpn3pnote3.key" (
ping localhost -n 3 >nul
echo  File is already downloaded.. 
goto cpn3pset3
)
ping localhost -n 3 >nul
echo  Checking your web connectivity..
ping localhost -n 3 >nul
tools\wget https://coolpadtoolkit.files.wordpress.com/2016/12/cpn3pnote3.key --no-check-certificate
if errorlevel 1 goto cpn3perror
:cpn3pset3
echo.
ping localhost -n 3 >nul
echo  Extracting and verifying..
tools\7za x -y cpn3pnote3.key 
goto cpn3pset2
:cpn3pset2
ping localhost -n 3 >nul
if not exist recovery\CPN3P\recovery-twrp.img (goto error1)
if exist _device.log del _device.log /Q
echo CPN3P >> _device.log
set MODEL=Coolpad Note 3 Plus


:: MAKE SURE TO CHANGE THIS

if exist configdevice.bat (call configdevice.bat) else (call configdevice.exe)
goto mainmenu
exit
:cpn3perror
echo.
echo  We are not able to download required module.. because some connectivity issues..
ping localhost -n 3 >nul
echo  You can also manually download it from the given below link..
ping localhost -n 3 >nul
echo.
echo  link : https://coolpadtoolkit.files.wordpress.com/2016/12/cpn3pnote3.key
echo.
echo  Once downloaded you can place this file into this directory and run this
echo  option again..
ping localhost -n 3 >nul
echo.
pause
goto mainmenu

:: For Coolpad Dazon 1

:CPN3Dset

cls
ping localhost -n 2 >nul
if not exist backups\CPN3D (
md backups\CPN3D
md backups\CPN3D\CWM
md backups\CPN3D\SMS
md backups\CPN3D\STORAGE
md backups\CPN3D\TWRP
md recovery\CPN3D
)
echo.
if not exist recovery\CPN3D\recovery-twrp.img (goto cpn3dset1) else (goto cpn3dset2)
:cpn3dset1
ping localhost -n 3 >nul
echo.
echo  The selected Device Modules Are Not Downloaded...
echo.
ping localhost -n 3 >nul
echo  Downloading it right now..
echo.
if exist "cpn3dazen.7z" (
ping localhost -n 3 >nul
echo  File is already downloaded.. 
goto cpn3dset3
)
ping localhost -n 3 >nul
echo  Checking your web connectivity..
ping localhost -n 3 >nul
tools\wget https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/Devices/cpn3dazen.7z --no-check-certificate
if errorlevel 1 goto cpn3derror
:cpn3dset3
echo.
ping localhost -n 3 >nul
echo  Extracting and verifying..
tools\7za x -y cpn3dazen.7z
goto cpn3dset2
:cpn3dset2
ping localhost -n 3 >nul
if not exist recovery\CPN3D\recovery-twrp.img (goto error1)
if exist _device.log del _device.log /Q
echo CPN3D >> _device.log
set MODEL=Coolpad Dazon 1
if exist configdevice.bat (call configdevice.bat) else (call configdevice.exe)
goto mainmenu
exit
:cpn3derror
echo.
echo  We are not able to download required module.. because some connectivity issues..
ping localhost -n 3 >nul
echo  You can also manually download it from the given below link..
ping localhost -n 3 >nul
echo.
echo link : https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/Devices/cpn3dazen.7z
echo.
echo  Once downloaded you can place this file into this directory and run this
echo  option again..
ping localhost -n 3 >nul
echo.
pause
goto mainmenu

:: For Elephone P8 3D

:ELP8
cls
ping localhost -n 2 >nul
if not exist backups\ELP8 (
md backups\ELP8
md backups\ELP8\CWM
md backups\ELP8\SMS
md backups\ELP8\STORAGE
md backups\ELP8\TWRP
md recovery\ELP8
)
if exist _device.log del _device.log /Q
echo ELP8 >> _device.log
set MODEL=Elephone P8 3D

:eleset

cls
ping localhost -n 2 >nul
if not exist backups\ELP8 (
md backups\ELP8
md backups\ELP8\CWM
md backups\ELP8\SMS
md backups\ELP8\STORAGE
md backups\ELP8\TWRP
md recovery\ELP8
)
echo.
if not exist recovery\ELP8\recovery-twrp.img (goto eleset1) else (goto eleset2)
:eleset1
ping localhost -n 3 >nul
echo.
echo  The selected Device Modules Are Not Downloaded...
echo.
ping localhost -n 3 >nul
echo  Downloading it right now..
echo.
ping localhost -n 3 >nul
echo  Checking your web connectivity..
ping localhost -n 3 >nul
"%~dp0tools\wget.exe" -O recovery/ELP8/recovery-twrp.img https://www.dropbox.com/s/uh9z6bem2u0vtw9/recovery-twrp.img?dl=0 --no-check-certificate
:: "%~dp0tools\wget.exe" -O recovery/CPN5/recovery-twrp-n.img https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/recovery/CPN5/recovery-twrp-n.img --no-check-certificate
if errorlevel 1 goto eleerror
:eledset3
echo.
ping localhost -n 3 >nul
echo  Verifying files..
goto eleset2
:eleset2
ping localhost -n 3 >nul
if not exist recovery\ELP8\recovery-twrp.img (goto error1)
if exist _device.log del _device.log /Q
echo ELP8 >> _device.log
set MODEL=Elephone P8 3D
if exist configdevice.bat (call configdevice.bat) else (call configdevice.exe)
goto mainmenu
exit
:eleerror
echo.
echo  We are not able to download required module.. because some connectivity issues..
ping localhost -n 3 >nul
echo  You can also manually download all files from the given below link..
ping localhost -n 3 >nul
echo.
echo link : https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/recovery/ELP8/
echo.
echo  Once downloaded create a directory in recovery folder as 'ELP8' and paste all those
echo  recoveries into it. Take a reference from Source
ping localhost -n 3 >nul
echo.
pause
goto mainmenu

:: For Coolpad MAX

:CPNMAX
cls
ping localhost -n 2 >nul
if not exist backups\CPNMAX (
md backups\CPNMAX
md backups\CPNMAX\CWM
md backups\CPNMAX\SMS
md backups\CPNMAX\STORAGE
md backups\CPNMAX\TWRP
md recovery\CPNMAX
)
if exist _device.log del _device.log /Q
echo CPNMAX >> _device.log
set MODEL=Coolpad Max
if exist configdevice.bat (call configdevice.bat) else (call configdevice.exe)
goto mainmenu
exit

:: For Coolpad Note 5

:CPN5set

cls
ping localhost -n 2 >nul
if not exist backups\CPN5 (
md backups\CPN5
md backups\CPN5\CWM
md backups\CPN5\SMS
md backups\CPN5\STORAGE
md backups\CPN5\TWRP
md recovery\CPN5
)
echo.
if not exist recovery\CPN5\recovery-twrp-mm.img (goto cpn5set1) else (goto cpn5set2)
:cpn5set1
ping localhost -n 3 >nul
echo.
echo  The selected Device Modules Are Not Downloaded...
echo.
ping localhost -n 3 >nul
echo  Downloading it right now..
echo.
ping localhost -n 3 >nul
echo  Checking your web connectivity..
ping localhost -n 3 >nul
"%~dp0tools\wget.exe" -O recovery/CPN5/recovery-twrp-mm.img https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/recovery/CPN5/recovery-twrp-mm.img --no-check-certificate
"%~dp0tools\wget.exe" -O recovery/CPN5/recovery-twrp-n.img https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/recovery/CPN5/recovery-twrp-n.img --no-check-certificate
if errorlevel 1 goto cpn5error
:cpn3dset3
echo.
ping localhost -n 3 >nul
echo  Verifying files..
goto cpn5set2
:cpn5set2
ping localhost -n 3 >nul
if not exist recovery\CPN5\recovery-twrp-mm.img (goto error1)
if exist _device.log del _device.log /Q
echo CPN5 >> _device.log
set MODEL=Coolpad Note 5
if exist configdevice.bat (call configdevice.bat) else (call configdevice.exe)
goto mainmenu
exit
:cpn5error
echo.
echo  We are not able to download required module.. because some connectivity issues..
ping localhost -n 3 >nul
echo  You can also manually download all files from the given below link..
ping localhost -n 3 >nul
echo.
echo link : https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/recovery/CPN5/
echo.
echo  Once downloaded create a directory in recovery folder as 'CPN5' and paste all those
echo  recoveries into it. Take a reference from Source
ping localhost -n 3 >nul
echo.
pause
goto mainmenu
:letstart
echo.
echo  Setting toolkit for the first time..
setx CRT ""
setx CRT "%~dp0"
:letstart1
echo.
echo  Extracting some packages..
tools\7za x -y drivers.7z
tools\7za x -y root.7z
tools\7za x -y sp_tool.7z
tools\7za x -y tools.7z
echo.
echo  Deleting Package..
del /Q *.7z
ping localhost -n 3 >nul
cls
goto inidata1

:checkforupdates
cd "%~dp0"
del temp\* /Q
cls
echo.
if not exist root\Magisk16.zip (
echo Downloading latest Magisk Installer...
"%~dp0tools\wget.exe" -O root/Magisk16.zip https://www.dropbox.com/s/h7ai4b9nlanznvn/Magisk16.zip?dl=0 --no-check-certificate
)
if exist recovery\CPN3 (
if not exist recovery\CPN3\recovery-twrp-mm-3.1.1.img (
echo Downloading latest TWRP for Coolpad Note 3...
"%~dp0tools\wget.exe" -O recovery/CPN3L/recovery-twrp-mm-3.1.1.img https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/recovery/CPN3/recovery-twrp-mm-3.1.1.img --no-check-certificate
)
)
if exist recovery\CPN3L (
if not exist recovery\CPN3L\recovery-twrp-mm-3.1.1.img (
echo Downloading latest TWRP for Coolpad Note 3 lite...
"%~dp0tools\wget.exe" -O recovery/CPN3L/recovery-twrp-mm-3.1.1.img https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/recovery/CPN3L/recovery-twrp-mm-3.1.1.img --no-check-certificate
)
)
echo.
for /f "tokens=1" %%r in (tools\_toolkitversion.cf) do (set version=%%r)
ping localhost -n 1 >nul
echo Toolkit is Checking for Updates..
"%~dp0tools\wget.exe" -O temp/test.txt https://www.dropbox.com/s/yd3xww6xug0icaw/update.txt?dl=0 --no-check-certificate -q
ping localhost -n 1 >nul
for /f "tokens=1" %%s in (temp\test.txt) do (SET filelink1=%%s)
"%~dp0tools\wget.exe" -otemp/updatefile.7z %filelink1% --no-check-certificate
if errorlevel 1 goto errupdate
cd temp
"%~dp0tools\7za.exe" x updatefile.7z
for /f "tokens=1" %%n in (version.txt) do (SET newversion=%%n)
for /f "tokens=*" %%k in (link.txt) do (SET updatelink=%%k)
if %newversion% GTR %version% (goto selfupdate) else (goto errupdate)
goto inidata1
:selfupdate
cls
echo.
type changelog.txt
echo.
ping localhost -n 2 >nul
echo.
SET /P TEST=[*] Do you want to Download this Update (y/n):- 
if %TEST%==Y goto start1
if %TEST%==y goto start1
goto end
:end
goto errupdate
:start1
cls
echo  Downloading..
echo.
cd "%~dp0"
"%~dp0tools\wget.exe" -O Update.7z %updatelink% --no-check-certificate
ping localhost -n 1 >nul
if exist run.bat (start run.bat) else (
rem More complex..
"%~dp0tools\7za.exe" x -y update.7z
if exist run.bat (start run.bat)
)
exit
:errupdate
cls
cd "%~dp0"
del temp\* /Q
%returntome11%
echo.
echo  No Updates Found Till Yet..
ping localhost -n 3 >nul
echo.
echo  Check Official Thread for more info..
ping localhost -n 3 >nul
goto inidata1
