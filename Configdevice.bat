:: Coolpad Toolkit v1.6 Source
:: Developed And Written by KP 
:: CopyRight @2016 KP

:: Do not commit any unneccessary changes to it and Post it anywhere
:: Its Lisenced Under Apache and has my Original Signatures


@echo off
mode con:cols=85 lines=49
SETLOCAL EnableDelayedExpansion
if not exist tools\device.log goto notoolkiterror
for /F "tokens=1" %%i in (_device.log) do (set DEVICE=%%i)
for /f "tokens=*" %%m in (tools\device.log) do (SET basic=%%m)
if not %basic%==Script-is-running goto notoolkiterror
:ini1
set m=
cd "%~dp0"
if %DEVICE%==CPNMAX (
adb pull /system/bin/magisk
if exist magisk (
adb shell magisk su -c exit
del magisk /q
)
)
adb shell getprop ro.product.manufacturer >_temp1.log
if errorlevel 1 del _temp1.log
adb shell getprop ro.product.model >_temp.log
if errorlevel 1 del _temp.log
echo.
for /f "tokens=*" %%m in (_temp.log) do (SET productmodel=%%m)
for /f "tokens=1" %%m in (_temp1.log) do (SET productmanufacturer=%%m)
for /F "tokens=1" %%k in (tools\_toolkitcolor.cf) do (set /a m+=1 && set colour!m!=%%k)
cls
color %colour1%%colour2%
if errorlevel 1 goto resetcolors
title Coolpad Toolkit V%version%
cls
ping localhost -n 2 >nul
del _temp.log /Q && del _temp1.log /Q && del _temp2.log
cls
::if exist "%~dp0recovery\%DEVICE%\recovery-twrp-m.img" (goto fix3)
if %W2%==OK (
if %clashes%==failed goto encryptionstate12
)
:RESTART
cls
title Coolpad Toolkit V%version%
cd "%~dp0"
set infosectionon=Grabage
set cuspath=GARBAGE
set encryptionfinalstate=Grabage
set encryptionstate=Grabage
set bootmenucus=Garbage
SET clashes=NOne
set customrec=Garbage
set modssel=Grabage
set TEST=Garbahe
set menuselection=Grabe
set dumplcselection=Grabage
set recoverypartitionfirsttime=Grabage
set lbselection=Grabage
set recovery=Grabage
set recovery1=Grabage
set path1=Garbage
set cuspath=Grabage
set type=Grabage
set setroot=Grabage
set setrootmethodchoice=Grabage
set cuspath1=Grabage
echo  ===================================================================================
echo  Written by KP (%toolkitthread%)               version : V%version%
rem echo Open Source : https://github.com/KaustubhPatange/Coolpad-Toolkit
rem echo Contact: DeveloperKP16@gmail.com
echo  ===================================================================================
echo.
call tools\ctext.exe 0b " FASTBOOT MODE"
echo                               [If serial shows, drivers are installed]
echo  List of devices attached                   TOOLKIT FOR  : %MODEL%
rem echo                                            TOOLKIT FOR  : %MODEL%
if exist fastboot.exe (fastboot -i 0x1EBF devices)
rem echo                                            
call tools\ctext.exe 0b " ADB MODE" 
echo                                    Last Updated : %lastcheck%
adb devices
echo  -----------------------------------------------------------------------------------
echo.
echo   MAIN MENU - %productmanufacturer% %productmodel%
echo.
echo   1. Install Device Drivers on your PC      [IF DRIVERS ARE NOT PRESENT DO IT FIRST]
ECHO   2. Backup And Restore your Device                                 [DO THIS SECOND]
rem echo.
echo   3. UnLock/Re-Lock your BootLoader                                  [DO THIS THIRD]
echo   4. Root/UnRoot/Check Root Status                                        [ADB Mode]
if %DEVICE%==CPNMAX (
echo   5. Flash Recovery [CWM, TWRP, Philz_Touch CWM, Stock]                   [DISABLED]
) else (
echo   5. Flash Recovery [CWM, TWRP, Philz_Touch CWM, Stock]                   [ADB Mode]
)
echo   6. Install BusyBox on Device                                            [ADB Mode]
rem echo.
if %DEVICE%==Basic (
echo   7. ALLINONE - Unlock,Root,Busybox,Cust Recovery                         [DISABLED]
) else (
echo   7. ALLINONE - Unlock,Root,Busybox,Cust Recovery                       [SUPER PACK]
)
rem echo.
echo   8. Download/Flash Coolpad Factory Stock Image            [Flash Part or Whole Rom]
echo   9. Download/Sideload Custom Rom via Stock/Custom Recovery               [ADB MODE]
if %DEVICE%==Basic (
echo  10. Boot to Custom/Stock Recovery without Permanently Flashing it        [DISABLED]
) else (
echo  10. Boot to Custom/Stock Recovery without Permanently Flashing it        [ADB Mode]
)
echo  11. Boot or Flash .img Files to Device                                   [ADB Mode]
echo  12. Install/Sideload a Zip File to Device via Stock/Custom Recovery      [ADB Mode]
if exist root\xposed-uninstaller-20160829-arm64.zip (
if %DEVICE%==CPNMAX (
echo  13. Install Xposed Framework via Custom Recovery                         [DISABLED]
) else (
echo  13. Install Xposed Framework via Custom Recovery                         [ADB MODE]
)
) else (
echo  13. Install Xposed Framework via Custom Recovery                         [DOWNLOAD]

)
echo.
echo  14. Install apk files to Device                                          [ADB Mode]
echo  15. Push Files to Device                                                 [ADB Mode]
echo  16. Pull Files or Folders from Device                                    [ADB Mode]
rem echo.
echo  17. Set File Permissions on Device                                       [ADB Mode]
echo  18. LogCat Functions                                                     [ADB Mode]
echo  19. ROM TOOLS (Extract/Rebuild your System.img FIRMWARE)        [Device not Needed]
echo  20. App/Program/Device Fixes, Developer Tools                     [Could be Useful]
echo  21. Extras, Tips and Tricks                                     [Device not Needed]
echo  22. Device specific Mods and Special Requests                            [ADB Mode]
rem echo.
echo  23. Device Information [Model,Version,Build+MORE]                        [ADB Mode]
echo  24. Device Reboot Options
echo  26. Open a Command Prompt for Manual Input
echo  27. Open a Android Terminal                                              [ADB MODE]
echo  28. INFORMATION, HELP AND FAQ SECTION                  [Lots of Useful Information]
echo  29. Refresh Main Menu
echo  30. ToolKit Settings / ABOUT                                            [CREDITERS]
echo.
echo  x.  Exit
echo  ===================================================================================
echo.
SET /P menuselection=[*] Make your decision:- 
if %menuselection%==x goto exit1
if %menuselection%==X goto exit1
if %menuselection%==1 goto insd
if %menuselection%==2 goto bak
if %menuselection%==3 goto blt
if %menuselection%==4 goto rtl
if %menuselection%==5 goto flashcus
if %menuselection%==6 goto insbusy
if %menuselection%==7 goto allinone
if %menuselection%==8 goto fct
if %menuselection%==9 goto cusq
if %menuselection%==10 goto bootcus
if %menuselection%==11 goto bootfl
if %menuselection%==12 goto sidez
if %menuselection%==13 goto xposedfe
if %menuselection%==14 goto installapk
if %menuselection%==15 goto pushfile
if %menuselection%==16 goto pullfile
if %menuselection%==17 goto permi
if %menuselection%==18 goto logcatfunctions
if %menuselection%==19 goto ers
if %menuselection%==20 goto developersection
if %menuselection%==21 goto extratips
if %menuselection%==22 goto devicemods
if %menuselection%==23 goto getmodelbuildprop
if %menuselection%==24 goto rebootoptions
if %menuselection%==26 goto launchcmd
if %menuselection%==27 goto launchadb
if %menuselection%==28 goto help
if %menuselection%==29 goto ini1
if %menuselection%==30 goto settings
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto RESTART
:settings
@echo off
for /f "tokens=1" %%s in (tools\_toolkitupdatec.cf) do (SET W1=%%s)
for /f "tokens=1" %%s in (tools\_toolkitsettings.cf) do (SET W2=%%s)
cls
set TEST=dedj
echo  ===================================================================================
echo  This screen contains various settings/changes you can make to the ToolKit.
echo  ===================================================================================
echo.
echo   OPTIONS
echo   -------
echo.
echo   1.  Select a different Device to work with                 [change working device]
echo.
echo   2.  Change ToolKit Colours                    [change background and text colours]
echo.
echo   3.  Display version numbers of Apps/Programs used by the Toolkit
echo.
echo   4.  Credits
echo.
echo   5.  Credits to Bugs Finder
echo.
echo   6.  Contact Me 
echo.
echo   7.  Plugins
echo.
echo   8.  Check for Updates at Startup                                            [%W1%]
echo.
echo   9.  Check for Encryption of Phone                                           [%W2%]
echo.
echo  10.  View my More Projects                                                    [WEB]
echo.
echo   p. Requests your Device to add into this Toolkit
echo.
echo   x. Return To MAINMENU
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A Choice:- 
if %TEST%==1 goto settings1
if %TEST%==2 goto settings2
if %TEST%==3 goto settings3
if %TEST%==4 goto settings4
if %TEST%==5 goto settings6
if %TEST%==6 goto settings5
if %TEST%==7 goto downloadnow1
if %TEST%==8 goto disa2
if %TEST%==9 goto disa1
if %TEST%==10 start https://kpstvhub.com && goto settings
if %TEST%==p goto packdevice
if %TEST%==P goto packdevice
if %TEST%==x goto RESTART
if %TEST%==X goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto settings
:packdevice
cls
echo.
del temp\* /Q
echo  Waiting for USB debugging to be detected
adb wait-for-device
ping -n 2 127.0.0.1 >nul
adb shell getprop ro.product.device >_temp.log
for /f %%m in (_temp.log) do (SET folder=%%m)
md temp\%folder%
echo.
echo  Generating Device Information...
echo.
echo.> temp\%folder%\info.txt
echo ---------------------------------- >> temp\%folder%\info.txt
echo Auto Generated by Coolpad Toolkit  >> temp\%folder%\info.txt
echo ---------------------------------- >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Build Characteristics: >> temp\%folder%\info.txt
adb shell getprop ro.build.characteristics >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Bootloader Info: >> temp\%folder%\info.txt
adb shell getprop ro.bootloader >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Build PDA: >> temp\%folder%\info.txt
adb shell getprop ro.build.PDA >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Build Description: >> temp\%folder%\info.txt
adb shell getprop ro.build.description >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Encryption State: >> temp\%folder%\info.txt
adb shell getprop ro.crypto.state >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Build ID: >> temp\%folder%\info.txt
adb shell getprop ro.build.id >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Ro Secure: >> temp\%folder%\info.txt
adb shell getprop ro.secure >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo ADB Secure: >> temp\%folder%\info.txt
adb shell getprop ro.adb.secure >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo SE Linux Enforcement: >> temp\%folder%\info.txt
adb shell getprop ro.build.selinux.enforce >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo SE Linux: >> temp\%folder%\info.txt
adb shell getprop ro.build.selinux >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Build version Release: >> temp\%folder%\info.txt
adb shell getprop ro.build.version.release >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Platform Version: >> temp\%folder%\info.txt
adb shell getprop ro.board.platform >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Local Region: >> temp\%folder%\info.txt
adb shell getprop ro.product.locale.region >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Product Model: >> temp\%folder%\info.txt
adb shell getprop ro.product.model >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Device Serial: >> temp\%folder%\info.txt
adb shell getprop ro.serialno >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Model ID: >> temp\%folder%\info.txt
adb shell getprop ril.model_id >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Product Device: >> temp\%folder%\info.txt
adb shell getprop ro.product.device >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Hardware Info: >> temp\%folder%\info.txt
adb shell getprop ro.hardware >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Product Manufacturer: >> temp\%folder%\info.txt
adb shell getprop ro.product.manufacturer >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Build Date: >> temp\%folder%\info.txt
adb shell getprop ro.build.date >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo ------------------ >> temp\%folder%\info.txt
echo PARTITION Details >> temp\%folder%\info.txt
echo ------------------ >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo  Using DF: >> temp\%folder%\info.txt
adb shell df >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo  Using Parted: >> temp\%folder%\info.txt
adb shell su -c parted /dev/block/mmcblk0 print >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo  Using Default block /dev/block/platform/mtk-msdc.0/by-name: >> temp\%folder%\info.txt
adb shell su -c ls /dev/block/platform/mtk-msdc.0/by-name >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo  Using cat proc/mounts: >> temp\%folder%\info.txt
adb shell cat /proc/mounts >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo  Using cat /proc/partitions >> temp\%folder%\info.txt
adb shell cat /proc/partitions >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo.
echo.
echo  Fill the Following Details as said. [Leave it blank ^& Press Enter if unable]
echo.
set TWRP=
set Stock=
set ROM=
set SCATTER=
set guide=
set Otherguide=
set /p TWRP=[*] Give your Device TWRP Link: 
echo.
set /p Stock=[*] Give your Device Stock Recovery Link: 
echo.
set /p ROM=[*] Give your Device Stock ROM Link: 
echo.
set /p SCATTER=[*] Give your Device Scatter.txt Link: 
echo.
set /p Guide=[*] Give your Device Guide INFO, ROOT GUIDE or Others Link: 
echo.
set /p Otherguide=[*] Any Other guide Link [if you feel its useful]: 
echo. 
echo  Applying...
echo ------------------- >> temp\%folder%\info.txt
echo Guides, Links, ETC >> temp\%folder%\info.txt
echo ------------------- >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo TWRP Link: %TWRP% >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Stock Recovery Link: %Stosck% >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Stock ROM Link: %ROM% >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Scatter File: %SCATTER% >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Guide 1: %Guide% >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
echo Guide 2: %Otherguide% >> temp\%folder%\info.txt
echo.>> temp\%folder%\info.txt
cls
echo.
echo  Information Saved at temp\%folder%\info.txt
echo.
echo  You can modify your details of that info.txt file to help me more :)
echo.
echo  Send me this information over my email.
echo  You can find my contact ID from Toolkit Settings Option #30
echo.
pause
goto settings
:disa2
if not exist tools\_toolkitupdatec.cf (
echo OK > tools\_toolkitupdatec.cf
set W1=None
)
if %W1%==OK (echo NO > tools\_toolkitupdatec.cf)
if %W1%==NO (echo OK > tools\_toolkitupdatec.cf)
goto settings
:disa1
cls
ping localhost -n 2 >nul
set TEST=OOP
echo  ===================================================================================
echo  ARE YOU SURE ?
ECHO.
ECHO  The Toolkit will then disable its safety feature of the Phone encryption which 
echo  might let the device brick too.
echo  However you can then enable it by again selecting this option :)
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Enter Y for Yes and N for NO :- 
if %TEST%==Y goto disa11
if %TEST%==y goto disa11
if %TEST%==n goto settings
if %TEST%==B goto settings
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto disa1
:disa11
if not exist tools\_toolkitsettings.cf (
echo OK > tools\_toolkitsettings.cf
set W2=None
)
if %W2%==OK (echo NO > tools\_toolkitsettings.cf)
if %W2%==NO (echo OK > tools\_toolkitsettings.cf)
goto settings
:downloadnow1
title Coolpad Toolkit V%version%
cls
set pluginmenu=Garbage
echo  ===================================================================================
echo  From here you can download plugins from your phone
echo.
echo  MAKE SURE YOU HAVE A NET CONNECTION,ON YOUR PC SO THAT WE CAN DOWNLOAD PLUGIN
ECHO  EASILY.
ECHO  AN ALREADY DOWNLOADED PLUGIN WILL BE MARKED AS NOTHING. BUT AN NOT DOWNLOAD PLUGIN
ECHO  WILL BE MARKED AS DOWNLOAD EMBEED IN SQUARE BRACKETS.
ECHO  SO YOU CAN DISTINNGUISH BETWEEN THEM.
echo  ===================================================================================
ECHO.
ECHO  PLUGINS : :
echo  -------
echo.
if exist Plugins\Rom-Porter\ROM-PORTER.bat (
echo  1. Rom Porting Tools -- By mnishamk                  [Registered in Rom Tools # 19]
) else (
echo  1. Rom Porting Tools -- By mnishamk                                      [DOWNLOAD]
)
echo.
if exist "Plugins\Deodexer.exe" (
echo  2. Deodexer Tool -- By BDfreak               [Registered in Development Tools # 20]
) else (
echo  2. Deodexer Tool -- By BDfreak                                           [DOWNLOAD]
)
echo.
echo  3. All in One Unpack Utility                                               [ONLINE]
echo.
if exist "Plugins\Build-Prop\Prop-Tweaker.exe" (
echo  4. Build Prop Tweaker -- By ME                       [Registered in Rom Tools # 19]
) else (
echo  4. Build Prop Tweaker -- By ME                                           [DOWNLOAD]
)
echo.
echo  x. Return To MAINMENU
echo.
echo  ===================================================================================
ECHO.
SET /P pluginmenu=[*] Make A Decision:- 
if %pluginmenu%==1 goto romport
if %pluginmenu%==2 goto deodextool
if %pluginmenu%==4 goto proptweak
if %pluginmenu%==3 start https://forum.xda-developers.com/android/general/roms-aio-unpack-utility-t3607569 && goto downloadnow1 
if %pluginmenu%==x goto settings
if %pluginmenu%==X goto settings
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto downloadnow1
:proptweak
set ASK=Garbage
cls
ping localhost -n 2 >nul
echo  -----------------------------------------------------------------------------------
echo   XDA thread -- https://goo.gl/ubyjVj
echo.
if exist "Plugins\Build-Prop\Prop-Tweaker.exe" (
call tools\ctext.exe 0b "This Plugin is Installed"
)
echo.
echo.
echo   Credits -- ME 
echo.
echo  Build Prop Tweaker is an Awesome Small Mini Tool used to Tweak Some Build Prop Mods
echo  Very easily with quite nice interface and also some pre-installed mods in it. VERY
echo  Handy and portable to use.
echo.
echo   Features :
echo.
echo  *Small in size (1.7mb)
echo  *Gui Interface
echo  *Automatically detects if your device is connected
echo  *Automatically detects su i.e if your phone is rooted
echo  *Pull your Phone's build prop as current project
echo  *Export your build prop or copy it to /system
echo  *Make a Recovery flashable build prop (no signing zip)
echo  *Over 20 delicious tweaks (check that out)
echo  *All others, check that out
echo.
echo  -----------------------------------------------------------------------------------
echo.
if exist "Plugins\Build-Prop\Prop-Tweaker.exe" (
pause
goto downloadnow1
)
SET /P ASK=[*] Are you ready to Download [Y]es or [N]o:- 
if %ASK%==Y goto plugin3
if %ASK%==y goto plugin3
if %ASK%==n goto downloadnow1
if %ASK%==N goto downloadnow1
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto download1
:plugin3
cls
ping localhost -n 3 >nul
echo.
echo  Downloading Build Prop Tweaker Plugin..
echo.
ping localhost -n 3 >nul
if exist Prop-Tweaker.zip (goto plugin123)
tools\wget https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/Plugins/Prop-Tweaker.zip --no-check-certificate
if errorlevel 1 goto plugin1err1
:plugin123
cls
md Plugins\Build-Prop
ping localhost -n 3 >nul
echo.
echo  Extracting..
"%~dp0tools\7za.exe" x -y -oPlugins\Build-Prop\ Prop-Tweaker.zip
echo.
ping localhost -n 3 >nul
cls
::del Prop-Tweaker.zip /Q
ping localhost -n 3 >nul
echo.
echo  Build Prop Tweaker register you can use it now..
ping localhost -n 4 >nul
echo.
goto settings
:plugin1err1
echo.
echo  We are not able to download required module.. because some connectivity issues..
ping localhost -n 3 >nul
echo  You can also manually download it from the given below link..
ping localhost -n 3 >nul
echo.
echo  link : https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/Plugins/Prop-Tweaker.zip
echo.
echo  Once downloaded you can place this file into this directory and run this
echo  option again..
ping localhost -n 3 >nul
echo.
pause
goto RESTART
:deodextool
set ASK=Garbage
if exist "Plugins\Deodexer.exe" (goto Pluginalreadyinstalled2)
cls
ping localhost -n 2 >nul
echo  -----------------------------------------------------------------------------------
echo  XDA thread -- http://forum.xda-developers.com/showthread.php?t=2735156
echo.
echo  Credits -- BDfreak (Recognised Themer)
echo.
echo  Ultimate Deodexer is a tool engineered for all XDA Members, which allows user to 
echo  deodex apk and jar files with just some few clicks.It is a automated GUI based tool
echo  and very much user friendly. 
echo.
echo  Features :
echo.
echo  *Works with all Windows Version
echo  *User friendly Interface
echo  *Can deodex apks and jars of all API level
echo  *Solves problem in deodexing which was with 4.3/4.4
echo  *Drag and drop files or folders to load odex files
echo  *Framework and Output path can be selected
echo  *Unlimited files can be deodexed in a Go
echo  *Creates a log text file to track what's going on
echo.
echo  -----------------------------------------------------------------------------------
echo.
SET /P ASK=[*] Are you ready to Download [Y]es or [N]o:- 
if %ASK%==Y goto plugin2
if %ASK%==y goto plugin2
if %ASK%==n goto downloadnow1
if %ASK%==N goto downloadnow1
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto deodextool
:plugin2err
echo.
echo  We are not able to download required module.. because some connectivity issues..
ping localhost -n 3 >nul
echo  You can also manually download it from the given below link..
ping localhost -n 3 >nul
echo.
echo  link : ^https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/Plugins/Deodexer.exe
echo.
echo  Once downloaded you can place this file into this directory and run this
echo  option again..
ping localhost -n 3 >nul
echo.
pause
goto RESTART
:plugin2
cls
ping localhost -n 3 >nul
echo.
echo  Downloading Ultimate Deodexer Plugin..
echo.
ping localhost -n 3 >nul
if exist "Dexoder.exe"  (goto plugin22)
tools\wget https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/Plugins/Deodexer.exe --no-check-certificate
if errorlevel 1 goto plugin2err
:plugin22
cls
ping localhost -n 3 >nul
echo.
echo  Verifying..
cd "%~dp0"
move Dexoder.exe "Plugins"
rename Plugins\Dexoder.exe Deodexer.exe
echo.
ping localhost -n 3 >nul
cls
ping localhost -n 3 >nul
echo.
echo  Ultimate Deodexer Tool register you can use it now..
ping localhost -n 4 >nul
echo.
goto settings
:Pluginalreadyinstalled2
cls
ping localhost -n 2 >nul
echo  -----------------------------------------------------------------------------------
echo  XDA thread -- http://forum.xda-developers.com/showthread.php?t=2735156
echo.
echo  Credits -- BDfreak (Recognised Themer)
echo.
echo  Ultimate Deodexer is a tool engineered for all XDA Members, which allows user to 
echo  deodex apk and jar files with just some few clicks. It is a automated GUI based tool
echo  and very much user friendly. 
echo.
echo  Features :
echo.
echo  *Works with all Windows Version
echo  *User friendly Interface
echo  *Can deodex apks and jars of all API level
echo  *Solves problem in deodexing which was with 4.3/4.4
echo  *Drag and drop files or folders to load odex files
echo  *Framework and Output path can be selected
echo  *Unlimited files can be deodexed in a Go
echo  *Creates a log text file to track what's going on
echo.
echo  -----------------------------------------------------------------------------------
echo.
pause
goto downloadnow1
:romport
set ASK=Garbage
if exist Plugins\Rom-Porter\ROM-PORTER.bat (goto Pluginalreadyinstalled1)
cls
ping localhost -n 2 >nul
echo  -----------------------------------------------------------------------------------
echo  XDA thread -- http://forum.xda-developers.com/showthread.php?t=2276871
echo.
echo  Credits -- mnishamk (Senior Member)
echo.
echo  With This tool you can actually port custom roms to any device, take an eg of miui
echo  you can port it easily with our stock rom. Its easy to use and very basic procedure
echo  else everything tool will automatically do it.
echo.
echo  -----------------------------------------------------------------------------------
echo.
SET /P ASK=[*] Are you ready to Download [Y]es or [N]o:- 
if %ASK%==Y goto plugin1
if %ASK%==y goto plugin1
if %ASK%==n goto downloadnow1
if %ASK%==N goto downloadnow1
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto romport
:plugin1err
echo.
echo  We are not able to download required module.. because some connectivity issues..
ping localhost -n 3 >nul
echo  You can also manually download it from the given below link..
ping localhost -n 3 >nul
echo.
echo  link : https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/Plugins/Plugin1.7z
echo.
echo  Once downloaded you can place this file into this directory and run this
echo  option again..
ping localhost -n 3 >nul
echo.
pause
goto RESTART
:plugin1
cls
ping localhost -n 3 >nul
echo.
echo  Downloading Rom Porter Plugin..
echo.
ping localhost -n 3 >nul
if exist Plugin1.7z (goto plugin12)
tools\wget https://github.com/KaustubhPatange/Coolpad-Toolkit/raw/master/Plugins/Plugin1.7z --no-check-certificate
if errorlevel 1 goto plugin1err
:plugin12
cls
ping localhost -n 3 >nul
echo.
echo  Extracting..
"%~dp0tools\7za.exe" x -y Plugin1.7z
echo.
ping localhost -n 3 >nul
cls
ping localhost -n 3 >nul
echo.
echo  Rom porter Tool register you can use it now..
ping localhost -n 4 >nul
echo.
goto settings
:settings6
cls
echo.
echo  ===================================================================================
echo  This screen is to give credit to peoples who have reported bugs to me and made it
echo  again a Better and increased in performance. RESPECT THEM
echo  ===================================================================================
echo.
echo                               %toolkitthread%
echo.
echo  WRITTEN BY : 
echo  ----------
echo.
echo  Kaustubh Patange (KP)
echo.
echo  Email : DeveloperKP16@gmail.com
echo.
echo  BUG REPORTERS :
echo  -------------
echo.
echo  - MAJOR BUG about fastboot not being detected and used            -- Pranay
echo.
echo  - MAJOR BUG about adb not working in recovery                     -- Pranay
echo.
echo  - Bugs in Installing Google usb drivers                           -- Pranay
echo.
echo  - Bugs in Mods Section while installing Dolby atmos               -- ME :)
echo.
echo  - Bugs in Flashing Custom Recovery regarding some recovery**.p
echo    reflashing stock recovery                                       -- Tanmay
echo.
echo  - Bugs in Xposed Module (Now no bootloop Will occur)              -- ME :)
echo.
echo  Thanks to all this people Who have contributed to report bugs, otherwise this
echo  toolkit goes wrong.. :p
echo.
echo  ===================================================================================
echo.
pause
goto settings
:settings5
cls
echo.
echo  ===================================================================================
echo  This will help you to Contact me
echo  ===================================================================================
echo.
echo  If you have Some reports,bugs,regarding this toolkit you can contact me from below
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
goto settings
:settings4
cls
echo.
echo  ===================================================================================
echo  This screen is to give credit to the people who have contributed to the Toolkit.
echo  ===================================================================================
echo.
echo  WRITTEN BY : 
echo  ----------
echo.
echo  Kaustubh Patange (KP)
echo.
echo  Email : DeveloperKP16@gmail.com
echo.
echo  CONTRIBUTORS :
echo  ------------
echo.
echo  Koush and the Clockworkmod team for CWM custom recovery.
echo.
echo  Teamwin for TWRP custom recovery.
echo.
echo  Philz_Touch for his Advanced CWM recovery.
echo.
echo  Chainfire for his SuperSU root.
echo.
echo  Koush [again] for his Superuser root.
echo.
echo  Stephen Erickson for the BusyBox installer app.
echo.
echo  BurrowsApps for the Root Checker app.
echo.
echo  Riteshu For His SMS Backup ^& Restore
echo.
echo  Wanam for the EFS Backup app.
echo.
echo  Coolpad Members (AMT, TEAM Zero, etc)
echo.
echo  Thank you for those who Contributed there roms.
echo.
echo  ASSISTED ME:
echo  -----------
echo.
echo  Shripal Bro.. :) Who helped me in clearing my doubts.
echo.
echo  Google : For clearing my doubts.
echo.
echo  Thank you to everyone else who has contributed and made the Toolkit what it is.
echo.
echo  ===================================================================================
echo.
echo Press any key to return to the Main Menu..&pause >nul
echo.
goto settings
:settings3
cls
echo.
echo  ===================================================================================
echo  [Root] - SuperSU by Chainfire                                    v2.78
echo  [Root] - SuperSU Beta by Chainfire                               v2.78
echo  [Root] - Superuser by ClockworkMod                               v1.0.3.0
echo.
echo.
echo  [App] Busybox Installer by Stericson                             v4.4
echo  [App] Root Checker by Burrows Apps                               v4.0.2
echo  [App] SMS Backup ^& Restore                                      unknown
echo  [App] EFS Backup by Wannam                                       v1.60
echo  [App] ADBD insecure                                              v2.0
echo  [App] Xposed Installer                                           v3.0 alpha
echo.
echo  [Tool] Sp Flash Tool                                             v5.1628.00
echo  ===================================================================================
ping -n 3 127.0.0.1 >nul
echo.
echo  Press any key to return to the Main Menu&pause >nul
echo.
goto settings
:settings2
cls
echo  ===================================================================================
echo  This screen contains various settings/changes you can make to the ToolKit.
echo  ===================================================================================
echo.
echo  This will allow you to change the background and text colours of the ToolKit to add
echo  a bit of a personal touch to it. The colours you can select are as follows:
echo.
echo                           0 = Black          8 = Grey
echo                           1 = Blue           9 = Light Blue
echo                           2 = Green          A = Light Green
echo                           3 = Aqua           B = Light Aqua
echo                           4 = Red            C = Light Red
echo                           5 = Purple         D = Light Purple
echo                           6 = Yellow         E = Light Yellow
echo                           7 = White          F = Light White
echo.
echo  The colour setting when installed is '0' [Black] for the Background and 'A' 
echo  [Light Green]for the text colour but you can change it to whatever you want and it
echo  will be your new default colour.
echo.
echo  ===================================================================================
echo.
SET /P CLD=[*] Select background color ( 0-F ) :- 
echo.
SET /P GGT=[*] Select text color ( 0-F ) :- 
echo.
ping localhost -n 2 >nul
if exist "tools\_toolkitcolor.cf" (del "tools\_toolkitcolor.cf" /Q)
echo.
echo I: Setting Toolkit Color..
echo %CLD% >> tools\_toolkitcolor.cf
echo %GGT% >> tools\_toolkitcolor.cf
ping localhost -n 2 >nul
set n=
for /F "tokens=1" %%i in (tools\_toolkitcolor.cf) do (
set /a n+=1
set colour!n!=%%i
)
ping localhost -n 2 >nul
echo.
echo I: RETURNING TO MAINMENU..
ping localhost -n 3 >nul
color %colour1%%colour2%
ping localhost -n 2 >nul
goto RESTART
:settings1
if exist Toolkit.bat (
call Toolkit.bat
goto RESTART
exit
) else (
call Toolkit.exe
goto RESTART
exit
)
goto RESTART
:help
cls
ping localhost -n 2 >nul
SET infosectionon=yes
cls
echo  ===================================================================================
echo  This Screen will give you lots of useful information about how to use the Toolkit
echo  and how to fix any problems you may be facing. I will update this as frequently as
echo  I can to keep all the information up to date.
echo  ===================================================================================
echo.&echo.
echo  INFORMATION OPTIONS    [This section is under development]
echo  -------------------
echo.
echo  1.  So I installed the Toolkit, now what am I supposed to do?                [Info]
echo.
echo  2.  Selecting from the Main Menu                                             [Info]
echo.
echo  3.  Manual Instructions for Installing Drivers                               [Info]
echo.
echo  4.  Toolkit and Device 'Frequently Asked Questions'                          [Info]
echo.
echo.
echo  5. Return to MAINMENU
echo.
echo  ===================================================================================
echo.
SET /P infosectionon=[*] Make A Choice:- 
if %infosectionon%==1 goto info1
if %infosectionon%==2 goto info2
if %infosectionon%==3 goto info3
if %infosectionon%==4 goto info4
if %infosectionon%==5 goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto help
:info4
cls
echo  ===================================================================================
echo               TOOLKIT AND DEVICE FREQUENTLY ASKED QUESTIONS PAGE 1
echo  ===================================================================================
echo.
echo   Q. What is ADB Shell?
echo.
echo  Adb shell is a linux command line tool (because android is based on linux) used to 
echo  send commands to your android device. For S-ON devices, this is crucial for 
echo  modifying files in the /system partition (where the rom sits) as you cannot modify 
echo  anything in /system when the rom is running without S-OFF like removing system apps
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  Q. What is FASTBOOT?
echo.
echo  Fastboot is 2 things. It is a mode on the device, which looks a little like
echo  Bootloader.You can access it by holding Volume UP+Down and holding the power button
echo  while turning on the device.
echo.
echo  It is also a way of flashing radios, recovery, boot images and system images in a 
echo  command line method from a PC much like adb.
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  Q. I flashed Custom Recovery but each time I reboot the Stock Recovery is back
echo.
echo  There is an auto recovery restore system on certain Stock Android Builds that will 
echo  reflash the Stock Recovery if you flash Custom Recovery on a Stock Rom.
echo.
echo  Use Root Explorer to Mount the system folder as R/W (or use a free app from Google
echo  Play such as ES File Explorer). Rename the files /system/recovery-from-boot.p and
echo  /system/etc/install-recovery.sh (requires root). Now when you flash Custom Recovery 
echo  it will NOT be overwritten after a reboot. You can also do this via the Toolkit.
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  Q. My AntiVirus program says the Toolkit files may be harmful
echo.
echo  The exe compiled files are not digitally signed with a Microsoft certificate (as
echo  they cost money) so certain AntiVirus programs (mainly Norton and AVG Free) may
echo  pick it up as potentially harmful when it is not. They will pick up ANY file that
echo  doesn't contain a purchased Microsoft certificate in the same way. Just Restore the
echo  deleted file and exclude it from further scans and it will be fine. Or switch to a 
echo  better AntiVirus program such as BitDefender.
echo.
echo  ===================================================================================
echo.
pause
cls
echo  ===================================================================================
echo                TOOLKIT AND DEVICE FREQUENTLY ASKED QUESTIONS PAGE 2
echo  ===================================================================================
echo.
echo  Q. The ToolKit recognises my device in one mode but not in the other.
echo.
echo  Open the Device Manager on your pc and then boot your tablet into fastboot mode or
echo  adb mode (dont plug the usb cable in yet). Make sure USB debugging is enabled on 
echo  your Phone in settings, developer options. Plug the cable in while watching the 
echo  Device Manager and determine which item is added to list with the device plugged 
echo  in. Once you have found it right click on the item and select update driver. Select 
echo  browse my computer from the list and then browse to the 'drivers' folder in the
echo  ToolKit folder (wherever you installed the ToolKit to). Make sure sub folders is 
echo  ticked and click next. Hopefully the driver will be picked up and installed.
echo.
echo  You can check if a driver has been installed by looking at the top of the Main Menu 
echo  in the ToolKit while in fastboot mode and adb modes. If a serial number is displayed 
echo  in each mode then it will work fine.
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  Q. I Have Coolpad Device running on Coolui6 or 8 I didn't find developer options
echo.
echo  With Android 4.2 or later google have hidden the Developer options screen in the 
echo  Settings. This means you can't enable usb debugging to communicate with your device. 
echo  To show the Developers options screen do the following:
echo.
echo  1. Goto Settings, About Phone and tap the Build number text 7 times.
echo  2. When you have tapped 5-6 times you will be given a countdown of taps until you 
echo     become a developer.
echo  3. Once you are told you are now a developer you can go back to the Settings
echo     Screen and can see Developer options.
echo  4. You can now go into Developer options and enable usb debugging.
echo.
echo  ===================================================================================
echo.
pause
cls
echo  ===================================================================================
echo                TOOLKIT AND DEVICE FREQUENTLY ASKED QUESTIONS PAGE 3
echo  ===================================================================================
echo.
echo  Q. Can I backup my apps before unlocking the Bootloader so I don't lose my data?
echo.
echo  Performing an APPS BACKUP (option2,1) will backup all apps that were installed 
echo  after you first used your device. This will include any associated user data (such 
echo  as settings or high scores for games) and apps you installed from Google Play Store. 
echo  Just follow the recommended options and remember to turn your devices screen on 
echo  before starting it as you need to confirm on your screen.
echo.
echo  This option will NOT require your bootloader to be unlocked first.
echo. 
echo  -----------------------------------------------------------------------------------
echo.
echo  Q. I have Windows 8 and cannot install the drivers
echo.
echo  How to Disable Driver Signature Enforcement in Windows 8:
echo.
echo  1. From the Metro Start Screen, open Settings (move your mouse to the bottom-right-
echo     corner of the screen and wait for the pop-out bar, then click the Gear icon).
echo  2. Click More PC Settings.
echo  3. Click General.
echo  4. Scroll down, and click Restart now under Advanced startup.
echo  5. Click Troubleshoot.
echo  6. Click Advanced Options.
echo  7. Click Windows Startup Settings.
echo  8. Click Restart.
echo.
echo  When your computer restarts, select Disable driver signature enforcement from the
echo  list. You can now load your modified driver. Reboot again once the driver is
echo  installed and all will be well.
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  Q. In Latest Android Phones I get a pop-up asking to Allow USB debugging
echo.
echo  On Jelly Bean 4.2.2 or later there is a new whitelist procedure to verify the pc
echo  you are using. After USB debugging has been enabled for the first time after
echo  updating to 4.2.2 or later a pop up will appear on the devices screen asking to 
echo  allow USB debugging for that pc. Tick 'Always Allow' and click 'ok' and the 
echo  connection with that pc will be enabled and you will be able to use the Toolkit as
echo  normal. You will have to do this on any new pc you connect to your device via usb.
echo.
echo  ===================================================================================
echo.
pause
cls
echo  ===================================================================================
echo                TOOLKIT AND DEVICE FREQUENTLY ASKED QUESTIONS PAGE 4
echo  ===================================================================================
echo.
echo   Q. I am having trouble getting adb working with the drivers installed
echo.
echo  Try switching your connection type to File Transfer mode
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  Q. I want to send my device back for warranty purposes
echo.
echo  1. Install adb/fastboot drivers (if you havent already done so).
echo  2. Download a Factory Image and select to flash it.
echo  3. After it finishes you will be given the option to flash the image. Do this.
echo  4. Let the device reboot, then reboot to fastboot mode via the Device Reboot Screen.
echo  5. Relock the bootloader. Its now ready to return.
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  Q. How to get into your FastBoot Mode
echo.
echo  1. Turn your device off
echo  2. Unplug your usb cable if you have one plugged in
echo  3. Keep holding the Vol Up, Vol Down and Power buttons to boot into FastBoot Mode
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  Q. How to get into Custom Recovery
echo.
echo  First boot into FastBoot Mode then scroll down with the Volume Down button until
echo  it says Recovery mode at the top and press the Power button to enter Recovery
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  Q. My device Cannot detect Fastboot mode (BIG PROBLEM)
echo.
echo  Basically this is a very big problem because I since face many issues while doing
echo  it and found this solutions, Check that you have perfectly install your fastboot 
echo  drivers.If you don't know then reboot your phone to fastboot and connect to pc.Now
echo  open device manager from start menu,then underneath Android ADB if you don't see
echo  ADB bootloader, Coolpad Bootloader it means that it is driver issue. SO from the 
echo  toolkit install Coolpad Drivers form Maybe Option 7 like that, now check if it 
echo  recognises or not,Still you find the problem,then you need to download ANDROID SDK
echo  i.e simply Download Android Studio and install it. Then configure it.
echo  Contact me if you need any help from me :)
echo  ===================================================================================
echo.
pause
goto help
:info3
cls
echo.
echo  INSTALLING ADB/FASTBOOT/SIDELOAD DRIVERS
echo  ----------------------------------------
echo  The first thing you need to do before you can work with your device is install the
echo  adb/fastboot drivers on your PC. These drivers are needed so that you can unlock
echo  your bootloader, root your device, flash a custom recovery, send commands to your
echo  device from your pc and perform other tasks on your device.
echo.
echo  If you have tried installing the drivers automatically from the toolkit and you are
echo  having problems then try the following:
echo.
echo  Make sure you have USB DEBUGGING ENABLED in settings, developer options. In Android
echo  5.0 you need to  have to enable the developer options screen by going to settings,
echo  About Phone and click on Build number at the bottom 7 times until it says 
echo  "You are now a developer. If you have already enabled usb debugging then
echo  UNPLUG/REPLUG THE USB CABLE at the pc end and it should start.
echo.
echo  You can also try pulling down the notification screen from the top left with the
echo  device plugged in, then click on 'connected as' and change to File Transfer mode.
echo. 
echo  On Android 5.0  when you replug the usb cable after enabling usb debugging for the
echo  first time you will get a popup asking you to AUTHORIZE YOUR PC.Tick 'Always allow'
echo  then click 'ok' and everything should carry on as normal. 
echo  ON ANDROID 6 MAY SWITCH USB MODE [pull down top left] back to 'Charging only' after
echo  rebooting, after reconnecting the usb cable or after a while which stops the device
echo  being detected. If you are on Android 6 or later check you are in PTP mode.
echo.
echo  Manual checking/installing: Go to the Control PanelDevice Manager on your PC.
echo. 
echo  If drivers are not installed or there is an exclamation mark next to the device:
echo  Plug the device in to a usb cable directly connected to your motherboard. In the
echo  Device Manager a new item, usually called Android ADB should pop up in the list.
echo  Right click on the device item then left click on Update Driver Software. Select
echo  'browse my computer' and then 'Let me pick from a list'. If no adb interface driver
echo  appears in the list then untick 'Show compatible hardware' and find the Android,
echo  Google or Samsung adb interface driver. If you cannot find any of these click Have
echo  Disk, browse to the Toolkit install folder, drivers folder, google folder, click on
echo  android_winusb.inf and click Open. Click OK and select Google ADB Interface.
echo  You can use the same procedure to install the correct driver if your device is in
echo  adb/fastboot/sideload mode and the Toolkit is not detecting it.
echo. 
echo  NOTE: If the Toolkit tries to detect your device and gives the message 'error: no
echo  devices/emulators found' then the drivers aren't working. Follow the steps in the
echo  Drivers Screen to uninstall the driver in the mode you are in and replace it with
echo  the Coolpad adb driver. It should work then.
echo.
echo  ===================================================================================
pause
goto help
:info2
cls
echo.
echo  SELECTING FROM THE MAIN MENU
echo  -------------------------------
echo  Firstly you have the option to let the ToolKit automatically install all the
echo  adb/fastboot drivers that your device needs to function and communicate with 
echo  [Option1]. There is also a Tool which will fix the wrong drivers install for adb
echo  and fastboot and install correct one.
echo.
echo  You can now use ToolKit to backup your apk's and associated user data so if you
echo  are Unlocking your device for the first time or switching roms you can back up 
echo  everything and then restore it at a later date putting your device back the way it 
echo   was [you will still have to set the widgets back on the homescreens].You can even
echo  back up your devices Internal Storage [SD Card] along with your apps although this
echo  seemed a bit buggy in testing and may not back up everything.
echo.
echo  In the backup otions you can also backup your /data/media folder [virtual SD Card]
echo  using adb. This is a much safer method to use if you need to know your data is 
echo  backed up before Unlocking your Bootloader.
echo.
echo  If you want to flash Custom Roms straight away, download the Rom first and copy it
echo  across to your device [to the Internal Storage]. You can then just Unlock the
echo  Bootloader and Flash Custom Recovery. Then enter Recovery [use the Volume buttons
echo  to scroll to Recovery and press the Power button to select] and Flash your new ROM.
echo.
echo  If you just want to Root then you can simply unlock the bootloader and Root your
echo  device by flashing supersu zip. 
echo  For Flashing Recovery, Rom and other stuff like system.img, userdata.img a tool
echo  is provided for you i.e SP Flash tool. There is always a section for guide for
echo  flashing specific thing.
echo.
echo  ALLINONE [Option7] will do everything you need to do in 1 simple step. On a
echo  Stock Rom it will Unlock the Bootloader, Root the device, flash CWM Recovery and 
echo  install Busybox automatically and the only thing you need to do is to Enable USB
echo  debugging which is in settings, developer options after the first boot. The 
echo  ToolKit will then do the rest. This will be a Smart option so you can switch 
echo  things between the process.
echo.
echo  If you have a Coolpad device and want to Unroot and set everything back to normal
echo  then you just need to flash our original Stock Rom, this will be very helpful to
echo  restore your warranty back after rooting.
echo  If sending your device back REMEMBER to Relock the Bootloader afterwards.
echo.
echo  You can also use the ToolKit to ReLock your Bootloader,Reflash your Stock Recovery
echo  Image back to your device, Boot directly into Custom Recovery without flashing it, 
echo  Flash/Boot .img files, Push/Pull files and Set File Permissions, dump LogCat and
echo  BugReport files to your PC and modify your device via the Mods Section.
echo.
echo  ===================================================================================
pause
goto help
:info1
cls
echo.
echo  STARTING OUT FOR THE FIRST TIME
echo  -------------------------------
echo.
echo  Ok so you installed the Toolkit and went through the model selection screen to
echo  download your model files and custom recovery but now what do you do?
echo.
echo  Well the VERY FIRST thing you want to do is to enable USB debugging on your device
echo  so that your pc and device can communicate. This is quite easy:
echo  1. Make sure your device is booted into your Android operating system home screen.
echo  2. Open the apps drawer and select the 'settings' icon from the list.
echo  3. Now you need to enable the 'Developer options' screen by selecting 'About Phone'
echo     in Settings and tapping on Build number at the bottom 7 times.
echo  4. Now on the 'Settings' screen you can select 'Developer options'
echo  5. Tap on 'USB debugging' and select OK to confirm
echo. 
echo  Now you have USB debugging enabled your device should be ready to communicate with
echo  your PC so now you want to install the adb and fastboot drivers so the 2 sides can
echo  see each other [in simple terms]. This is all done from option 1 in the Main Menu.
echo. 
echo  Once the drivers are installed you can now connect your USB cable. On Using the 
echo  adb mode for your device first time, you will recieve a pop-up to authenticate 
echo  your device, simply Click on 'Allow Always'
echo.
echo  If you do not get any pop up on your device then don't worry sometimes it is auto
echo  accepted. So leave it as it is.
echo. 
echo  Now you need to verify that your device is properly showing on screen, i.e look
echo  on the device attached and see that your device serial key is printed, if not then
echo  something went wrong you need to reinstall drivers or try plugging the USB cable
echo  in a different USB port connected directly to your motherboard [NOT IN A USB HUB].
echo  Still nothing then try a different USB cable as it can actually make a difference.
echo.
echo  The last resort is to refer to the drivers help section to make sure your drivers
echo  are installed properly.
echo.
echo  Now that you have your connection with your PC you can do anything in the Toolkit.
echo  You will most probably want to root if you are using the Toolkit which means you
echo  will need to unlock the bootloader, then root and maybe even flash a custom
echo  recovery [allows you to flash custom roms, kernels, backup your device and much
echo  more].
echo.
echo  But if you want to unlock bootloader then first of all you need to go to Settings,
echo  Developer Options, and check allow oem unlocking, This will help toolkit with ease
echo  to unlock the toolkit.
echo.
echo  Now you have started down the road to hacking your device and making it the way YOU
echo  want it and I wish you all the best. Have fun, explore all the different options in
echo  the Toolkit and above all enjoy yourself.
echo.
echo  ===================================================================================
pause
goto help
:launchadb
cls
ping localhost -n 2 >nul
echo I: Waiting for ADB MODE..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Launching Android Terminal..
start adb shell
ping localhost -n 3 >nul
goto RESTART
:launchcmd
cls
ping localhost -n 2 >nul
echo I: Launching Command Prompt..
start
ping localhost -n 2 >nul
goto RESTART
:rebootoptions
cls
set rebootoptionschoice=dbjd
ping localhost -n 2 >nul
echo  ===================================================================================
echo.
echo  REBOOT OPTIONS
echo  --------------
echo.
echo  1.  Reboot Device to Fastboot Mode                            [from Fastboot Mode]
echo.                                      
echo  2.  Reboot Device to Android OS                               [from Fastboot Mode]
echo.
echo  3.  Reboot Device to Fastboot Mode              [from ADB Mode, Booted to Android]
echo.
echo  4.  Reboot Device to Recovery                   [from ADB Mode, Booted to Android]
echo.
echo  5.  Reboot Device to Android OS                 [from ADB Mode, Booted to Android]
echo.
echo  6.  Power Off The Device                        
echo.&echo.
echo  7.  Start SP Flash Tool                                        [Must be Power OFF]
echo.&echo.
echo  8.  Back to Main Menu
echo.
echo  ===================================================================================
echo.
SET /P rebootoptionschoice=[*] Make your choice:- 
echo.
IF %rebootoptionschoice%==1 (goto fastbootbootfastboot)
IF %rebootoptionschoice%==2 (goto fastbootbootandroid)
IF %rebootoptionschoice%==3 (goto adbbootfastboot)
IF %rebootoptionschoice%==4 (goto adbbootrecovery)
IF %rebootoptionschoice%==5 (goto adbbootandroid)
IF %rebootoptionschoice%==6 (goto poweroff)
IF %rebootoptionschoice%==7 (goto spflashtool)
IF %rebootoptionschoice%==8 (goto RESTART)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto rebootoptions
:poweroff
adb shell reboot -p
ping -n 6 127.0.0.1 >nul
goto rebootoptions
:spflashtool
cd "%~dp0"
if exist "sp_tool\flash_tool.exe" (
call "sp_tool\flash_tool.exe"
goto rebootoptions
)
goto rebootoptions
:fastbootbootfastboot
fastboot -i 0x1EBF reboot-bootloader
ping -n 6 127.0.0.1 >nul
goto rebootoptions
:adbbootfastboot
adb reboot bootloader
ping -n 6 127.0.0.1 >nul
goto rebootoptions
:fastbootbootandroid
fastboot -i 0x1EBF reboot
ping -n 5 127.0.0.1 >nul
echo.
echo  If your device is not detected after rebooting[waiting for usb debugging]you will
echo  need to go to Settings, Developer options, Debugging and turn USB debugging off. 
echo  Then click on USB debugging again and turn it back on to connect.
echo.
ping -n 2 127.0.0.1 >nul
echo  If on Android 6 or later you may have to switch usb mode [pull down top left] from
echo  Charging only to PTP/MTP [whichever gave a connection] to connect after rebooting.
echo.
ping -n 2 127.0.0.1 >nul
echo I: Waiting For ADB MODE..
adb wait-for-device
ping -n 3 127.0.0.1 >nul
goto rebootoptions
:adbbootandroid
adb reboot
ping -n 5 127.0.0.1 >nul
echo.
echo  If your device is not detected after rebooting[waiting for usb debugging]you will
echo  need to go to Settings, Developer options, Debugging and turn USB debugging off. 
echo  Then click on USB debugging again and turn it back on to connect.
echo.
ping -n 2 127.0.0.1 >nul
echo  If on Android 6 or later you may have to switch usb mode [pull down top left]from
echo  Charging only to PTP/MTP [whichever gave a connection] to connect after rebooting.
echo.
ping -n 2 127.0.0.1 >nul
echo I: Waiting For ADB MODE..
adb wait-for-device
ping -n 3 127.0.0.1 >nul
goto rebootoptions
:adbbootrecovery
adb reboot recovery
ping -n 6 127.0.0.1 >nul
echo  -----------------------------------------------------------------------------------
echo  If you see A DEAD Android mode.. Then
echo.
echo  NOW HOLD VOLUME UP KEY AND POWER KEY FOR APPROXIMATELY 7 SEC THEN QUICKLY RELEASE IT
ECHO  THIS WILL QUITE THE DEAD ANDROID MODE: THIS WILL QUITE DEAD ANDROID MODE
echo  -----------------------------------------------------------------------------------
echo.
ping -n 3 127.0.0.1 >nul
echo.
pause
goto rebootoptions
:getmodelbuildprop
cls
echo.
echo I: Waiting for USB debugging to be detected
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
goto RESTART
:devicemods
cd "%~dp0"
:modsmenu
cls
set modssel=ddjhdj
echo  ===================================================================================
echo  WELCOME TO THE COOLPAD MODS SECTION                                           v1.2
echo.
echo  YOU MUST ACCESS THE MODS SECTION FROM THE TOOLKIT. 
echo.
echo  EVERYTHING IN THIS SECTION REQUIRES YOU TO BE BOOTED UP IN ANDROID EITHER TO FOLLOW
echo  THE INSTRUCTIONS OR FOR ADB MODE TO APPLY TWEAKS [WHICH REQUIRES ROOT ACCESS].
echo  ===================================================================================
echo.&echo.
echo   MENU [Must be in Android OS and Connected via USB]
echo   --------------------------------------------------
echo.
echo   1. Install ADB Insecure  (without booting insecure image)               [ADB MODE]
echo.
echo   2. Remove Your Phone Lock                                               [ADB MODE]
echo.
echo   3. Change Your Android Phone Theme                                         [GUIDE]
echo.
echo   4. Fix folder Permissions on Internal Storage                        [ADB ISECURE]
echo.
echo   5. Change your DPI                                                      [ADB MODE]
echo.
echo   6. Install Dolby Atmos                                          [ROOT+Sideloading]
echo.
echo   7. Take ScreenShot of Your Android Screen
echo.
if %DEVICE%==CPN3L (
echo   8. Disable Capactive Buttons and Enable Virtual Key BOTH                [COOLUI 8]
) else (
echo   8. Disable Capactive Buttons and Enable Virtual Key BOTH                [DISABLED]
)
echo.
echo   9. Install Google Assistant (Pixel One) for NON-ROOT Device            [VERY EASY]
echo.
echo  10. Set up Loki Tool (use to flash system images)
echo.
echo  x. Return to Mainmenu
echo.
echo  ===================================================================================
echo.
SET /P modssel=[*] Make A Choice:- 
if %modssel%==1 goto ADBinsecure
if %modssel%==2 goto remphone
if %modssel%==3 goto andtheme
if %modssel%==4 goto fixper
if %modssel%==5 goto changedpi
if %modssel%==6 goto insalldolby
if %modssel%==7 goto screencap
if %modssel%==8 goto disacap
if %modssel%==9 goto Coming
if %modssel%==10 goto flashimgb
if %modssel%==x goto RESTART
if %modssel%==X goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto modsmenu
:flashimgb
cls
set modssel=ddjhdj
echo  ===================================================================================
echo  Before you continue, Ensure following things
echo.
echo  YOUR DEVICE MUST BE ROOTED.
echo.
echo  USB DEBUGGING MUST BE ENABLED IN SETTINGS, DEVELOPER OPTIONS BEFORE STARTING. 
ECHO  YOUR DEVICE MUST BE IN ANDROID MODE.
echo  ===================================================================================
echo.
ECHO  PRESS ENTER TO START
pause>nul
ECHO.
echo  Waiting for Device...
adb wait-for-device
echo.
echo  Aquiring Root shell... (Accept Device request, if asked)
adb shell su -c exit
if errorlevel 1 (call tools\ctext.exe 0a "Failed.."&& echo.)
echo.
echo  Mounting System...
adb shell su -c mount -o remount, rw /system 
echo.
echo  Pushing to Device...
adb push tools\loki_tool /sdcard/loki_tool
adb shell su -c cp /sdcard/loki_tool /system/bin
adb shell su -c chmod 777 /system/bin/loki_tool
echo.
echo  Done..
echo.
pause
goto devicemods
:coming
cls
echo  ===================================================================================
echo  IT IS VERY EASY TO HAVE GOOGLE ASSISTANT ON ANY 6.0.xx Phone
echo  ------------------------------------------------------------
echo.
echo  Very very simple thing, you need to do. NO ROOTING Nothing.
echo.
echo  Just update your Google app to latest build from playstore.
echo.
echo  Thats it you have your assistant now... :) CHEERS
echo.
echo  ===================================================================================
echo.
pause
goto modsmenu
:disacap
cls
set TEST=hhdj
ping localhost -n 2 >nul
if %DEVICE%==CPN3L goto nserror1
echo  ===================================================================================
echo  THIS MOD IS GIVEN BY MOHIT (http://www.coolpadforums.com/?986)
echo  --------------------------------------------------------------
echo.
echo  This will replace or enable Capactive Buttons or Virtual Keys
echo. 
echo  OPTION 1 will Disable Capactive Buttons on Notification Bars ^& enable Virtual Keys
echo  -------- by sideloading 2 zip files..
echo.
echo  OPTION 2 will Disable Capactive Buttons on Notification Bars ^& enable Virtual Keys
echo  -------- by Pushing the two zip to sdcard (INTERNAL STORAGE) and you need to 
echo  manually flash the zip.
echo.
echo  NOTE For this to be work your device must be Rooted and have custom recovery
echo  installed. IF note then DO it from the toolkit.
echo.
echo  ===================================================================================
echo.
echo  OPTIONS : :
echo  -------
echo.
echo  1. Disable Capactive Buttons and enable Virtual Keys                     [SIDELOAD]
echo.
echo  2. Disable Capactive Buttons and enable Virtual Keys              [CUSTOM RECOVERY]
echo.
echo.
echo  3. Return to MODS SECTION
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make a Decision :- 
if %TEST%==2 goto disacap2
if %TEST%==3 goto modsmenu
if %TEST%==1 (
set cuspath=root\virtualkey1.zip
set cuspath1=root\virtualkey2.zip
goto decesionmaker2
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto modsmenu
:disacap2
SET JUST=ganekeh
echo  ===================================================================================
echo  BEST PROCEDURE FOR ENABLING VIRTUAL KEYS VIA CUSTOM RECOVERY
echo  ------------------------------------------------------------
echo  1. First OF all Take a Complete backup of your phone, because if something goes 
echo     wrong, you can restore your data using toolkit.
echo  2. Now using this toolkit flash TWRP, CWM,PHILZ any recovery you want. If you have
echo     done it already you can proceed.
echo  3. Once Custom Recovery is set,then Select 1 option to push to your phone.
echo  4. Once done, press 2 to reboot into custom recovery. 
echo  6. Now FOR TWRP:
echo     a. Select Install ^> Install from internal_sdcard ^> /toolkit ^> virtualkey1.zip
echo     Again flash,
echo       Select Install ^> Install from internal_sdcard ^> /toolkit ^>  virtualkey2.zip
echo       Now a new screen will appear, just select wipe cache, davlik cache then from 
echo       below Swipe Right to start flashing. Once done you can reboot your phone,
echo       after again wiping data,cache.
echo    Now FOR CWM:
echo    a. Select Insall from internal_sdcard ^> /toolkit ^> virtualkey1.zip ^> YES
echo    Again flash Insall from internal_sdcard ^> /toolkit ^> virtualkey2.zip ^> YES
echo  7. Patience is must factor needed for this. SO wait, once everything is done. YOU
echo     can Restart your phone
echo  8. At first it will take so much time or nearly much time for first reboot so don't
echo     get panic. 
echo  9. Once you have successfully booted into android. You can check your notification
echo     bar to see COOL Changes..
echo.
echo  MAKE SURE THAT YOUR DRIVERS ARE PERFECTLY INSTALL TO DETECT ADB MODE,IN YOUR PC.IF
ECHO  NOT GO IN THE DRIVERS SECTION AND INSTALL IT.
echo  ===================================================================================
echo.
echo  OPTIONS
echo  -------
echo.
echo  1. Push .zip to internal sdcard                                          [ADB MODE]
echo.
echo  2. Reboot to Custom Recovery                                             [ADB MODE]
echo.
echo  3. Back to Previous Menu
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A choice:- 
if %TEST%==3 goto disacap
if %TEST%==1 goto disacap3
if %TEST%==2 (
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
echo  Just press Any Key
echo.
pause
cd "%~dp0"
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Rebooting to custom Recovery..
adb reboot recovery
ping localhost -n 3 >nul
echo I: Done..
echo.
pause
goto disacap2
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto disacap2
:disacap3
cls
echo.
cd "%~dp0"
ping localhost -n 2 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC ^& Drivers are properly installed
echo  If not then head to Driver Installation section in my toolkit.
echo.
echo  IF NOT PUSHED YOUR Virtual1.zip ^& Virtual2.zip, MANUALLY COPY TO INTERNAL STORAGE
echo  OF YOUR PHONE.
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  Just press Any Key
echo.
pause
cd "%~dp0"
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Pushing zip to internal_sdcard..
echo.
echo GIVE PERMISSION IN YOUR PHONE, IF PROMPT
adb push "root\virtualkey1.zip" /mnt/sdcard/Toolkit/
adb push "root\virtualkey2.zip" /mnt/sdcard/Toolkit/
echo I: Done..
echo.
pause
goto disacap2
:disacap1
ping localhost -n 2 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC ^& Drivers are properly installed
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
echo  Just press Any Key
echo.
pause
cd "%~dp0"
echo I: Waiting for adb mode..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Rebooting to Recovery..
adb reboot recovery
if errorlevel 1 (echo Something went wrong.. :0 && pause && goto modsmenu)
ping localhost -n 4 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  Lets Enable Virtual Keys.....
echo.
echo  For TWRP RECOVERY
echo  1. Just Click ON ADB sideload Option.
echo.
echo  For CWM RECOVERY
echo  1. Just Go and select Install zip from sideload
echo.
echo  IF you want to cancel all this ^& reboot your phone to normal just hold power button
echo  for 15 sec your device will boot in android.
echo. 
echo  Once everything is done, press enter
echo  -----------------------------------------------------------------------------------
echo.
pause
echo.
echo I: Updating Android..
ping localhost -n 1 >nul
echo I: Sideloading Zip file 1..
adb sideload "root\virtualkey1.zip"
ping localhost -n 4 >nul
echo I: Sideloading Zip file 2..
adb sideload "root\virtualkey2.zip"
ping localhost -n 4 >nul
echo I: Rebooting to Android..
adb reboot 
ping localhost -n 2 >nul
echo.
echo I: Done..
echo.
echo  If device does not reboot, reboot it manually :)
echo.
pause
goto disacap
:screencap
echo.
set /A n=0
echo  Make Sure your phone screen in turn on, else you will get black screenshot
echo.
echo  Press any Key to Take a Screen shot. && pause>nul
echo.
echo I: Waiting for ADB mode..
adb wait-for-device
echo I: Taking ScreenShot..
adb shell screencap -p /sdcard/screenshot.png
adb pull /sdcard/screenshot.png temp
ping -n 1 127.0.0.1 >nul
if exist OUTPUT\screenshot%n%.png (
set /A n=n+1
rename temp\screenshot.png Screenshot%n%.png
move temp\Screenshot%n%.png OUTPUT
)
echo.
echo I: Done..
echo.
echo  ScreenShot save to "OUTPUT" folder..
echo.
pause
goto modsmenu
:insalldolby
SET PANDU=HKJDKD
cls
ping -n 2 127.0.0.1 >nul
echo  ===================================================================================
echo  This will install Dolby Atmos on %MODEL%
echo.
call tools\ctext.exe 0b "This Option is verified properly"
echo.
echo.
ping -n 1 127.0.0.1 >nul
echo  Dolby Atmos for mobile devices adapts the premier cinema sound experience for 
echo  reproduction over built-in speakers and headphones to create powerful,moving audio
echo  that seems to flow all around you.
echo.
echo  Sounds in Dolby Atmos soundtracks for cinema and home exist as individual entities,
echo  called audio objects. These audio objects move around you and above you to create a
echo  complete audio environment that perfectly follows the onscreen story to fully 
echo  immerse you in the action.
echo.
echo  Dolby Atmos for mobile devices works over any pair of headphones and is custom-
echo  tuned to get the most out of built-in stereo speakers. Not only does it deliver the
echo  best experience for Dolby Atmos content, it also greatly improves the sound of 
echo  music, games, and television shows in any format on your device. It provides 
echo  crisper dialogue, a more enveloping soundfield, greater subtlety and nuance, 
echo  maximized loudness without distortion, and consistent playback volume for a wide 
echo variety of content.
echo.
echo  MAKE SURE YOUR DEVICE IS ROOTED AND IT IS PROPERLY BOOTED INTO ANDROID. YOU MUST
ECHO  HAVE CUSTOM RECOVERY FOR IT.
echo  ===================================================================================
ECHO.
echo  OPTIONS : :
echo  -------
echo.
echo  1. Install Dolby via Sideloading through custom recovery                [SIDELOAD]
echo.
echo  2. Install Dolby manually via Custom Recovery                           [ADB MODE]
echo.
echo  3. Install Dolby via TWRP Tweaks :)                                  [recommended]
echo.
echo  x. Return to Mods SECTION
echo.
echo  ===================================================================================
ECHO.
SET /P PANDU=[*] Make A Choice:- 
if %PANDU%==2 goto dolby2
if %PANDU%==3 goto dolbynew

if %PANDU%==X goto modsmenu
if %PANDU%==x goto modsmenu

if %PANDU%==1 (
set cuspath=root\datmos.zip
goto decesionmaker2
)

echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto insalldolby
:dolbynew
cls
echo.
echo.
ping localhost -n 3 >nul
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  Phone is Booted into Android. Custom Recovery like TWRP, CWM should be present
echo  Your phone must be ROOTED.
echo  -----------------------------------------------------------------------------------
echo.
ping localhost -n 2 >nul
echo  Just press Any Key
echo.
pause
echo.
ping localhost -n 2 >nul
echo  Waiting for adb mode..
adb wait-for-device
echo.
echo  Grant Root Access..
adb shell su -c exit
echo.
ping localhost -n 3 >nul
adb push root\datmos.zip /sdcard/
echo.
echo  Initializing Scripts..
ping localhost -n 2 >nul
adb shell < tools\_toolkitflash5.cf
echo.
ping localhost -n 2 >nul
echo.
echo  Done..
echo.
ping localhost -n 2 >nul
echo  Now wait and watch :)
ping localhost -n 2 >nul
echo.
pause
goto devicemods
:dolby2
cd "%~dp0"
if %DEVICE%==CPN3 (SET MODEL=Coolpad Note 3) else (SET MODEL=Coolpad Note 3 Lite)
cls
SET JUST=ganekeh
echo  ===================================================================================
echo  BEST PROCEDURE FOR FLASHING DOLBY ATMOS VIA CUSTOM RECOVERY
echo  -----------------------------------------------------------
echo  1. First OF all Take a Complete backup of your phone, because if something goes 
echo     wrong, you have your data using toolkit.
echo  2. Now using this toolkit flash TWRP, CWM,PHILZ any recovery you want. If you have
echo     done it already you can proceed.
echo  3. Once Custom Recovery is set,then Select 1 option to push to your phone.
echo  4. Once done, press 2 to reboot into custom recovery. 
echo  6. Now FOR TWRP:
echo     a. Select Install ^> Install from external_sdcard ^> datmos.zip
echo        Now a new screen will appear, just select wipe cache, davlik cache then from 
echo        below Swipe Right to start flashing. Once done you can reboot your phone,
echo        after again wiping data,cache.
echo     Now FOR CWM:
echo     a. Select Insall from external_sdcard ^> datmos.zip ^> YES
echo  7. Patience is must factor needed for this. SO wait, once everything is done. YOU
echo     can Restart your phone
echo  8. At first it will take so much time or nearly much time for first reboot so don't
echo     get panic. 
echo  9. Once you have successfully booted into android. Open Dolby atmos app to configure
echo     it.
echo     VOILA YOU HAVE DOLBY ATMOS !!!!
echo.
echo  MAKE SURE THAT YOUR DRIVERS ARE PERFECTLY INSTALL TO DETECT ADB MODE, IN YOUR PC. IF
ECHO  NOT GO IN THE DRIVERS SECTION AND INSTALL IT.
echo  ===================================================================================
echo.
echo  OPTIONS
echo  -------
echo.
echo  1. Push .zip to external sdcard                                          [ADB MODE]
echo.
echo  2. Reboot to Custom Recovery                                             [ADB MODE]
echo.
echo  3. Back to Previous Menu
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A choice:- 
if %TEST%==3 goto insalldolby
if %TEST%==1 goto pushdatmos
if %TEST%==2 (
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
echo  Just press Any Key
echo.
pause
cd "%~dp0"
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Rebooting to custom Recovery..
adb reboot recovery
ping localhost -n 3 >nul
echo I: Done..
echo.
pause
goto dolby2
)
echo.
echo   You went crazy, Entering Option which is actually not present :0
echo.
pause
goto dolby2
:pushdatmos
cls
echo.
cd "%~dp0"
ping localhost -n 2 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo.
echo  IF NOT PUSHED YOUR DATMOS.ZIP, MANUALLY COPY TO EXTERNAL STORAGE OF YOUR PHONE.
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  Just press Any Key
echo.
pause
cd "%~dp0"
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Pushing zip to external_sdcard..
echo.
echo GIVE PERMISSION IN YOUR PHONE, IF PROMPT
adb push "root\datmos.zip" /mnt/sdcard2/
echo I: Done..
echo.
pause
goto dolby2

:: THIS IS A SHIT

::dolby1
ping localhost -n 2 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
echo Just press Any Key
echo.
pause
cd "%~dp0"
echo I: Waiting for adb mode..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Rebooting to Recovery..
adb reboot recovery
if errorlevel 1 (echo Something went wrong.. :0 && pause && goto modsmenu)
ping localhost -n 4 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  Lets Flash Dolby.....
echo.
echo  For TWRP RECOVERY
echo  1. Just Click ON ADB sideload Option.
echo.
echo  For CWM RECOVERY
echo  1. Just Go and select Install zip from sideload
echo.
echo  IF you want to cancel all this ^& reboot your phone to normal just hold power button
echo  for 15 sec your device will boot in android.
echo.
echo  Once everything is done, press enter
echo  -----------------------------------------------------------------------------------
echo.
pause
echo.
echo I: Updating Android..
ping localhost -n 1 >nul
echo I: Sideloading Zip file..
adb sideload "root\datmos.zip"
ping localhost -n 2 >nul
echo I: Rebooting to Android..
adb reboot 
ping localhost -n 2 >nul
echo.
echo I: Done..
echo.
echo If device does not reboot, reboot it manually :)
echo.
pause
goto insalldolby

:: THIS WAS A SHIT


:changedpi
cls
ping -n 2 127.0.0.1 >nul
echo  ===================================================================================
echo.
echo  As our phone's screen size is quite big, some people wants smaller icon size and 
echo  some more bigger. But as our Phone is temporarily unable to root, it is difficult
echo  to change the DPI, butI know a simple method to do this stuff
echo.
echo  DPI values generally look like 320,400,260 etc.Higher the DPI value more large will
echo  be the icons and vice-versa.
echo.
echo  Our default DPI of coolpad phones is 267 or 320.
echo.
echo  Just give the input of any values you like and then change it. Don't panic if you 
echo  think that you will mess with your DPI and something goes wrong. Then again use 
echo  this option to set your dpi to 267 or 320. Thats it, else RESET your phone.
echo.
echo  Press "x" any time to return back to Mods section.
echo  ===================================================================================
echo.
SET /P dpi=[*] Type an Input for DPI:- 
if %dpi%==X goto modsmenu
if %dpi%==x goto modsmenu
echo.
ping -n 3 127.0.0.1 >nul
echo I: Waiting for adb mode..
adb wait-for-device
ping -n 3 127.0.0.1 >nul
echo I: Changing your current dpi..
ping -n 3 127.0.0.1 >nul
adb shell wm density %dpi%
ping -n 2 127.0.0.1 >nul
echo I: Rebooting your Phone..
adb reboot
ping -n 4 127.0.0.1 >nul
echo.
echo I: Done, DPI set to %dpi%
ping -n 5 127.0.0.1 >nul
echo.
goto modsmenu
:fixper
cls
ping -n 2 127.0.0.1 >nul
echo.
echo I: Waiting for ADB Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Getting Permissions
adb shell su -c exit
IF errorlevel 1 (goto errormessage1)
ping -n 5 127.0.0.1 >nul
adb shell mount -o rw,remount /system /system
IF errorlevel 1 (goto errormessage1)
ping -n 2 127.0.0.1 >nul
echo.&echo I: Fixing permissions for /data/media folder
ping -n 4 127.0.0.1 >nul
adb shell chmod -R 775 /data/media
IF errorlevel 1 (goto errormessage1)
echo.&echo I: Rebooting device to make changes
ping -n 4 127.0.0.1 >nul
adb reboot
ping -n 3 127.0.0.1 >nul
goto modsmenu
:andtheme
if %DEVICE%==CPN3 (
set link1=goo.gl/9mWbcU
set link2=goo.gl/R1Uf5Q
)
if %DEVICE%==CPN3L (
set link1=goo.gl/9mWbcU
set link2=goo.gl/R1Uf5Q
)
if %DEVICE%==Basic (
set link1=You are using basic version
set link2=You are using basic version
)
cls
echo  ===================================================================================
echo  This will change your android theme on both Lollipop and Marshmallow
ECHO.
echo  FOR LOLLIPOP USER ::
echo  -----------------
echo  1. First of all access to one of the those website given below to download themes
echo     for %MODEL%
echo  2. Once its Downloaded you need to place it into your External memory, coolpad,
echo     coolshow, theme 
echo     If you didn't find "theme"  folder their, you need to simply create it.
echo  3. Place your all .theme files into "theme" folder. Make sure while creating your
echo     folder keep your letters in lower case only as it is case sensitive.
echo  4. Now access you Coolshow app from app list then head to themes, from their you 
echo     can access your theme and then apply it simply.
echo.
echo Link for All themes:- %link1%
echo.
echo  FOR MARSHMALLOW USER ::
echo  --------------------
echo  1. First of all access to one of the those website given below to download themes
echo     for %MODEL%
echo  2. Once its Downloaded you need to place it into your Internal Storage,zookingsoft,
echo     ThemeStore, themes 
echo     If you didn't find "themes"  folder their, you need to simply create it.
echo  3. Place your all .theme files into "themes" folder.Make sure while creating your
echo     folder keep your letters in lower case only as it is case sensitive.
echo  4. Now access you Theme app from app, from their you can access your theme and 
echo     then apply it simply.
echo.
echo Link for All themes:- %link2%
echo.
echo  ===================================================================================
echo.
pause
goto modsmenu
:remphone
CLS
SET TEST=djkdj
echo  ===================================================================================
echo  This will remove your Phone Pattern or Password lock
echo.
echo  OPTION 1 will use adb shell su -c exit to remove pattern lock, then automatically reboot your
echo  device. 
echo  OPTION 2 will use adb shell su -c exit to remove password lock, then automatically reboot your
echo  device. 
echo  OPTION 3 will go back to Mainmenu... LOL xd you know it :)
echo.
echo  MAKE SURE YOU MUST HAVE ROOT ACCESS TO DO THIS
echo  ===================================================================================
ECHO.
echo  OPTIONS : :
echo  -------
echo.
echo  1. Reset your Pattern lock (gesture)                                [ADB INSECURE]
echo.
echo  2. Reset your Password lock (pass)                                  [ADB INSECURE]
echo.
echo  3. Return TO Mainmenu
echo.
echo  ===================================================================================
ECHO.
SET /P TEST=[*] Make A Choice:- 
if %TEST%==3 goto modsmenu
if %TEST%==1 goto resetg
if %TEST%==2 goto resetp
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto remphone
:resetp
echo.
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
pause
echo.
echo I: Waiting for ADB mode..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Reseting Passoword lock
ping localhost -n 2 >nul
adb shell su -c exit
ping localhost -n 2 >nul
echo adb shell rm /data/system/pass.key
ping localhost -n 2 >nul
echo.
echo I: Rebooting device..
adb reboot
ping localhost -n 3 >nul
echo.
echo I: Done..
ping localhost -n 4 >nul
echo.
echo If you see again pattern, just try any combination it would unlock..
ping localhost -n 4 >nul
echo.
pause
goto remphone
:resetg
echo.
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
pause
echo.
echo I: Waiting for ADB mode..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Reseting Pattern lock
ping localhost -n 2 >nul
adb shell su -c exit
ping localhost -n 2 >nul
echo adb shell rm /data/system/gesture.key
ping localhost -n 2 >nul
echo.
echo I: Rebooting device..
adb reboot
ping localhost -n 3 >nul
echo.
echo I: Done..
ping localhost -n 4 >nul
echo.
echo If you see again pattern, just try any combination it would unlock..
ping localhost -n 4 >nul
echo.
pause
goto remphone
:ADBinsecure
cls
set agree=dnkdj
ping localhost -n 2 >nul
echo  ===================================================================================
echo  This will install ADB insecure apk on your device
echo.
echo  NOW AS YOU HAVE EXPLORE THIS TOOLKIT, you might have seen some options beside their
echo  is written ADB INSECURE, Now what is this basically. So here I am.
echo  For certain things to work out with adb like if you want to explore data folder of
echo  your android phone, you can't directly do it via ADB coz our android doesn't allow
echo  to do that so we use ADB insecure (which usually needs root) so that you can easily
echo  access those directories and many things without basically flashing inscure image.
echo.
echo  FOR more Information just GOOGLE IT.
echo.
echo  Once the app is Installed
echo   1. Open it and click on adb insecure thats it. 
echo.
echo  YOU WILL NEED ROOT ACCESS TO RUN THIS ALSO PHONE MUST BE IN ADB MODE I.E Connected
ECHO  TO PC VIA USB DEBUGGING MODE ENABLED.
echo  ===================================================================================
ECHO.
SET /P agree=[*] Are you ready to Continue (y/n):- 
if %agree%==Y goto ADBinsecure1
if %agree%==y goto ADBinsecure1
if %agree%==N goto modsmenu
if %agree%==n goto modsmenu
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto goto ADBinsecure
:ADBinsecure1
echo.
echo I: Waiting For ADB MODE..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Installing Adb inscure apk..
adb install -r tools\eu.chainfire.adbd-v2.00.apk
ping localhost -n 2 >nul
echo I: Launching App..
adb shell am start -n eu.chainfire.adbd/eu.chainfire.adbd.MainActivity
ping localhost -n 2 >nul
echo I: Done..
ping localhost -n 2 >nul
echo.
echo  Trigger ADB INSECURE MODE..
ping localhost -n 4 >nul
echo.
pause
goto modsmenu
:errormessage1
echo.&echo An Error Occured
echo.&echo Returning to Phone Mods Menu
ping -n 5 127.0.0.1 >nul
goto modsmenu
:nserror1
cls
echo.
ping localhost -n 3 >nul
echo  This Feature is not available for your device..
echo.
ping localhost -n 4 >nul
echo  This Option is Disabled..
echo.
ping localhost -n 4 >nul
echo.
echo I: RETURNING TO MAINMENU
ping localhost -n 3 >nul
goto modsmenu
:extratips
cls
cd "%~dp0"
echo  ===================================================================================
echo  Here Are Some Tips ^& Tricks for Coolpad
echo  ----------------------------------------
echo.
echo                     MORE WILL BE INTEGRATED IN NEXT UPDATE
echo.
tools\ctext.exe 0b " How to Fix MTK Logger"
echo.
echo.
echo  1. Go to Dialpad Enter ^*#9527^*#
echo  2. Then DM and enter Password 54321
echo  3. OK, the cancel everything.
echo  4. Thats it..
echo.
tools\ctext.exe 0b " How to Backup IMEI number"
echo.
echo.
echo  1. Go to Backup Section of the toolkit and Do it..
echo.
tools\ctext.exe 0b " How to Open Engineering Mode"
echo.
echo.
echo  1. Go to Dialpad Enter *20121220#
echo.
echo.
echo  ===================================================================================
echo.
pause
goto RESTART
if exist tools\configextra.exe (
ping localhost -n 2 >nul
call "tools\configextra.exe"
goto RESTART
)
cls
ping localhost -n 3 >nul
echo.
echo Actually Currently I am Working on THIS
echo.
ping localhost -n 4 >nul
echo And I will really need your help for making this section
ping localhost -n 5 >nul
echo.
echo Because I am not much aware of Coolpad phones
ping localhost -n 4 >nul
echo.
echo I have but I have not perform any much experiment on it
ping localhost -n 4 >nul
echo.
echo So if you gyzz are interested In helping me in making this section
ping localhost -n 5 >nul
echo.
echo Contact me on Whatsapp from this Toolkit 
ping localhost -n 4 >nul
echo.
echo I hope you will help me :) THANK YOU
ping localhost -n 4 >nul
echo.
echo.
echo I: Returning to MAINMENU
ping localhost -n 3 >nul
goto RESTART
:developersection
cls
echo  ===================================================================================
echo  This section is for App/Program/Device Fixes and Developer Tools.
echo.
echo  FIX SUPERUSER/SUPERSU - Toolkit will attempt to extract the superuser.apk file from
echo  the root zip file in the Root folder and if successful it will then be installed.
echo  You can then run the app [Superuser or SuperSU] from the apps list/bar and follow
echo  any prompts if given to make sure you are rooted properly.
echo.
echo  FIX BOOT LOOP AFTER FLASHING ROM - If you have flashed a Rom via Sp flashtool for
echo  might any reason to unbrick your phone, want to experience some new Custom Rom or
echo  anyreason. Then After flashing you will experience some thing weird startup, like
echo  letters are flooting, i.e boot loop.
echo  We will simply fix it by using simple adb command. Note that ADB drivers are 
echo  properly Installed on your pc. Phone must be connected to pc via USB debugging.
echo.
echo  CACHERIPPER -Is a tool written by Adam Lange. It takes a cache.img file and unpacks
echo  the cache inside it to widely readable and reusable zip file. In blink of an eye
echo  you can have a cache file which you can read/modify and FLASH WITH CWM as it 
echo  contains all things needed to flash (including scripts).
echo  ===================================================================================
echo.
echo  DEVELOPER TOOLS [ALL OPTIONS REQUIRE ADB MODE]
echo  ----------------------------------------------
echo.
echo  1.  Fix Superuser/SuperSU stopped message or app missing after rooting  [ADB MODE]
echo.
echo  2.  Fix boot loop after Flashing Rom via SP TOOL                        [ADB MODE]
echo.
echo  3.  Cache Ripper [by Adam Lange]
echo.
echo  4.  Replace Kinguser with Supersu                                          [GUIDE]
echo.
echo  5.  Deodexer Tool (A Tool Helped you in deodexing rom and apps)           [PLUGIN]
echo.
echo  6.  Flash Zip Without Recovery                                     [APP] + [GUIDE]
echo.
echo  7.  Remove Factory Text after Rooting with Magisk                 [NOTE 5] + [MAX]
echo.&echo.
echo  x.  Back to Main Menu
echo.
echo  ===================================================================================
echo.
SET /P developerselection=[*] Make your choice:- 
set developerselection="%developerselection%"
echo.
IF %developerselection%=="1" (goto fixsupersu)
IF %developerselection%=="2" (goto fixbootloop)
IF %developerselection%=="3" (goto cacheimgripper)
IF %developerselection%=="4" (goto rks)
IF %developerselection%=="5" (goto dexdex)
IF %developerselection%=="6" (goto zipw)
IF %developerselection%=="7" (goto remm)
IF %developerselection%=="x" (goto RESTART)
IF %developerselection%=="X" (goto RESTART)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
set developersection=Gragdhd
goto developersection
:remm
cls
ping localhost -n 1 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  CONNECT YOUR PHONE TO PC AND CHECK IF ADB IS WORKING OR NOT, DO NOT PANIC NOTHING
ECHO  TO BE WORRIED, WE WILL FIX IT. IF WE FIND SOME ERRORS WE WILL IMMEDIATELY INFORM 
ECHO  YOU.
echo  Make sure you insert your cable into proper port of the toolkit. So that adb will be
echo  detected by the toolkit.
echo  -----------------------------------------------------------------------------------
ECHO.
pause
echo.
echo  Waiting for Device...
adb wait-for-device
echo.
echo  Gaining Root Access... (magisk) (Accept any onscreen events)
adb shell magisk su -c exit
echo.
echo  Removing...
adb shell su -c audioelectric start
adb shell su -c audioelectricsetDM
echo.
ping localhost -n 2 >nul
echo  Rebooting Device...
adb reboot
echo.
echo  Done.. Now it should have been removed...
echo.
pause
goto developersection
:zipw
cls
echo  ===================================================================================
echo  INSTRUCTIONS :
echo.
echo   A Superb Development Done by Androguide.fr (XDA)
echo   An App Which Lets you to Flash Zips without Custom recovery%
echo.
echo   Original Post : https://forum.xda-developers.com/showthread.php?t=2250555
echo.
echo   HOW THIS WORKS ?
echo.
echo   All Recovery flashable codes are written in updater-script as we know, What this
echo   app does, it reads each line by line code in updater-script and convert them into
echo   their native bash commands then run it from terminal with root permissions.
echo.
echo   WHAT HAS BEEN FLASHED AND TESTED ?
echo.
echo   * Magisk on Coolpad NOTE 3   -- Working
echo   * SuperSU on Coolpad NOTE 3  -- Working (NOT BETA)
echo   * Xposed on Coolpad NOTE 3   -- Not Tested
echo   * Dolby on Coolpad NOTE 3    -- Working
echo   
echo   NOTE :- DO not Flash ROMS or it might brick your device
echo.
echo   CONNECT YOUR PHONE TO PC, USB DEBUGGING MODE SHOULD BE Enabled.
ECHO   YOUR DEVICE MUST BE Rooted
ECHO. 
echo  ===================================================================================
echo.
set /p Flash=[*] Do you want to Install this app (y/n) : 
if %Flash%==Y goto zipw1
if %Flash%==y goto zipw1
goto RESTART
:zipw1
echo.
echo  Waiting for Device...
adb wait-for-device
echo.
echo  Installing App...
adb install -r tools\FlashGordon.apk
echo.
echo  Launching App...
ping localhost -n 1 >nul
adb shell am start -n com.androguide.recovery.emulator/com.androguide.recovery.emulator.Main
echo.
echo  Done...
echo.
pause
goto developersection
:dexdex
cls
ping localhost -n 2 >nul
if not exist Plugins\Deodexer.exe (goto callporterr1)
echo.
echo Launching Tool..
ping localhost -n 1 >nul
cd Plugins
start Deodexer.exe
ping localhost -n 2 >nul
cd "%~dp0"
goto developersection
:callporterr1
echo.
echo You need to Download the Plugin for using it..
ping localhost -n 3 >nul
echo.
echo Download it from Toolkit Settings..
ping localhost -n 3 >nul
goto developersection
:rks
cls
ping localhost -n 2 >nul
set TEST=dkdj
cls
echo  ===================================================================================
echo  STEPS TO REPLACE KINGUSER WITH SUPERSU
echo  --------------------------------------
echo  Step 1: Use option 1 to push ZIP File to your internal storage ^& Extract the zip
echo          there.
echo          Install Terminal app for Android from store ^& extract the zip and after 
echo          extracting the zip file, transfer the Extracted Folder ^- MRW to outermost
echo          directory in the internal storage.
echo  Step 2: Open Terminal Android App ^& Write the Following commands in the Android 
echo          Terminal.
echo          Open the terminal android app type the command "SU" in the terminal, after
echo          writing the SU in terminal, you will be prompted with the message box 
echo          asking you to deny/grant the functions. Granting permission will help you 
echo          remove the kinguser on your smartphone.
echo.
echo  "Su"
echo.
echo  After granting permissions you will have to type one single line of code, The other
echo  command will be:
echo.
echo  "sh /sdcard/mrw/root.sh"
echo.
echo  After writing the above command, it might show some error, but ignore that error,it
echo  will automatically launch SuperSU, in case it doesn’t manually open SuperSU.
echo.
echo  Once done,Restart your smartphone and you will see that SuperSU works flawlessly on
echo  your Smartphone. That’s all, you’ve successfully replaced KingRoot’s KingUser with 
echo  Chainfire’s SuperSU.
echo  ===================================================================================
echo.
echo  OPTIONS : :
echo  -------
echo.
echo  1. Push the zip to the internal Storage                                  [ADB MODE]
echo.
echo  2. Return to DEVELOPERS Menu
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A Choice:- 
if %TEST%==2 goto developersection
if %TEST%==1 (
echo.
echo I: WAITING FOR YOUR DEVICE..
adb push root\Root-fix.zip /mnt/sdcard/
echo.
echo I: DONE..
echo.
pause
goto rks
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto rks
:cacheimgripper
cls
echo  ===================================================================================
echo  You need to copy the cache.img file that you want to work with to the INPUT folder
echo  in the ToolKit before starting.The ToolKit will then detect it is present and pass
echo  it to CacheRipper to extract to a CWM compatable zip file that can easily be read
echo  and modified. You will even be given a script file to flash it back via CWM.
echo.
echo  This will NOT work with Direct Dumped images from a device. The Cache.img file
echo  needs to be from a Stock Firmware or built with Android SDK.
echo  ===================================================================================
echo.
pause
echo.
IF NOT EXIST INPUT\cache.img (
echo I: Cache.img file not found in the INPUT folder
ping -n 4 127.0.0.1 >nul
echo.
echo  Please copy the file to the INPUT folder and type r to try again
ping -n 2 127.0.0.1 >nul
goto cacheimgrippernofile
)
goto startcacheimgripper1
:cacheimgrippernofile
echo.
SET /P confirmselection=[*] Make a choice: Try again[r] Back to Main Menu[x]?
set confirmselection="%confirmselection%"
echo.
IF /I %confirmselection%=="r" (goto cacheimgripper)
IF /I %confirmselection%=="x" (goto developersection)
goto cacheimgrippernofile
:startcacheimgripper1
echo.
set returntome05=goto startcacheimgripper2
echo I: Cache.img file found in INPUT folder
ping -n 3 127.0.0.1 >nul
echo.
SET /P confirmselection=[*] Are you ready to continue? [Y]es or [N]o:- 
set confirmselection="%confirmselection%"
echo.
IF /I %confirmselection%=="y" (goto setdatetimestampsorted)
IF /I %confirmselection%=="Y" (goto setdatetimestampsorted)
IF /I %confirmselection%=="n" (goto developersection)
IF /I %confirmselection%=="N" (goto developersection)
goto cacheimgripper
:startcacheimgripper2
SET cacheripperoutput=OUTPUT\Cache_%datetimestampsorted%.zip
ping -n 3 127.0.0.1 >nul
tools\CacheRipper.exe INPUT\cache.img %cacheripperoutput%
echo.
echo I: File saved as %cacheripperoutput%
ping -n 3 127.0.0.1 >nul
echo.
pause
goto developersection
:fixbootloop
echo.
ping -n 3 127.0.0.1 >nul
echo  -----------------------------------------------------------------------------------
echo  CONNECT YOUR PHONE TO PC AND CHECK IF ADB IS WORKING OR NOT, DO NOT PANIC NOTHING
ECHO  TO BE WORRIED, WE WILL FIX IT. IF WE FIND SOME ERRORS WE WILL IMMEDIATELY INFORM 
ECHO  YOU.
echo  Make sure you insert your cable into proper port of the toolkit. So that adb will be
echo  detected by the toolkit.
echo  -----------------------------------------------------------------------------------
ECHO.
ECHO  PRESS ENTER && pause>nul
echo.
echo I: Waiting for ADB MODE..
adb wait-for-device
echo.
echo I: Fixing BOOTLOOP at Startup..
ping -n 3 127.0.0.1 >nul
adb shell fctest system reboot
echo I: Done..
echo.
ping -n 2 127.0.0.1 >nul
echo Your device will reboot normally..
ping -n 2 127.0.0.1 >nul
echo.
pause
goto developersection
:fixsupersu
set setroot=Grabage
cls
echo  ===================================================================================
echo  The easiest way to fix this problem is by reinstalling the superuser apk file. The
echo  Toolkit will attempt to extract the superuser.apk file from the root zip file in
echo  the Root folder and if successful it will then be installed. You can then run the
echo  app [Superuser or SuperSU] from the apps list and follow any prompts given to make
echo  sure you are rooted properly.
echo.
echo  In some cases you will not see SuperSU/Superuser after rooting in your application
echo  list. You can enable it by going to Settings, Apps, Swipe at the top to the 
echo  DISABLED APPS tab and Enable SuperSU/Superuser app.
echo.
echo  NOTE: This is not required on all devices and you will only need to do it if you
echo  get a warning message that Superuser/SuperSU has stopped or you do not see the app
echo  after you have rooted.
echo  ===================================================================================
echo.
echo  1. SuperSU Beta by Chainfire
echo.
echo  2. SuperSU by Chainfire
echo.
echo  3. Superuser by Clockworkmod
echo.&echo.
echo  4. Back to Main Menu
echo.
echo  ===================================================================================
echo.
SET /P setroot=[*] Choose which method you used to root:- 
if %setroot%==1 goto fixsuperuserstopped1
if %setroot%==2 goto fixsuperuserstopped1
if %setroot%==3 goto fixsuperuserstopped1
if %setroot%==4 goto developersection
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto fixsupersu
:superuserapknotextracted
echo.
echo I: File not found
ping -n 3 127.0.0.1 >nul
echo.
echo  If you can open the root zip file in the Root folder and extract Superuser.apk to
echo  the Root folder then run this procedure again and it should carry on.
ping -n 4 127.0.0.1 >nul
echo.
rmdir temp /s /q
md temp
echo Press any key to return to the Main Menu..&pause >nul
echo.
goto fixsupersu
:fixsuperuserstopped1
ping -n 3 127.0.0.1 >nul
echo I: Extracting root files..
IF %setrootmethodchoice%=="1" (
set supersu=BETA-SuperSU.zip
tools\7za.exe e -y -otemp root\%supersu%
goto fixsuperuserstopped2
)
IF %setrootmethodchoice%=="2" (
set supersu=SuperSU.zip
tools\7za.exe e -y -otemp root\%supersu% >nul
goto fixsuperuserstopped2
)
IF %setrootmethodchoice%=="3" (
set supersu=SuperuserCwm.zip
tools\7za.exe e -y -otemp root\%supersu% >nul
goto fixsuperuserstopped2
)
goto fixsupersu
:fixsuperuserstopped2
IF EXIST temp\Superuser.apk (
copy temp\Superuser.apk root\Superuser.apk >nul
IF errorlevel 1 (goto superuserapknotextracted)
goto fixsuperuserstopped2a
)
goto superuserapknotextracted
:fixsuperuserstopped2a
echo.
ping -n 3 127.0.0.1 >nul
echo I: Superuser.apk file extracted successfully
ping -n 3 127.0.0.1 >nul
rmdir temp /s /q
md temp
echo.
goto fixsuperuserstopped3
:fixsuperuserstopped3
IF NOT EXIST root\Superuser.apk (goto superuserapknotextracted)
echo I: Installing Superuser.apk to your device..
echo.
ping -n 4 127.0.0.1 >nul
echo  If the install process takes longer than expected, press the power button on your
echo  device and unlock it [if the lock screen is enabled] to check adb is enabled and if
echo  any on screen actions need to be taken.
echo.
ping -n 6 127.0.0.1 >nul
echo I: Waiting for ADB mode..
adb wait-for-device
adb install -r "root\Superuser.apk"
IF errorlevel 1 (goto error1)
IF EXIST root\Superuser.apk (del root\Superuser.apk /F /Q)
echo.
echo  RUN THE APP [SUPERUSER OR SUPERSU] FROM THE APPS LIST TO CHECK IT IS WORKING
echo  PROPERLY AND FOLLOW ANY PROMPTS IF GIVEN. 
ping -n 4 127.0.0.1 >nul
echo.
echo I: Done..
echo. && pause >nul
echo.
goto fixsupersu
:ers
cls
ping localhost -n 2 >nul
set TEST=Djdem
echo  ===================================================================================
echo  ROM PORTING Tools Contains some high quality of Plugins you can download and use it
echo.
echo  Now maybe You can guess that you know what is system.img file. If not read it.
echo.
echo  SYSTEM.IMG is a file includes some packages and some lib file.It's the Android file 
echo  system, which means all the support files that Android needs, the applications, but 
echo  also the framework, the Dalvik VM, initialization scripts and so on.
echo.
echo  WHY SYSTEM.IMG File ONLY?
echo  -------------------------
echo  This is very good question who frame it is great (actually I did :)). The answer is 
echo  basically I don't know, yeah really I search on web but they don't give reason as 
echo  well just show how to extract, repack it.Hahaha,i am joking actually we choose most
echo  of time system.img file coz it contain some android apps, framework files, davlik 
echo  data and so on. 
echo  People edit it for might many reasons like removing bloatware apps, fix some scripts 
echo  in it and optimize dalvik cache, etc. 
echo  Many people tend to edit some apps in System image but mostly can't because they 
echo  might be odexed. As the example of our MARSHMALLOW rom, we can't do that coz it is
echo  odexed.
echo.
echo  FOR THIS THING TO BE WORK YOU NEED JAVA JDK TO BE INSTALLED AND ALSO PYTHON TO BE 
ECHO  CONFIGURE. NOW WHEN I SAY PYTHON TO BE CONFIGURE MEANS NOT ONLY INSTALLING IT BUT
ECHO  ALSO TO BE CONFIGURE IT IN SYSTEM VARIABLES.
ECHO  DON'T WORRY IN THE NEW SETUPS FROM 3.xx IT HAS BEEN SET TO AUTO MODE.
ECHO.
ECHO  Make sure you have your system.img file. Dont copy it to any folder because it might
echo  take much time because its size is very big, you just need to drag it and it will be
echo  extracted into a new folder present in the "Project" directory.
echo.
echo  ===================================================================================
echo.
echo  OPTIONS : : 
echo  -------
echo.
echo  1. Extract the System.img file    
rem echo.
echo  2. Rebuild the extracted System.img folder  
rem echo.
echo  3. Rom Porting Tools                                                       [PLUGIN]
rem echo.
echo  4. All in One Extractor Tool (for ROM Porting)                             [PLUGIN]
rem echo.
echo  5. Build Prop Tweaker (For Auto-Modfiying Build Prop)                      [PLUGIN]
echo.
echo  x. Return to Mainmenu
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make a Choice:- 
if %TEST%==1 goto extractsystem
if %TEST%==2 goto rebuildsystem
if %TEST%==3 goto callport
if %TEST%==4 goto callport1
if %TEST%==5 goto callport2
if %TEST%==x goto Restart
if %TEST%==X goto Restart
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto ers
:callport2
cls
ping localhost -n 2 >nul
if not exist Plugins\Build-Prop\Prop-Tweaker.exe (goto callporterr)
echo.
echo  Launching Tool..
ping localhost -n 1 >nul
cd Plugins\Build-Prop
start Prop-Tweaker.exe
ping localhost -n 2 >nul
cd "%~dp0"
goto ers
:callport1
cls
ping localhost -n 2 >nul
echo.
echo  Its a Plugin, Download it from Plugin Options in Toolkit Settings
echo.
pause
goto ers
:callport
cls
ping localhost -n 2 >nul
if not exist Plugins\Rom-Porter\ROM-PORTER.bat (goto callporterr)
echo.
echo  Launching Script as New Window..
ping localhost -n 1 >nul
cd Plugins\Rom-Porter
start ROM-PORTER.bat
ping localhost -n 2 >nul
cd "%~dp0"
goto ers
:callporterr
echo.
echo  You need to Download the Plugin for using it..
ping localhost -n 3 >nul
echo.
echo  Download it from Toolkit Settings..
ping localhost -n 3 >nul
goto ers
:rebuildsystem
echo.
cd "%~dp0"
ping localhost -n 2 >nul
SET /P ASK=[*] DO you want to add or Change Size Image [Y]es or [N]o:- 
if %ASK%==Y goto rebuildsystem1
if %ASK%==y goto rebuildsystem1
if %ASK%==n goto rebuildsystemfinal
if %ASK%==N goto rebuildsystemfinal
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
cls
goto rebuildsystem
:rebuildsystem1
echo.
ping localhost -n 2 >nul
SET /P temp_size:- [*] Enter Size in bytes:- 
echo.
ping localhost -n 3 >nul
cls
ping localhost -n 2 >nul
echo.
echo I: Rebuilding Image..
tools\make_ext4fs.exe -T 0 -S temp\file_contexts -l %temp_size% -a temp\system.new.img Project\system-raw\
ping localhost -n 2 >nul
ext2simg temp\system.new.img OUTPUT\system.img
ping localhost -n 3 >nul
echo.
echo I: Done..
ping localhost -n 2 >nul
echo.
echo Your img is saved in OUTPUT folder..
ping localhost -n 3 >nul
echo.
pause
goto ers
:extractsystem
cd "%~dp0"
echo.
ping localhost -n 2 >nul
SET /P img=[*] Drag your system.img file here:- 
ping localhost -n 2 >nul
if not exist %img% (echo. && echo The file you selected is not valid.. && pause && goto ers)
echo.
echo I: Gathering your Image..
ping localhost -n 3 >nul
echo I: GENERATING a raw file..
ping localhost -n 2 >nul
tools\simg2img.exe %img% temp\System.raw.img
ping localhost -n 3 >nul
echo I: EXTRACTING contents..
ping localhost -n 2 >nul
tools\Imgextractor.exe temp\system.raw.img Project\system-raw
ping localhost -n 2 >nul
echo.
echo I: Done..
ping localhost -n 2 >nul
echo.
echo Just look in "Project" directory..
ping localhost -n 3 >nul
echo.
pause
goto ers
:logcatfunctions
ping localhost -n 2 >nul
set lbselection=djeidj
set dumplcselection=GARBAGE
cls
echo  ===================================================================================
echo  LogCat is the Android logging system to help debug problems on your device. It logs
echo  various applications and portions of the system which can then be viewed as text.
echo.
echo  BugReport captures your firmware build versions, memory and cpu info, the system 
echo  log [logcat], system properties, service states and much more.
echo.
echo  All this captured information can be very useful if you are having a problem with 
echo  your device and the developer requests your logcat or just for your own use.
echo  ===================================================================================
echo.&echo.
echo  OPTIONS
echo  -------
echo.
echo  1.  Dump LogCat text file to your PC
echo.
echo  2.  View LogCat text file on your PC
echo.
echo  3.  Clear LogCat file on your device
echo.
echo  4.  Dump BugReport text file to your PC
echo.
echo  5.  View BugReport text file on your PC
echo.
echo.
echo  6.  Back to Main Menu
echo.
echo  ===================================================================================
echo.
SET /P lbselection=[*] Make your choice:- 
set lbselection="%lbselection%"
echo.&echo.
IF %lbselection%=="1" (goto dltf)
IF %lbselection%=="2" (goto viewlogcat)
IF %lbselection%=="3" (goto clearlogcat)
IF %lbselection%=="4" (goto dumpbugreport)
IF %lbselection%=="5" (goto viewlogcat)
IF %lbselection%=="6" (goto RESTART)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto logcatfunctions
:dumpbugreport
echo  ===================================================================================
echo  This will dump all information from the device that should be included in a bug
echo  report such as firmware build versions, memory and cpu info, the system log 
echo  [logcat], system properties, service states and much more.
echo  ===================================================================================
echo.
SET /P dumpbrcchoice=[*] Do you want to output a BugReport now? Type y[yes] or n[no]:
set dumpbrcchoice="%dumpbrcchoice%"
echo.
IF %dumpbrcchoice%=="y" (goto setdatetimestampsorted)
IF %dumpbrcchoice%=="yes" (goto setdatetimestampsorted)
IF %dumpbrcchoice%=="n" (goto logcatfunctions)
IF %dumpbrcchoice%=="no" (goto logcatfunctions)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
cls
echo.
goto dumpbugreport
:startdumpbugreport
set reportfile=backups\%DEVICE%\BugReport_%datetimestampsorted%.txt
echo I: Waiting for Device
echo.
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: GENERATING: %reportfile%
adb bugreport > %reportfile%
set maxbytesize=10000
FOR /F "usebackq" %%A IN ('%reportfile%') DO set bugreportsize=%%~zA
IF %bugreportsize% LSS %maxbytesize% (
echo.&echo Process failed. The created file is Empty..
ping -n 4 127.0.0.1 >nul
echo.&echo BugReport.apk may not be included on your Rom
ping -n 4 127.0.0.1 >nul
echo.&echo I: Returning to Previous Menu
ping -n 4 127.0.0.1 >nul
goto logcatfunctions
) ELSE (
ping -n 3 127.0.0.1 >nul
echo.&echo I: Generated Default BugReport
ping -n 3 127.0.0.1 >nul
echo.
goto viewlogcatfileyesno
)
goto viewlogcatfileyesno
:clearlogcat
echo  ===================================================================================
echo  LogCat can get pretty large very quickly so you may want to clear it every once in 
echo  a while You can do this very easily.
echo  ===================================================================================
echo.
SET /P clearlcchoice=[*] Do you want to Clear the LogCat file? Type y[yes] or n[no]:
set clearlcchoice="%clearlcchoice%"
echo.
IF /I %clearlcchoice%=="y" (goto startclearlogcatfile)
IF /I %clearlcchoice%=="yes" (goto startclearlogcatfile)
echo I: Returning to Previous Menu
echo.
ping -n 3 127.0.0.1 >nul
goto logcatfunctions
:startclearlogcatfile
echo I: Waiting for Device
echo.
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Clearing LogCat file now
adb logcat -c
ping -n 3 127.0.0.1 >nul
echo.&echo I: LogCat file Cleared
ping -n 3 127.0.0.1 >nul
echo.
goto logcatfunctions
:viewlogcat
cd "%~dp0"
cls
echo  ===================================================================================
echo  This will View any LogCat\Bugreport text file that you created.
echo.
echo  YOU MUST ENTER CORRECT NUMBER OF THE LOG FILE, ELSE THIS WILL NOT WORK
echo.
echo  Type "x" at the file input prompt to return to the LogCat Menu.
echo  ===================================================================================
echo.
echo  LIST OF LOGCAT FILES AVAILABLE TO VIEW
echo  --------------------------------------
echo.
set /A count=0
FOR %%F IN (backups/%DEVICE%/*.txt) DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo  !count!. %%F )
echo.
if /I !count! GTR 10 (echo  !count!. %%F )
)
echo.
echo.
set /P selectfile=[*] Enter the logcat.txt Number:- 
if %selectfile%==x goto logcatfunctions
if %selectfile%==X goto logcatfunctions
if /I %selectfile% GTR !count! (goto chc211)
if /I %selectfile% LSS 1 (goto chc211)
set logcattxtfile=!a%selectfile%!
set jar=0
set ext=jar
IF "!logcattxtfile:%ext%=!" NEQ "%logcattxtfile%" set jar=1
ping -n 3 127.0.0.1 >nul
START "LogCat" backups\%DEVICE%\%logcattxtfile%
ping -n 3 127.0.0.1 >nul
goto logcatfunctions
:chc211
set logcattxtfile=None
goto logcatfunctions
:dltf
cls
echo  ===================================================================================
echo  The default LogCat output will dump all logs to a text file.
echo.
echo  The filtered output will dump a LogCat based on the priority you choose. Every 
echo  Android log message has a tag and a priority associated with it so with this option
echo  you will only output what you want to see to reduce the log output to a manageable
echo  level.
echo.
echo  The Android logging system keeps multiple circular buffers for log messages, and 
echo  not all of the log messages are sent to the default circular buffer. To see 
echo  additional log messages you can select the alternative LogCat output, to request 
echo  viewing of an alternate circular buffer.
echo  ===================================================================================
echo.&echo.
echo  OPTIONS
echo  -------
echo.
echo  1.  Dump a default [full] LogCat text file to your PC
echo.
echo  2.  Dump a filtered [by priority] LogCat text file to your PC
echo.
echo  3.  Dump an alternative [by buffer] LogCat text file to your PC
echo.&echo.
echo  4.  Back to Main Menu
echo.
echo  ===================================================================================
echo.
SET /P dumplcselection=[*] Make your choice:- 
set dumplcselection="%dumplcselection%"
echo.
IF %dumplcselection%=="1" (goto dumpdefaultlogcat)
IF %dumplcselection%=="2" (goto dumpfilteredlogcat)
IF %dumplcselection%=="3" (goto dumplogcatbuffer)
IF %dumplcselection%=="4" (goto logcatfunctions)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto dltf

:dumplogcatbuffer
cls
echo  ===================================================================================
echo  This will dump an alternative LogCat from the circular buffer you choose. You can 
echo  view any of these alternate buffers:
echo.
echo  Radio  = View the buffer that contains radio/telephony related messages
echo  Events = View the buffer containing events-related messages
echo  Main   = View the main log buffer (default)
echo.
echo  The file will be date/time stamped for future reference.
echo  ===================================================================================
echo.&echo.
echo  OPTIONS
echo  -------
echo.
echo  1.  Dump the Radio buffer LogCat text file to your PC
echo.
echo  2.  Dump the Events buffer LogCat text file to your PC
echo.
echo  3.  Dump the Main buffer LogCat text file to your PC
echo.&echo.
echo  4.  Back to LogCat Menu
echo.
echo  ===================================================================================
echo.
SET /P dumpblcselection=[*] Make your choice:-
set dumpblcselection="%dumpblcselection%"
echo.
IF %dumpblcselection%=="1" (
set buffertext=radio
set buffersetting=Radio
goto startdumpbufferlogcat
)
IF %dumpblcselection%=="2" (
set buffertext=events
set buffersetting=Events
goto startdumpbufferlogcat
)
IF %dumpblcselection%=="3" (
set buffertext=main
set buffersetting=Main
goto startdumpbufferlogcat
)
IF %dumpblcselection%=="4" (goto dltf)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto dumplogcatbuffer

:startdumpbufferlogcat
echo I: Waiting for Device
echo.
adb wait-for-device
ping -n 2 127.0.0.1 >nul
goto setdatetimestampsorted
:startdumplogcatbuffer
set reportfile=backups\%DEVICE%\LogCat_Buffer_%buffersetting%_%datetimestampsorted%.txt
echo I: GENERATING: %reportfile%
adb logcat -d -b %buffertext% > %reportfile%
ping -n 3 127.0.0.1 >nul
echo.&echo I: Generated alternative LogCat buffer
ping -n 3 127.0.0.1 >nul
echo.
goto viewlogcatfileyesno
:dumpfilteredlogcat
cls
echo  ===================================================================================
echo  This will dump a LogCat text file which is filtered by priority to reduce the log 
echo  output to a manageable level. The priority is one of the following character values
echo  ordered from lowest to highest priority:
echo.
echo  V = Verbose (lowest priority)
echo  D = Debug
echo  I = Info (default priority)
echo  W = Warning
echo  E = Error
echo  F = Fatal
echo  S = Silent (highest priority, on which nothing is ever printed)
echo.
echo  The file will be date/time stamped for future reference.
echo  ===================================================================================
echo.&echo.
SET /P dumpflcchoice=[*] Which priority do you want to filter [v, d, i, w, e, f, s]?
set dumpflcchoice="%dumpflcchoice%"
echo.
IF %dumpflcchoice%=="v" (
set prioritysetting=Verbose
goto startdumpfilteredlogcat
)
IF %dumpflcchoice%=="d" (
set prioritysetting=Debug
goto startdumpfilteredlogcat
)
IF %dumpflcchoice%=="i" (
set prioritysetting=Info
goto startdumpfilteredlogcat
)
IF %dumpflcchoice%=="w" (
set prioritysetting=Warning
goto startdumpfilteredlogcat
)
IF %dumpflcchoice%=="e" (
set prioritysetting=Error
goto startdumpfilteredlogcat
)
IF %dumpflcchoice%=="f" (
set prioritysetting=Fatal
goto startdumpfilteredlogcat
)
IF %dumpflcchoice%=="s" (
set prioritysetting=Silent
goto startdumpfilteredlogcat
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto dumpfilteredlogcat
:startdumpfilteredlogcat
echo I: Waiting for Device
echo.
adb wait-for-device
ping -n 2 127.0.0.1 >nul
goto setdatetimestampsorted
:startdumpfilteredlogcat2
set reportfile=backups\%DEVICE%\LogCat_Filtered_%prioritysetting%_%datetimestampsorted%.txt
echo I: GENERATING: %reportfile%
adb logcat -d *:%dumpflcchoice% > %reportfile%
ping -n 3 127.0.0.1 >nul
echo.&echo I: Generated Filtered LogCat
ping -n 3 127.0.0.1 >nul
echo.
goto viewlogcatfileyesno
:dumpdefaultlogcat
echo  ===================================================================================
echo  This will dump a default LogCat text file to the backups folder. The file will be 
echo  date/time stamped for future reference.
echo  ===================================================================================
echo.
SET /P dumpdlcchoice=[*] Do you want to continue? Type y[yes] or n[no]:
set dumpdlcchoice="%dumpdlcchoice%"
echo.
IF /I %dumpdlcchoice%=="y" (goto startdumpdlc)
IF /I %dumpdlcchoice%=="yes" (goto startdumpdlc)
goto dltf
:startdumpdlc
echo I: Waiting for Device
echo.
adb wait-for-device
ping -n 2 127.0.0.1 >nul
goto setdatetimestampsorted
:startdumpdefaultlogcat
set reportfile=backups\%DEVICE%\LogCat_Default_%datetimestampsorted%.txt
echo I: GENERATING: %reportfile%
adb logcat -d > %reportfile%
ping -n 2 127.0.0.1 >nul
echo.&echo I: Generated Default LogCat
ping -n 3 127.0.0.1 >nul
echo.
goto viewlogcatfileyesno
:viewlogcatfileyesno
SET /P viewlcchoice=[*] Do you want to view the LogCat file now? Type y[yes] or n[no]:
set viewlcchoice="%viewlcchoice%"
echo.
IF /I %viewlcchoice%=="y" (goto viewlogcatfile)
IF /I %viewlcchoice%=="yes" (goto viewlogcatfile)
echo I: Returning to Previous Menu
echo.
ping -n 5 127.0.0.1 >nul
goto logcatfunctions
:viewlogcatfile
START "LogCat" %reportfile%
ping -n 5 127.0.0.1 >nul
goto logcatfunctions
:permi
set perminput=GARBAGE
set selectpermfilechoose=GARBAGE
set perminput=GARBAGE
cls
echo  ===================================================================================
echo  YOU NEED TO BE IN ANDROID AND HAVE ROOTED YOUR DEVICE FOR ADB TO WORK. MAYBE YOU 
ECHO  NEED TO HAVE ADB INSECURE TO BE EXIST, IF YOU DON't KNOW ABOUT IT. SEARCH IT IN 
ECHO  DEVICE MODS.
echo.
echo  File Permissions on Android via ADB Shell look something like drwxrwxrwx
echo.
echo  The First character defines the Directory (d), Link (l) or Binary (b).
echo.
echo  The next 9 characters define the file permissions.
echo  These permissions are given in groups of 3 each.
echo.
echo  The first 3 characters are the permissions for the owner of the file or directory.
echo  Example: -rwx------
echo.
echo  The next 3 characters are permissions for the group that the file is owned by.
echo  Example: ----rwx---
echo.
echo  The final 3 define the access permissions for everyone not part of the group.
echo  Example: -------rwx
echo.
echo  There are 3 possible attributes that make up file access permissions.
echo.
echo  r - Read permission. Whether the file may be read.
echo  w - Write permission. Whether the file may be written to or modified.
echo  x - Execute permission. Whether the file may be executed.
echo.
echo  In addition to the file permission, you can also modify the owner and group of the 
echo  file. You need to be the owner of a file or have root to do this.
echo.
echo  Setting permissions of 644 for build.prop for example = -rw-r--r--
echo.
echo  Chmod Guide: 0 - --- , 1 - --x , 2 - -w- , 3 - -wx
echo              4 - r-- , 5 - r-x , 6 - rw- , 7 - rwx
echo.
echo  There are other settings but you should only use them if you know what you are doing
echo  or have the exact chmod values for that file or you could harm your system.
echo  ===================================================================================
echo.
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC ^& Drivers are properly installed
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
pause
echo.
echo I: Waiting for ADB mode..
adb wait-for-device
adb shell su -c exit
IF errorlevel 1 (goto error1)
ping -n 7 127.0.0.1 >nul
adb shell mount -o rw,remount /system /system
IF errorlevel 1 (goto error1)
ping -n 2 127.0.0.1 >nul
echo.
SET /P selectpermfilechoose=Type the path and filename you want to set:
echo.
echo The permissions are currently set to:
adb shell ls -l %selectpermfilechoose%
IF errorlevel 1 (goto error1)
echo.
SET /P perminput=What permissions would you like to give this file?
echo.
adb shell chmod %perminput% %selectpermfilechoose%
IF errorlevel 1 (goto error1)
echo I: Setting Permissions
echo.
echo The files permissions are now set to:
adb shell ls -l %selectpermfilechoose%
echo.
SET /P anotherpermfile=[*] Do you want to set another files Permissions? Type y[yes] or n[no]:
set anotherpermfile="%anotherpermfile%"
echo.
IF %anotherpermfile%=="y" (goto permi)
IF %anotherpermfile%=="yes" (goto permi)
goto RESTART
:pullfile
cls
set TEST=enkef
echo  ===================================================================================
echo  This will allow you to pull any file or folder from your device via adb.
echo.
echo  For files type the full path of the file you want to pull: eg. /sdcard/file.zip
echo. 
echo  Files will be copied to "pulled-files-are-put-here" folder.
echo.
echo  For folders type the full path of the folder you want to pull:
echo  eg. /sdcard/clockworkmod/backup/2013-01-22.10.56/ [remembering the / at the end]
echo.
echo  This will NOT pull files from protected folders such as /system/apps/
echo.
echo  IMPORTANT: YOUR DEVICE MUST BE IN ADB MODE [WITH USB DEBUGGING ENABLED] USING AN
echo  INSECURE BOOT IMAGE FOR THIS TO WORK.
echo.
echo  IMPORTANT: CERTAIN FOLDERS NEED adb shell su -c exit ACCESS TO PULL A FILE FROM THAT LOCATION.
echo  THE ROOT FOLDER / and INTERNAL STORAGE /sdcard/ ARE NOT PROTECTED AND FILES/FOLDERS
echo  CAN BE PULLED FROM THERE WITHOUT NEEDING TO FLASH AN INSECURE BOOT IMAGE FIRST.
echo  ===================================================================================
echo.
echo  OPTIONS : :
echo  -------
echo.
echo  1. Pull Files via Toolkit                                                [ADB MODE]
echo.
echo  2. Launch Windows explorer to Copy files
echo.
echo  3. Return to MAINMENU
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A Decision:- 
if %TEST%==1 goto pullfile1
if %TEST%==2 goto pullfile2
if %TEST%==3 goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto pullfile
:pullfile2
START explorer.exe
IF errorlevel 1 (goto error1)
ping -n 2 127.0.0.1 >nul
goto pullfile
:pullfile1
echo.
ping -n 2 127.0.0.1 >nul
echo  From Where do you want to Pull files?
echo  Type the full path, eg. /mnt/sdcard/DCIM/Image1.png, /system/app/Launcher.apk,etc
echo.
echo  You can also Pull folders for eg /mnt/sdcard/DCIM , /system/ , /data/app/
echo.
SET /P file=[*] Enter a Path:- 
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
echo I: Waiting for ADB mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo.
echo I: Pulling Files from %path1%
ping -n 2 127.0.0.1 >nul
adb pull %file% "pulled-files-are-put-here"
echo.
ping -n 2 127.0.0.1 >nul
echo I: Done..
ping -n 2 127.0.0.1 >nul
echo.
pause
goto pullfile
:pushfile
cd "%~dp0"
del temp\* /Q
set pushpath=cnkdne
set push1=
set push2=
set ppt=kefjj
cls
SET INPUT=dwdjkdj
echo  ===================================================================================
echo  This will allow you to push any file to your device via adb.
echo.
echo  PLEASE MAKE SURE THE FILE IS CORRECT FOR YOUR DEVICE BEFORE PUSHING IT
echo.
echo  This will be an Advanced Pusher file to your phone.. You can select options from
echo  below to push file to internal storage or external storage or can launch windows
echo  Explorer to copy files between phone to PC.
echo.
echo  IMPORTANT: CERTAIN FOLDERS ARE PROTECTED ^& NEED adb shell su -c exit ACCESS TO PUSH A FILE TO
echo  THAT LOCATION. THE INTERNAL STORAGE /SDCARD/ IS NOT PROTECTED AND FILES CAN BE
echo  PUSHED THERE WITHOUT FLASHING AN INSECURE BOOT IMAGE FIRST [UNLESS ON LOLLIPOP].
echo  ===================================================================================
echo.
echo  OPTIONS : :
echo  -------
echo.
echo  1. Push Files via Toolkit Advanced menus                                 [ADB MODE]
echo.
echo  2. Launch Windows explorer to Copy files
echo.
echo  3. Return to MAINMENU
echo.
echo  ===================================================================================
echo.
SET /P INPUT=[*] Make a Choice:- 
if %INPUT%==1 goto Pushfile1
if %INPUT%==2 goto pushfile2
if %INPUT%==3 goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto pushfile
:pushfile2
START explorer.exe
IF errorlevel 1 (goto error1)
ping -n 2 127.0.0.1 >nul
goto pushfile
:Pushfile1
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
echo I: Waiting for ADB mode..
adb wait-for-device
echo.
ping localhost -n 2 >nul
SET /P TEST=[*] Do you want to push single file [s] or multiple file [m]:- 
if %TEST%==S goto pushsingle
if %TEST%==s goto pushsingle
if %TEST%==m goto pushmultiple
if %TEST%==M goto pushmultiple
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
cls
goto pushfile1
:pushmultiple
cd "%~dp0"
ping localhost -n 2 >nul
echo.
echo  Copy all your files in "put-file-to-push-here" folder..
echo.
pause
if not exist "put-file-to-push-here\*" (
echo. 
echo  No files found within put-file-to-push-here folder.. 
pause
goto pushfile
)
ping localhost -n 3 >nul
echo.
set File=put-file-to-push-here
echo.
goto question1
:pushsingle
ping localhost -n 2 >nul
echo.
SET /P File=[*] Drag your file here for pushing:- 
ping localhost -n 2 >nul
if not exist %File% (
echo.
echo  The file you selected is not valid.. 
pause
goto RESTART
)
echo.
ping localhost -n 3 >nul
:question1
echo  Where you want to push the file?
echo.
echo  1. Internal Storage (sdcard)
echo  2. External Storage (sdcard1)
echo  3. Custom Directory (system or data) [ADB INSECURE]
echo.
echo  4. Return to Previous MAINMENU
echo.
SET /P ASK1=[*] Make a Choice:- 
if %ASK1%==3 goto pushcus
if %ASK1%==4 goto pushfile
if %ASK1%==1 (
set push1=sdcard
goto question2
)
if %ASK1%==2 (
set push1=sdcard2
goto question2
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
cls
echo.
goto question1
ping localhost -n 3 >nul
:question2
echo.
SET /P ASK2=[*] DO you want to Push it into some further directory [Y]es or [N]o:- 
if %ASK2%==y goto question3
if %ASK2%==Y goto question3
if %ASK2%==n goto finalpushfile
if %ASK2%==N goto finalpushfile
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
cls
goto question2
:question3
if exist temp\test.bat del temp\test.bat /Q
ping localhost -n 3 >nul
echo.
echo I: Printing some further directory.. 
ping localhost -n 2 >nul
echo adb shell >> temp\test.bat
echo cd %push1% >> temp\test.bat
echo ls >> temp\test.bat
echo exit >> temp\test.bat
adb shell < temp\test.bat >> temp\files.txt
ping localhost -n 2 >nul
start temp\files.txt
echo.
SET /P push2=[*] Enter Any Folder name from the list:- 
ping localhost -n 3 >nul
echo.
goto finalpushfile
:finalpushfile
cls
echo.
ping localhost -n 2 >nul
echo You have set following path..
echo.
if %ppt%==host (echo %pushpath%) else (echo  /%push1%/%push2%/)
echo.
SET /P ASK4=[*] DO you want to continue [Y]es or [N]o:- 
if %ASK4%==y goto finalpushfile1
if %ASK4%==Y goto finalpushfile1
if %ASK4%==n goto pushfile
if %ASK4%==N goto pushfile
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
cls
goto finalpushfile
:finalpushfile1
echo.
echo I: Checking your device..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Pushing Files..
if %ppt%==host (adb push "%File%" %pushpath%) else (adb push %File% /mnt/%push1%/%push2%/)
ping localhost -n 3 >nul
echo.
echo I: Done..
ping localhost -n 2 >nul
echo.
pause
goto pushfile
:pushcus
echo.
ping localhost -n 3 >nul
echo  Where do you want to copy it to on your device?
echo  Type the full path, eg. /data/media/, /system/, /system/app/
echo.
SET /P pushpath=[*] Enter the path:- 
set ppt=host
ping localhost -n 2 >nul
adb shell su -c exit
IF errorlevel 1 goto error1
ping -n 4 127.0.0.1 >nul
adb shell mount -o rw,remount /system /system
IF errorlevel 1 goto error1
ping -n 2 127.0.0.1 >nul
goto finalpushfile
:installapk
set TEST=GARBAGE
set apk=hwdh
cls
echo  ===================================================================================
echo  This will allow you to install a single apk or multiple apks to your device via adb.
echo.
echo  The apk files need to be in the 
echo  "put-apks-to-install-here" folder
echo  so they can be detected by the Toolkit for installation.
echo.
echo  OPTION 1 will install single apk just by draging it onto the screen.
echo.
echo  OPTION 2 will Install multiple apk Present in "put-apks-to-install-here" folder.
echo.
echo  If the install process takes longer than expected, press the power button on your
echo  device and unlock it [if the lock screen is enabled] to check adb is enabled and if
echo  any on screen actions need to be taken.
echo.
echo  YOU NEED TO BE BOOTED INTO ANDROID, HAVE DRIVERS INSTALLED AND HAVE ADB DEBUGGING
echo  ENABLED FOR ADB TO WORK.
echo.
echo  ===================================================================================
echo.
echo  OPTIONS : :
echo  -------
echo.
echo  1. Install Single apk                                                    [ADB MODE]
echo.
echo  2. Install Multiple apks in "put-apks-to-install-here" folder            [ADB MODE]
echo.
echo  3. Return to MAINMENU
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A choice:- 
if %TEST%==1 goto installapk1
if %TEST%==2 goto installapk2
if %TEST%==3 goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto installapk
:installapk2
cd "%~dp0"
echo.
ping localhost -n 2 >nul
echo  Copy all you apk in "put-apks-to-install-here" folder..
echo.
pause
ping localhost -n 2 >nul
echo.
if not exist "put-apks-to-install-here\*.apk" (echo. && echo  No apk Found withing "put-apks-to-install-here" folder.. && pause && goto installapk)
echo I: Waiting for ADB mode..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Installing apks..
adb install -r "put-apks-to-install-here\*.apk"
ping localhost -n 2 >nul
echo.
echo I: Done..
echo.
ping localhost -n 2 >nul
pause
goto installapk
:installapk1
cls
cd "%~dp0"
echo.
echo  You can press "x" to RETURN to previous screen
ping localhost -n 2 >nul
echo.
echo.
SET /P apk=[*] Drag an apk Here:- 
if %apk%==X goto installapk
if %apk%==x goto installapk
ping localhost -n 2 >nul
if not exist "%apk%" (echo. && echo The apk you selected is not valid.. && pause && goto installapk)
echo.
echo I: Waiting for ADB mode..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Installing apk..
adb install -r "%apk%"
ping localhost -n 2 >nul
echo.
echo I: Done..
echo.
ping localhost -n 2 >nul
pause
goto installapk
:xposedfe
if %DEVICE%==Basic (goto xposederror1)
if %DEVICE%==CPN5 (goto Deviceerror)
if %DEVICE%==CPNMAX goto earlybuild
:xposed
:xposedclr
cls
cd "%~dp0"
if not exist root\xposed-v86-sdk22-arm64.zip  (goto error3)
if not exist root\xposed-v86-sdk23-arm64.zip  (goto error3)
if not exist root\xposed-uninstaller-20160829-arm64.zip  (goto error3)
set error2=echo Some Files are missing..
SET TEST=dejdo
echo  ===================================================================================
echo  This will Install Xposed Framwork on %MODEL% 
echo  [NEW METHOD VERY FAST AND NO LOOPS]
call tools\ctext.exe 0b " This Option is verified properly"
echo.
echo.
echo  WHAT IS XPOSED FRAMEWORK?
echo  -------------------------
echo  Xposed framework is a groundbreaking development that lets you do just that. Its 
echo  easy to install and configure, and already has a plethora of modules available that
echo  bring functionality to your device that otherwise requires flashing a custom ROM or 
echo  mod from recovery.
echo  Xposed is a base system that allows you to download modules, each of which can make
echo  one or more changes to the UI of your device. Things like adding the three dot menu
echo  to every app, or enabling the full 13MP sensor for Superior Auto in Android cameras,
echo  or any manner of changes. 
echo.
echo  OPTION 1 will Install Xposed apk in your phone via ADB MODE and the sideload an
echo  Framework zip file via Custom Recovery so that Xposed will be perfectly install.
echo.
echo  OPTION 2 is an manuall installation that is we will install xposed apk via ADB mode
echo  and push the framework zip file into your phone for manually flashing through 
echo  Custom recovery. Help screen will be showed in the due time.
echo.
echo  NOTE:- IN THE PREVIOUS UPDATES THERE MIGHT CAUSE BOOTLOOP WHILE INSTALLING XPOSED
ECHO  ------ BUT NOW I HAVE FIXED SOME XPOSED ZIPS AND NOW NO BOOTLOOP WILL OCCUR WHILE
ECHO  INSTALLING XPOSED. BECAME VERY SAFE.
ECHO.
ECHO  Make sure drivers are properly Installed, Phone is Connected to PC, via USB Cable
echo  USB Debugging mode is ON. ALSO YOUR phone must be ROOTED. If not then you can ^&
echo  proceed to do it with my toolkit.
echo  CUSTOM RECOVERY like TWRP, CWM, Philz must be installed for this to be work.
echo.
echo  ===================================================================================
echo.
echo  OPTIONS : :
echo  -------
echo.
if %DEVICE%==CPN3D (
echo  1. Install Xposed Framework App                                 [KitKat + ADB Mode]
echo.
echo  2. Uninstall Module
) else (
echo  1. Install Xposed Framework                                   [LOLLIPOP + ADB MODE]
echo  2. Install Xposed Framework                                [MARSHMALLOW + ADB MODE]
echo  3. Install Xposed Framework Manually                             [LOLLIPOP + GUIDE]
echo  4. Install Xposed Framework Manually                          [MARSHMALLOW + GUIDE]
echo  5. Show help screen for Flashing Xposed zip file 
echo  6. Uninstall Xposed Module
)
echo.
echo  x. Return to MAINMENU
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A choice:- 
if %TEST%==6 goto Uninstallxposed
if %TEST%==x goto RESTART
if %TEST%==X goto RESTART

if %TEST%==5 (goto beforexposed3)

if %TEST%==4 (
set module1=xposed-v86-sdk23-arm64.zip 
set returntome01=goto xposed4
goto xposed1
)

if %TEST%==3 (
set module1=xposed-v86-sdk22-arm64.zip 
set returntome01=goto xposed4
goto xposed1
)

if %TEST%==2 (
if %DEVICE%==CPN3D goto noticekit2
set module1=xposed-v86-sdk23-arm64.zip 
set module2=Xposed_Installer_1.apk
goto xposed1
)

if %TEST%==1 (
if %DEVICE%==CPN3D goto noticekit
set module1=xposed-v86-sdk22-arm64.zip 
set module2=Xposed_Installer_1.apk
goto xposed1
)

echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto xposed
:noticekit2
cd "%~dp0"
cls
echo.
echo  ===================================================================================
echo  TO Uninstall Xposed App Follow this:
echo.
echo  1. Open Xposed Installer App
echo  2. Click on Uninstall Modules
echo  3. Reboot
echo.
echo  ===================================================================================
echo.
pause
goto xposed
:noticekit
cd "%~dp0"
cls
echo.
echo  ===================================================================================
echo  INSTRUCTIONS :
echo.
echo  TO install XPOSED on KitKat Devices are So Simple, Just Install Xposed App On it
echo  and click on Install Button, thats it..
echo.
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  Phone is Booted into Android. Your phone must be ROOTED.
echo  ===================================================================================
echo.
pause
echo.
echo  Waiting For Device...
adb wait-for-device
echo.
echo  Installing App...
adb install -r tools\Xposed_Installer.apk
if errorlevel 1 (call tools\ctext.exe 0a "Failed...")
echo.
echo  Done...
echo.
pause
goto xposed
:Uninstallxposed
cls
ping localhost -n 2 >nul
echo.
echo Select a Method to Work?
echo.
echo  1. Sideloading Uninstaller [For Custom roms]
echo  2. Uninstall via TWRP Tweaks :) [For Stock Roms or some Custom Roms]
echo.
echo x. Cancel All The process
echo.
SET /P ASK10=[*] Choose:- 
if %ASK10%==1 (goto uxposed1)
if %ASK10%==2 (goto uxposednew)
if %ASK10%==x (goto xposed)
if %ASK10%==X (goto xposed)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto xposed
:uxposednew
cls
echo.
echo.
ping localhost -n 3 >nul
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  Phone is Booted into Android. Custom Recovery like TWRP, CWM should be present
echo  Your phone must be ROOTED.
echo  -----------------------------------------------------------------------------------
echo.
ping localhost -n 2 >nul
echo Just press Any Key
echo.
pause
echo.
ping localhost -n 2 >nul
echo  Waiting for adb mode..
adb wait-for-device
echo.
echo  Grant Root Access..
adb shell su -c exit
echo.
adb push root\xposed-uninstaller-20160829-arm64.zip /sdcard/
ping localhost -n 3 >nul
echo.
echo  Initializing Scripts..
ping localhost -n 2 >nul
adb shell < tools\_toolkitflash4.cf
echo.
ping localhost -n 2 >nul
echo.
echo  Done..
echo.
ping localhost -n 2 >nul
echo Now wait and watch :)
ping localhost -n 2 >nul
echo.
pause
goto RESTART
:uxposed1
cls
ping localhost -n 3 >nul
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed
echo  If not then head to Driver Installation section in my toolkit.
echo  Phone is Booted into Android. Custom Recovery like TWRP, CWM should be present
echo  Your phone must be ROOTED.
echo  -----------------------------------------------------------------------------------
echo.
ping localhost -n 2 >nul
echo Just press Any Key
echo.
pause
echo.
ping localhost -n 2 >nul
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Rebooting to RECOVERY..
adb reboot recovery
ping localhost -n 7 >nul
echo.
echo.
echo  ===================================================================================
echo  Now you need to select Sideloading Option for flashing Xposed framework zip file..
echo.
echo  FOR TWRP Recovery 
echo  -----------------
echo  1. Select Option "Advanced" and then "ADB Sideload"
echo  2. Swipe to Right to Start Sideloading
echo.
echo  FOR CWM Recovery 
echo  ----------------
echo  1. Use Volume Keys to scroll up and down and power button to select.
echo  2. From there choose Option "Install zip from Sideload"
echo.
echo  FOR PHILZ Recovery ... I don't know. :( if you then contact me from the toolkit.
echo.
echo  IF you want to cancel all this and reboot your phone to normal just hold power 
echo  button for 15 sec your device will boot in android.
echo.
echo  If everything is set, Press ENTER
echo  ===================================================================================
echo.
pause
echo.
ping localhost -n 2 >nul
echo I: Uninstalling Xposed..
ping localhost -n 2 >nul
echo I: Sideloading uninstaller zip..
ping localhost -n 2 >nul
adb sideload root\xposed-uninstaller-20160829-arm64.zip
ping localhost -n 4 >nul
echo I: REBOOTING to Android..
adb reboot
ping localhost -n 4 >nul
echo I: Done..
ping localhost -n 6 >nul
echo.
echo  If does not reboot, Reboot your phone manually..:)
ping localhost -n 4 >nul
goto xposed
:beforexposed3
cls
cls
ping localhost -n 2 >nul
echo.
echo Select your device to work with
echo.
echo 1. Lollipop
echo 2. Marshmallow
echo.
SET /P ASK=[*] Choose:- 

if %ASK%==1 (
set module1=xposed-v86-sdk22-arm64.zip 
set zip1=_toolkitflash2
set module2=Xposed_Installer_1.apk
goto beforexposed4
)

if %ASK%==2 (
set module1=xposed-v86-sdk23-arm64.zip 
set zip1=_toolkitflash3
set module2=Xposed_Installer_1.apk
goto beforexposed4
)

echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto xposed
:beforexposed4
cls
ping localhost -n 2 >nul
echo.
echo  Select a Method to Work?
echo.
echo  1. Sideloading Xposed [For Custom roms]
echo  2. TWRP Tweaks :) [For Stock Roms and some Custom Roms]
echo.
echo  x. Cancel All The process
echo.
SET /P ASK10=[*] Choose:- 
if %ASK10%==1 (goto xposed1)
if %ASK10%==2 (goto xposednew)
if %ASK10%==x (goto xposed)
if %ASK10%==X (goto xposed)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto xposed
:xposednew
cls
echo.
echo.
ping localhost -n 3 >nul
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  Phone is Booted into Android. Custom Recovery like TWRP, CWM should be present
echo  Your phone must be ROOTED.
echo  -----------------------------------------------------------------------------------
echo.
ping localhost -n 2 >nul
echo Just press Any Key
echo.
pause
echo.
ping localhost -n 2 >nul
echo  Waiting for adb mode..
adb wait-for-device
echo.
echo  Grant Root Access..
adb shell su -c exit
echo.
ping localhost -n 3 >nul
echo.
echo  Installing Xposed apk..
adb push root\xposed-v86-sdk22-arm64.zip /sdcard/
adb push root\xposed-v86-sdk23-arm64.zip /sdcard/
adb install -r "tools\Xposed_Installer_1.apk"
ping localhost -n 2 >nul
echo.
echo  Initializing Scripts..
ping localhost -n 2 >nul
adb shell < tools\%zip1%
echo.
ping localhost -n 2 >nul
echo.
echo Done..
echo.
ping localhost -n 2 >nul
echo  Now wait and watch :)
ping localhost -n 2 >nul
echo.
pause
goto RESTART
:xposed4
echo.
echo.
ping localhost -n 3 >nul
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed
echo  If not then head to Driver Installation section in my toolkit.
echo  Phone is Booted into Android. Custom Recovery like TWRP, CWM should be present
echo  Your phone must be ROOTED.
echo  -----------------------------------------------------------------------------------
echo.
ping localhost -n 2 >nul
echo Just press Any Key
echo.
pause
echo.
ping localhost -n 2 >nul
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Installing Xposed apk..
adb install -r "tools\Xposed_Installer.apk"
ping localhost -n 2 >nul
echo  DONT OPEN IT..
ping localhost -n 3 >nul
echo I: Pushing Xposed framework zip..
adb push root\%module1% /mnt/sdcard/
ping localhost -n 2 >nul
echo I: Rebooting to Custom RECOVERY..
adb reboot recovery
ping localhost -n 4 >nul
echo.
echo Here is the help screen how to do it..
ping localhost -n 3 >nul
:xposed3
cls
echo  ===================================================================================
echo  You need to manually Flash Xposed Framework zip file..
echo.
echo  ENSURE YOU MUST WIPE CACHE / DALVIK CACHE BEFORE DOING THIS STUFF FROM YOUR 
echo  CUSTOM RECOVERY
echo.
echo  FLASHING ZIP VIA TWRP Recovery
echo  ------------------------------
echo     NOTE:- YOU MUST HAVE TWRP RECOVERY, ELSE THIS WILL NOT WORK. IF YOU DO NOT HAVE
ECHO     ------ IT THEN FLASH A TWRP OR BOOT INTO TWRP FROM THE TOOLKIT.
ECHO  1. Once you booted into TWRP, Click on "Install" and browse for the directory 
echo     /sdcard/%module1%
echo  2. Select the zip file and a new window will popup to say to confirm the flash.
echo     Confirm it by swiping the button to the right from below.
echo  3. Once Installation is complete reboot your system.
echo.
echo  FLASHING ZIP VIA CWM Recovery
echo -----------------------------
echo     NOTE:- YOU MUST HAVE CWM RECOVERY, ELSE THIS WILL NOT WORK. IF YOU DO NOT HAVE
ECHO     ------ IT THEN FLASH A CWM OR BOOT INTO CWM FROM THE TOOLKIT.
ECHO  1. Once you booted into TWRP, Select "Install zip from sdcard". Scroll down to the
echo     %module2% file 
echo  2. Now Confirm the installation by Selecting "YES" - Install xxxxx.zip
echo  3. Once Installation is complete reboot your system.
echo.
echo.
ECHO  NOTE:- I DONT KNOW ABOUT PHILZ RECOVERY, BECAUSE I HAVENT TRIED IT. IF YOU HAVE
ECHO  ------ PHILZ RECOVERY INSTALLED THEN CONTACT ME FROM THE TOOLKIT.
echo.
echo  If everything is Done.. you can press Enter..
echo  ===================================================================================
ECHO.
pause
goto xposed
:xposed1
cls
cd "%~dp0"
echo.
ping localhost -n 2 >nul
echo I: Checking Required files..
ping localhost -n 2 >nul
if exist root\%module1% (set b1=Present) else (Set b1=Error)
if exist tools\%module2% (set b2=Present) else (Set b2=Error)
ping localhost -n 3 >nul
echo.
echo  Xposed Framework zip : %b1%
ping localhost -n 3 >nul
echo.
echo  Xposed apk           : %b2%
ping localhost -n 3 >nul
if %b1%==Error goto error1
if %b2%==Error goto error1
ping localhost -n 2 >nul
echo.
echo Files Present Proceeding to Sequence..
ping localhost -n 2 >nul
cls
%returntome01%
echo.
echo.
ping localhost -n 4 >nul
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC ^& Drivers are properly installed
echo  If not then head to Driver Installation section in my toolkit.
echo  Phone is Booted into Android. Custom Recovery like TWRP, CWM should be present
echo  Your phone must be ROOTED.
echo  -----------------------------------------------------------------------------------
echo.
ping localhost -n 2 >nul
echo Just press Any Key
echo.
pause
echo.
ping localhost -n 2 >nul
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Installing Xposed apk..
adb install -r "tools\%module2%"
ping localhost -n 2 >nul
echo I: Rebooting to RECOVERY..
adb reboot recovery
ping localhost -n 4 >nul
echo.
echo.
echo  ===================================================================================
echo  Now you need to select Sideloading Option for flashing Xposed framework zip file..
echo.
echo  FOR TWRP Recovery 
echo  -----------------
echo  1. Select Option "Advanced" and then "ADB Sideload"
echo  2. Swipe to Right to Start Sideloading
echo.
echo  FOR CWM Recovery 
echo  ----------------
echo  1. Use Volume Keys to scroll up and down and power button to select.
echo  2. From there choose Option "Install zip from Sideload"
echo.
echo  FOR PHILZ Recovery ... I don't know. :( if you then contact me from the toolkit.
echo.
echo  IF you want to cancel all this and reboot your phone to normal just hold power 
echo  button for 15 sec your device will boot in android.
echo.
echo  If everything is set, Press ENTER
echo  ===================================================================================
echo.
pause
echo.
ping localhost -n 2 >nul
echo I: Updating Android..
ping localhost -n 2 >nul
echo I: Sideloading xposed zip..
ping localhost -n 2 >nul
adb sideload root\%module1%
ping localhost -n 2 >nul
echo I: REBOOTING to Android..
adb reboot
ping localhost -n 4 >nul
echo I: Done..
ping localhost -n 2 >nul
echo.
echo  If does not reboot, Reboot your phone manually..:)
ping localhost -n 4 >nul
call tools\msg.bat
goto xposed
:sidez
cls
SET TEST=Gsug
echo  ===================================================================================
echo.
echo  OPTION 1 will push the zip file to the device, the reboot to Custom Recovery where
echo  you can flash file manually.
echo.
echo  OPTION 2 will reboot the device to custom Recovery the sideload the zip file from 
echo  there. This may be work on stock recovery also.
echo.
echo  NOTE: Some versions of TWRP [2.8 on] have problems with sideloading zip files. If
echo  you select sideload method and it fails or the root app gives an error when you
echo  open it then choose the push method. If not sure just choose the push method.
echo.
echo  ===================================================================================
echo.
echo  INSTALL ZIP FLASH CHOICE
echo  ------------------------
echo.
echo  1.  Push zip to device and reboot to custom recovery to flash manually  [ADB Mode]
echo.
echo  2.  Install zip file directly via adb sideload feature in Recovery      [ADB Mode]
echo.
echo  3. Install zip file directly via some TWRP TWEAKS :)                 [recommended]
echo.
echo  x.  Back to Main Menu
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A Choice:- 
if %TEST%==3 (
set returntome10=goto push3
goto push2
)

if %TEST%==1 goto push1
if %TEST%==2 goto push2
if %TEST%==x goto RESTART
if %TEST%==X goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto sidez
:push3
cls
echo.
ping localhost -n 3 >nul
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
ping localhost -n 2 >nul
echo  Just press Any Key
echo.
pause
echo.
echo  Waiting for adb mode..
adb wait-for-device
echo.
echo  Grant Root Access..
adb shell su -c exit
echo.
echo  Creating Scripts..
if exist temp\tmp.flash (del temp\tmp.flash /Q)
ping localhost -n 2 >nul
echo su >> temp\tmp.flash
echo echo 'boot-recovery ' ^> /cache/recovery/command >> temp\tmp.flash
echo echo '--update_package=/sdcard/%current%' ^>^> /cache/recovery/command >> temp\tmp.flash
echo reboot recovery >> temp\tmp.flash
echo exit >> temp\tmp.flash
echo exit >> temp\tmp.flash
echo exit >> temp\tmp.flash
adb push INPUT\%current% /sdcard/
ping localhost -n 3 >nul
echo.
echo  Launching Script..
ping localhost -n 3 >nul
start adb shell < temp\tmp.flash
ping localhost -n 2 >nul
echo.
echo  Done..
echo.
ping localhost -n 2 >nul
echo  Now wait and watch :)
ping localhost -n 2 >nul
echo.
pause
goto RESTART
:push2
cd "%~dp0"
echo.
ping localhost -n 2 >nul
echo  Copy your .zip file into "INPUT" folder of this directory for sideloading
echo.
pause
cls
echo.
echo  Select the .zip file for Sideloading
echo  Press x to return
cls
set /A count=0
FOR %%F IN ("INPUT/*.zip") DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo  !count!. %%F )
echo.
if /I !count! GTR 10 (echo  !count!. %%F )
)
echo.
echo.
set /P INPUT=[*] Enter the .zip Number:- 
if %INPUT%==x goto sidez
if %INPUT%==X goto sidez
if /I %INPUT% GTR !count! (goto chc21)
if /I %INPUT% LSS 1 (goto chc21)
set current=!a%INPUT%!
set jar=0
set ext=jar
IF "!current:%ext%=!" NEQ "%current%" set jar=1
goto push14
:chc21
set current=None
goto sidez
:push14
set cuspath=INPUT\%current%
%returntome10%
goto decesionmaker2

:: WAS A SHIT
echo.
ping localhost -n 4 >nul
echo  -----------------------------------------------------------------------------------
echo Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
ping localhost -n 2 >nul
echo Just press Any Key
echo.
pause
echo.
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Rebooting to RECOVERY..
adb reboot recovery
ping localhost -n 4 >nul
echo.
echo.
echo  ===================================================================================
echo Now you need to select Sideloading Option
echo.
ECHO IF YOU SEE A DEAD ANDROID MODE WHILE REBOOTING TO RECOVERY, THEN HOLD YOUR POWER 
ECHO BUTTON AND VOLUME UP KEY FOR 6-7 SEC THEN RELEASE IT QUICKLY TO QUITE DEAD ANDROID 
ECHO MODE.
echo.
echo  FOR STOCK Recovery
echo  ------------------
echo  1. Use Volume Keys to scroll up and down and power button to select.
echo  2. From there choose option "Apply update from adb"
echo.
echo  FOR TWRP Recovery 
echo  -----------------
echo  1. Select Option "Advanced" and then "ADB Sideload"
echo  2. Swipe to Right to Start Sideloading
echo.
echo  FOR CWM Recovery 
echo  ----------------
echo  1. Use Volume Keys to scroll up and down and power button to select.
echo  2. From there choose Option "Install zip from Sideload"
echo.
echo IF you want to cancel all this and reboot your phone to normal just hold power 
echo button for 15 sec your device will boot in android.
echo.
echo  If everything is set, Press ENTER
echo  ===================================================================================
echo.
pause
echo.
ping localhost -n 2 >nul
echo I: Updating Android..
ping localhost -n 2 >nul
echo I: Sideloading %current%..
ping localhost -n 2 >nul
adb sideload "INPUT\%current%"
ping localhost -n 2 >nul
echo I: REBOOTING to Android..
adb reboot
ping localhost -n 4 >nul
echo I: Done..
ping localhost -n 2 >nul
echo.
echo  If does not reboot, Reboot your phone manually..:)
ping localhost -n 2 >nul
echo.
pause
goto sidez
:push1
cd "%~dp0"
echo.
ping localhost -n 2 >nul
echo  Copy your .zip file into "INPUT" folder of this directory for sideloading
echo.
pause
:push13
cls
echo.
echo Select the .zip file
echo Press x to return
cls
set /A count=0
FOR %%F IN ("INPUT/*.zip") DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo  !count!. %%F )
echo.
if /I !count! GTR 10 (echo  !count!. %%F )
)
echo.
echo.
set /P INPUT=[*] Enter the .zip Number:- 
if %INPUT%==x goto sidez
if %INPUT%==X goto sidez
if /I %INPUT% GTR !count! (goto chc21)
if /I %INPUT% LSS 1 (goto chc21)
set current=!a%INPUT%!
set jar=0
set ext=jar
IF "!current:%ext%=!" NEQ "%current%" set jar=1
goto push12
:chc21
set current=None
goto sidez
:push12
cls
SET INPUT=Gsug
echo  ===================================================================================
echo  This will push the file into Phone and reboot your device to Custom Recovery 
echo  if present.
echo.
echo  From there you need to manually flash the file according to the instructions given
echo.
echo  FLASHING ZIP VIA TWRP Recovery
echo  ------------------------------
echo  1. Choose Option #1 from below to push your current .zip file in sdcard.
echo  2. Choose Option #2 from below to boot into TWRP.
echo      NOTE:- YOU MUST HAVE TWRP RECOVERY, ELSE THIS WILL NOT WORK. IF YOU DO NOT HAVE
ECHO      ------ IT THEN FLASH A TWRP OR BOOT INTO TWRP FROM THE TOOLKIT.
ECHO  3. Once you booted into TWRP, Click on "Install" and browse for the directory 
echo     /sdcard/%current%
echo  4. Select the zip file and a new window will popup to say to confirm the flash.
echo     Confirm it by swiping the button to the right from below.
echo  5. Once Installation is complete reboot your system.
echo.
echo  FLASHING ZIP VIA CWM Recovery
echo -----------------------------
echo  1. Choose Option #1 from below to push your current .zip file in sdcard.
echo  2. Choose Option #2 from below to boot into CWM.
echo      NOTE:- YOU MUST HAVE CWM RECOVERY, ELSE THIS WILL NOT WORK. IF YOU DO NOT HAVE
ECHO      ------ IT THEN FLASH A CWM OR BOOT INTO CWM FROM THE TOOLKIT.
ECHO  3. Once you booted into TWRP, Select "Install zip from sdcard". Scroll down to the
echo     %current% file 
echo  4. Now Confirm the installation by Selecting "YES" - Install xxxxx.zip
echo  5. Once Installation is complete reboot your system.
echo.
echo.
ECHO  NOTE:- I DONT KNOW ABOUT PHILZ RECOVERY, BECAUSE I HAVENT TRIED IT. IF YOU HAVE
ECHO  ------ PHILZ RECOVERY INSTALLED THEN CONTACT ME FROM THE TOOLKIT.
echo  ===================================================================================
ECHO.
ECHO  OPTIONS : :
ECHO  -------
ECHO.
ECHO  1. Push the file to your phone                                           [ADB MODE]
echo.
echo  2. Reboot to Custom Recovery                                             [ADB MODE]
echo.
echo  3. Change your .zip file you selected
echo.
echo  4. Return to Previous MENU
echo.
echo  ===================================================================================
echo.
SET /P INPUT=[*] Make A choice:- 
if %INPUT%==1 goto pushaq
if %INPUT%==3 goto push13
if %INPUT%==4 goto sidez
if %INPUT%==2 (
echo.
echo I: Waiting for adb mode..
echo.
adb wait-for-device
echo I: Rebooting to Custom Recovery..
adb reboot recovery
ping localhost -n 4 >nul
echo.
echo I: Done..
echo.
pause
goto push12
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto push12
:pushaq
echo.
ping localhost -n 4 >nul
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC ^& Drivers are properly installed
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
ping localhost -n 2 >nul
echo Just press Any Key
echo.
pause
echo.
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Pushing %current%..
adb push "INPUT\%current%" /mnt/sdcard/
if errorlevel 1 goto error1
ping -n 2 127.0.0.1 >nul
echo I: Done..
echo.
pause
goto push12
:bootfl
cls
SET ASK=Gsug
echo  ===================================================================================
echo  This will allow you to flash a .img file to your device.
echo.
echo  These will typically be BOOT.IMG, BOOTLOADER.IMG, RADIO.IMG, RECOVERY.IMG
echo.
echo  PLEASE MAKE SURE YOU SELECT THE CORRECT PARTITION TO FLASH YOUR IMAGE TO. IF YOU
echo  FLASH AN IMAGE TO THE WRONG PARTITION THEN YOU CAN DO A LOT OF DAMAGE TO YOUR
echo  DEVICE OR EVEN BRICK IT IF YOU FLASH THE WRONG IMAGE TO THE BOOTLOADER PARTITION.
echo.
echo  YOU CAN SPECIFICALLY CHOOSE FROM THE FOLLOWING, WHETHER TO FLASH IT VIA FASTBOOT OR
ECHO  YOU CAN USE SP FLASH TOOL METHOD. THIS WILL CREATE A SCATTER FILE FOR YOUR IMAGE SO
ECHO  I BETTER GUESS THAT WOULD BE EASY OFTEN. :)
echo.
ECHO  Make sure drivers are properly Installed, Phone is Connected to PC, via USB Cable ^&
echo  USB Debugging mode is ON. ALSO Bootloader needs to be Unlocked. If not then you can
echo  proceed to do it with my toolkit.
echo.
echo  ===================================================================================
echo.
echo  OPTIONS : :
ECHO  -------
ECHO.
echo  1. Flash .img files via Fastboot                                         [FASTBOOT]
echo.
echo  2. Flash .img files via SP flash tool                                    
ECHO.
echo  3. Flash .img files via Toolkit
rem need to code more,,,
ECHO.
echo  x. Return to MAINMENU
ECHO.
echo  ===================================================================================
echo.
SET /P ASK=[*] Make a Choice:- 
if %ASK%==2 goto startfile13
if %ASK%==X goto RESTART
if %ASK%==x goto RESTART
if %ASK%==3 goto flimg
if %ASK%==1 goto startfile12
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto bootfl
:flimg
cls
set opt=grh
echo.
echo  SELECT A PARTITION : And Put your .img file in 'Input' Folder
echo.
echo  1. Recovery
echo  2. Kernel
echo.
echo  x. Return to Previous SCREEN
echo.
echo.
set /P opt=[*] Select a Option : 
if %opt%==1 (set model=recovery && goto startflm)
if %opt%==2 (set model=kernel && goto startflm)
if %opt%==x goto bootfl
if %opt%==X goto bootfl
goto bootfl
:startflm
cls
set modssel=ddjhdj
echo  ===================================================================================
echo  Before you continue, Ensure following things
echo.
echo  YOUR DEVICE MUST BE ROOTED. YOUR .IMG File is in INPUT Folder
echo.
ECHO  You have installed flash_image binary from Mods section (Option #22 > Option #10).
echo  If not do this first.
echo.
echo  USB DEBUGGING MUST BE ENABLED IN SETTINGS, DEVELOPER OPTIONS BEFORE STARTING. 
ECHO  YOUR DEVICE MUST BE IN ANDROID MODE.
echo.
echo  Enter x to go to previous screen, r to refresh menu
echo  ===================================================================================
echo.
echo.
echo  LIST OF IMAGE FILES AVAILABLE TO FLASH
echo  --------------------------------------
echo.
set /A count=0
FOR %%F IN ("INPUT/*.img") DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo  !count!. %%F )
echo.
if /I !count! GTR 10 (echo  !count!. %%F )
)
echo.
echo.
set /P INPUT=[*] Enter the .img Number:- 
if %INPUT% == r goto startflm
if %INPUT% == R goto startflm
if %INPUT%==x goto bootfl
if %INPUT%==X goto bootfl
if /I %INPUT% GTR !count! (goto chc2)
if /I %INPUT% LSS 1 (goto chc2)
set img=!a%INPUT%!
set jar=0
set ext=jar
IF "!img:%ext%=!" NEQ "%img%" set jar=1
goto ch3dc
:chc2
set img=None
goto bootfl
:ch3dc
cls
ping localhost -n 2 >nul
echo.
echo  Waiting for Device...
adb wait-for-device
echo.
echo  Checking Recovery File...
if not exist %img% (call tools\ctext.exe 0a "Failed.."&& echo.)
echo.
echo  Flashing...
adb shell su -c flash_image %model% %img%
if errorlevel 1 (call tools\ctext.exe 0a "Failed.."&& echo.)
echo.
echo  Rebooting...
adb reboot recovery
echo.
echo  Done...
:startfile13
cls
cd "%~dp0"
ping localhost -n 2 >nul
set TEST=Longago
echo  ===================================================================================
echo  This will allow you to flash a .img file to your device.
echo.
echo  These will typically be BOOT.IMG, BOOTLOADER.IMG, RADIO.IMG, RECOVERY.IMG
echo.
echo  THIS WILL CREATE A SCATTER FILE FOR YOUR IMAGE SO I BETTER GUESS THAT WOULD BE EASY 
echo  OFTEN. :)
echo.
echo  Make sure the Image you have choosen must be valid, not corrupted. If you don't know
echo  then Try to extract that .img with this toolkit.
echo.
echo  PLEASE MAKE SURE YOU SELECT THE CORRECT PARTITION TO FLASH YOUR IMAGE TO DEVICE.
echo.
echo  If you do not see your file below then copy it to "INPUT"
echo  and press "r" to refresh the list, or "x" at any point to return to the Main Menu.
echo.
echo  ===================================================================================
echo.
echo  LIST OF IMAGE FILES AVAILABLE TO FLASH
echo  --------------------------------------
echo.
set /A count=0
FOR %%F IN ("INPUT/*.img") DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo  !count!. %%F )
echo.
if /I !count! GTR 10 (echo  !count!. %%F )
)
echo.
echo.
set /P INPUT=[*] Enter the .img Number:- 
if %INPUT% == r goto startfile13
if %INPUT% == R goto startfile13
if %INPUT%==x goto bootfl
if %INPUT%==X goto bootfl
if /I %INPUT% GTR !count! (goto chc2)
if /I %INPUT% LSS 1 (goto chc2)
set img=!a%INPUT%!
set jar=0
set ext=jar
IF "!img:%ext%=!" NEQ "%img%" set jar=1
goto startfile111
:chc2
set img=None
goto bootfl
:startfile111
cls
SET TEST=dbjeh
ping localhost -n 3 >nul
echo Selected Image : %img%
echo.
echo Select a partition type to Flash
echo.
echo  1. Boot
echo  2. Cache
echo  3. Recovery
echo  4. System
echo  5. UserData
echo.
echo  x. Return
echo.
SET /P TEST=[*] Select a partition type to Flash:- 
if %TEST%==x goto bootfl
if %TEST%==X goto bootfl
if %TEST%==1 (
set rena=boot
goto startfile14
)
if %TEST%==2 (
set rena=cache
goto startfile14
)
if %TEST%==3 (
set rena=recovery
goto startfile14
)
if %TEST%==4 (
set rena=system
goto startfile14
)
if %TEST%==5 (
set rena=userdata
goto startfile14
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto startfile111
:startfile14
echo.
cls
cd "%~dp0"
ping localhost -n 2 >nul
echo I: Creating A scatter File..
ping localhost -n 3 >nul
copy tools\scatter_file.txt "INPUT"
echo.
echo.
echo I: Setting .img file for Flashing..
rename "INPUT\%img%" %rena%.img
ping localhost -n 3 >nul1
echo.
echo All SET..
ping localhost -n 3 >nul
echo.
echo.
echo.
echo  ===================================================================================
echo  # Now you can Run SP flash tool from sp_tool directory of this toolkit.
echo  # Set Scatter file and choose path "INPUT\scatter_file.txt"
echo  # Choose The drop down list from "Download Only" or "Whatever" to "FIRMWARE"
ECHO  # Click on "Download" Button from top.
echo.
echo  NOW COMPLETELY SHUTDOWN YOUR PHONE AND CONNECT IT TO PC. Flashing will start soon.
echo  Once reboot your phone, if you find some error restarting, the use 
echo    " adb shell fctest system reboot " command to fix it.
echo.
echo  !!! PLEASE MAKE SURE !!!
ECHO.
ECHO   DO NOT PRESS ENTER UNTIL AND UNLESS FLASHING IS DONE.ONCE DONE,YOU CAN GO BACK TO
ECHO   MAINMENU
ECHO.
echo  ===================================================================================
ECHO.
PAUSE
rename "INPUT\%rena%.img" %img%
del "INPUT\scatter_file.txt" /Q
ping localhost -n 3 >nul
goto RESTART
:startfile12
cls
ping localhost -n 2 >nul
set INPUT=Longago
cd "%~dp0"
echo  ===================================================================================
echo  This will allow you to flash a .img file to your device.
echo.
echo  These will typically be BOOT.IMG, BOOTLOADER.IMG, RADIO.IMG, RECOVERY.IMG
echo.
echo  PLEASE MAKE SURE YOU SELECT THE CORRECT PARTITION TO FLASH YOUR IMAGE TO DEVICE.
echo.
echo  Make sure the Image you have choosen must be valid, not corrupted. If you don't know
echo  then Try to extract that .img with this toolkit.
echo. 
ECHO  Make sure drivers are properly Installed, Phone is Connected to PC, via USB Cable ^&
echo  USB Debugging mode is ON. ALSO Bootloader needs to be Unlocked. If not then you can
echo  proceed to do it with my toolkit.
echo.
echo  If you do not see your file below then copy it to "INPUT"
echo  and press "r" to refresh the list, or "x" at any point to return to the Main Menu.
echo.
echo  ===================================================================================
echo.
echo  LIST OF IMAGE FILES AVAILABLE TO FLASH
echo  --------------------------------------
echo.
set /A count=0
set /A count=0
set /A count=0
set /A count=0
FOR %%F IN ("INPUT/*.img") DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo  !count!. %%F )
echo.
if /I !count! GTR 10 (echo  !count!. %%F )
)
echo.
echo.
set /P INPUT=[*] Enter the .img Number:- 
if %INPUT% == r goto startfile12
if %INPUT% == R goto startfile12
if %INPUT%==x goto bootfl
if %INPUT%==X goto bootfl
if /I %INPUT% GTR !count! (goto chc2)
if /I %INPUT% LSS 1 (goto chc2)
set img=!a%INPUT%!
set jar=0
set ext=jar
IF "!img:%ext%=!" NEQ "%img%" set jar=1
goto startfile
:chc2
set img=None
goto bootfl
:startfile
set TEST=Grabage
ping localhost -n 2 >nul
cls
echo.
echo  Selected File:- %img%
echo.
echo  BOOT FROM IMAGE [TEMPORARY] OR FLASH IT TO YOUR DEVICE [PERMANENT]
echo  -----------------------------------------------------------------
echo.
echo  1. Boot    [Use only with Boot and Recovery Images]
echo  2. Flash   [Flashes to device Permanently]
echo.
echo  3. Back to Previous Menu
echo.
SET /P TEST=Make your choice:
if %TEST%==1 goto startfile1
if %TEST%==2 goto partfile
if %TEST%==3 goto bootfl
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto startfile
:partfile
cls
SET INPUT=dbjeh
ping localhost -n 3 >nul
echo.
echo  Select a partition type to Flash
echo.
echo  1. Boot
echo  2. Cache
echo  3. Recovery
echo  4. System
echo  5. UserData
echo.
echo  x. Return
echo.
SET /P INPUT=[*] Make a Choice:- 
if %INPUT%==x goto startfile
if %INPUT%==X goto startfile
if %INPUT%==1 (
set type=boot
set recovery=%img%
set cuspath=INPUT\%img%
set recovery1=%type%
goto decesionmaker1
)
if %INPUT%==2 (
set type=cache
set recovery=%img%
set cuspath=INPUT\%img%
set recovery1=%type%
goto decesionmaker1
)
if %INPUT%==3 (
set type=recovery
set recovery=%img%
set cuspath=INPUT\%img%
set recovery1=%type%
goto decesionmaker1
)
if %INPUT%==4 (
set type=system
set recovery1=%type%
set recovery=%img%
set cuspath=INPUT\%img%
goto decesionmaker1
)
if %INPUT%==5 (
set type=userdata
set recovery1=%type%
set recovery=%img%
set cuspath=INPUT\%img%
goto decesionmaker1
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto partfile
::partfile1
echo.
ping localhost -n 4 >nul
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC ^& Drivers are properly installed
echo  If not then head to Driver Installation section in my toolkit.
echo  Phone is Properly booted into Android.
echo  -----------------------------------------------------------------------------------
echo.
ping localhost -n 2 >nul
echo  Just press Any Key
echo.
pause
echo.
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Booting to bootloader..
adb reboot bootloader
ping -n 4 127.0.0.1 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  When you see a NOTICE and triangle sign on your phone.. PRESS ENTER
echo  -----------------------------------------------------------------------------------
echo.
pause
echo I: Flashing %img% as %command%
ping -n 2 127.0.0.1 >nul
fastboot -i 0x1EBF flash %command% "INPUT\%img%"
if errorlevel 1 goto error1
ping -n 4 127.0.0.1 >nul
echo I: Flash Done..
fastboot -i 0x1EBF continue
ping -n 6 127.0.0.1 >nul
echo.
echo.
pause
goto RESTART

:: Nothing here...

:startfile1
ping -n 2 127.0.0.1 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC ^& Drivers are properly installed
echo  If not then head to Driver Installation section in my toolkit.
echo  Phone is Properly booted into Android.
echo  -----------------------------------------------------------------------------------
echo.
ping localhost -n 4 >nul
echo Just press Any Key
echo.
pause
echo.
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Booting to bootloader..
adb reboot bootloader
ping -n 4 127.0.0.1 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  When you see a NOTICE and triangle sign on your phone.. PRESS ENTER
echo  -----------------------------------------------------------------------------------
echo.
pause
echo I: Temporary flashing and booting Image %img%..
ping -n 2 127.0.0.1 >nul
fastboot -i 0x1EBF boot "INPUT\%img%"
if errorlevel 1 goto error1
ping -n 4 127.0.0.1 >nul
echo I: Done..
ping -n 4 127.0.0.1 >nul
echo.
echo To exit it just reboot to normal :)
echo.
pause
goto RESTART
:bootcus
if %DEVICE%==Basic (goto Basicerror1)
SET bootmenucus=hdke
cd "%~dp0"
cls
echo  ===================================================================================
echo.
echo  Selected Device : %MODEL%  %DEVICE%
echo.
echo  This will boot into CWM Recovery, Philz_Touch Recovery, TWRP Touch Recovery or
echo  Stock Recovery [useful if you have already flashed a custom recovery] but will not
echo  flash it to your device so your current Recovery will not be overwritten.
echo.
echo  If doing this straight after Unlocking your Bootloader make sure you boot your
echo  device into Android once BEFORE entering Custom Recovery. If you do not boot into
echo  Android first you will get errors and it will not work properly.
echo.
echo  ===================================================================================
echo.
echo  OPTIONS
echo  -------
echo.
if %DEVICE%==CPN3P (
echo  1. Boot to Clockworkmod Recovery - CWM                                   [DISABLED]
) else (
echo  1. Boot to Clockworkmod Recovery - CWM                        [Lollipop] [FASTBOOT]
)
echo.
echo  2. Boot to Teamwin Recovery - TWRP                            [Lollipop] [FASTBOOT]
echo.
if %DEVICE%==CPN3P (
echo  3. Boot to Teamwin Recovery - TWRP                                       [DISABLED]
) else (
echo  3. Boot to Teamwin Recovery - TWRP                         [Marshmallow] [FASTBOOT]
)
echo.
if %DEVICE%==CPN3L (
echo  4. Boot to Philz Recovery                                                [DISABLED]
) 
if %DEVICE%==CPN3P (
echo  4. Boot to Philz Recovery                                                [DISABLED]
) else (
echo  4. Boot to Philz Recovery                                     [Lollipop] [FASTBOOT]
)
echo.
echo  5. Boot to Stock Recovery                       [Lollipop + Marshmallow] [FASTBOOT]
echo.
echo  6. Back to Main Menu
echo.
echo  ===================================================================================
echo.
SET /P bootmenucus=[*] Make a Choice:- 
if %bootmenucus%==6 goto RESTART
if %bootmenucus%==5 goto stockreb

if %bootmenucus%==1 (
set recovery=CWM
set cuspath=recovery\%DEVICE%\recovery-cwm.img
set type=boot
set recovery1=recovery-cwm.img
goto decesionmaker1
)

if %bootmenucus%==2 (
set recovery=TWRP
set cuspath=recovery\%DEVICE%\recovery-twrp.img
set type=boot
set recovery1=recovery-twrp.img
goto decesionmaker1
)

if %bootmenucus%==3 (
set recovery=TWRP-MARSHMALLOW
set cuspath=recovery\%DEVICE%\recovery-twrp-mm.img
set type=boot
set recovery1=recovery-twrp-mm.img
goto decesionmaker1
)

if %bootmenucus%==4 (
set recovery=Philz
set cuspath=recovery\%DEVICE%\recovery-philz.img
set type=boot
set recovery1=recovery-philz.img
goto decesionmaker1
)

echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto bootcus
:stockreb
echo.
echo.
ping -n 2 127.0.0.1 >nul
echo  You are trying to boot into Stock recovery, so first you may need to download your
echo  original stock recovery for your current rom. 
echo  Because of they differ from rom to rom, I have set this option. 
echo.
echo  SO first you may need to download your original stock recovery, to do that just
echo  held to MAINMENU of this toolkit. Choose option 5 says "flash custom recovery"
echo  From the last option you can download your stock recovery.
echo.
echo  Once downloaded : Drag that file to this window..
echo.
SET /P cuspath=[*] Stock recovery here:- 
ping -n 2 127.0.0.1 >nul
if not exist %path1% (echo. && echo  Stock recovery file, not found within the directory you specified.. && pause && goto RESTART)
set recovery=STOCK
set type=boot
goto decesionmaker1

::startpp
ping -n 2 127.0.0.1 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  Phone is Properly booted into Android.
echo  -----------------------------------------------------------------------------------
echo.
echo  Just press Any Key
echo.
pause
echo.
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Booting to bootloader..
adb reboot bootloader
ping -n 4 127.0.0.1 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  When you see a NOTICE and triangle sign on your phone.. PRESS ENTER
echo  -----------------------------------------------------------------------------------
echo.
pause
echo I: Temporary flashing and booting to %recovery%..
ping -n 2 127.0.0.1 >nul
if %path1%==none (fastboot -i 0x1EBF boot recovery\%DEVICE%\%recovery1%) else (fastboot -i 0x1EBF boot %path1%)
ping -n 4 127.0.0.1 >nul
echo I: Done..
ping -n 4 127.0.0.1 >nul
echo.
echo To exit it just reboot to normal :)
echo.
pause
goto bootcus

:: WAS A SHIT


:cusq
set TEST=Garbage
cls
echo  ===================================================================================
echo  You can select between downloading and/or sideloading a Coolpad Custom Rom FIRMWARE
echo  Image or flashing a Coolpad Factory OTA Firmware Image that you have already
echo  downloaded.
echo.
echo  IMPORTANT: YOU CAN SIDELOAD ANY ROM TO OUR COOLPAD DEVICES USING A STOCK, CUSTOM
ECHO  ---------- RECOVERY, BUT MAKE SURE THAT SIDELOADING A CUSTOM ROM VIA STOCK RECOVERY
ECHO  CONSUMES MUCH MORE TIME THAN CUSTOM RECOVERIES LIKE 
echo.
echo  YOUR BOOTLOADER CAN BE LOCKED OR UNLOCKED BUT USB DEBUGGING NEEDS TO BE ENABLED IN
echo  SETTINGS, DEVELOPER OPTIONS AND USB MODE SET TO PTP MODE BEFORE STARTING.
echo  -----------------------------------------------------------------------------------
echo  To Enable USB debugging:
echo  1. Goto Settings, About Phone and tap 5-6 times on the Build Number at the bottom 
echo     to enable the Developer options tab
echo  2. Go to Settings, Developer options and tick USB debugging
echo  3. Unplug/Replug the usb cable
echo.
echo  NOTE: On Android 6 make sure you switch usb mode [pull down top left] from
echo  Charging only to PTP/MTP [normally PTP but whichever gave a connection] to connect.
echo.
echo  ===================================================================================
echo.
echo  OPTIONS
echo  -------
echo.
echo  1. Download Coolpad Custom Roms                                         
echo.
echo  2. Sideload An Custom ROM                              [via Stock, Custom Recovery]
echo.
echo  3. Flash Custom rom via Custom Recovery                    [TWRP,CWM,Philz + Guide]
echo.
echo  4. Back to Mainmenu
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make a Choice:- 
if %TEST%==1 goto dcc
if %TEST%==2 goto fcct
if %TEST%==3 goto fcr
if %TEST%==4 goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto cusq
:dcc
cls
echo  ===================================================================================
echo  WELCOME TO THE DOWNLOAD SECTION OF CUSTOM ROM OF COOLPAD DEVICE
ECHO   ---------------------------------------------------------------
ECHO  So from here you can download your stock rom for %MODEL%
echo.
echo  Below are given links for downloading stock rom for %MODEL%
echo  Make sure you download rom from the given links only, this link are checked by me,
echo  and they all are working and original image for %MODEL%
echo.
echo  -----------------------------------------------------------------------------------
echo  Custom Doesn't need Some special OS to be flashed, it cam be flashed at any instant
echo  SO IF you have 5.1 or 6.0 you can still flash Custom ROM via sideload or recovery
echo  method nothing matters. OK so here are some given links for downloading custom roms
echo  On Coolpad devices.
echo.
echo  For Coolpad Note 3 All Roms -- goo.gl/hvdmxk
echo  (Contains All roms including Coolui 8, ASOP, VETAS)
echo.
echo  For Coolpad Note 3 Lite Rom --
echo  ---------------------------
echo  a. 360 OS    :-  goo.gl/z9Fc25
echo  b. Touch Wiz :-  goo.gl/uxmfNq
echo  c. RR Rom    :-  goo.gl/Xyz7oN (POWERED BY MOHIT http://www.coolpadforums.com/?986)
echo     Bugs:
echo          1. 2nd sim is not working yet
echo.
echo  NOTE THAT THIS ARE IN .RAR AND .ZIP FORMAT AND MAYBE THERE SIZE OCCURS UPTO 2GB.
ECHO  ONCE YOU HAVE DOWNLOADED ROM YOU CAN FLASH IT USING CUSTOM RECOVERY OR CAN USE THIS 
ECHO  TOOLKIT TO FLASH OR SIDELOAD TO FLASH (PREFERABLE).
ECHO  FLASHING RESULT RESULT INTO DATA LOSS SO TAKE A BACKUP OF YOU PHONE FROM THIS TOOL
ECHO  FLASH IT AND THEN RESTORE YOUR BACKUP.
ECHO.
echo  ===================================================================================
echo.
pause
goto cusq
:fcr
cd "%~dp0"
if %DEVICE%==CPN3 (SET MODEL=Coolpad Note 3) else (SET MODEL=Coolpad Note 3 Lite)
cls
SET JUST=ganekeh
echo  ===================================================================================
echo   GUIDE FOR FLASHING CUSTOM ROM VIA CUSTOM RECOVERY
ECHO   ------------------------------------------------
ECHo  NOTE ALL YOUR USER DATA WILL BE FORMATTED BECAUSE THIS WILL OVERWRITE ALL YOUR 
ECHO  SYSTEM FILES. SO BE CAREFULL WHILE FLASHING. YOU CAN USE THIS METHOD TO UNBRICK ANY
ECHO  COOLPAD DEVICES.
echo  1. Download Custom Rom for %MODEL% from the Toolkit.
echo  2. Now Place your Custom Rom .zip file into your sdcard (External storage) of your
echo     phone.
echo  3. Now Boot your phone into Custom Recovery mode, then select Install and choose 
echo     our rom zip to flash. Wait till it completes. 
echo  4. Once done wipe, your cache and data. Then restart your phone.
echo  -----------------------------------------------------------------------------------
echo   BEST PROCEDURE FOR FLASHING CUSTOM ROM VIA CUSTOM RECOVERY
echo  ----------------------------------------------------------
echo  1. First of all take A complete backup of your phone,as you know this will wipe
echo    full phone from the toolkit.
echo  2. Now using this toolkit flash TWRP, CWM,PHILZ any recovery you want. If you have 
echo    done it already you can proceed.
echo  3. Once Custom Recovery is set,then Copy your downloaded Custom rom .zip file in the
echo     "INPUT" directory of the toolkit. Make sure you check the zip, dont extract but
echo    view its internal folder. If you find some folders like "system", "META-INF",then
echo    the .zip you have chosen is correct. Else you need to download other one.
echo  4. Once you have copied it, Select 1 option to push to your phone. This eventually
echo     might take some time.
echo  5. Once done, press 2 to reboot into custom recovery. 
echo  6. Now FOR TWRP:
echo     a. Select Install ^> Install from external_sdcard ^> your_custom_rom.zip
echo        Now a new screen will appear, just select wipe cache, davlik cache then from 
echo        below Swipe Right to start flashing. Once done you can reboot your phone,
echo        after again wiping data,cache.
echo     Now FOR CWM:
echo     a. Select Insall from external_sdcard ^> your_custom_rom.zip ^> YES
echo  7. Patience is must factor needed for this. SO wait, once everything is done. YOU
echo     can Restart your phone
echo  8. At first it will take so much time or nearly much time for first reboot so don't
echo     get panic. 
echo  9. Once you have successfully booted into android. Restore all your files that you
echo     have backed up from this toolkit.
echo     VOILA YOU ARE IN CUSTOM ROM !!!!
echo.
echo  MAKE SURE THAT YOUR DRIVERS ARE PERFECTLY INSTALL TO DETECT ADB MODE, IN YOUR PC. IF
ECHO  NOT GO IN THE DRIVERS SECTION AND INSTALL IT.
echo  ===================================================================================
echo  OPTIONS
echo  -------
echo  1. Push Custom rom .zip to external sdcard                               [ADB MODE]
echo  2. Reboot to Custom Recovery                                             [ADB MODE]
echo  3. Back to Previous Menu
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A choice:- 
if %TEST%==3 goto cusq
if %TEST%==1 goto pucc
if %TEST%==2 (
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
echo  Just press Any Key
echo.
pause
cd "%~dp0"
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Rebooting to custom Recovery..
adb reboot recovery
ping localhost -n 3 >nul
echo I: Done..
echo.
pause
goto fcr
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto fcr
:pucc
cls
echo.
cd "%~dp0"
ping localhost -n 2 >nul
echo Make sure to put your .zip file in "INPUT" folder for Pushing to external_sdcard.
echo Make sure only one zip file should be present within the folder or this will not 
echo work.
echo IF NOT PUSHED, MANUALLY COPY TO EXTERNAL STORAGE OF YOUR PHONE.
echo.
pause
echo.
ping localhost -n 2 >nul
if not exist "INPUT\*.zip" (echo No .zip file found within "INPUT" for Pushing to external_sdcard.. && echo. && pause && goto fcr)
echo.
echo  -----------------------------------------------------------------------------------
echo Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
echo Just press Any Key
echo.
pause
cd "%~dp0"
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Pushing rom to external_sdcard..
echo.
echo GIVE PERMISSION IN YOUR PHONE, IF PROMPT
adb push "INPUT\*.zip" /mnt/sdcard2/
echo I: Done..
echo.
pause
goto fcr
:fcct
echo.
cd "%~dp0"
ping localhost -n 2 >nul
echo Make sure to put your .zip file in "flash-zip-via-sideloading" folder for sideload.
echo Make sure only one zip file should be present within the folder or this will not 
echo work.
echo This method will also work for Sideloading Stock ROM. BUT make sure dont sideload
echo any .zip file there must be some files and folders like META-INF, SYSTEM if this
echo folder contain in your .zip it can be sideloaded.
echo.
pause
echo.
ping localhost -n 2 >nul
if not exist "flash-zip-via-sideloading\*.zip" (echo No .zip file found within "flash-zip-via-sideloading" for Sideloading.. && echo. && pause && goto cusq)
FOR %%F IN (flash-zip-via-sideloading/*.zip) DO (set /A count+=1 && set file1=%%~nF%%~xF)
set cuspath=flash-zip-via-sideloading\%file1%
goto decesionmaker2

:: WAS A SHIT
:goal
echo.
echo  -----------------------------------------------------------------------------------
echo Make sure Your phone is properly Connected to PC and Drivers are properly installed.
echo If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
echo Just press Any Key
echo.
pause
cd "%~dp0"
echo I: Waiting for adb mode..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Rebooting to Recovery..
adb reboot recovery
if errorlevel 1 (echo Something went wrong.. :0 && pause && goto cusq)
ping localhost -n 4 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  NOW HOLD VOLUME UP KEY ^& POWER KEY FOR APPROXIMATELY 7 SEC THEN QUICKLY RELEASE IT
ECHO  THIS WILL QUITE THE DEAD ANDROID MODE: THIS WILL QUITE DEAD ANDROID MODE
echo.
echo  For Stock Recovery
echo  1. Now use your volume keys to go down ^& you need to select "apply update from adb"
echo     In custom recovery it will be something like Install, Update options. But I know
echo     there is an option for sideload, select it.
echo.
echo  For TWRP RECOVERY
echo  1. Just Click ON ADB sideload Option.
echo.
echo  For CWM RECOVERY
echo  1. Just Go and select Install zip from sideload
echo.
echo  IF you want to cancel all this ^& reboot your phone to normal just hold power button
echo  for 15 sec your device will boot in android.
echo.
echo  Once everything is done, press enter
echo  -----------------------------------------------------------------------------------
echo.
pause
echo.
echo I: Updating Android..
ping localhost -n 1 >nul
echo I: Sideloading Zip file..
adb sideload "flash-zip-via-sideloading\*.zip"
ping localhost -n 2 >nul
echo I: Rebooting to Android..
adb reboot 
ping localhost -n 2 >nul
echo.
echo I: Done..
echo.
echo If device does not reboot, reboot it manually :)
echo.
pause
goto cusq

:: WAS A SHIT
:fct
cls
set TEST=Garbeg
cd "%~dp0"
cls
echo  ===================================================================================
echo  You can select between downloading and/or flashing a Coolpad Factory Firmware Image
echo  automatically or flashing a Coolpad Factory Firmware Image that you have already
echo  downloaded.
echo.
echo  YOUR BOOTLOADER IS UNLOCKED AND USB DEBUGGING ENABLED IN SETTINGS, DEVELOPER
echo  OPTIONS BEFORE STARTING. YOUR DEVICE CAN BE IN ANDROID OR FASTBOOT MODE.
echo  -----------------------------------------------------------------------------------
echo  BEST PROCEDURE FOR UPDATING YOUR ROM [AFTER UNLOCKING BOOTLOADER]:
echo  ------------------------------------------------------------------
echo  1. Backup your apps and/or Internal Storage via the backups section [if desired]
echo  2. Download and flash your desired Stock Image
echo  3. Go through the setup wizard to get to your launcher home screen
echo  4. Now Go to Settings ^> About Phone ^> tap build number 5-6 times to enable 
echo     developer Options
echo  5. Go to Settings ^> Developer options and tick USB debugging
echo  6. Unplug/Replug the usb cable
echo  7. When your device is been detected by this toolkit, then you can Restore your 
echo     backed up Apps/Internal Storage [if desired]
echo  -----------------------------------------------------------------------------------
echo  FIX FOR BOOTLOOP OR DEVICE NOT BOOTING PROPERLY:
echo  ------------------------------------------------
echo  1. Put your device in fastboot mode by unplugging the usb cable, then
echo     First of all completely shutdown your phone,the Hold power button and both volume
echo     up ^& download button for a few seconds until you see a "NOTICE" and "WARNING"
echo     Symbol.
echo  2. Select one of the below options to flash a stock image back to your device.
echo     Choose format the userdata partition when asked to give the best result. This
echo     will result in a loss of all data so if you really need any data on the device
echo     you can try the process without formatting userdata first to see if that works.
echo  3. After the image has been flashed your device should be fixed.
echo.
echo  ===================================================================================
echo.
echo  OPTIONS
echo  -------
echo.
if %DEVICE%==Basic (
echo  1. Download Coolpad Stock Image                                          [DISABLED]
) else (
echo  1. Download Coolpad Stock Image               [download file directly for flashing]
)
echo  2. Flash Stock Rom                                                [SP TOOl + GUIDE]
echo.
echo  3. Back to Main Menu
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A choice:- 
if %TEST%==1 goto dfc
if %TEST%==2 goto fgsi
if %TEST%==3 goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto fct
:fgsi
cd "%~dp0"
if %DEVICE%==CPN3 (SET MODEL=Coolpad Note 3) else (SET MODEL=Coolpad Note 3 Lite)
cls
SET JUST=ganekeh
echo  ===================================================================================
echo  GUIDE FOR FLASHING STOCK ROM VIA SP FLASH TOOL
ECHO  ----------------------------------------------
ECHo  NOTE ALL YOUR USER DATA WILL BE FORMATTED. USE THIS TO UNBRICK YOUR PHONE
ECHO  1. First of all download any version of the stock rom for your %MODEL%
echo  2. When the download gets completed, Open the SP flashtool from sp_tool folder i.e
echo     flash_tool.exe
echo  3. Run it as an administrator, now extract your coolpad stock rom rar or zip file.
echo  4. Now you may get there some folders in that go to Firmware folder where all your
echo     .img file contains.
echo  5. There you may find some file name like MTK... scatter.txt file so locate its path
echo  6. Now open the Sp flash tool and then Go to download section sections,where you 
echo     have to load scatter txt file that we have located in Firmware folder.
echo     To do that click on Scatter-loading in right side of the tool, browse the path of
echo     MTK..Scatter.txt file in firmeware folder.
echo  7. Once it is loaded you may get some list of the files below. Keep it as it is and
echo     then below scatter-loading you will find a drop down list where you have to
echo     select it to Download Only mode. 
echo  8. Once every thing is set click on the "Download" Button on the top of the tool.
echo  9. Now Turn of your phone completely. If your phone is brick not booting up then 
echo     open recovery mode by holding volume up and power button till you will get dead
echo     Android Mode. Then hold Volume up and power button for some seconds approximately
echo     6-7 then quickly release it. Then by volume keys go to power off device and by
echo     power button select it.
echo  10.Now connect your phone to pc but make sure it does not charge while the process
echo     is one, that means when you connect your phone to pc it does not power on the
echo     phone, if this happens then completely shutdown your phone again and try 
echo     connecting to some other ports in your laptop /PC.
echo  11.Once SP flash tool successfully detects your phone it will automatically start
echo     the flashing the process, this may take about a 5-6 min only.
echo  12.Once it gets completed. You will be inform by them just click on OK button.
echo  13.Now basically what happens when you start your phone by powering it on, it will
echo     get stuck on bootloop so to fix it, just select Option 2 from below.
echo.
echo  NOTE THAT YOUR SP DRIVERS MUST BE INSTALLED IN YOUR PC, WITHOUT IT YOUR PHONE WILL 
ECHO  NOT BE DETECTED BY THE TOOL. ALSO TO PERFECTLY FLASH YOUR ROM, MAKW SURE TO REMOVE
ECHO  SIMCARD AND MEMORY CARD SO THAT IF ANY ERROR CAUSES YOUR SIM, SDCARD WILL BE
ECHO  PROTECTED.
echo  -----------------------------------------------------------------------------------
echo.
echo  OPTIONS 
echo  -------
echo  1. Launch Sp Flash tool (as an Administrator)
echo  2. Fix Bootloop After flashing your phone                                [ADB MODE]
echo  3. Return to Previous MENU
echo.
echo  ===================================================================================
SET /P JUST=[*] Make a Choice:- 
if %JUST%==3 goto fct
if %JUST%==1 (
cd sp_tool
echo.
echo I: Launching Tool..
start flash_tool.exe
ping localhost -n 3 >nul
goto fgsi
)
if %JUST%==2 (
echo.
echo  -----------------------------------------------------------------------------------
echo  Make sure Your phone is properly Connected to PC ^& Drivers are properly installed
echo  If not then head to Driver Installation section in my toolkit.
echo  -----------------------------------------------------------------------------------
echo.
echo  Just press Any Key
echo.
pause
echo.
ping localhost -n 2 >nul
echo I: Detecting your device..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Fixing Bootloop error..
ping localhost -n 2 >nul
adb shell fctest system reboot
ping localhost -n 2 >nul
echo I: Fixed bootloop..
ping localhost -n 2 >nul
echo.
echo Now start your device Normally..
echo.
ping localhost -n 2 >nul
pause
goto fgsi
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto fgsi
:dfc
cls
if %DEVICE%==Basic goto Basicerror1
if %DEVICE%==CPN3 (
set link1=echo 1. Stock Rom v15   --  goo.gl/klHSSe
set link2=echo 2. Stock Rom v20   --  goo.gl/C5Dbhq
set link3=echo 3. Stock Rom v34   --  goo.gl/EGXCze
set link4=echo 4. Stock Rom v36   --  goo.gl/wcy5yr
set link5=echo 5. Stock Rom v22   --  goo.gl/69JHK9
) else (
set link1=echo 1. Stock Rom v15   --  http://d-h.st/CR5c
set link2=echo 2. Stock Rom v29   --  goo.gl/Ef3Xmx
set link5=echo 3. Stock Rom v22   --  goo.gl/QeMT4h
)
if %DEVICE%==CPN3 (SET MODEL=Coolpad Note 3) else (SET MODEL=Coolpad Note 3 Lite)
if %DEVICE%==CPN3P (
SET link1=echo 1. Stock Rom v7   --  goo.gl/HrWA1a 
set link5=echo Marshmallow is not available for plus devices
)
if %DEVICE%==CPN3D (
SET link1=echo 1. Stock Rom v1.4  --  goo.gl/3CYH1Z
set link5=echo Marshmallow is not available for this devices
)
set TEST=Garbeg
cd "%~dp0"
cls
echo  ===================================================================================
echo  WELCOME TO THE DOWNLOAD SECTION OF FLASHING STOCK IMAGE INTO COOLPAD
ECHO  --------------------------------------------------------------------
ECHO  So from here you can download your stock rom for %MODEL%
echo.
echo  Below are given links for downloading stock rom for %MODEL%
echo  Make sure you download rom from the given links only, this link are checked by me,
echo  and they all are working and original image for %MODEL%
echo.
echo  -----------------------------------------------------------------------------------
echo  LINKS FOR THE STOCK ROM (LOLLIPOP)
ECHO  ----------------------------------
%link1%
%link2%
%link3%
%link4%
echo.
echo  -----------------------------------------------------------------------------------
echo  LINKS FOR THE STOCK ROM (MARSHMALLOW)
ECHO  ----------------------------------
%link5%
echo.
echo  NOTE THAT THIS ARE IN .RAR AND .ZIP FORMAT AND MAYBE THERE SIZE OCCURS UPTO 2GB.
ECHO  ONCE YOU HAVE DOWNLOADED ROM YOU CAN FLASH IT USING SP FLASH TOOL OR CAN USE THIS 
ECHO  TOOLKIT TO FLASH OR SIDELOAD TO FLASH (PREFERABLE).
ECHO  FLASHING RESULT RESULT INTO DATA LOSS SO TAKE A BACKUP OF YOU PHONE FROM THIS TOOL
ECHO  FLASH IT AND THEN RESTORE YOUR BACKUP.
ECHO.
echo  ===================================================================================
echo.
pause
goto fct
:allinone
cls
if %DEVICE%==Basic (goto Basicerror1)
set TEST=Garbeg
cd "%~dp0"
cls
echo  ===================================================================================
echo  This is an All-In-One script to do all options at once, making it easy to save your
echo  time. 
echo.
echo  - This script will unlock your bootloader by fastbooting[DRIVERS MUST BE INSTALLED]
echo  - Flash a Custom recovery
ECHO  - Root your phone
echo  - Install Busybox libraries
echo.
echo  This will be an automatic process so sit calm ^& don't mess up with your device or
echo  else you would brick it up.
echo.
echo  IMPORTANT: YOUR DEVICE MUST BE IN ADB MODE [WITH USB DEBUGGING ENABLED] AND HAVE
echo  ROOT ACCESS [SUPERUSER / KINGROOT] FOR BUSYBOX TO WORK.
echo.
echo  ===================================================================================
echo.
echo.
SET /P TEST=[*] Are you ready [Y]es or [N]o:- 
if %TEST%==y goto allinone1
if %TEST%==Y goto allinone1
if %TEST%==n goto RESTART
if %TEST%==N goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto allinone
:allinone1
echo.
echo  Setting Unlocking bootloader script..
ping localhost -n 3 >nul
echo.
tools\ctext.exe 0b "Bootloader is already Unlocked"
echo.
echo.
echo  Setting Root options via ADB side load..
ping  localhost -n 3 >nul
echo.
echo  Setting Busybox script..
ping localhost -n 3 >nul
:topx
cls
echo.
echo  Follow the instructions and set your command..
echo.
ping localhost -n 2 >nul
echo [*] With What you want to root your device?
echo.
echo  1. SuperSU BETA by Chainfire    [For Android 6.0 OS and Above]
echo.
echo  2. SuperSU by Chainfire         [For Android 5.0 OS and Above]
echo.
echo  3. SuperUser by Clockworkmod    [Experimental]
echo.
SET /P TEST=[*] Make A Choice:- 
if %TEST%==1 (
set Supersu=BETA-SuperSU.zip
goto topx1
)
if %TEST%==2 (
set Supersu=SuperSU.zip
goto topx1
)
if %TEST%==3 (
set Supersu=SuperuserCwm.zip
goto topx1
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto topx
:topx1
cls
ping localhost -n 2 >nul
echo [*] Which recovery you want to flash?
echo.
echo  1. CWM         [lollipop]
echo  2. TWRP        [lollipop]
if %DEVICE%==CPN3L (
echo  3. Philz       [DISABLED]
) else (
echo  3. Philz       [lollipop]
)
echo  4. TWRP     [MARSHMALLOW]
echo.
SET /P OPT=[*] Make a choice:- 
echo.
if %OPT%==1 (
set recovery1=CWM
set recovery=recovery-cwm.img
set path1=none
goto flashitnow3
)

if %OPT%==2 (
set recovery1=TWRP
set recovery=recovery-twrp.img
set path1=none
goto flashitnow3
)

if %OPT%==3 (
ping localhost -n 1 >nul
if %DEVICE%==CPN3L goto basicerror2
set recovery1=Philz
set recovery=recovery-philz.img
set path1=none
goto flashitnow3
)

if %OPT%==4 (
set recovery1=Twrp (Marshmallow)
set recovery=recovery-twrp-mm.img
set path1=none
goto flashitnow3
)

echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto topx1
:flashitnow3
cls
ping localhost -n 2 >nul
echo.
echo [*] Bootloader ALready Unlocked SET..
echo.
echo [*] Recovery Set to %recovery1%..
echo.
echo [*] Rooting Set to %supersu%..
echo.
echo.
SET /P ASK=[*] Are you set to go [Y]es or [N]o:- 
if %ASK%==y goto flashitnow4
if %ASK%==Y goto flashitnow4
if %ASK%==n goto RESTART
if %ASK%==N goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto flashitnow3
:flashitnow4
set backtome1=goto flashitnow5
cls
ping localhost -n 2 >nul
echo.
echo  Please make sure that this things are enable on your device
echo  -----------------------------------------------------------
echo  1. Phone is Properly connected to pc and drivers are also
echo     properly installed.
echo  2. USB debugging is enabled.
echo  3. OEM unlocking option is on (Settings ^> Developer Options ^>
echo     Check oem unlocking option)
echo  4. Dont remove USB or touch your mobile between the process
echo.
echo  If this things are done, you can proceed.
echo.
pause
ping localhost -n 2 >nul
cls
ping localhost -n 3 >nul
echo.
tools\ctext.exe 0b "Bootloader is ALready Unlocked"
echo.
ping localhost -n 5 >nul
echo.
:flashitnow5
cls
echo.
echo  Does your device properly booted into android, if not wait then.
echo  If yes you can press Any key to continue. (Dont unlug your phone)
pause
echo.
echo  Now we will proceed to rooting android..
ping localhost -n 2 >nul
echo.
:startnn
echo  All set here, If you want to stop the script here, just press "N" to do it or
echo  for continuing to root you can go for "Y"
SET /P ASK1=
if %ASK1%==y goto flashitnow6
if %ASK1%==Y goto flashitnow6
if %ASK1%==N (
echo.
ping localhost -n 1 >nul
echo  OK, I got you.. tired na.. Maybe Next time.. :)
echo.
ping localhost -n 4 >nul
goto RESTART
)
if %ASK1%==n (
echo.
ping localhost -n 1 >nul
echo  OK, I got you.. tired na.. Maybe Next time.. :)
echo.
ping localhost -n 4 >nul
goto RESTART
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
cls
goto startnn
:flashitnow6
echo.
set backtome2=goto flashitnow7
echo  -----------------------------------------------------------------------------------
echo  You need To have Bootloader Unlocked, And Custom Recovery Must be installed like 
echo  CWM, TWRP, Philz, etc. If it is present then only proceed. If not, Unlock your 
echo  bootloader from mainmenu options and flash a custom recovery from this toolkit. :)
echo  -----------------------------------------------------------------------------------
echo.
echo Just press Enter..
pause
goto startq1
:flashitnow7
cls
echo.
echo  Does your device properly booted into android, if not wait then.
echo  If yes you can press Any key to continue. (Dont unlug your phone)
pause
echo.
echo  Now we will proceed for installation of busybox..
ping localhost -n 2 >nul
echo.
:startnn1
echo  All set here, If you want to stop the script here, just press "N" to do it or
echo  for continuing installation of busybox you can go for "Y"
SET /P ASK2=
if %ASK2%==y goto flashitnow8
if %ASK2%==Y goto flashitnow8
if %ASK2%==N (
echo.
ping localhost -n 1 >nul
echo  OK, I got you.. tired na.. Maybe Next time.. :)
echo.
ping localhost -n 4 >nul
goto RESTART
)
if %ASK2%==n (
echo.
ping localhost -n 1 >nul
echo  OK, I got you.. tired na.. Maybe Next time.. :)
echo.
ping localhost -n 4 >nul
goto RESTART
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
cls
goto startnn1
:flashitnow8
set backtome3=goto flashitnow9
:insbusy
cls
set TEST=Garbeg
cd "%~dp0"
cls
echo  ===================================================================================
echo  This will install Busybox to your device.
echo.
echo  Busybox combines tiny versions of many common UNIX utilities into a single small
echo  executable. It provides replacements for most of the utilities you usually find in
echo  GNU fileutils, shellutils, etc. The utilities in BusyBox generally have fewer
echo  options than their full-featured GNU cousins; however, the options that are
echo  included provide the expected functionality and behave very much like their GNU
echo  counterparts. Busybox provides a fairly complete environment for any small or
echo  embedded system.
echo.
echo  After the busybox app is installed you must go to the apps drawer, run 'busybox 
echo  free' then click install to install the binaries. If you do not do this then 
echo  certain procedures in the Toolkit which need busybox will not work properly.
echo.
echo  Similarly to uninstall busy libraries, just open the app and click Uninstall.
echo.
echo  After busy libraries are installed you can uninstall that app from your app drawer
echo.
echo  IMPORTANT: YOUR DEVICE MUST BE IN ADB MODE [WITH USB DEBUGGING ENABLED] AND HAVE
echo  ROOT ACCESS [SUPERUSER / KINGROOT] FOR BUSYBOX TO WORK.
echo  ===================================================================================
echo.
echo   OPTIONS : :
echo   -------
echo.
echo  1. Install BusyBox via TWRP Tweaks                                   [recommended]
echo.
echo  2. Install BusyBox app (Manually Installation)   
echo.
echo  x. Return to MAINMENU
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A Choice:- 
if %TEST%==1 goto busycwm
if %TEST%==2 goto busyadb
if %TEST%==x goto RESTART
if %TEST%==X goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto insbusy
:busycwm
cls
cls
ping localhost -n 3 >nul
echo.
SET /P TEST=[*] Are you ready [Y]es or [N]o:- 
if %TEST%==y goto insbusy2
if %TEST%==Y goto insbusy2
if %TEST%==n goto RESTART
if %TEST%==N goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto insbusy
:insbusy2
echo.
ping localhost -n 2 >nul
echo.
echo Grant Root Access..
adb shell su -c exit
echo.
ping localhost -n 3 >nul
echo Pushing File..
adb push root\BusyBox.zip /sdcard/
ping localhost -n 2 >nul
echo.
echo Injecting Commands
ping localhost -n 2 >nul
start adb shell < tools\_toolkitflash1.cf
ping localhost -n 2 >nul
echo.
echo Done..
echo.
ping localhost -n 2 >nul
echo Now wait and watch :)
ping localhost -n 2 >nul
echo.
pause
goto RESTART
:busyadb
cls
ping localhost -n 3 >nul
echo.
SET /P TEST=[*] Are you ready [Y]es or [N]o:- 
if %TEST%==y goto insbusy1
if %TEST%==Y goto insbusy1
if %TEST%==n goto RESTART
if %TEST%==N goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto insbusy
:insbusy1
echo.
echo I: Waiting for ADB mode..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Installing busybox apk..
if not exist tools\stericson.ver.43.build.193.apk (echo. && echo An error occured, one file is missing.. 
echo. && pause 
goto RESTART)
adb install -r tools\stericson.ver.43.build.193.apk
ping localhost -n 2 >nul
echo I: Launching..
adb shell am start -n stericson.busybox/stericson.busybox.Activity.MainActivity
echo I: Done..
echo.
echo.
echo  Click INSTALL to install the binaries
echo  IMPORTANT: YOU MUST CLICK INSTALL AT THE BOTTOM OR THE BINARIES WILL NOT BE COPIED.
echo  If you find a problem installing the binaries try changing the install location
echo  from /system/xbin to /system/bin. You could also go to the Play store and try
echo  another busybox installer app [from JRummy Apps or Burrows Apps].
echo.
pause
%backtome3%
goto RESTART
:flashitnow9
cls
echo.
echo  I Hope that, you have successfully completed all the task, if not run this script 
echo again.. :)
echo.
ping localhost -n 4 >nul
echo  Just press Any key to return to mainmenu..
echo.
pause
goto RESTART
:flashcus
if %DEVICE%==CPNMAX goto earlybuild
cls
SET customrec=Garbage
cd "%~dp0"
echo  ===================================================================================
echo  The selected device is : %MODEL% %DEVICE%
echo.
call tools\ctext.exe 0b "This Options is verified properly. (November 7, 2017)"
echo.
echo.
echo  This will flash CWM Recovery, Philz_Touch Recovery, TWRP Touch Recovery or Stock
echo  Recovery.
echo.
echo  If doing this straight after Unlocking your Bootloader make sure you boot your
echo  device into Android once BEFORE entering Custom Recovery. If you do not boot into
echo  Android first you will get errors and it will not work properly.
echo.
echo  Bootloader is already Unlocked in our Coolpad Devices so It is better to go with 
echo  this toolkit to flash custom recovery without SP flash tool.
echo.
echo  If you flash custom recovery and then boot straight in to it and you encounter
echo  errors then reboot the device to Android ^& unlock to allow the partition table to
echo  update, then reboot back to recovery and it should work fine.
echo.
echo  MAKE SURE USB DEBUGGING IS ON AND YOUR PHONE IS PLUGGED TO PC AND DRIVERS ARE ALSO
ECHO  PROPERLY INSTALLED.
echo  ===================================================================================
echo.
echo  OPTIONS
echo  -------
echo.
ping localhost -n 1 >nul
if %DEVICE%==Basic (
echo  1.  Flash Clockworkmod Recovery                                          [DISABLED]
)
if %DEVICE%==CPN3L (
echo  1.  Flash Clockworkmod Recovery                              [ADB + Stock Lollipop]
)
if %DEVICE%==CPN3 (
echo  1.  Flash Clockworkmod Recovery                              [ADB + Stock Lollipop]
)
if %DEVICE%==CPN3D (
echo  1.  Flash Clockworkmod Recovery                              [ADB + Stock Lollipop]
)
if %DEVICE%==CPN3P (
echo  1.  Flash Clockworkmod Recovery                                          [DISABLED]
)
if %DEVICE%==CPN5 (
echo  1.  Flash Clockworkmod Recovery                                          [DISABLED]
)
if %DEVICE%==ELP8 (
echo  1.  Flash Clockworkmod Recovery                                          [DISABLED]
)
echo.
ping localhost -n 1 >nul
if %DEVICE%==Basic (
echo  2.  Flash TWRP Touch Recovery                                            [DISABLED]
) else (
if %DEVICE%==CPN5 (
echo  2.  Flash TWRP Touch Recovery                                             [Noughat]
) else if %DEVICE%==ELP8 (
echo  2.  Flash TWRP Touch Recovery                                 [ADB + Stock Noughat]
) else (
echo  2.  Flash TWRP Touch Recovery                                [ADB + Stock Lollipop]
)
)
echo.
ping localhost -n 1 >nul
if %DEVICE%==Basic (
echo  3.  Flash Philz Recovery                                                 [DISABLED]
)
if %DEVICE%==CPN3L (
echo  3.  Flash Philz Recovery                                                 [DISABLED]
) 
if %DEVICE%==CPN3 (
echo  3.  Flash Philz Recovery                                     [ADB + Stock Lollipop]
) 
if %DEVICE%==CPN3P (
echo  3.  Flash Philz Recovery                                                 [DISABLED]
)
if %DEVICE%==CPN3D (
echo  3.  Flash Philz Recovery                                                 [DISABLED]
)
if %DEVICE%==CPN5 (
echo  3.  Flash Philz Recovery                                                 [DISABLED]
)
if %DEVICE%==ELP8 (
echo  3.  Flash Philz Recovery                                                 [DISABLED]
)

echo.
ping localhost -n 1 >nul
set "TEST=;Basic;CPN3P;CPN3D;ELP8;"
if "!TEST:;%DEVICE%;=!" neq "!TEST!" (
echo  4.  Flash TWRP Touch Recovery                                            [DISABLED]
) else (
echo  4.  Flash TWRP Touch Recovery                             [ADB + Stock Marshmallow]
)
echo.
ping localhost -n 1 >nul
if %DEVICE%==Basic (
echo  5.  FLash Stock Recovery                                                 [DISABLED]
) else if %DEVICE%==ELP8 (
echo  5.  FLash Stock Recovery                             [Stock Recovery Not Available]
) else (
echo  5.  FLash Stock Recovery                                          [ADB + Stock Rom]
)
echo.
ping localhost -n 1 >nul
if %DEVICE%==Basic (
echo  6.  Flash Recovery via SP flash tool                                     [DISABLED]
) else (
echo  6.  Flash Recovery via SP flash tool                                        [GUIDE])
echo.
echo.
echo  7.  Back to Mainmenu
echo.
echo  ===================================================================================
echo.
SET /P customrec=[*] Make a choice:- 
set customrec=%customrec%
if %customrec%==7 goto RESTART
if %customrec%==6 goto helpflash
if %customrec%==5 (
set recovery1=Stock
set type=recovery
set recovery=recovery.img
set cuspath=recovery\%DEVICE%\recovery.img
goto decesionmaker1
)
echo.
if %customrec%==1 (
set recovery1=CWM
set type=recovery
set recovery=recovery-cwm.img
set cuspath=recovery\%DEVICE%\recovery-cwm.img
goto decesionmaker1
)

if %customrec%==2 (
set recovery1=TWRP
set type=recovery
if %DEVICE%==CPN5 (set recovery=recovery-twrp-n.img
set cuspath=recovery\%DEVICE%\recovery-twrp-n.img
goto cpn5info) else (
set recovery=recovery-twrp.img
set cuspath=recovery\%DEVICE%\recovery-twrp.img
goto cpn5info
)
goto decesionmaker1
)

if %customrec%==4 (
set recovery1=TwrpMarshmallow
set type=recovery
set recovery=recovery-twrp-mm.img
if exist recovery\%DEVICE%\recovery-twrp-mm-3.1.1.img (goto bedecesionmaker1) else (set cuspath=recovery\%DEVICE%\recovery-twrp-mm.img)
if %DEVICE%==CPN5 goto cpn5info
goto decesionmaker1
)

if %customrec%==3 (
set recovery1=Philz
set type=recovery
set recovery=recovery-philz.img
set cuspath=recovery\%DEVICE%\recovery-philz.img
goto decesionmaker1
)

echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto flashcus
:bedecesionmaker1
cls
echo.
set /P YUP=Do you Want to Select Latest TWRP 3.1.1 [y/n] : 
if %YUP%==y set cuspath=recovery\%DEVICE%\recovery-twrp-mm-3.1.1.img
if %YUP%==n set cuspath=recovery\%DEVICE%\recovery-twrp-mm.img
:decesionmaker1
if %customrec%==1 (goto CWMcheck)
if %customrec%==2 (goto TWRPcheck)
if %customrec%==3 (goto PHILZcheck)
if %customrec%==4 (goto TWRPMcheck)
if %customrec%==5 (goto STOCKcheck)

if %bootmenucus%==1 (goto CWMcheck)
if %bootmenucus%==2 (goto TWRPcheck)
if %bootmenucus%==3 (goto TWRPMcheck)
if %bootmenucus%==4 (goto PHILZcheck)

if %bootoption%==3 (goto checkconditionoffastboot)
if %encryptionfinalstate%==y (goto checkconditionoffastboot)
if %encryptionfinalstate%==Y (goto checkconditionoffastboot)
:: Write all you command for CPN3 and L and PLUS
goto checkconditionoffastboot
:STOCKcheck
if %DEVICE%==Basic goto Basicerror1
if exist recovery\%DEVICE%\recovery.img (goto checkconditionoffastboot) else (goto onlineflash)
goto checkconditionoffastboot
:PHILZcheck
if %DEVICE%==Basic goto Basicerror1
if %DEVICE%==CPN3L goto Basicerror2
if %DEVICE%==CPN3P goto Basicerror2
if %DEVICE%==CPN3D goto Basicerror2
if %DEVICE%==ELP8 goto Basicerror2
if %DEVICE%==CPN5 goto Basicerror2
goto checkconditionoffastboot
:CWMcheck
if %DEVICE%==Basic goto Basicerror1
if %DEVICE%==CPN3P goto Basicerror2
if %DEVICE%==ELP8 goto Basicerror2
if %DEVICE%==CPN5 goto Basicerror2
goto checkconditionoffastboot
:TWRPMcheck
if %DEVICE%==Basic goto Basicerror1
if %DEVICE%==CPN3P goto Basicerror2
if %DEVICE%==ELP8 goto Basicerror2
if %DEVICE%==CPN3D goto Basicerror2
goto checkconditionoffastboot
:TWRPcheck
if %DEVICE%==Basic goto Basicerror1
:checkconditionoffastboot
set checkcondition=GARBAGE
cls
echo  ===================================================================================
echo  Selected Recovery : %recovery1%
echo.
echo  Fastboot Devices
fastboot -i 0x1EBF devices
echo.
echo  ADB DEVICES
adb devices
echo.
echo  OK, Now detect state where your phone exist. 
echo.
echo  Inshort your phone must be in fastboot for flashing recovery. But if not you can 
echo  select the option from below to detect it or can use the option below to do that.
echo.
echo  PLEASE MAKE SURE THAT DRIVERS ARE PROPERLY INSTALLED ON YOUR PHONE AND PHONE IS 
ECHO  CONNECTED TO PC VIA CABLE ALSO DEVICE SHOULD BE LISTED ABOVE OR IN FASTBOOT OR 
ECHO  ANDROID MODE. 
ECHO  IN SHORT DEVICE MUST BE IN FASTBOOT,EITHER YOU DO IT MANUALLY ^& THEN CONNECT YOUR
ECHO  PHONE TO DISPLAY THE SERIAL ABOVE, OR LET THE TOOLKIT DO ITS WORK.
echo.
echo  Refresh the screen "r" to Check the devices.
echo  ===================================================================================
echo.
echo  1. My Phone is booted into Recovery Mode
echo.
echo  2. My Phone is booted into Fastboot Mode
echo.
echo  3. My Phone is booted into Android
echo.
echo  4. Automatically Detects your phone
echo.
echo  r. Refresh the Screen
echo.
echo  x. Return to MAINMENU
echo.
echo  ===================================================================================
echo.
set /p checkcondition=[*] Make a decesion:- 
if %checkcondition%==1 goto detectphonerecovery
if %checkcondition%==2 goto detectphonefastboot
if %checkcondition%==3 goto detectphoneandroid
if %checkcondition%==4 goto detectphone
if %checkcondition%==r goto checkconditionoffastboot
if %checkcondition%==R goto checkconditionoffastboot
if %checkcondition%==x goto RESTART
if %checkcondition%==X goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto checkconditionoffastboot
:detectphone
cls
ping localhost -n 3 >nul
echo  Detecting Device..
echo.
adb devices > _tmp.txt
ping localhost -n 1 >nul
for /F "tokens=2" %%i in (_tmp.txt) do (set condition=%%i)
ping localhost -n 1 >nul
if %condition%==device goto detectphoneandroid
if %condition%==recovery goto detectphonerecovery
if %condition%==unauthorized goto ensurephone
if %condition1%==fastboot goto detectphonefastboot
goto error13
:ensurephone
cls
ping localhost -n 1 >nul
echo  Please Unlock your Phone and Accept the authorized state
echo.
pause
goto detectphone
:detectphonefastboot
cls
echo Phone Detected in FASTBOOT..
ping localhost -n 3 >nul
echo.
goto detectphoneandroid1
:detectphonerecovery
cls
echo  Phone Detected in Recovery..
ping localhost -n 3 >nul
echo.
echo  Rebooting to FASTBOOT..
ping localhost -n 3 >nul
adb reboot bootloader
ping localhost -n 4 >nul
goto detectphoneandroid1
:detectphoneandroid
cls
echo  Phone Detected in Android..
ping localhost -n 3 >nul
echo.
echo  Rebooting to FASTBOOT..
ping localhost -n 3 >nul
adb reboot bootloader
ping localhost -n 4 >nul
:detectphoneandroid1
:: Condition commands the flash switch
if %menuselection%==5 goto fastbootflashrecovery
if %menuselection%==10 goto fastbootflash
if %menuselection%==11 goto fastbootflash
if %bootoption%==3 goto device-info1
:helpflash
cls
echo  ===================================================================================
echo  COMPREHENSIVE GUIDE FOR FLASHING RECOVERY VIA SP TOOL
ECHO  -----------------------------------------------------
ECHO  WITH THIS TOOL YOU CAN FLASH RECOVERY WITHOUT ACTUALLY UNLOCKING BOOTLOADER, THATS 
ECHO  GREAT. SO TO FLASH RECOVERIES FOLLOW MY STEP BELOW:
echo.
echo  INSTALL YOUR SP FLASH DRIVERS FROM THIS TOOLKIT OPTION #1 FROM MAINMENU, OTHERWISE
ECHO  IT WILL NOT DETECT YOUR PHONE.
ECHO.
echo  1. Open the Sp_tool folder and launch flash_tool.exe as an administrator(right click
echo     on it ^> Run as administrator)
echo  2. Once its open head to Download section in the SP flash tool (from tabs)
echo  3. Now you need to load a scatter file for recovery, to do it click on "Scatter 
echo     loading" : Now you need to browse for the scatter file for recoveries. Go to 
echo     %~dp0recovery\%DEVICE% 
echo    Here you will find some scatter .txt files..
echo    a. For flashing lollipop cwm recovery     -- click on scatter-cwm-lollipop.txt
echo    b. For flashing lollipop twrp recovery    -- click on scatter-twrp-lollipop.txt
echo    c. For flashing lollipop philz recovery   -- click on scatter-philz-lollipop.txt
echo    d. For flashing marshmallow twrp recovery -- click on scatter-twrp-marshmallow.txt
echo  4. Once you have selected corresponding scatter file, now below scatter file option
echo     there is a drop down list containing options, set that option to "Download only"
echo  5. Once this is done, click on "Download button" on top of the tool.
echo  6. Now Switch of completely your phone and connect it to pc via USB cable. IF it is
echo     properly connected your flashing will start in 5-7 secs, if not then try to 
echo     connect your phone to some other port. Till it get detected.
echo  7. Once your device found, it will start flashing recovery and when flashing gets 
echo     complete there will be prompt which says "Download OK" just close it. 
echo  8. Now unplug your phone and Power On your device as a normal reboot.
echo  9. IF you want to check your twrp recovery, reboot into normal recovery by pressing
echo     volume button and power button.
echo.
echo  NOTE THAT IF YOUR DEVICE IS NOT BOOTING UP THEN GO TO TWRP RECOVERY I.E REBOOT TO 
ECHO  RECOVERY BY PRESSING VOLUME UP BUTTON ^& POWER BUTTON. FROM THERE JUST CLEAN CACHE
ECHO  AND DALVIK CACHE. THEN REBOOT YOUR PHONE TO ANDROID. :)
ECHO.
echo  ===================================================================================
PAUSE
GOTO flashcus
:check1
if %DEVICE%==CPN3L goto basicerror2
goto flashitnow3
:onlineflash
cls
if %DEVICE%==Basic goto Basicerror1
echo.
if %DEVICE%==CPN3 (
set link1=ECHO 1. Recovery V15 - goo.gl/fJ7vZv
set link2=ECHO 2. Recovery V20 - goo.gl/DcvNN5
set link3=ECHO 3. Recovery V24 - goo.gl/em4Dyd
set link4=ECHO 4. Recovery V36 - goo.gl/He8CGM
) 
if %DEVICE%==CPN3L (
set link1=ECHO 1. Recovery V15 - goo.gl/VgCUwm
set link2=ECHO 2. Recovery V28 - goo.gl/0W2Z17
)
if %DEVICE%==CPN3P (
set link1=echo.
set link2=echo There is no Stock recovery avaible here. If you find it you can then
set link3=echo contact me from toolkit so that I can add here.
)
cd "%~dp0"
echo  ===================================================================================
echo  Stock recovery may be different on which android version you are so to properly
echo  flash a stock recovery check your version like v36, v20, v26 etc and download the 
echo  recovey from below links.
echo.
echo  ONCE THE RECOVERY IS DOWNLOADED, YOU NEED TO COPY THAT TO 
ECHO  %~dp0recovery\%DEVICE%\recovery.img , MAKE SURE YOU NAME IT AS RECOVERY.IMG
ECHO.
ECHO  THEN CONTINUE
echo.
echo  FOR STOCK LOLLIPOP USER : :
ECHO  -----------------------
%link1%
%link2%
%link3%
%link4%
echo.
echo  FOR MARSHMALLOW USER : : 
ECHO  --------------------
ECHO  5. Stock RECOVERY - I didn't found it :p (if you find it contact me from mainmenu :0)
echo.
echo  ===================================================================================
echo.
echo Press Enter if you have placed your downloaded stock recovery into the folder..
echo.
pause
if exist recovery\%DEVICE%\recovery.img (echo Recovery found.. && goto checkconditionoffastboot) else (echo Recovery not found.. && pause && goto flashcus)
:fastbootflash
if %type%==recovery goto fastbootflashrecovery
:flashitnowbe
cls
echo.
cd "%~dp0"
echo  -----------------------------------------------------------------------------------
echo  Selected Recovery : %recovery1%
echo.
echo  Everything Set Continue.. Wait until your phone is in fastboot mode
echo  -----------------------------------------------------------------------------------
ECHO.
SET /P GO=[*] Want to continue [Y]es or [N]o:-
if %GO%==y goto flashitnow1 
if %GO%==Y goto flashitnow1
if %GO%==n goto flashcus 
if %GO%==N goto flashcus 
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto flashitnowbe
:flashitnow1
echo.
echo I: Flashing %type% %recovery1%
ping localhost -n 2 >nul
fastboot -i 0x1EBF flash %type% %cuspath%
echo.
ping -n 4 127.0.0.1 >nul
echo I: Rebooting device..
fastboot -i 0x1EBF continue
echo.
ping -n 4 127.0.0.1 >nul
echo I: Done..
echo.
pause
goto flashcus
:fastbootflashrecovery
SET recoverypartitionfirsttime=Garbage
cls
echo  -----------------------------------------------------------------------------------
echo.
call tools\ctext.exe 0c "NOTICE"
echo.
echo ------- 
echo  Are you flashing Recovery Recovery for first time, means without any modification on
echo  your device. If yes Press "Y", if not Press "N".
echo.
echo  Because What is actually happening is If you are Flashing Recovery for first time 
echo  without any modification, Our device will automatically flash stock recovery again.
echo  To avoid this Select Option "Y" from below.
echo  -----------------------------------------------------------------------------------
echo.
SET /P recoverypartitionfirsttime=[*] Let the Game Begin [Y]es or [N]o:-
if %recoverypartitionfirsttime%==y goto flashitnowbe1
if %recoverypartitionfirsttime%==Y goto flashitnowbe1
if %recoverypartitionfirsttime%==n goto flashitnowbe1
if %recoverypartitionfirsttime%==N goto flashitnowbe1
goto fastbootflashrecovery
:flashitnowbe1
SET GO=Game
cls
echo.
cd "%~dp0"
echo  -----------------------------------------------------------------------------------
echo  Selected Recovery : %recovery1%
echo.
echo  Everything Set Continue.. Wait until your phone is in fastboot mode
echo  -----------------------------------------------------------------------------------
ECHO.
SET /P GO=[*] Want to continue [Y]es or [N]o:-
if %GO%==y goto flashitnow123
if %GO%==Y goto flashitnow123
if %GO%==n goto flashcus 
if %GO%==N goto flashcus 
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto flashitnowbe
:flashitnow123
echo.
echo I: Flashing %type% %recovery1%
ping localhost -n 2 >nul
fastboot -i 0x1EBF flash %type% %cuspath%
echo.
ping -n 4 127.0.0.1 >nul
cls
echo.
echo I: Rebooting Device..
if %recoverypartitionfirsttime%==Y goto myfirstrecoveryerror
if %recoverypartitionfirsttime%==y goto myfirstrecoveryerror
fastboot -i 0x1EBF continue
ping -n 3 127.0.0.1 >nul
echo I: Done..
echo.
pause
goto flashcus
:myfirstrecoveryerror
CLS
echo  -----------------------------------------------------------------------------------
echo  NOTE : :
echo  ----
echo  Now the thing is different even you have flash recovery it is not permanently 
echo  applied. So to make it permanent do this steps:
echo.
echo  1. Press Power button and Volume Up Button for 15 secs approximately to reboot into 
echo     Custom Recovery.
echo.
echo  For TWRP :
echo  --------
echo  1. Swipe right to Allow for Modification, Now it is applied Permanently. You can
echo     reboot to device Normally by Reboot ^> System.
echo.
echo  For CWM :
echo  --------
echo  1. Don't do anything it is applied Permanently as you booted into custom recovery 
echo     for the first time. Now reboot normally.
echo.
echo  For PHILZ :
echo  --------
echo  1. Don't do anything it is applied Permanently as you booted into custom recovery 
echo     for the first time. Now reboot normally.
echo.
echo  NOW NEXT TIME YOU ARE FLASHING RECOVERY DON'T SELECT THIS OPTION BECAUSE NOW Your
ECHO  SYSTEM HAS MODIFIED SO IT WILL NOT FLASH ORIGINAL RECOVERY AGAIN.
echo.

echo  -----------------------------------------------------------------------------------
echo.
pause
goto RESTART
:flashitnow3
echo.
echo  An error occured, fastboot does not detected your phone.
echo  Make sure you have installed proper fastboot drivers 
echo  Try connecting your phone to some other port and check your device
echo  by typing "fastboot devices" if serial show then you been detected
echo  Press ENter to reboot your device to normal mode
echo.
pause
adb reboot 
if errorlevel 1 (echo. Device not detected. Cannot reboot && echo To do it manually hold your power button to reboot to android for 15 secs)
echo.
pause
goto flashcus
:rtl
cd "%~dp0" 
SET TEST=Garbage
cls
echo  ===================================================================================
call tools\ctext.exe 0b " This Option is verified properly (Jan 7, 2017)"
echo.
echo.
echo   ROOT OPTIONS : : 
ECHO   -------------
echo  OPTION1 will Root your phone via booting into custom recovery, IF you don't have
echo          custom recovery do not use this option. Also bootloader must be unlocked.
echo  OPTION2 This will root your phone using adb sideload command, This maybe work in 
echo          stock, custom recovery.
echo  OPTION3 Root with Kingroot. May Good for those devices, whose root is not made.
echo  OPTION4 Is also a guide for rooting via SP flash tool, it will basically tells you
echo          to flash any custom recovery via sp flash tool and then root by Option #1
echo  OPTION5 Will install a root checker app your android device via adb, this app has 
echo          basically many features that it can detects root status, busybox, xposed
echo          and many things
echo.
echo  Note : After rooting, warranty will be void and you will no longer recieve official
echo         OTAs. If you want that, read UNROOT Section below
echo.
echo  -----------------------------------------------------------------------------------
ECHO   UNROOT OPTIONS : :
ECHO   --------------
ECHO  TO SIMPLY UNROOT YOUR PHONE YOU SIMPLY NEED TO FLASH ORIGNAL STOCK ROM BACK TO
ECHO  DEVICE. TO FLASH A STOCK ROM, BACK TO YOUR DEVICE. THERE IS A SECTER IN MAINMENU
ECHO  SCREEN TO DO THAT, CHECK OUT IT.
echo.
echo  DRIVERS MUST BE INSTALLED AND USB DEBUGGING ENABLED IN DEVELOPER OPTIONS.
echo  To Enable it tap build number 4-5 times under
echo  Settings ^> About phone ^> Build number ^& and enable USB debugging option 
echo  ===================================================================================
echo.
echo   ROOTING OPTIONS
echo   ---------------
echo.
if %DEVICE%==CPNMAX (
echo   1. Root Your Device                                                     [DISABLED]
echo   2. Root Your Phone                                                      [DISABLED]
) else (
echo   1. Root Your Device             [Don't use it, if you do not have custom recovery]
echo   2. Root Your Phone                                                  [ADB sideload]
)
echo.
echo   3. Root with KingRoot                                                [App + Guide]
echo   4. Root device with SP flash tool                             [SMART TOOL + Guide]
echo   5. Install Root Checker app [free] on your device to verify root        [ADB Mode]
echo.
rem CHECK THIS
set "TEST=;CPN3;CPN3L;CPN3P;CPN3D;ELP8;"
if "!TEST:;%DEVICE%;=!" neq "!TEST!" (
echo   6. Root with Magisk [Note 5, Lite, A8 Max, Mega 2.5D]                   [DISABLED]
) else (
echo   6. Root with Magisk [Note 5, Lite, A8 Max, Mega 2.5D]             [Temporary Root])
echo.
echo   x. Return to Mainmenu
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A Choice:- 
if %TEST%==1 goto rootviacus
if %TEST%==2 goto rootviaside
if %TEST%==3 goto rootviaking
if %TEST%==4 goto rootviasp
if %TEST%==5 goto checkroot
if %TEST%==6 goto magiskroot
if %TEST%==x goto RESTART
if %TEST%==X goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
pause
goto rtl
:magiskroot
if %DEVICE%==CPN3 goto Deviceerror
if %DEVICE%==CPN3D goto Deviceerror
if %DEVICE%==CPN3P goto Deviceerror
if %DEVICE%==ELP8 goto Deviceerror
if %DEVICE%==CPN3L goto Deviceerror
cls
cd "%~dp0" 
echo  ===================================================================================
echo  Before you Continue, Ensure Following Stuffs.
echo.
echo  YOU HAVE INSTALLED PROPER USB DRIVERS FOR YOUR DEVICE,USB DEBUGGING MUST BE enable
echo  IN Settings ^> Developer OPTIONS
echo.
echo  ===================================================================================
echo.
pause
echo.
echo  Waiting for Device...
adb wait-for-device
echo.
echo  Installing Required Apps...
adb install -r tools\openrp.apk
adb install -r tools\Magisk.apk
echo.
echo  Firing up...
adb shell monkey -p com.yulong.openrp -v 500
ping localhost -n 2 >nul
echo.
echo  Rebooting Device.. (Do not Unplug it)
adb reboot
ping localhost -n 10 >nul
cls
echo.
echo  ===================================================================================
echo  Please Wait Until Your Device is Rebooted Properly to Android.
echo.
echo  MTK Longer may be somehow enable, stop it first from top and then disable it from
echo  dialpad. Dial *#9527*# > DM > 54321 > OK > Close
echo.
echo  ===================================================================================
echo.
pause
echo.
echo  Waiting...
adb wait-for-device
echo.
echo  Finalizing Root... (Please Look up for Onscreen Events in Phone)
adb shell mount -o remount,rw /system
adb push tools\magisk /system/bin
adb shell magisk su -c exit
adb shell mount -o remount,ro /system
echo.
echo  Done...
ping localhost -n 1 >nul
echo.
echo.
echo  Your Device has gained Partial root, that means whenever you reboot your device next
echo  time, you need to run this command from command line 'adb shell magisk su' or from
echo  android terminal 'magisk su'
if %DEVICE%==CPN5 (
echo.
echo  Next Step for Coolpad Note 5 users is to convert this temporary root to permanent
echo  root. Just by installing Supersu after Flashing TWRP Recovery.
echo  So go to Option #6 to Flash Recovery from mainmenu, then root your device with
echo  supersu.
)
if %DEVICE%==CPNMAX (
echo.
echo  Auto Root has been initiated for your Device. Whenever you connect your Phone to
echo  Toolkit, it will relaunch magisk as root user.
)
echo.
echo  If you device are getting Factory text on Top after rebooting. Go to Option # 20 
echo  for a quick fix.
echo.
pause
goto rtl
:checkroot
cls
cd "%~dp0"
echo  ===================================================================================
echo  This will install Root Checker to your device.
echo.
echo  Root Checker is a quick to use to check if your device has root access after your
echo  attempt at rooting. This application displays information that is needed in order
echo  to check if your phone is really rooted.
echo  Disclaimer: The app will not root phone.
echo  Root Checker checks for root on your device and has the following features:
echo  - Detects if your phone has Root access
echo  - Displays the following content:
echo  - User and Group Id
echo  - SuperUser Location
echo  - Su and Sudo Location
echo  - Environment Variables
echo  - Device and Android Version along with the API Level
echo  Root Checker was made for users to easily check for root user access(superuser) on
echo  their devices. This will notify users of the information listed [above]. This is a
echo  simple application that checks root access by accessing the “su” binary that is
echo  installed on a user’s device when rooting. The application 'SuperUser' [installed
echo  when rooting] must also be installed and working properly in order for the process
echo  to work.
echo.
echo  After clicking on the Check Now button, the user will be prompted by SuperUser [if
echo  present] asking to grant root access on their device and the relevant information
echo  will then be displayed.
echo.
echo  IMPORTANT: YOUR DEVICE MUST BE IN ADB MODE [WITH USB DEBUGGING ENABLED] FOR THE APP
echo  TO INSTALL.
echo  ===================================================================================
echo.
SET /P INPUT=[*] DO you want to install [Y]es or [N]o:- 
if %INPUT%==y goto checkrooti
if %INPUT%==Y goto checkrooti
if %INPUT%==n goto rtl
if %INPUT%==N goto rtl
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto checkroot
:checkrooti
echo.
if not exist tools\burrows.apps.rootchecker.4.0.2.apk (echo I: File is Misssing.. && echo. && pause && goto rtl)
echo  Waiting for ADB mode..
adb wait-for-device
echo.
echo  Installing Root checker apk..
adb install -r tools\burrows.apps.rootchecker.4.0.2.apk
echo.
echo  Done..
echo. && pause
goto rtl
:rootviasp
cls
echo  ===================================================================================
echo  In order to root your device with sp flash tool all you need to do it flash any 
echo  custom recovery on your coolpad device, whether it is a TWRP, CWM, Philz etc but you
echo  need a custom recovery. If you want to flash it. Go to mainmenu of this toolkit
echo  there will an secter for flashing custom recovery with SP Flash tool. Do it.
echo  Once you have you have your custom recovery all you need to do is back and select 
echo  option #1 from back to root your device :p
echo  ===================================================================================
echo.
pause
goto rtl
:rootviaking
cls
echo  ===================================================================================
echo  INSTRUCTION FOR ROOTING DEVICE WITH KINGROOT:
echo  ---------------------------------------------
echo  Note one thing, once you rooted your phone, you will not recieve any official OTA
echo  Update on your device, so think twice for rooting your device. To recieve OTA 
echo  updates all you need to do is Unroot your phone from back options.
echo.
echo  THIS METHOD WILL NOT USE SUPERSU FOR ROOTING,BUT A NEW APP KINGUSER.HOWEVER IF YOU
ECHO  WANT TO REPLACE KINGROOT WITH SUPERSU CHECK THE OPTIONS FROM MENU.
ECHO.
ECHO  FOLLOW THIS STEPS : :
ECHO  -----------------
ECHO  1. Go to www.kingroot.net/wap in your android browser, and download latest KINGROOT
echo     app.
echo  2. Now Install the app in your phone, while installing they might prompt you that 
echo     this is a malicious app, dont install it. But from there select "Install anyway"
echo  3. The installation might take time as it will do it in background.
echo  4. Once installed, open the app, wait till it Configures your system. 
echo  5. From there click on "Try to Root" option. (MAKE SURE YOU HAVE ACTIVE INTERNET 
ECHO     CONNECTION, BECAUSE KINGROOT NEED INTERNET CONNECTION FOR ROOTING)
ECHO  6. Once everything is completed, ^& your device is rooted. Make sure to reboot your
echo     system once. (NECESSARY)
echo  7. If everything is fine.. Your device is rooted now. :)
echo.
echo  DONT WORRY IF IT GET FAILS OR SHOW YOU ERROR THAT ROOT FAILS. TRY ONE MORE TIME. IN
ECHO  BETWEEN THE PROCESS DONT TRY TO MESS UP WITH YOUR DEVICE AROUND, CAUSE YOU MAY
ECHO  ACCIDENTLY BRICK IT.
ECHO.
echo  ===================================================================================
ECHO.
PAUSE
GOTO rtl
:rootviaside
if %DEVICE%==CPNMAX goto earlybuild
cls
echo  ===================================================================================
echo  SuperSU BETA by Chainfire - Is the latest test version of SuperSU and your best bet
echo  on newer systems if the version is higher than the SuperSU version. It may contain
echo  a few bugs but will be perfectly useable and is updated more regularly.
echo.
echo  SuperSU by Chainfire - This is the stable version of SuperSU. 
echo  This root type will be disabled in the options if not suitable for your build.
echo.
echo  Superuser by Clockworkmod - This is an older root method which has not been updated
echo  in a while and it is an experimental project, May work on %DEVICE%.
echo.
echo  NOTE: WITH SUPERSU IT IS BETTER TO USE THE HIGHEST VERSION AVAILABLE IF POSSIBLE.
echo  BY DEFAULT SUPERSU [STABLE AND BETA] WILL ROOT THE DEVICE IN SYSTEMLESS MODE IF
echo  POSSIBLE SO YOU DO NOT HAVE TO USE THE SYSTEMLESS BETA ANY MORE. IF YOU NEED TO
echo  ROOT IN SYSTEM MODE EMAIL ME AND I WILL ADD IT BUT IT MAY NOT WORK WELL ON FUTURE
echo  ANDROID BUILDS.
echo.
echo  Note one thing, once you rooted your phone, you will not recieve any official OTA
echo  Update on your device, so think twice for rooting your device. To recieve OTA 
echo  updates all you need to do is Unroot your phone from back options.
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  SUPERUSER [ROOT] METHOD
echo  -----------------------
echo.
echo  1. SuperSU BETA by Chainfire                        [For Android 6.0 OS and Above]
echo.
echo  2. SuperSU by Chainfire                             [For Android 5.0 OS and Above]
echo.
echo  3. SuperUser by Clockworkmod                                        [Experimental]
echo.
echo  4. Magisk by topjohnwu                                               [recommended]
echo.
echo  x. Return To Rooting Options
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A Choice:- 
if %TEST%==1 (
set Supersu=BETA-SuperSU.zip
set cuspath=root\%Supersu%
goto decesionmaker2
)
if %TEST%==2 (
set Supersu=SuperSU.zip
set cuspath=root\%Supersu%
goto decesionmaker2
)
if %TEST%==3 (
set Supersu=SuperuserCwm.zip
set cuspath=root\%Supersu%
goto decesionmaker2
)
if %TEST%==4 (
set Supersu=Magisk16.zip
set cuspath=root\%Supersu%
goto decesionmaker2
)
if %TEST%==x goto rtl
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto rootviaside

:decesionmaker2
:: Write Custom Commands
if %menuselection%==9 (goto checkconditionoffastboot1)
goto checkconditionoffastboot1


:checkconditionoffastboot1
set checkcondition1=GARBAGE
cls
echo  ===================================================================================
echo  Selected File : %cuspath%
echo.
echo  Fastboot Devices
fastboot -i 0x1EBF devices
echo.
echo  ADB DEVICES
adb devices
echo.
echo  OK, Now detect state where your phone exist.
echo.
echo  Inshort your phone must be in recovery for this stuff. But if not you can select the 
echo  option from below to detect it or can use the option below to do that.
echo.
echo  PLEASE MAKE SURE THAT DRIVERS ARE PROPERLY INSTALLED ON YOUR PHONE AND PHONE IS 
ECHO  CONNECTED TO PC VIA CABLE ALSO DEVICE SHOULD BE LISTED ABOVE OR IN FASTBOOT OR 
ECHO  ANDROID MODE. 
ECHO  IN SHORT DEVICE MUST BE IN RECOVERY, EITHER YOU DO IT MANUALLY ^& THEN CONNECT YOUR
ECHO  PHONE TO DISPLAY THE SERIAL ABOVE, OR LET THE TOOLKIT DO ITS WORK.
echo.
echo.
echo  Refresh the screen "r" to see the device..
echo  ===================================================================================
echo.
echo  1. My Phone is booted into Recovery Mode
echo.
echo  2. My Phone is booted into Fastboot Mode
echo.
echo  3. My Phone is booted into Android
echo.
echo  4. Automatically Detects your phone
echo.
echo  r. Refresh the screen
echo.
echo  x. Return to MAINMENU
echo.
echo  ===================================================================================
echo.
set /p checkcondition1=[*] Make a decesion:- 
if %checkcondition1%==1 goto detectphonerecovery1
if %checkcondition1%==2 goto detectphonefastboot1
if %checkcondition1%==3 goto detectphoneandroid1
if %checkcondition1%==4 goto detectphone1
if %checkcondition1%==r goto checkconditionoffastboot1
if %checkcondition1%==R goto checkconditionoffastboot1
if %checkcondition1%==x goto RESTART
if %checkcondition1%==X goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto checkconditionoffastboot1
:detectphone1
cls
ping localhost -n 3 >nul
echo Detecting Device..
echo.
adb devices > _tmp.txt
fastboot -i 0x1EBF devices > _tmp1.txt
ping localhost -n 1 >nul
for /F "tokens=2" %%i in (_tmp.txt) do (set condition=%%i)
if errorlevel 1 (goto error13)
for /F "tokens=2" %%i in (_tmp1.txt) do (set condition1=%%i)
if errorlevel 1 (goto error13)
ping localhost -n 1 >nul
del _tmp.txt /Q
del _tmp1.txt /Q
if %condition%==unauthorized goto ensurephone1
if %condition%==device goto detectphoneandroid1
if errorlevel 1 (goto error13)
if %condition%==recovery goto detectphonerecovery1
if errorlevel 1 (goto error13)
if %condition1%==fastboot goto detectphonefastboot1
if errorlevel 1 (goto error13)
cls
ping localhost -n 3 >nul
echo An Error Occured..
ping localhost -n 3 >nul
echo.
echo There are no Connected device, or drivers are not properly installed
ping localhost -n 5 >nul
echo.
echo.
echo I: RETURNING TO MAINMENU
ping localhost -n 4 >nul
goto RESTART
:ensurephone1
cls
ping localhost -n 1 >nul
echo  Please Unlock your Phone and Accept the authorized state
echo.
pause
goto detectphone1
:detectphonefastboot1
echo  Phone Detected in FASTBOOT..
ping localhost -n 3 >nul
echo.
echo  Rebooting to RECOVERY..
ping localhost -n 3 >nul
adb reboot
if errorlevel 1 goto error1
ping localhost -n 4 >nul
adb reboot recovery
goto detectphoneandroid2
:detectphonerecovery1
echo  Phone Detected in Recovery..
ping localhost -n 3 >nul
echo.
goto detectphoneandroid2
:detectphoneandroid1
echo  Phone Detected in Android..
ping localhost -n 3 >nul
echo.
echo  Rebooting to RECOVERY..
ping localhost -n 3 >nul
adb reboot recovery
if errorlevel 1 goto error1
ping localhost -n 4 >nul
:detectphoneandroid2
if %menuselection%==9 goto Sideload1
if %menuselection%==4 goto Sideload1
if %menuselection%==12 goto Sideload1
if %modssel%==6 goto Sideload1
if %modssel%==8 goto Sideload1
:: Condition commands the flash switch
goto error1

:Sideload1
cls
ping localhost -n 2 >nul
echo  ===================================================================================
echo  Now you need to select Sideloading Option
echo.
ECHO  IF YOU SEE A DEAD ANDROID MODE WHILE REBOOTING TO RECOVERY, THEN HOLD YOUR POWER 
ECHO  BUTTON AND VOLUME UP KEY FOR 6-7 SEC THEN RELEASE IT QUICKLY TO QUITE DEAD ANDROID 
ECHO  MODE.
echo.
echo  FOR STOCK Recovery
echo  ------------------
echo  1. Use Volume Keys to scroll up and down and power button to select.
echo  2. From there choose option "Apply update from adb"
echo.
echo  FOR TWRP Recovery 
echo  -----------------
echo  1. Select Option "Advanced" and then "ADB Sideload"
echo  2. Swipe to Right to Start Sideloading
echo.
echo  FOR CWM Recovery 
echo  ----------------
echo  1. Use Volume Keys to scroll up and down and power button to select.
echo  2. From there choose Option "Install zip from Sideload"
echo.
echo  IF you want to cancel all this and reboot your phone to normal just hold power 
echo  button for 15 sec your device will boot in android.
echo.
echo  NOTE:- ONCE YOU HAVE SELECTED ADB SIDELOAD OPTION, YOU NEED TO RECONNECT YOUR 
echo  ------ DEVICE TO PC I.E REMOVE IT ONCE AND AGAIN PLUG-IN IT.
echo  ===================================================================================
echo.
pause
adb devices > _tmp.txt
ping localhost -n 1 >nul
for /F "tokens=2" %%i in (_tmp.txt) do (set condition=%%i)
if %condition%==sideload goto startinfosis
echo.
echo  We did not find any sideloading devices, please check again...
:looprep
echo.
set input=dhj
echo Try Again?
echo.
echo a. Yes
echo b. No
echo.
set /p input=[*] Choose:- 
if %input%==a goto Sideload1
if %input%==b goto RESTART
set input=GDhdj
cls
goto looprep
:startinfosis
if %menuselection%==4 (goto startq1)
echo.
echo  Updating Android..
ping localhost -n 3 >nul
echo.
echo  Sideloading Zip..
adb sideload "%cuspath%"
if errorlevel 1 (goto cuspatherror)
if not %cuspath1%==Garbage (%cuspath1%)
echo.
echo  Done..
ping localhost -n 3 >nul
echo.
echo  You need to Manually Reboot into Android..
ping localhost -n 3 >nul
echo.
pause
goto RESTART
:cuspatherror
echo.
echo  Oops Got an error.. 
ping localhost -n 3 >nul
adb reconnect
echo.
echo  Lets Fix it..
ping localhost -n 2 >nul
adb sideload "%cuspath%"
if errorlevel 1 (
echo.
echo  TRY AGAIN.. TO FLASH MAN.. WITH SAME OPTION
echo.
pause
)
if not %cuspath1%==Garbage (%cuspath1%)
echo.
echo  Done..
ping localhost -n 3 >nul
echo.
echo  You need to Manually Reboot into Android..
ping localhost -n 3 >nul
echo.
pause
goto RESTART
:Supersu2
echo.
echo  -----------------------------------------------------------------------------------
echo  This will root your device by flashing %Supersu% on your device.
echo  You only need to have a stock recovery,but if you have some other custom recoveries
echo  like TWRP, CWM, Philz it would be better. :) Are You READY
echo  -----------------------------------------------------------------------------------
echo.
SET /P AND=Make a Choice [Y]es or [N]o:- 
if %AND%==y goto startq1
if %AND%==Y goto startq1
goto rootviaside
:startq1
echo.
echo  Updating Android..
ping localhost -n 3 >nul
echo.
echo  Sideloading %supersu%..
echo.
adb sideload "root\%supersu%"
if errorlevel 1 (
echo.
echo  TRY AGAIN.. TO FLASH MAN.. WITH SAME OPTION
echo.
pause
)
ping localhost -n 3 >nul
echo.
echo  Done..
echo.
echo  Press Enter to Reboot your Phone..
pause>nul
adb reboot 
echo.
echo  If device does not reboot reboot it manually :)
echo.
pause
%backtome2%
goto rootviaside
:rootviacus
if %DEVICE%==CPNMAX goto earlybuild
cls
echo  ===================================================================================
echo  SuperSU BETA by Chainfire - Is the latest test version of SuperSU and your best bet
echo  on newer systems if the version is higher than the SuperSU version. It may contain
echo  a few bugs but will be perfectly useable and is updated more regularly.
echo.
echo  SuperSU by Chainfire - This is the stable version of SuperSU. 
echo  This root type will be disabled in the options if not suitable for your build.
echo.
echo  Superuser by Clockworkmod - This is an older root method which has not been updated
echo  in a while and it is an experimental project, May work on %DEVICE%.
echo.
echo  NOTE: WITH SUPERSU IT IS BETTER TO USE THE HIGHEST VERSION AVAILABLE IF POSSIBLE.
echo  BY DEFAULT SUPERSU [STABLE AND BETA] WILL ROOT THE DEVICE IN SYSTEMLESS MODE IF
echo  POSSIBLE SO YOU DO NOT HAVE TO USE THE SYSTEMLESS BETA ANY MORE. IF YOU NEED TO
echo  ROOT IN SYSTEM MODE EMAIL ME AND I WILL ADD IT BUT IT MAY NOT WORK WELL ON FUTURE
echo  ANDROID BUILDS.
echo.
echo  Note one thing, once you rooted your phone, you will not recieve any official OTA
echo  Update on your device, so think twice for rooting your device. To recieve OTA 
echo  updates all you need to do is Unroot your phone from back options.
echo.
echo  IN ORDER TO ROOT YOUR PHONE YOUR BOOTLOADER MUST BE UNLOCKED,IF NOT YOU CAN DO IT
ECHO  FROM THIS TOOLKIT VIA MAINMENU.
echo  -----------------------------------------------------------------------------------
echo.
echo  SUPERUSER [ROOT] METHOD
echo  -----------------------
echo.
echo  1. SuperSU BETA by Chainfire                        [For Android 6.0 OS and Above]
echo.
echo  2. SuperSU by Chainfire                             [For Android 5.0 OS and Above]
echo.
echo  3. SuperUser by Clockworkmod                                        [Experimental]
echo.
echo  4. Magisk by topjohnwu                                               [recommended]
echo.
echo  x. Return To Rooting Options
echo.
echo  ===================================================================================
echo.
SET /P TEST=[*] Make A Choice:- 
if %TEST%==1 (
set Supersu=BETA-SuperSU.zip
goto supersu1
)
if %TEST%==2 (
set Supersu=SuperSU.zip
goto supersu1
)
if %TEST%==3 (
set Supersu=SuperuserCwm.zip
goto supersu1
)
if %TEST%==4 (
set Supersu=Magisk16.zip
goto supersu1
)
if %TEST%==x goto rtl
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto rootviacus
:supersu1
echo.
echo  -----------------------------------------------------------------------------------
echo  You need To have Bootloader Unlocked, And Custom Recovery Must be installed like 
echo  CWM, TWRP, Philz, etc. If it is present then only proceed. If not, Unlock your 
echo  bootloader from mainmenu options and flash a custom recovery from this toolkit. :)
echo  -----------------------------------------------------------------------------------
echo.
SET /P AND=Make a Choice [Y]es or [N]o:- 
if %AND%==y goto startq
if %AND%==Y goto startq
goto rootviacus
:startq
echo.
echo I: Waiting for adb mode..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Pushing %Supersu%..
adb shell mkdir /mnt/sdcard/root
ping localhost -n 1 >nul
adb push root\%Supersu% /mnt/sdcard/root
ping localhost -n 2 >nul
echo I: Rebooting to Custom Recovery..
adb reboot recovery
if errorlevel 1 (set stats=Error) else (set stats=Recovery Mode)
ping localhost -n 4 >nul
echo.
echo  -----------------------------------------------------------------------------------
echo  NOW HOLD VOLUME UP KEY AND POWER KEY FOR APPROXIMATELY 7 SEC THEN QUICKLY RELEASE IT
ECHO  THIS WILL QUITE THE DEAD ANDROID MODE:
echo  -----------------------------------------------------------------------------------
ECHO Once done press ENTER
echo.
pause
cls
echo.
echo  Status : %stats%
echo.
echo  Use Volume up and down keys to move up and down, and power to select an option : : 
echo.
echo  Step 1: Use volume keys and power button to select option "apply update from sdcard"
echo  Step 2: Now go to this directory /root and select %Supersu% by power button
echo  Step 3: It will flash the %Supersu% on your device, patience is needed
echo  Step 4: Now you can reboot your phone from "Reboot to system" option
echo.
echo  If everything is fine, Congratulation You have rooted your phone..
echo.
pause
goto rootviacus
:blt
SET bootoption=Gatbae
cls
echo  ===================================================================================
echo  To flash or boot images to your device your Bootloader needs to be unlocked.
echo.
if %DEVICE%==ELP8 (
CALL TOOLS\ctext.exe 0b " Elephone P8 Device has a locked bootloader [UNLOCK IT]"
) else if %DEVICE%==Basic (
CALL TOOLS\ctext.exe 0b " We are not sure if your device is Unlocked [Check Option #3]"
) else (
CALL TOOLS\ctext.exe 0b " Bootloader is already unlocked in Coolpad Devices [VERIFIED]"
)
echo.
ECHO.
echo  WARNING: THIS WILL RESULT IN ALL DATA BEING ERASED INCLUDING INTERNAL STORAGE.
echo.
echo  Note that by unlocking bootloader your warranty will be void, In case you have to 
echo  send your device back for warranty purposes you need to re-lock the Bootloader after
echo  flashing a Stock Rom via fastboot mode.
echo.
echo  To make this process Simple, Take A backup of sdcard from the Backup ^& Restore menu
echo  Unlock Bootloader from the options given below. As a Sure this will wipe your data.
echo  Then Restore your sdcard backup via restore menu.
echo.
echo  MAKE SURE YOUR DEVELOPER OPTIONS IS ON, PHONE IS CONNECTED TO PC AND USB DEBUGGING 
ECHO  MODE IS ON. ALSO SOMETIMES YOU NEED TO CHECK OEM UNLOCK OPTION FROM THERE
ECHO.
echo.
CALL TOOLS\ctext.exe 0e " One more thing you have to do it, Go to settings - Developer Options - 'Check oem"
echo.
CALL TOOLS\ctext.exe 0e " unlocking option' or 'Allow unlocking the bootloader' as it is required for"
echo.
CALL TOOLS\ctext.exe 0e " bootloader to be unlock."
echo.
::ECHO  One more thing you have to do it, Go to settings ^> Developer Options ^> 'Check oem
::echo  unlocking option' or 'Allow unlocking the bootloader' as it is required for
::echo  bootloader to be unlock.
echo.
echo  ===================================================================================
echo.
echo  BOOTLOADER OPTIONS
echo  ------------------
echo.
if %DEVICE%==Basic (
echo  1. UnLock Bootloader                                          [Do at your Own Risk]
echo.
echo  2. ReLock Bootloader     
echo.
) else if %DEVICE%==ELP8 (
echo  1. UnLock Bootloader                           [Perform this before Flashing TWRP]
echo.
echo  2. ReLock Bootloader                                   [Regain back your Warranty]
echo.
) else (
echo  1. UnLock Bootloader                                                    [DISABLED]
echo.
echo  2. ReLock Bootloader                                                    [DISABLED]
echo.
)
echo  3. Bootloader-Info
echo.
echo  x. Return to Mainmenu
echo.
echo  ===================================================================================
echo.
echo.
SET /P bootoption=[*] Make A Choice:- 
if %bootoption%==1 goto unlockb
if %bootoption%==2 goto relockb
if %bootoption%==3 goto device-info
if %bootoption%==X goto RESTART
if %bootoption%==x goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto blt
:device-info
goto decesionmaker1
:device-info1
echo.
echo Checking Condition of Fastboot..
fastboot -i 0x1EBF oem device-info
echo.
pause
goto blt
:relockb
if %DEVICE%==Basic goto relockbb
if %DEVICE%==ELP8 goto relockbb
goto bootloaderunlcoked
:bootloaderunlcoked
cls
echo.
ping localhost -n 2 >nul
echo Coolpad Has Unlocked Bootloader ..
echo.
ping localhost -n 3 >nul
echo No need to unlocked it again..
ping localhost -n 3 >nul
echo.
echo.
echo I: RETURNING TO MAINMENU
ping localhost -n 3 >nul
goto RESTART
:relockbb
echo.
cls
cd "%~dp0"
cls
echo.
echo  -----------------------------------------------------------------------------------
echo  This will lock your bootloader and prevent custom images from being flashed to your
echo  device. This will make it more secure but if your device ever gets stuck in a
echo  bootloop when booting to android or it will not boot for any reason then you will
echo  not be able to reflash a stock image to fix it. You would need to unlock the
echo  bootloader which will erase internal storage [meaning you would lose any pictures,
echo  videos or data stored on the device.
echo  -----------------------------------------------------------------------------------
echo.
SET /P TEST=[*] Are you ready [Y]es or [N]o:- 
if %TEST%==y goto relockb1
if %TEST%==Y goto relockb1
goto blt
:relockb1
echo.
echo I: Waiting for adb mode..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Rebooting to fastboot mode..
ping localhost -n 2 >nul
adb reboot bootloader
echo I: Setting Up Environment..
ping localhost -n 2 >nul 
echo I: Relocking BootLoader..
echo.
echo  -----------------------------------------------------------------
echo  FOLLOW INSTRUCTIONS ON YOUR MOBILE AND PRESS VOLUME UP TO CONFIRM
echo  -----------------------------------------------------------------
echo.
fastboot -i 0x1EBF oem lock
echo I: Rebooting..
ping localhost -n 2 >nul
fastboot -i 0x1EBF continue
echo I: Everything is Done..
echo.
echo Reboot to your system :)
echo.
pause
goto blt
:unlockb
if %DEVICE%==Basic goto unlockbb
if %DEVICE%==ELP8 goto unlockbb
goto bootloaderunlcokedrr
:bootloaderunlcokedrr
cls
echo.
ping localhost -n 2 >nul
echo  Coolpad Has Unlocked Bootloader..
echo.
ping localhost -n 3 >nul
echo  No need to unlocked it again..
ping localhost -n 3 >nul
echo.
echo.
echo I: RETURNING TO MAINMENU
ping localhost -n 3 >nul
goto RESTART
:unlockbb
echo.
cls
cd "%~dp0"
cls
echo.
echo  Please make sure that this things are enable on your device
echo  -----------------------------------------------------------
echo  1. Phone is Properly connected to pc and drivers are also
echo     properly installed.
echo  2. USB debugging is enabled.
echo  3. OEM unlocking option is on (Settings ^> Developer Options ^>
echo     Check oem unlocking option)
echo  4. Dont remove USB or touch your mobile between the process
echo.
echo  If this things are done, you can proceed.
SET /P TEST=[*] Are you ready [Y]es or [N]o:- 
if %TEST%==y goto unlockb1
if %TEST%==Y goto unlockb1
goto blt
:unlockb1
echo.
echo I: Waiting for adb mode..
adb wait-for-device
ping localhost -n 2 >nul
echo I: Rebooting to fastboot mode..
ping localhost -n 2 >nul
adb reboot bootloader
echo.
echo If your phone reboots to bootloader.. Press ENTER
pause
echo I: Setting Up Environment..
ping localhost -n 2 >nul 
echo I: Unlocking BootLoader..
echo.
echo  -----------------------------------------------------------------
echo  FOLLOW INSTRUCTIONS ON YOUR MOBILE AND PRESS VOLUME UP TO CONFIRM
echo  -----------------------------------------------------------------
echo.
fastboot -i 0x1EBF oem unlock
echo I: Rebooting..
ping localhost -n 2 >nul
fastboot -i 0x1EBF -w
ping localhost -n 2 >nul
fastboot -i 0x1EBF continue
echo I: Everything is Done..
echo.
echo  First Boot may take some time !! AS your phone data is wiped :)
echo.
pause
%backtome1%
goto blt
:bak
cd "%~dp0"
title Coolpad Toolkit
set bakselection=garbage
cls
echo  ===================================================================================
echo  This option will allow you to backup/restore part or all of your device.
echo.
call tools\ctext.exe 0b "This Option is verified Properly (November 7, 2017)"
echo.
echo  The Option Itself says what is does, so need of More INFOs
echo.
echo  VERY IMPORTANT: DO NOT TOUCH YOUR DEVICE WHILE ANY BACKUP IS BEING PERFORMED OR YOU
echo  COULD CORRUPT THE BACKUP FILE. 
echo  ===================================================================================
echo.
echo  BACKUP OPTIONS
echo  --------------
echo.
echo  1.  Backup ALL installed apps                       [full adb backup with options]
echo  2.  Backup Individual Packages ONLY                                   [single app]
echo  3.  Backup selected storage folders       [Camera, Music, etc from Virtual SdCard]
echo.
echo  4.  Backup Apps on Drive                              [New backup method on Drive]
echo.
echo  5.  CWM  NANDROID Backup                                                   [Guide]
echo  6.  TWRP NANDROID Backup                                                   [Guide]
echo  7.  ADB Backup TWRP Mode {Latest}                                            [New]
echo  8.  Pull /data folder [excluding /data/media] ONLY to your PC      [adbd Insecure]
echo  9.  Pull /system folder ONLY to your PC                            [adbd Insecure]
echo 10.  Backup Call logs, SMS, Contacts                                    [ADB + APP]
echo 11.  Install EFS Backup APP [free] on your device                       [ADB + APP]
echo 12.  Backup your IMEI and SN number
echo.
echo  -----------------------------------------------------------------------------------
echo.
echo  RESTORE OPTIONS [ALL OPTIONS REQUIRE ADB MODE]
echo  ----------------------------------------------
echo.
echo  13. Restore apps from a Backup File                    [adb restore .ab .bak file]
echo  14. Restore Selected storage folders      [Camera, Music, etc from Virtual SdCard]
echo.
echo  15. CWM NANDROID Backup Restore                                            [Guide]
echo  16. TWRP NANDROID Backup Restore                                           [Guide]
echo  17. Restore IMEI and SN number
echo.
echo  x. Back To Mainmenu
echo.
ECHO.
echo  ===================================================================================
echo.
set /p bakselection=[*] Make your choice:- 
if %bakselection%==1 goto bak1
if %bakselection%==2 goto bakind
if %bakselection%==3 goto baksel
if %bakselection%==4 goto backupdrive
if %bakselection%==5 goto cwmba
if %bakselection%==6 goto twrpba
if %bakselection%==7 goto twrpbbb
if %bakselection%==8 goto pdata
if %bakselection%==9 goto psystem
if %bakselection%==10 goto csc
if %bakselection%==11 goto efsb
if %bakselection%==12 goto imei
if %bakselection%==13 goto res1
if %bakselection%==14 goto res2
if %bakselection%==15 goto res3
if %bakselection%==16 goto res4
if %bakselection%==17 goto imei1
if %bakselection%==x goto RESTART
if %bakselection%==X goto RESTART
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto bak
:twrpbbb
cd "%~dp0"
set back=Garbge
cls
echo  ===================================================================================
echo  ADB TWRP Backup TOOL
echo  --------------------
echo.
echo  After Android 4.3.x Google has made changes to the source that It won't allow to 
echo  take whole backup through "adb backup -all" or similar one, due to security 
echo  purposes. 
echo  Because since that feature take the backups of whole data in the phone, so it is
echo  difficult to maintain apps safety, thats why Google remove this feature. But now
echo  it is said that it came back in after 6.x I Hope so, Did work on Coolpad Note 3 mm
echo  But to use adb backup feature in below android TWRP has found new method to take
echo  backups through twrp only, so it means that it can be accessed but in TWRP 3.1.0
echo  versions only.
echo.
echo  MAKE SURE YOUR PHONE MUST BE BOOTED IN TWRP, ELSE THIS WILL NOT WORK.
ECHO  RECOMMENDED TWRP IS VERSION 3.1.0
echo.
echo  ===================================================================================
echo.
echo  1. Complete Backup your Phone (system, cache, data, boot)
echo.
echo  2. Backup System Only
echo.
echo  3. Backup Data Only
echo.                 
echo  4. Backup Boot Only
echo.
echo  5. Restore Stuff
echo.
echo  x. Return to Previous Window
echo.
echo  ===================================================================================
echo.
SET /P back=[*] Make a Decision:- 
if %back%==1 goto compfull
if %back%==2 goto compsys
if %back%==3 goto compdata
if %back%==4 goto compboot
if %back%==5 goto compres
if %back%==x goto bak
if %back%==X goto bak
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto twrpbbb
:compres
echo.
cd Backups\%DEVICE%\
echo  LIST OF Backup FILES AVAILABLE TO RESTORE
echo  -----------------------------------------
echo.
set /A count=0
FOR %%F IN ("TWRP/*.ab") DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo  !count!. %%F )
echo.
if /I !count! GTR 10 (echo  !count!. %%F )
)
echo.
echo.
set /P INPUT=[*] Enter the Number:- 
if %INPUT%==x goto bak
if %INPUT%==X goto bak
if /I %INPUT% GTR !count! (goto chc4)
if /I %INPUT% LSS 1 (goto chc2)
set img=!a%INPUT%!
set jar=0
set ext=jar
IF "!img:%ext%=!" NEQ "%img%" set jar=1
goto startfile1112
:chc4
set img=None
goto bootfl
:startfile1112
adb restore %img%
echo.
echo Done..
echo.
pause
cd "%~dp0"
goto twrpbbb
:errortwrp
ping localhost -n 3 >nul
echo.
echo.
echo  Error Backup Process Could not Completed .. !
echo.
pause
goto twrpbbb
:compboot
cls
echo.
set /p filename=[*] Backup File Name:- 
SET filename2=-f Backups\%DEVICE%\TWRP\%filename%.ab
ping localhost -n 2 >nul
echo.
echo  Backing UP Files..
echo.
adb.exe backup %filename2% --twrp boot --compress
if errorlevel 1 goto errortwrp
echo.
echo  Done.. Dumped in Backups\%DEVICE%\TWRP\%filename%.ab
echo.
pause
goto twrpbbb
:compdata
cls
echo.
set /p filename=[*] Backup File Name:- 
SET filename2=-f Backups\%DEVICE%\TWRP\%filename%.ab
ping localhost -n 2 >nul
echo.
echo  Backing UP Files..
echo.
adb.exe backup %filename2% --twrp data --compress
if errorlevel 1 goto errortwrp
echo.
echo  Done.. Dumped in Backups\%DEVICE%\TWRP\%filename%.ab
echo.
pause
goto twrpbbb
:compsys
cls
echo.
set /p filename=[*] Backup File Name:- 
SET filename2=-f Backups\%DEVICE%\TWRP\%filename%.ab
ping localhost -n 2 >nul
echo.
echo  Backing UP Files..
echo.
adb.exe backup %filename2% --twrp system --compress
if errorlevel 1 goto errortwrp
echo.
echo  Done.. Dumped in Backups\%DEVICE%\TWRP\%filename%.ab
echo.
pause
goto twrpbbb
:compfull
cls
echo.
set /p filename=[*] Backup File Name:- 
SET filename2=-f Backups\%DEVICE%\TWRP\%filename%.ab
ping localhost -n 2 >nul
echo.
echo  Backing UP Files..
echo.
adb.exe backup %filename2% --twrp system cache data boot --compress
if errorlevel 1 goto errortwrp
echo.
echo  Done.. Dumped in Backups\%DEVICE%\TWRP\%filename%.ab
echo.
pause
goto twrpbbb
:backupdrive
set backupdriveoptions=Garbge
cls
echo  ===================================================================================
echo.
tools\ctext.exe 0b " Backup Will be performed using bmgr tool" && echo.
echo.
echo  bmgr is a shell tool you can use to interact with the Backup Manager on Android 
echo  devices version 2.2 (API Level 8) or higher. The tool provides commands to initiate 
echo  backup and restore operations so that you don't need to repeatedly wipe data or take
echo  similar intrusive steps in order to test your application's backup functionality.
echo.
echo  Since Android 6.0 (API 23), Android has offered the Auto Backup for Apps feature as
echo  a way for developers to quickly add backup functionality to their apps. Auto Backup
echo  preserves app data by uploading it to the user’s Google Drive account.The amount of
echo  data is limited to 25MB per user of your app and there is no charge for storing 
echo  backup data
echo.
echo  NOTE:- As of what this is the new tool Provided by Android, Using this you may get
echo  ------ error coz the docs preferences are not that much clear. So What I understand
echo  from there I have provided here. For more info visit here - https://goo.gl/10JGZ8
echo.
echo  So Just for Getting Started with it go to Settings ^> Backup ^& Restore..
echo  From there Set everything i.e your backup account and enable your backup process
echo.
echo  ===================================================================================
echo.
echo  BACKUP OPTIONS : :
echo  ------ -------
echo.
echo  1.  Backup a Package                                     [using 'backup' arguement]
echo  2.  Backup a Package                                 [using 'fullbackup' arguement]
echo  3.  Backup Whole App Packages                 [User Apps + System apps (sometimes)]
echo.
echo  -----------------------------------------------------------------------------------
echo  RESTORE OPTIONS : :
echo  ------- -------
echo.
echo  4. Restore a Package from list                                     [dumpsys + bmgr]
echo  5. Restore Whole Packages                                      [May take much time]
echo.
echo  -----------------------------------------------------------------------------------
echo  TOOL STUFF : :
echo  ---- -----
echo.
echo  6. Wipe All Backups from transports                                          
echo  7. List All Sets and Transports                      [All Token IDs and Transports] 
echo  x. Return to Previous Window
echo.
echo  ===================================================================================
SET /P backupdriveoptions=[*] Make a Decision:- 
if %backupdriveoptions%==1 goto backupp
if %backupdriveoptions%==2 goto backupwp
if %backupdriveoptions%==3 goto backupwpp
if %backupdriveoptions%==4 goto restorep
if %backupdriveoptions%==5 goto restorewp
if %backupdriveoptions%==6 goto wipep
if %backupdriveoptions%==7 goto listt

if %backupdriveoptions%==x goto bak
if %backupdriveoptions%==X goto bak
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto backupdrive
:listt
cls
echo.
echo Listing All Sets Token..
ping -n 2 127.0.0.1 >nul
echo.
adb shell bmgr list sets
echo.
echo.
echo Listing All Transport ID..
ping -n 2 127.0.0.1 >nul
echo.
adb shell bmgr list transports
echo.
echo.
echo Done..
echo.
pause
goto backupdrive
:wipep
cls
if exist _packagelist.txt del _packagelist.txt /Q
adb shell bmgr list transports >> _packagelist.txt
ping -n 3 127.0.0.1 >nul
START "List of All Transports" _packagelist.txt
echo.
SET /P BackupNow=[*] Give your Transport ID :- 
echo.
echo.
echo Wiping Process will Start Now..
echo.
pause
echo.
echo Running Wiping Session Session..
echo.
ping localhost -n 2 >nul
adb shell bmgr wipe all %BackupNow%
if errorlevel 1 goto error1
echo.
echo Running Immediate Schedule..
adb shell bmgr run
ping localhost -n 2 >nul
echo.
echo Done..
echo.
pause
goto backupdrive
:restorewp
cls
if exist _packagelist.txt del _packagelist.txt /Q
adb shell bmgr list sets >> _packagelist.txt
ping -n 3 127.0.0.1 >nul
START "List of All Tokens" _packagelist.txt
echo.
SET /P BackupNow=[*] Give your Sets Token ID (eg:- 3adbb21abba) :- 
echo.
echo.
echo Backup Process will Start Now..
echo.
pause
echo.
echo Running Restoring Session..
echo.
ping localhost -n 2 >nul
adb shell bmgr restore %BackupNow%
if errorlevel 1 goto error1
echo.
echo Running Immediate Schedule..
adb shell bmgr run
ping localhost -n 2 >nul
echo.
echo Done..
echo.
pause
goto backupdrive
:restorep
cls
if exist _packagelist.txt del _packagelist.txt /Q
adb shell dumpsys backup >> _packagelist.txt
ping -n 3 127.0.0.1 >nul
START "List of All Backed Up Package" _packagelist.txt
echo.
SET /P BackupNow=[*] Enter your Package from the list :- 
echo.
echo Backup Process will Start Now..
echo.
pause
echo.
echo Running Restoring Session..
echo.
ping localhost -n 2 >nul
adb shell bmgr restore %BackupNow%
if errorlevel 1 goto error1
echo.
echo Running Immediate Schedule..
adb shell bmgr run
ping localhost -n 2 >nul
echo.
echo Done..
echo.
pause
goto backupdrive
:backupwpp
cls
ping -n 3 127.0.0.1 >nul
echo Backup Process will Start Now..
echo.
pause
echo.
echo Running Backing Up Session..
echo.
ping localhost -n 2 >nul
adb shell bmgr backup all
if errorlevel 1 goto error1
echo.
echo Running Immediate Schedule..
adb shell bmgr run
ping localhost -n 2 >nul
echo.
echo Done..
echo.
pause
goto backupdrive
:backupwp
cls
if exist _packagelist.txt del _packagelist.txt /Q
adb shell pm list packages >> _packagelist.txt
ping -n 3 127.0.0.1 >nul
START "List of Packages" _packagelist.txt
echo.
SET /P BackupNow=[*] Enter your Package from the list :- 
echo.
echo Backup Process will Start Now..
echo.
pause
echo.
echo Running Backing Up Session..
echo.
ping localhost -n 2 >nul
adb shell bmgr fullbackup %BackupNow%
if errorlevel 1 goto error1

echo.
echo Running Immediate Schedule..
adb shell bmgr run
ping localhost -n 2 >nul
echo.
echo Done..
echo.
pause
goto backupdrive
:backupp
cls
if exist _packagelist.txt del _packagelist.txt /Q
adb shell pm list packages >> _packagelist.txt
ping -n 3 127.0.0.1 >nul
START "List of Packages" _packagelist.txt
echo.
SET /P BackupNow=[*] Enter your Package from the list :- 
echo.
echo Backup Process will Start Now..
echo.
pause
echo.
echo Running Backing Up Session..
echo.
ping localhost -n 2 >nul
adb shell bmgr backup %BackupNow%
if errorlevel 1 goto error1
echo.
echo Running Immediate Schedule..
adb shell bmgr run
ping localhost -n 2 >nul
echo.
echo Done..
echo.
pause
goto backupdrive
:imei1
cls
cd "%~dp0"
echo.
echo.
if not exist backups\%DEVICE%\device.txt (echo You haven't backed up your IMEI ^& SN number.. && pause && goto bak)
echo Your IMEI and SN number..
echo.
type backups\%DEVICE%\device.txt
echo.
pause
goto bak
:imei
cls
cd "%~dp0"
echo.
echo.
echo To take a Backup of IMEI number Only thing is you need to do it..
echo.
echo 1. Open your dial pad and type ^*#9527^*#
echo.
echo 2. Head to Numbers Options
echo.
echo 3. Now enter your IMEI number in the option below and press enter..
echo.
echo 4. Now enter SN number in the second option below and press enter..
echo.
echo This will save your imei number in text file.. in backup folder..
echo.
echo Backup your IMEI number of the sim you are using most..
echo.
SET /P IMEI=[*] Enter you IMEI number: 
echo.
SET /P SN=[*] Enter you SN number: 
echo.
if exist backups\%DEVICE%\device.txt (del backups\%DEVICE%\device.txt /Q)
echo IMEI number -- %IMEI% >> backups\%DEVICE%\device.txt
echo. >> backups\%DEVICE%\device.txt
echo SN number -- %SN% >> backups\%DEVICE%\device.txt
echo.
echo BACKUPED..
ping localhost -n 3 >nul
goto bak
:res4
cd "%~dp0"
SET INPUT=Garbage
cls
echo  ===================================================================================
echo  RESTORING NANDROID BACKUP USING TWRP RECOVERY
ECHO  ---------------------------------------------
ECHO  This guide will help you to restore nandroid backup
echo.
ECHO  NANDROID BACKUP IS A DE-FACTO STANDARD DIRECTORY STRUCTURE FOR BACKING UP A PERFECT
ECHO  IMAGE OF YOUR ANDROID DEVICE. BY DOING THIS BACKUP,YOU CAN SAVE LITERALLY EVERYTHING
ECHO  FROM YOUR OWN PERSONAL DATA TO SYSTEM FILES.
ECHO.
echo  MAKE SURE USB DEBUGGING IS ON AND YOUR PHONE IS PLUGGED TO PC AND DRIVERS ARE ALSO
ECHO  PROPERLY INSTALLED
echo  -----------------------------------------------------------------------------------
echo.
echo  STEPS TO DO IT PROPERLY
ECHO  -----------------------
ECHO   1. Choose Option 1 from below to Push Your Nandroid backup stored in backups folder
echo      If you have manually transfer the file from Phone to anywhere else in PC. Simply
echo      DRAG that file in Option 2.
echo   2. Once Pushing is completed, Choose 3 Option to reboot into TWRP.
echo   3. From there head towards Restore, Select the img you want.
echo   4. Wait till the whole restoring process gets completed. Once done You can reboot 
echo      your phone.
echo.
echo  NOTE:- IN BETWEEN THE PROCESS DONT DO ANYTHING NON-SENSE TO YOUR PHONE, AS IF 
ECHO  ------ ANYTHING GOES WRONG, YOU WILL LOSE YOUR PHONE (BRICK).
echo  IF YOU SEE A DEAD ANDROID WHILE REBOOTING TO RECOVERY, THEN PRESS POWER BUTTON AND
ECHO  VOLUME UP BUTTON FOR 7-8 SECS THEN RELEASE IT QUICKLY. YOU ARE IN RECOVERY MODE.
ECHO.
echo   -----------------------------------------------------------------------------------
echo   OPTIONS ::
ECHO   ----------
ECHO.
ECHO  1. Push NANDROID Backup From backups\%DEVICE%\TWRP\ to Your phone Only   [ADB MODE]
echo.
echo  2. Push NANDROID Backup From Custom Directory to Your phone Only         [ADB MODE]
echo.
echo  3. Reboot to RECOVERY                                                    [ADB MODE]
echo.
echo  4. Return to Mainmenu
echo.
echo  ===================================================================================
echo.
SET /P INPUT=[*] Make a Choice:- 
if %INPUT%==4 goto bak
if %INPUT%==1 goto res31
if %INPUT%==2 goto res32
if %INPUT%==3 (
ECHO.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Rebooting to Recovery..
ping localhost -n 2 >nul
adb reboot recovery
echo.
echo I: Done..
echo.
pause
goto res4
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto res4
:res32
echo.
SET /P FILE=[*] Drag The NANDROID img file here:- 
if not exist %FILE% (echo. && echo The File you Entered is Invalid && pause && goto res3)
echo.
cd "%~dp0"
echo.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Pushing NANDROID Backup..
ping localhost -n 2 >nul
adb push %FILE% /mnt/sdcard/TWRP/
echo.
echo I: Done..
echo.
pause
goto res4
:res31
echo.
echo  lIST OF THE FILES PRESENT
ECHO  -------------------------
cd backups\%DEVICE%
set /A count=0
FOR %%F IN (TWRP/*.img) DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo  !count!. %%F )
echo.
if /I !count! GTR 10 (echo  !count!. %%F )
)
if !count! leq 0 (
echo.
echo  No Backups Found In backups\%DEVICE%\TWRP
echo.
pause
goto res4
)
echo.
echo.
set /P INPUT=[*] Enter the img Number:- 
if /I %INPUT% GTR !count! (goto chc2)
if /I %INPUT% LSS 1 (goto chc2)
set capp=!a%INPUT%!
set jar=0
set ext=jar
IF "!capp:%ext%=!" NEQ "%capp%" set jar=1
goto fire21
:chc2
set capp=None
goto res4
:fire21
cd "%~dp0"
echo.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Pushing NANDROID Backup..
ping localhost -n 2 >nul
adb push backups\%DEVICE%\TWRP\%capp% /mnt/sdcard/TWRP/
echo.
echo I: Done..
echo.
pause
goto res4
:res3
cd "%~dp0"
SET INPUT=Garbage
cls
echo  ===================================================================================
echo  RESTORING NANDROID BACKUP USING CWM RECOVERY
ECHO  --------------------------------------------
ECHO  This guide will help you to restore nandroid backup
echo.
ECHO  NANDROID BACKUP IS A DE-FACTO STANDARD DIRECTORY STRUCTURE FOR BACKING UP A PERFECT
ECHO  IMAGE OF YOUR ANDROID DEVICE. BY DOING THIS BACKUP,YOU CAN SAVE LITERALLY EVERYTHING
ECHO  FROM YOUR OWN PERSONAL DATA TO SYSTEM FILES.
ECHO.
echo  MAKE SURE USB DEBUGGING IS ON AND YOUR PHONE IS PLUGGED TO PC AND DRIVERS ARE ALSO
ECHO  PROPERLY INSTALLED
echo  -----------------------------------------------------------------------------------
echo.
echo  STEPS TO DO IT PROPERLY
ECHO  -----------------------
ECHO  1. Choose Option 1 from below to Push Your Nandroid backup stored in backups folder
echo     If you have manually transfer the file from Phone to anywhere else in PC. Simply
echo     DRAG that file in Option 2.
echo  2. Once Pushing is completed, Choose 3 Option to reboot into CWM.
echo  3. From there head towards Backup ^& Restore ^> Restore, Select the file you want.
echo  4. Wait till the whole restoring process gets completed. Once done You can reboot 
echo     your phone.
echo.
echo  NOTE:- IN BETWEEN THE PROCESS DONT DO ANYTHING NON-SENSE TO YOUR PHONE, AS IF 
ECHO  ------ ANYTHING GOES WRONG, YOU WILL LOSE YOUR PHONE (BRICK).
echo   IF YOU SEE A DEAD ANDROID WHILE REBOOTING TO RECOVERY, THEN PRESS POWER BUTTON AND
ECHO  VOLUME UP BUTTON FOR 7-8 SECS THEN RELEASE IT QUICKLY. YOU ARE IN RECOVERY MODE.
ECHO.
echo  -----------------------------------------------------------------------------------
echo  OPTIONS ::
ECHO  ----------
ECHO.
ECHO  1. Push NANDROID Backup From backups\%DEVICE%\CWM\ to Your phone Only    [ADB MODE]
echo.
echo  2. Push NANDROID Backup From Custom Directory to Your phone Only         [ADB MODE]
echo.
echo  3. Reboot to RECOVERY                                                    [ADB MODE]
echo.
echo  4. Return to Mainmenu
echo.
echo  ===================================================================================
echo.
SET /P INPUT=[*] Make a Choice:- 
if %INPUT%==4 goto bak
if %INPUT%==1 goto res31
if %INPUT%==2 goto res32
if %INPUT%==3 (
ECHO.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Rebooting to Recovery..
ping localhost -n 2 >nul
adb reboot recovery
echo.
echo I: Done..
echo.
pause
goto res3
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto res3
:res32
echo.
SET /P FILE=[*] Drag The NANDROID img file here:- 
if not exist %FILE% (echo. && echo The File you Entered is Invalid && pause && goto res3)
echo.
cd "%~dp0"
echo.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Pushing NANDROID Backup..
ping localhost -n 2 >nul
adb push %FILE% /mnt/sdcard/Clockworkmod/
echo.
echo I: Done..
echo.
pause
goto res3
:res31
echo.
echo  lIST OF THE FILES PRESENT
ECHO  -------------------------
cd backups\%DEVICE%
set /A count=0
FOR %%F IN (CWM/*.img) DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo  !count!. %%F )
echo.
if /I !count! GTR 10 (echo  !count!. %%F )
)
if !count! leq 0 (
echo.
echo  No Backups Found In backups\%DEVICE%\CWM
echo.
pause
goto res3
)
echo.
echo.
set /P INPUT=[*] Enter the img Number:- 
if /I %INPUT% GTR !count! (goto chc)
if /I %INPUT% LSS 1 (goto chc)
set capp=!a%INPUT%!
set jar=0
set ext=jar
IF "!capp:%ext%=!" NEQ "%capp%" set jar=1
goto fire2
:chc
set capp=None
goto res3
:fire2
cd "%~dp0"
echo.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Pushing NANDROID Backup..
ping localhost -n 2 >nul
adb push backups\%DEVICE%\CWM\%capp% /mnt/sdcard/Clockworkmod/
echo.
echo I: Done..
echo.
pause
goto res3
:res2
SET FILE=Grabge
SET INPUT=Grabge
cd "%~dp0"
cls
echo  ===================================================================================
echo  This will Restore a selected Backup of your virtual SD Card to your device.
echo.
echo  YOU MUST TYPE THE FULL FOLDER NAME OR DRAG THE FOLDER FROM backups\%DEVICE%\.
echo.
echo  After the data is restored to /mnt/ you may need to restart your device once 
echo  for the files to be viewable from your PC's Windows Explorer and device.
echo.
echo  TO PROPERLY DRAG A FOLDER FROM BACKUPS, SIMPLY GO TO backups\%DEVICE%\ SEARCH FOR A
ECHO  BACKUP FOLDER THAT CONTAINS SOME TIMESTAMP FOR EG:- 29-10-2016. MAKE SURE YOU DRAG
ECHO  THIS KIND OF FOLDER ONLY, EXCLUDING CWM,TWRP,SMS,ETC.
echo.
echo  Type "x" at the file input prompt to return to the Main Menu.
echo  ===================================================================================
echo.
echo  WHICH TYPE OF FOLDER YOU ARE RESTORING : :
echo  -------------------------------------------
echo  1. DCIM
echo  2. Music
echo  3. Custom Directory
echo  4. Whole Sdcard
echo.
SET /P INPUT=[*] Make a Choice:- 
if %INPUT%==x goto bak
if %INPUT%==X goto bak
if %INPUT%==1 (
set folder1=sdcard
set folder2=DCIM/
goto startres2
)
if %INPUT%==2 (
set folder1=sdcard
set folder2=Music/
goto startres2
)
if %INPUT%==3 (
set folder1=sdcard
set /p folder2=[*] Enter Custom Folder name with forwad slash for eg:- DCIM/:- 
goto startres2
)
if %INPUT%==4 (
set folder1=sdcard
goto startres2
)
:startres2
echo.
set /P FILE=[*] Drag a backup folder:- 
if not exist %FILE% (echo. && echo The file you selected, does not exist && pause && goto bak)
echo.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Restoring Folder..
adb push %FILE% /mnt/%folder1%/%folder2%
echo I: Done..
echo.
pause
goto bak
:res1
cls
cd "%~dp0"
echo  ===================================================================================
echo  This will Restore a selected Backup back to your device [.ab or .bak file].
echo.
echo  If you have a long filename then you can use the wildcard to save typing:
echo  For backup-com.google.android.camera-20120112174333.bak you can type *174333.bak
echo  As long as the filename is still unique to the folder with the wildcard used.
echo.
echo  If the backup filename has any commas, spaces or special characters in it then goto
echo  the backups folder and rename it before starting or the restore will fail.
echo.
echo  Type "x" at the file input prompt to return to the Main Menu.
echo  ===================================================================================
echo.
echo  LIST OF AVAILABLE BACKUP FILES
echo  ------------------------------
echo.
cd backups
set /A count=0
FOR %%F IN (%DEVICE%/*.ab) DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo  !count!. %%F )
echo.
if /I !count! GTR 10 (echo  !count!. %%F )
)
FOR %%F IN (%DEVICE%/*.bak) DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo  !count!. %%F )
echo.
if /I !count! GTR 10 (echo  !count!. %%F )
)
if !count! leq 0 (
echo.
echo  No Backups Found In backups\%DEVICE%\
echo.
pause
goto bak
)
echo.
echo.
set /P INPUT=[*] Enter the backup Number:- 
if %INPUT% == X goto bak
if %INPUT% == x goto bak
if /I %INPUT% GTR !count! (goto chc)
if /I %INPUT% LSS 1 (goto chc)
set capp=!a%INPUT%!
set jar=0
set ext=jar
IF "!capp:%ext%=!" NEQ "%capp%" set jar=1
goto resq
:chc
set capp=None
goto bak
:resq
cd "%~dp0"
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Restoring Backup..
ping localhost -n 2 >nul
adb restore backups\%DEVICE%\%capp%
echo.
echo I: Done..
echo.
pause
goto bak
:efsb
set TEST=Garbage
cls
echo  ===================================================================================
echo  INFORMATION : : 
echo  ---------------
echo  This application let you save a backup of your EFS (IMEI) partition (if exists) on 
echo  any device running Android 3+, this help you to keep your IMEI safe from getting 
echo  corrupted after any bad Rom flashing issues, this is a common issue with coolpad 
echo  devices, if somehow you lost your IMEI, you won't be able to get registered and 
echo  connected to any mobile network.
echo.
echo  This App let you backup all related EFS (IMEI) partitions: efs, modem, radio...
echo  Internal and external SdCard are supported for saved backups.
ECHO.
echo                            -- FOR MORE INFO VISIT -- 
ECHO.
ECHO         https://play.google.com/store/apps/details?id=ma.wanam.efs&hl=en
ECHO.
echo  ===================================================================================
ECHO.
set /P TEST=[*] Do you Want to Install [Y]es or [N]o:- 
if %INPUT%==y goto inst1
if %INPUT%==Y goto inst1
if %INPUT%==n goto bak
if %INPUT%==N goto bak
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto efsb
:inst1
echo.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Install App..
adb install -r tools\wanam.efs.backup.160.apk
echo I: Done..
echo.
pause
goto bak
:csc
set INPUT=Garbage
cls
echo  ===================================================================================
echo  THIS WILL HELP YOU TO TAKE BACKUPS OF CALL LOGS, CONTACTS, SMS, ETC VIA ADB OR APP
ECHO  ----------------------------------------------------------------------------------
ECHO.
echo  VIA ADB
echo  -------
echo  NOTE:- THIS WILL TAKE BACKUP OF ONLY SMS BUT FOR CALL LOGS,CONTACTS YOU CAN INSTALL
ECHO  ------ AN APP FROM OPTION 2 IN YOUR PHONE TO DIRECTLY TAKE A BACKUP OF IT AND THEN 
ECHO  TRANSFER TO PC.
ECHO  1. Choose Option 1 from below to begin the process.
echo  THIS NEEDS ROOT, AND MAYBE SOMETIME ADBD INSECURE TO BE INSTALL, SO IF A PERMISSION
ECHO  IS PROMPTED ALLOW IT.
ECHO  2. Now Once its done, You can see you sms backup in backups\%DEVICE%\SMS\ folder ^&
echo     that file is saved as .db extension. 
echo.
echo  VIA APP
echo  -------
echo  1. Choose option 2 from below to install an app directly to your phone.
echo  2. Once its done, you can directly take a backup from there and then transfer it to
echo     pc.
echo.
echo  IMPORTANT: YOUR DEVICE MUST BE IN ADB MODE [WITH USB DEBUGGING ENABLED] AND HAVE
echo  ROOT ACCESS [SUPERUSER] AND BUSYBOX INSTALLED FOR THIS TO WORK.
echo  ===================================================================================
echo.
echo  OPTIONS : :
echo  -----------
echo.
echo  1. Backup SMS from Phone                                                 [ADB MODE]
echo.
echo  2. Install SMS Backup ^& Restore [Free] to backup contacts, logs, sms     [APP]
echo.
echo  3. Return to Previous Window
echo.
echo  ===================================================================================
echo.
SET /P INPUT=[*] Make a Choice:- 
if %INPUT%==1 goto smsb
if %INPUT%==2 goto smsa
if %INPUT%==3 goto bak
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto csc
:smsa
SET INPUT=Garbage
cls
echo  ===================================================================================
echo  INFORMATION : :
ECHO  ---------------
echo  SMS Backup & Restore is a simple Android app that backs up ^& restores your phone's
ECHO  text messages and call logs.
ECHO.
ECHO  APP FEATURES:
ECHO  - Backup SMS (text) Messages and call logs in XML format.
ECHO  - Local device backup with options to automatically upload to Email, Google Drive 
ECHO  - Choose a recurring scheduled time to automatically backup.
ECHO  - Option to backup MMS (media in the messages)
ECHO  - Option to select which text conversations to backup or restore.
ECHO  - View and drill into your backups
ECHO  - Search your backups
ECHO  - Restore/transfer backup to another phone. Backup format is independent of the 
ECHO    Android version so the messages and logs can be easily transferred from one phone 
ECHO    to another, irrespective of the version.
ECHO  - Fast Transfer between 2 phones over WiFi direct
ECHO  - Ability to restore pre-existing SMS or call logs backups from our other apps.
ECHO  - Ability to restore all text messages or only selected conversations.
ECHO  - Free up space on your phone. Delete all SMS Messages or call logs on the Phone.
ECHO  - Email a backup file.
ECHO  - The XML backup can be converted to other formats, and can also be viewed on a 
echo    computer.
ECHO.
echo                             -- FOR MORE INFO VISIT -- 
ECHO.
ECHO https://play.google.com/store/apps/details?id=com.riteshsahu.SMSBackupRestore^&hl=en
ECHO.
echo  ===================================================================================
ECHO.
set /P INPUT=[*] Do you Want to Install [Y]es or [N]o:- 
if %INPUT%==y goto inst
if %INPUT%==Y goto inst
if %INPUT%==n goto csc
if %INPUT%==N goto csc
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto smsa
:inst
echo.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Install App..
adb install -r tools\com.riteshsahu.SMSBackupRestore.apk
echo I: Done..
echo.
pause
goto csc
:smsb
echo.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
adb shell mount -o rw,remount /system /system
echo I: Backing up your sms logs..
ping -n 3 127.0.0.1 >nul
echo mkdir /mnt/sdcard/tmp > tmp1
echo su >> tmp1
echo cat /data/data/com.android.providers.telephony/databases/mmsms.db > /mnt/sdcard/tmp/mmsms.db >> tmp1
echo exit >> tmp1
echo exit >> tmp1
echo exit >> tmp1
ping -n 1 127.0.0.1 >nul
adb shell < tmp1
echo I: Pulling backup sms file to PC and cleaning up
ping -n 2 127.0.0.1 >nul
adb pull /mnt/sdcard/tmp/mmsms.db backups\%DEVICE%\SMS\
echo rm -r /mnt/sdcard/tmp/mmsms.db > tmp2
echo exit >> tmp2
adb shell < tmp2
del tmp2 /Q
del tmp1 /Q
IF errorlevel 1 (echo An Error Ocurred.. ! && pause && goto bak)
ping -n 2 127.0.0.1 >nul
echo I: Done..
echo.
pause
goto bak
:psystem
set INPUT=Garbage
cls
echo  ===================================================================================
echo  This will pull the /system folder from your device.
echo.
echo  The output is compressed as .tar and pulled to the backups folder in your ToolKit.
echo.
echo  The /system partition contains the entire operating system other than the kernel 
echo  and the ramdisk. This includes the Android user interface as well as all the system 
echo  applications that come pre-installed on the device. Wiping this partition will
echo  remove Android from the device without rendering it unbootable, and you will still
echo  be able to put the device into recovery or bootloader mode to install a new ROM.
echo.
echo  IMPORTANT: YOUR DEVICE MUST BE IN ADB MODE [WITH USB DEBUGGING ENABLED] AND HAVE
echo  ROOT ACCESS [SUPERUSER] AND BUSYBOX INSTALLED FOR THIS TO WORK.
echo.
echo  Option 1: THIS WILL PULL THE SYSTEM FOLDER BY SAFE METHOD BY CHANGING SOME AND 
ECHO  --------- FIXING SOME PERMISSION AND THEN PULL BACK TO PC. FOR THIS METHOD TO WORK
ECHO  ADBD INSECURE SHOULD BE INSTALL AND PATCH THE DEBUGGING LIBRARY. IF YOU DONT KNOW 
ECHO  HOW TO DO IT, REFER TO THE GUIDES IN HELP MENU OF THIS TOOLKIT.
ECHO  Option 2: THIS WILL DIRECTLY PULL THE SYSTEM FOLDER TO YOUR PC WITHOUT ACTUALLY 
ECHO  --------- FIXING PERMISSION, HOWEVER THIS IS AN EXPERIMENTAL OPTION, MAY NOT BE
ECHO  WORK. THIS OPTION DOES NOT REQUIRE ROOT PERMISSION. HOWEVER BUT PUSHING THIS YOU
ECHO  REQUIRE ROOT. :)
echo  ===================================================================================
echo.
echo  OPTIONS 
echo  -------
echo  1. Pull /system folder to Your PC                                   [adbd Insecure]
echo.
echo  2. Pull /system folder to Your PC                                    [Experimental]
echo.
echo  3. Return to Previous Window
echo.
SET /P INPUT=[*] Make a Choice:- 
IF %INPUT%==1 goto startsystembak
if %INPUT%==2 goto startsystembak2
if %INPUT%==3 goto bak
:startsystembak2
echo.
echo I: Waiting for adb mode..
adb wait-for-device
echo I: Pulling System Folder..
if exist temp\system (rd /s /q temp\system) else (adb pull /system/ temp\system)
echo I: Saving as raw file..
copy tools\tar.exe temp
cd temp
tools\tar cvf backups\%DEVICE%\system%date%.tar system/
ping localhost -n 2 >nul
echo.
echo I: Done..
echo.
pause
goto bak
:startsystembak
echo.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
adb shell mount -o rw,remount /system /system
echo I: Backing up your /system folder..
ping -n 3 127.0.0.1 >nul
echo tar -pcvf /sdcard/system.ext4.tar /system > tmp1
echo exit >> tmp1
ping -n 1 127.0.0.1 >nul
adb shell < tmp1
echo I: Pulling backup file to PC and cleaning up
ping -n 2 127.0.0.1 >nul
adb pull /sdcard/system.ext4.tar backups\%DEVICE%\system%DATE%.tar
echo rm -r /sdcard/system.ext4.tar > tmp2
echo exit >> tmp2
adb shell < tmp2
del tmp2
del tmp1
IF errorlevel 1 (echo An Error Ocurred.. ! && pause && goto bak)
ping -n 6 127.0.0.1 >nul
goto bak
:pdata
SET INPUT=Garbage
cls
echo  ===================================================================================
echo  This will pull the /data folder [excluding /data/media] from your device.
echo.
echo  The output is compressed as .tar and pulled to the backups folder in your ToolKit.
echo.
echo  Also called userdata, the data partition contains the user data and is where your
echo  contacts, messages, settings and apps that you have installed go. Wiping this
echo  partition essentially performs a factory reset on your device, restoring it to the
echo  way it was when you first booted it, or the way it was after the last official or
echo  custom ROM installation. When you perform a wipe data/factory reset from recovery,
echo  it is this partition that you are wiping.
echo.
echo  IMPORTANT: YOUR DEVICE MUST BE IN ADB MODE [WITH USB DEBUGGING ENABLED] AND HAVE
echo  ROOT ACCESS [SUPERUSER] AND BUSYBOX INSTALLED FOR THIS TO WORK.
echo  ALSO ADBD INSECURE SHOULD BE INSTALL AND PATCH THE DEBUGGING LIBRARY. IF YOU DONT
echo  KNOW HOW TO DO IT, REFER TO THE GUIDES IN HELP MENU OF THIS TOOLKIT.
echo  ===================================================================================
echo.
SET /P INPUT=[*] Lets Go [Y]es or [N]o:- 
if %INPUT%==y goto startdatabak
if %INPUT%==Y goto startdatabak
if %INPUT%==n goto bak
if %INPUT%==N goto bak
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto pdata
:startdatabak
echo.
echo I: Waiting for adb Mode..
adb wait-for-device
ping -n 2 127.0.0.1 >nul
echo I: Changing Some Permissions..
adb shell mount -o rw,remount /system /system
echo I: Backing up your /data folder [excluding /data/media]..
ping -n 4 127.0.0.1 >nul
echo. 
echo tar -pcvf /sdcard/data.ext4.tar /data --exclude='data/media' > tmp1
echo exit >> tmp1
adb shell < tmp1
echo.&
echo I: Pulling backup file to PC and cleaning up
ping -n 3 127.0.0.1 >nul
echo.
adb pull /sdcard/data.ext4.tar backups\%DEVICE%\data%DATE%.tar
echo rm -r /sdcard/data.ext4.tar > tmp2
echo exit >> tmp2
adb shell < tmp2
del tmp2 /Q
del tmp1 /Q
IF errorlevel 1 (echo An Error Ocurred.. ! && pause && goto bak)
ping -n 6 127.0.0.1 >nul
goto bak
:twrpba
SET INPUT=Garbage
cls
echo  ===================================================================================
echo  TAKING NANDROID BACKUP USING TWRP RECOVERY
ECHO  ------------------------------------------
ECHO  This guide will help you to create nandroid backup
echo.
ECHO  NANDROID BACKUP IS A DE-FACTO STANDARD DIRECTORY STRUCTURE FOR BACKING UP A PERFECT
ECHO  IMAGE OF YOUR ANDROID DEVICE. BY DOING THIS BACKUP,YOU CAN SAVE LITERALLY EVERYTHING
ECHO  FROM YOUR OWN PERSONAL DATA TO SYSTEM FILES.
ECHO.
ECHO  NOTE:- If you dont have TeamWin's (TWRP) recovery on your coolpad device, you wont
echo  ------ be able to take NANDROID backup onto your device. So if want TWRP recovery,
echo  then first unlock bootloader, root, flash twrp from mainmenu of this toolkit.
echo  -----------------------------------------------------------------------------------
echo.
echo  STEPS TO DO IT PROPERLY
ECHO  -----------------------
ECHO   1. Choose Option 1 from below to Reboot into TWRP recovery. The hold Volume Up and
echo      Power button simultaneously for 5 sec and release it quickly.
echo      (If this Options does not boot into twrp, the download and install quick boot on
echo       your phone and from there reboot into twrp).
echo   2. Using Volume UP/DOWN keys and Power button, you will have to navigate to backup
echo   ^> then select the partition you want. If you dont know simply leave it as it is.
echo   3. Make a backup by simply swiping to the right at the bottom.
echo      THIS IS CALLED CREATING NANDROID BACKUP.
ECHO  NOTE:- This backup Process can take upto 15-20 min, so you will need little patient.
echo   4. Once its Done, you can normally boot into android using volume and power keys.
echo   5. Once its correctly booted into Android, choose option 2 from below to pull all 
echo   the img created while backing up device. It will tag it onto backups\%DEVICE%\TWRP
echo   6. Thats it, You have successfully taken NANDROID backup.
echo.
echo  NOTE:- IN BETWEEN THE PROCESS DONT DO ANYTHING NON-SENSE TO YOUR PHONE, AS IF 
ECHO  ------ ANYTHING GOES WRONG, YOU WILL LOSE YOUR PHONE (BRICK).
ECHO.
echo  -----------------------------------------------------------------------------------
echo  OPTIONS ::
ECHO  ----------
ECHO.
ECHO  1. Reboot into Custom Recovery mode
echo  2. Pull all img From Sdcard/TWRP   
echo  3. Return to Mainmenu
echo.
echo  ===================================================================================
echo.
SET /P INPUT=[*] Make a Choice:- 
if %INPUT%==3 goto bak
if %INPUT%==2 (
echo.
echo  -----------------------------------------------------------------------------------
echo                                   PULLING FILES..
echo  -----------------------------------------------------------------------------------
adb pull /sdcard/TWRP/ "backups\%DEVICE%\TWRP"
if errorlevel 1 (echo Error caused && pause && goto cwmba)
echo.
echo  -----------------------------------------------------------------------------------
echo                                       DONE..
echo  -----------------------------------------------------------------------------------
echo.
pause
goto twrpba
)
if %INPUT%==1 (
echo.
echo I: Rebooting to recovery...
adb reboot recovery
if errorlevel 1 (echo An error occurred && pause && goto twrpba)
echo I: Done..
pause
goto twrpba
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto twrpba
:cwmba
SET INPUT=Garbage
cls
echo  ===================================================================================
echo  TAKING NANDROID BACKUP USING CWM RECOVERY
ECHO  -----------------------------------------
ECHO  This guide will help you to create nandroid backup
echo.
ECHO  NANDROID BACKUP IS A DE-FACTO STANDARD DIRECTORY STRUCTURE FOR BACKING UP A PERFECT
ECHO  IMAGE OF YOUR ANDROID DEVICE. BY DOING THIS BACKUP,YOU CAN SAVE LITERALLY EVERYTHING
ECHO  FROM YOUR OWN PERSONAL DATA TO SYSTEM FILES.
ECHO.
ECHO  NOTE:- If you dont have Clockworkmod (CWM) recovery on your coolpad device, you wont
echo  ------ be able to take NANDROID backup onto your device. So if want CWM recovery,
echo  then first unlock bootloader, root, flash cwm from mainmenu of this toolkit.
echo   -----------------------------------------------------------------------------------
echo.
echo  STEPS TO DO IT PROPERLY
ECHO  -----------------------
ECHO   1. Choose Option 1 from below to Reboot into CWM recovery. The hold Volume Up and
echo      Power button simultaneously for 5 sec and release it quickly.
echo      (If this Options does not boot into cwm, the download and install quick boot on
echo       your phone and from there reboot into cwm).
echo   2. Using Volume UP/DOWN keys and Power button, you will have to navigate to "backup
echo   ^& restore" ^> backup to begin a complete backup of your coolpad's current state.
echo      THIS IS CALLED CREATING NANDROID BACKUP.
ECHO  NOTE:- This backup Process can take upto 15-20 min, so you will need little patient.
echo   3. Once its Done, you can normally boot into android using volume and power keys.
echo   4. Once its correctly booted into Android, choose option 2 from below to pull all 
echo   the img created while backing up device. It will tag it onto backups\%DEVICE%\CWM
echo   5. Thats it, You have successfully taken NANDROID backup.
echo.
echo  NOTE:- IN BETWEEN THE PROCESS DONT DO ANYTHING NON-SENSE TO YOUR PHONE, AS IF 
ECHO  ------ ANYTHING GOES WRONG, YOU WILL LOSE YOUR PHONE (BRICK).
ECHO.
echo  -----------------------------------------------------------------------------------
echo  OPTIONS ::
ECHO  ----------
ECHO.
ECHO  1. Reboot into Custom Recovery mode
echo  2. Pull all img From Sdcard/Clockworkmod
echo  3. Return to Mainmenu
echo.
echo  ===================================================================================
echo.
SET /P INPUT=[*] Make a Choice:- 
if %INPUT%==3 goto bak
if %INPUT%==2 (
echo.
echo  -----------------------------------------------------------------------------------
echo                                   PULLING FILES..
echo  -----------------------------------------------------------------------------------
adb pull /sdcard/clockworkmod/backup "backups\%DEVICE%\CWM"
if errorlevel 1 (echo Error caused && pause && goto cwmba)
echo.
echo  -----------------------------------------------------------------------------------
echo                                       DONE..
echo  -----------------------------------------------------------------------------------
echo.
pause
goto cwmba
)
if %INPUT%==1 (
echo.
echo I: Rebooting to recovery...
adb reboot recovery
if errorlevel 1 (echo An error occurred && pause && goto cwmba)
echo I: Done..
pause
goto cwmba
)
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto cwmba
:baksel
cls
echo  ===================================================================================
echo  This will pull selected data from your Internal Storage to your pc.
echo.
echo  You must be booted into Android before starting. A time-stamped folder will be
echo  created in your backups\%DEVICE%\ folder and the selected data  
echo  will be copied across to it.
echo.
echo  If any of the folders conatain special characters such as ? then it could cause the
echo  pull command to give an error and stop. In this case you may want to go through the
echo  folder where it stopped and make sure there aren't any weird filenames. If you then
echo  run the process again it should go through fine.
echo.
echo  THIS MAY TAKE SOME TIME DEPENDING ON THE AMOUNT OF DATA TO BE COPIED
echo  ===================================================================================
echo.
echo  1.  Pull the 'DCIM' [Camera] folder to your pc                  [Internal Storage]
echo.
echo  2.  Pull the 'Music' folder to your pc                          [Internal Storage]
echo.
echo  3.  Pull A list of the Folder from your Phone                   [Internal Storage]
echo.
echo  4.  PULL ALL THE INTERNAL STORAGE FOLDER TO YOUR PC
echo.
echo  5.  Back to Main Menu
echo.
echo  ===================================================================================
echo.
SET /P backupinternaloption=[*] Make your choice:- 
IF %backupinternaloption%==1 (
set backupfolder1=mnt/sdcard
set backupfolder2=DCIM
set storagefolder=sdcard_DCIM
goto startbak12
)
IF %backupinternaloption%==2 (
set backupfolder1=mnt/sdcard
set backupfolder2=Music
set storagefolder=sdcard_Music
goto startbak12
)
IF %backupinternaloption%==3 (
set backupfolder1=mnt/sdcard
goto bakgg
)
IF %backupinternaloption%==4 (
set backupfolder1=mnt
set backupfolder2=sdcard
set storagefolder=sdcard
goto startbak12
)
IF %backupinternaloption%==5 (goto bak)
goto baksel
:bakgg
cls
echo.
echo  ===================================================================================
echo  Look into your phone, type a name of folder from your Internal Sdcard.
echo.
echo  DO NOT TYPE THE FOLDER: PART OF THE FOLDER YOU WANT OR IT WILL NOT WORK.
echo.
echo  Press Enter, then relax toolkit will do everything.
echo.
echo  Type 'x' [without the quotes] to return to the Main Menu.
echo  ===================================================================================
echo.
SET /P backupfolder2=Enter a name of folder:- 
if %backupfolder2% == x goto baksel
:startbak12
echo.
echo You have set following command..
echo.
echo adb pull /%backupfolder1%/%backupfolder2%/ 
echo.
SET /P TEST=[*] Do you want to continue[Y]es or [N]o:- 
if %TEST%==y goto startbak12d
if %TEST%==Y goto startbak12d
if %TEST%==Y goto startbak12d
if %TEST%==n goto baksel
if %TEST%==n goto baksel
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
cls
goto startbak12
:startbak12d
cd "%~dp0"
echo.
SET /P TEST=[*] Do you want to give custom backup name[Y]es or [N]o:- 
if %TEST%==y goto bakname
if %TEST%==Y goto bakname
set NAME=None
goto bakname1
:bakname
echo.
SET /P NAME=[#] Give a suitable name:- 
echo.
:bakname1
echo Backup will start when you press ENTER
echo.
echo THIS BACKUP WILL NOT USE ADB BACKUP COMMAND IT WILL ONLY PULL FOLDER FROM YOUR 
echo PHONE AND SAVE IT TO BACKUPS\%DEVICE%.
echo.
echo This routine will continue when the Backup has been completed. Please be patient.
echo.
PAUSE
echo I: Waiting for adb Mode..
adb wait-for-device
echo I: Device Found Starting Backup process..
ping localhost -n 2 >nul
if %NAME%==None (adb pull /%backupfolder1%/%backupfolder2%/ backups\%DEVICE%\STORAGE\%storagefolder%%DATE%) else (adb pull /%backupfolder1%/%backupfolder2%/ backups\%DEVICE%\STORAGE\%storagefolder%%NAME%)
echo I: Creating a timestamp..
echo BACKUP FOR %DATE%%TIME% SWITCHES :- Backup Folder /%backupfolder1%/%backupfolder2%/ >> backups\backup.txt
echo I: Done..
echo.
pause
goto baksel
:bakind
cls
echo.
echo  ===================================================================================
echo  Now opening a new window and listing available packages you can backup.
echo  Most package names start with com. [e.g. com.google.android.music].
echo.
echo  DO NOT TYPE THE PACKAGE: PART OF THE PACKAGE YOU WANT OR IT WILL NOT WORK.
echo.
echo  After typing the package name into the ToolKit please close the list.
echo.
echo  Type 'x' [without the quotes] to return to the Main Menu.
echo  ===================================================================================
echo.&echo.
adb shell pm list packages >> _packagelist.txt
ping -n 3 127.0.0.1 >nul
START "List of Packages" _packagelist.txt
echo.
SET /P selectpackage=Type the package name you wish to backup:
IF EXIST _packagelist.txt (del _packagelist.txt /F /Q)
IF "%selectpackage%"=="x" (goto bak)
echo.
:bakind1
cd "%~dp0"
echo.
echo  Backup will start when you press ENTER
echo.
echo  MAKE SURE YOUR DEVICES SCREEN IS ON AND FOLLOW THE ON-SCREEN INSTRUCTIONS. IT IS
echo  SAFER TO TYPE A PASSWORD FOR YOUR BACKUP TO KEEP IT SECURE BUT YOU DO NOT HAVE TO.
echo.
echo  This routine will continue when the Backup has been completed. Please be patient.
echo.
PAUSE
echo I: Waiting for adb Mode..
adb wait-for-device
echo I: Device Found Starting Backup process..
ping localhost -n 2 >nul
echo I: Accept your device (look into phone)
adb backup %selectpackage% -o backup.ab 
echo I: Backup Completed.. Moving file..
ping localhost -n 2 >nul
move /y backup.ab backups\%DEVICE% >nul
rename backups\%DEVICE%\backup.ab backup%DATE%.ab
goto setdatetimestampsorted
:bakind11
echo I: Creating a timestamp..
echo BACKUP FOR %DATE%%TIME% SWITCHES :- %selectpackage% >> backups\backup.txt
echo I: Done..
echo.
pause
goto bak
:bak1
cls
SET THING=Garbage
echo  ===================================================================================
echo  The backup file will be tagged with a short date/time it was created and saved to
echo  the backups\%DEVICE%' folder on your pc. A text file will be also created regarding
echo  the options which you have selected for backup
echo.
echo  After the backup has finished check the file size [to make sure it is a decent size
echo  depending on how much you backed up] and that the filename doesnt contain any 
echo  spaces, commas or special characters which would cause problems on restore]. If the
echo  backup completes within seconds [or straight away] after starting it hasn't worked.
echo.
echo  NOTE: Android 6 may have a problem making an adb backup of ALL installed apps
echo  [option1] with various options toggled. If option1 ends very quickly you can use
echo  option2 from below to backup ALL installed apps and device data [not the APKs
echo  themselves]. Internal Storage is not backed up with this option.
echo.
echo  You can also install the Easy Backup and Restore APP [option ?? from the main menu]
echo  to backup your apps [root needed to backup associated data], messages, call
echo  history, etc or go to Settings, Backup and reset and make sure the auto backup is
echo  enabled to backup your device to the cloud.
echo  ===================================================================================
echo.
echo      OPTIONS
echo      -------
echo.
echo  1.  Backup options below are selected:
echo      -Backup APK's AND respective apps data [-apk]
echo      -Do not include System apps in the Backup [-nosystem]
echo      -DO NOT include Internal Storage data in Backup [-noshared]
echo.
echo  2.  Backup ALL installed apps and device data [not the APKs themselves]
echo.
echo  3.  Select backup options manually
echo.
echo  x.  Return to Main Menu
echo.
echo -----------------------------------------------------------------------------------
echo.
set /p THING=[*] Make your choice:- 
if %THING%==1 (
set allorpackages=-all
set sysnosys=-nosystem
set apknoapk=-apk
set sharednoshared=-noshared
set datetimestampsorted=%date%%time%
goto bak12
)
if %THING%==2 goto bak13
if %THING%==3 goto bak14
if %THING%==x goto bak
if %THING%==X goto bak
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
goto bak1
:bak14
set sysnosysoption=Grabage
ECHO.
ECHO Press x to cancel the Backup Process...
echo.
echo  -----------------------------------------------------------------------------------
echo Do not include System apps in your backup if you want to restore to a different 
echo build than the backup is being made for.
echo  -----------------------------------------------------------------------------------
echo  1.  Include System apps in the Backup [-system]
echo.
echo  2.  Do not include System apps in the Backup [-nosystem]  [recommended]
echo.
SET /P sysnosysoption=[#] Make your choice:- 
IF %sysnosysoption%==1 (
set sysnosys=-system
goto backupallapps2
)
IF %sysnosysoption%==2 (
set sysnosys=-nosystem
goto backupallapps2
)
IF %sysnosysoption%==x (goto bak1)
goto bak14
:backupallapps2
echo.&echo.
set apknoapkoption=Grabage
echo  -----------------------------------------------------------------------------------
echo  If you want to restore app settings along with your apps then backup respective 
echo  apps data with the app.
echo  -----------------------------------------------------------------------------------
echo  1.  Backup APK's AND respective apps data [-apk] [recommended]
echo.
echo  2.  Backup only apps Data but not apks [-noapk]
echo.
SET /P apknoapkoption=[#] Make your choice:-
IF %apknoapkoption%==1 (
set apknoapk=-apk
goto backupallapps3
)
IF %apknoapkoption%==2 (
set apknoapk=-noapk
goto backupallapps3
)
goto backupallapps2
:backupallapps3
echo.
echo.
set sharednosharedoption=Grabage
echo  -----------------------------------------------------------------------------------
echo  If you want to backup your Virtual SD Card in the file then choose option 1. These 
echo  files will all be stored in the created .bak file however and you will not be able
echo  to view or edit them. You might be better off using the alternative Virtual SD Card
echo  backup method from the Backup Menu.
echo  -----------------------------------------------------------------------------------
echo  1.  Backup Internal Storage data [-shared]
echo.
echo  2.  DO NOT include Internal Storage data in Backup [-noshared] [recommended]
echo.
SET /P sharednosharedoption=[#] Make your choice:- 
IF %sharednosharedoption%==1 (
set sharednoshared=-shared
goto backupallapps4
)
IF %sharednosharedoption%==2 (
set sharednoshared=-noshared
goto backupallapps4
)
goto backupallapps3
:backupallapps4
echo.
echo.
set obbbackupoption=Garbeg
echo  -----------------------------------------------------------------------------------
echo  If you want to backup your apk obb folder that is used by some games to run their
echo  files associated with it. If you have obb files you can backup it.
echo  -----------------------------------------------------------------------------------
echo  1.  Backup obb data [-obb] [recommended]
echo.
echo  2.  DO NOT include obb data in Backup [-obb] 
echo.
SET /P obbbackupoption=[#] Make your choice:- 
IF %obbbackupoption%==1 (
set obbbackup=-obb
goto backupallapps5
)
IF %obbbackupoption%==2 (
set obbbackup=
goto backupallapps5
)
goto backupallapps4
:backupallapps5
set INPUT=Garbage
set allorpackages=-all
echo.
echo you have set the following commands:
ping -n 3 127.0.0.1 >nul
echo.
echo %allorpackages% %sysnosys% %obbbackup% %apknoapk% %sharednoshared%
echo.
SET /P INPUT=[*] Do you want to Continue or change it [Y]es or [N]o or Press x to Return:- 
if %INPUT%==y goto startbak1
if %INPUT%==Y goto startbak1
if %INPUT%==x goto bak1
if %INPUT%==X goto bak1
if %INPUT%==n (cls && goto bak14)
if %INPUT%==N (cls && goto bak14)
cls
goto backupallapps4
:startbak1
cd "%~dp0"
echo.
echo  Backup will start when you press ENTER
echo.
echo  MAKE SURE YOUR DEVICES SCREEN IS ON AND FOLLOW THE ON-SCREEN INSTRUCTIONS. IT IS
echo  SAFER TO TYPE A PASSWORD FOR YOUR BACKUP TO KEEP IT SECURE BUT YOU DO NOT HAVE TO.
echo.
echo  This routine will continue when the Backup has been completed. Please be patient.
echo.
PAUSE
echo I: Waiting for adb Mode..
adb wait-for-device
echo I: Device Found Starting Backup process..
ping localhost -n 2 >nul
echo I: Accept your device (look into phone)
adb backup %allorpackages% %sysnosys% %obbbackup% %apknoapk% %sharednoshared% -o backup.ab 
echo I: Backup Completed.. Moving file..
ping localhost -n 2 >nul
move /y backup.ab backups\%DEVICE% >nul
goto setdatetimestampsorted
:bak141
rename backups\%DEVICE%\backup.ab backup_%datetimestampsorted%.ab
echo I: Creating a timestamp..
echo BACKUP FOR %DATE%%TIME% SWITCHES :- %allorpackages% %sysnosys% %obbbackup% %apknoapk% %sharednoshared% >> backups\backup.txt
echo I: Done..
echo.
pause
goto bak1
:bak13
cd "%~dp0"
echo.
echo  Backup will start when you press ENTER
echo.
echo  MAKE SURE YOUR DEVICES SCREEN IS ON AND FOLLOW THE ON-SCREEN INSTRUCTIONS. IT IS
echo  SAFER TO TYPE A PASSWORD FOR YOUR BACKUP TO KEEP IT SECURE BUT YOU DO NOT HAVE TO.
echo.
echo  This routine will continue when the Backup has been completed. Please be patient.
echo.
PAUSE
echo I: Waiting for adb Mode..
adb wait-for-device
echo I: Device Found Starting Backup process..
ping localhost -n 2 >nul
echo I: Accept your device (look into phone)
adb backup -all -noapk -o backup.ab 
echo I: Backup Completed.. Moving file..
ping localhost -n 2 >nul
move /y backup.ab backups\%DEVICE% >nul
goto setdatetimestampsorted
:bak131
rename backups\%DEVICE%\backup.ab backup_%datetimestampsorted%.ab
echo I: Creating a timestamp..
echo BACKUP FOR %DATE%%TIME% SWITCHES :- %allorpackages% %sysnosys% %apknoapk% %sharednoshared% >> backups\backup.txt
echo I: Done..
echo.
pause
goto bak1
:bak12
cd "%~dp0"
echo.
echo  Backup will start when you press ENTER
echo.
echo  MAKE SURE YOUR DEVICES SCREEN IS ON AND FOLLOW THE ON-SCREEN INSTRUCTIONS. IT IS
echo  SAFER TO TYPE A PASSWORD FOR YOUR BACKUP TO KEEP IT SECURE BUT YOU DO NOT HAVE TO.
echo.
echo  This routine will continue when the Backup has been completed. Please be patient.
echo.
PAUSE
echo I: Waiting for adb Mode..
adb wait-for-device
echo I: Device Found Starting Backup process..
ping localhost -n 2 >nul
echo I: Accept your device (look into phone)
adb backup -all -nosystem -apk -noshared -o backup.ab 
echo I: Backup Completed.. Moving file..
ping localhost -n 2 >nul
move /y backup.ab backups\%DEVICE% >nul
goto setdatetimestampsorted
:bak121
rename backups\%DEVICE%\backup.ab backup_%datetimestampsorted%.ab
echo I: Creating a timestamp..
echo BACKUP FOR %DATE%%TIME% SWITCHES :- %allorpackages% %sysnosys% %apknoapk% %sharednoshared% >> backups\backup.txt
echo I: Done..
echo.
pause
goto bak1
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
:error1
echo.
echo  An Error Occured
ping -n 3 127.0.0.1 >nul
echo.
%error2%
ping -n 2 127.0.0.1 >nul
echo.
echo  Press any key to return to the Main Menu..
pause >nul
echo.
echo  Returning to Main Menu..
ping -n 3 127.0.0.1 >nul
goto RESTART

:setdatetimestampsorted
:: Setting Date and time and making it a stamped
@echo off
cd "%~dp0"
START /W REGEDIT /E _Temp.reg "HKEY_CURRENT_USER\Control Panel\International"
FOR /F "tokens=1* delims==" %%A IN ('TYPE _Temp.reg ^| FIND /I "iDate"') DO SET iDate=%%B
FOR /F "tokens=1* delims==" %%A IN ('TYPE _Temp.reg ^| FIND /I "sDate"') DO SET sDate=%%B
SET iDate=%iDate:"=%
SET sDate=%sDate:"=%
IF %iDate%==0 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET Year=%%C
	SET Month=%%A
	SET Day=%%B
)
IF %iDate%==1 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET Year=%%C
	SET Month=%%B
	SET Day=%%A
)
IF %iDate%==2 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET Year=%%A
	SET Month=%%B
	SET Day=%%C
)
FOR %%A IN (%Year%)  DO SET Year=%%A
FOR %%A IN (%Month%) DO SET Month=%%A
FOR %%A IN (%Day%)   DO SET Day=%%A
SET SortDate=%Year%%Month%%Day%
SET SortDate2=%Year%-%Month%-%Day%
goto setsortedtime

:setsortedtime
FOR /F "tokens=1* delims==" %%A IN ('TYPE _Temp.reg ^| FINDSTR /R /I /B /C:"\"iTime\"="') DO SET iTime=%%~B
FOR /F "tokens=1* delims==" %%A IN ('TYPE _Temp.reg ^| FINDSTR /R /I /B /C:"\"sTime\"="') DO SET sTime=%%~B
FOR /F "tokens=*" %%A IN ('TIME/T') DO SET Now=%%A
FOR /F "tokens=1,2* delims=%sTime% " %%A IN ('ECHO %Now%') DO (
SET Hour=%%A
SET Mins=%%B
)
ECHO.%Mins%| FIND /I "AM" >NUL && SET AmPm=A
ECHO.%Mins%| FIND /I "PM" >NUL && SET AmPm=P
SET Mins=%Mins: =%
SET Mins=%Mins:A=%
SET Mins=%Mins:a=%
SET Mins=%Mins:M=%
SET Mins=%Mins:m=%
SET Mins=%Mins:P=%
SET Mins=%Mins:p=%
IF 1%Hour% LSS 20 SET Hour=0%Hour%
IF 1%Mins% LSS 20 SET Mins=0%Mins%
IF %Hour% LSS 12 IF /I "%AmPm%"=="P" SET /A Hour=1%Hour%-88
IF %Hour% EQU 12 IF /I "%AmPm%"=="A" SET    Hour=00
SET Now=%Hour%%sTime%%Mins%
FOR /F "tokens=1,2* delims=%sTime% " %%A IN ('ECHO %Now%') DO (
SET SortTime=%%A%%B
SET timehour=%%A
SET timeminute=%%B
)
SET SortTime2=%timehour%.%timeminute%
SET SortTime3=%timehour%-%timeminute%
SET datetimestampsorted=%SortDate%%SortTime%
SET datetimestampsorted2=%SortDate2%.%SortTime2%
SET datetimestampsorted3=%SortDate2%--%SortTime3%
DEL _Temp.reg
ping localhost -n 2 >nul
IF %dumplcselection%=="1" (goto startdumpdefaultlogcat)
IF %dumplcselection%=="2" (goto startdumpfilteredlogcat2)
IF %dumplcselection%=="3" (goto startdumplogcatbuffer)
IF %lbselection%=="4" (goto startdumpbugreport)
IF %THING%==3 (goto bak141)
IF %THING%==2 (goto bak131)
IF %THING%==1 (goto bak121)
IF %bakselection%==2 goto (bakind11)
%returntome05%
goto error1
:Buginfo
echo.
echo I: Something went unexpected..
ping localhost -n 4 >nul
echo.
echo  If you find this message please contact me from the toolkit.. 
ping localhost -n 5 >nul
echo.
echo  Because its a bug I need to fix it..
ping localhost -n 4 >nul
echo.
goto RESTART
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
for /F "tokens=1" %%i in (tools\_toolkitcolor.cf) do (
set /a n+=1
set colour!n!=%%i
)
color %colour1%%colour2%
goto RESTART
:Basicerror2
cls
echo.
ping localhost -n 3 >nul
echo  This recovery is not available for your device..
echo.
ping localhost -n 4 >nul
echo  This Option is Disabled..
echo.
ping localhost -n 4 >nul
echo.
echo I: RETURNING TO MAINMENU
ping localhost -n 3 >nul
goto RESTART
:Basicerror1
cls
echo.
ping localhost -n 3 >nul
echo  You are Using Basic version of this Toolkit..
echo.
ping localhost -n 4 >nul
echo  This Option is Disabled..
echo.
ping localhost -n 4 >nul
echo.
echo I: RETURNING TO MAINMENU
ping localhost -n 3 >nul
goto RESTART
:error3
cls
ping localhost -n 3 >nul
echo.
echo  Xposed Modules are not downloaded...
ping localhost -n 3 >nul
echo.
echo  Downloading Latest Modules..
ping localhost -n 3 >nul
echo.
echo  Checking your web connectivity..
cd root
echo.
echo.
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
cls
ping localhost -n 3 >nul
echo.
echo  Verifying Downloads..
ping localhost -n 3 >nul
echo.
echo.
echo  I: RETURNING TO XPOSED WINDOW..
ping localhost -n 3 >nul
goto xposed
:earlybuild
cls
ping localhost -n 2 >nul
echo.
echo  The Device module is in its Early Stage..
ping localhost -n 3 >nul
echo.
echo  We'll enable it as required modules are Made..
ping localhost -n 4 >nul
echo.
echo.
echo I: RETURNING TO MAINMENU
ping localhost -n 4 >nul
goto RESTART
:error13
cls
ping localhost -n 3 >nul
echo  An Error Occured..
ping localhost -n 3 >nul
echo.
echo  There are no Connected device, or drivers are not properly installed
ping localhost -n 5 >nul
echo.
echo.
echo I: RETURNING TO MAINMENU
ping localhost -n 4 >nul
goto RESTART
:xposederror1
cls
ping localhost -n 3 >nul
echo  You are using Basic Version of the Toolkit..
echo.
ping localhost -n 3 >nul
echo  These xposed framework are specially designed for 5.1 and 6.0 devices..
echo i.e Note 3 and lite..
echo.
ping localhost -n 5 >nul
echo.
echo  Use This Feature at your own risk..
ping localhost -n 3 >nul
echo.
cls
goto xposedclr
:notoolkiterror
cls
echo.&echo.&echo.
echo  ===================================================================================
echo  This file needs to be run from the main source only i.e Toolkit.exe
echo.
echo  Please goto %toolkitthread% to download the ToolKit or 
echo  run the file from the correct folder.
echo  ===================================================================================
echo.&echo.
echo Press any key to Exit&pause >nul
echo.
echo.
echo.
goto exit5
:devicecheck
if %DEVICE%==CPN3 goto fix1
if %DEVICE%==CPN3L goto fix2
if %DEVICE%==Basic goto ini1
goto ini1
:fix1
if exist recovery\CPN3\scatter_file.txt (goto ini1)
echo Downloading some fix modules..
cd recovery\CPN3
echo.
ping localhost -n 3 >nul
"%~dp0tools\wget.exe" https://coolpadtoolkit.files.wordpress.com/2016/10/cpn3.key --no-check-certificate
if errorlevel 1 (
cls
ping localhost -n 3 >nul
echo Error while downloading..
ping localhost -n 3 >nul
goto ini1
)
ping localhost -n 3 >nul
echo.
echo Extracting..
"%~dp0tools\7za" x -y cpn3.key
echo.
del cpn3.key /Q
cd "%~dp0"
ping localhost -n 3 >nul
echo Deleting archieves..
copy tools\scatter_file.txt recovery\CPN3
ping localhost -n 3 >nul
del tools\scatter_file.txt /Q
cd "%~dp0"
goto ini1
:fix2
cd "%~dp0"
if exist recovery\CPN3\scatter_file-CPN3L.txt (goto ini1)
if %DEVICE%==CPN3L (
echo Downloading required modules..
cd recovery\CPN3L
echo.
ping localhost -n 3 >nul
"%~dp0tools\wget.exe" https://coolpadtoolkit.files.wordpress.com/2016/10/cpn3l.key --no-check-certificate
if errorlevel 1 (
cls
ping localhost -n 3 >nul
echo Error while downloading..
ping localhost -n 3 >nul
goto ini1
)
ping localhost -n 3 >nul
echo.
echo Extracting..
"%~dp0tools\7za" x -y cpn3l.key
echo.
del cpn3l.key /Q
ping localhost -n 3 >nul
cd "%~dp0"
echo Deleting archieves..
copy tools\scatter_file-CPN3L.txt recovery\CPN3L
ping localhost -n 3 >nul
del tools\scatter_file-CPN3L.txt /Q
cd "%~dp0"
)
goto ini1
:fix3
cd "%~dp0"
if %DEVICE%==CPN3 (goto fix3a)
if %DEVICE%==CPN3L (goto fix3b)
goto ini1
:fix3a
echo  Fixing Modules..
echo.
rename recovery\%DEVICE%\recovery-twrp-m.img recovery-twrp-mm.img
ping localhost -n 2 >nul
goto ini1
:fix3b
echo.
echo Downloading Some Fix Modules..
echo.
if exist recovery\%DEVICE%\recovery-twrp-m.img (del recovery\%DEVICE%\recovery-twrp-m.img /Q)
tools\curl -L -C - -o recovery\%DEVICE%\recovery-twrp-mm.img http://www.coolpadtoolkit.files.wordpress.com/2016/11/recovery-twrp-mm.key
if errorlevel 1 (
echo.
echo  Due to Some reasons We can't download your module..
echo.
echo  Because of Web Connectivity..
echo.
echo  Download it manually from here : :
echo.
echo  https://coolpadtoolkit.files.wordpress.com/2016/11/recovery-twrp-mm.key
echo.
echo  Rename That File to recovery-twrp-mm.img and place that file here : :
echo.
echo %~dp0\recovery\%DEVICE%
echo.
echo.
pause
goto ini1
)
goto ini1
:Deviceerror
cls
echo.
ping localhost -n 2 >nul
echo  An Error Occured..
ping localhost -n 3 >nul
echo.
echo  This Option is not supported on Current Device..
ping localhost -n 3 >nul
echo.
echo  To view this option you can select Basic Toolkit..
ping localhost -n 5 >nul
echo.
echo.
echo I: RETURNING TO MAINMENU
ping localhost -n 4 >nul
goto RESTART
:encryptionstate12
cls
ping localhost -n 3 >nul
echo  Your phone is Encrypted..
echo.
ping localhost -n 3 >nul
echo  You cannot install mods on it..
ping localhost -n 3 >nul
echo.
echo  For this you need to Format and Do some stuff your phone..
echo.
ping localhost -n 3 >nul
:thisfix
set ASK=Grabage
echo.
SET /P ASK=[*] Do you want to apply a Fix For This [Y]es or [N]o :- 
if %ASK%==Y goto fixen1 
if %ASK%==y goto fixen1
if %ASK%==n goto nofixforencrypt
if %ASK%==N goto nofixforencrypt
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
cls
goto thisfix
:fixen1
SET ASK1=Grabage
set encryptionfinalstate=Grabage
cls
echo.&echo.
echo  -----------------------------------------------------------------------------------
echo  What we are gonna doing..
echo.
echo  By Accepting Yes From the Window To apply this Fix, we will first take you to 
echo  Android stock recovery,from here you have to format your phone and will take you to 
echo  fastboot mode then from we will install custom TWRP recovery and then you need to 
echo  format your phone, from the there.. and then we will sideload root and root your
echo  device.
echo.
echo  NOTE: YOUR DATA WILL BE WIPED IT IS NECESSARY TO TAKE A BACKUP OF YOUR DEVICE, So
ECHO  ----- QUICKLY TAKE A BACKUP OF DEVICE FROM THIS TOOLKIT AND AGAIN RUN THIS OPTION
ECHO  WHEN EVERYTHING IS DONE. RESTORE YOUR DEVICE.
ECHO.
echo  Press "x" to return to MAINMENU
echo  -----------------------------------------------------------------------------------
echo.
SET /P encryptionfinalstate=[*] Ready To apply This Fix [Y]es or [N]o :- 
if %encryptionfinalstate%==Y goto rip
if %encryptionfinalstate%==y goto rip
if %encryptionfinalstate%==n goto nofixforencrypt
if %encryptionfinalstate%==N goto nofixforencrypt
if %encryptionfinalstate%==X goto nofixforencrypt
if %encryptionfinalstate%==x goto nofixforencrypt
echo.
echo  You went crazy, Entering Option which is actually not present :0
echo.
pause
cls
goto fixen1
:rip
cls
echo.
echo  Lets Take you to STOCK Recovery Mode..:)
adb reboot recovery
if errorlevel 1 goto error13
ping localhost -n 6 >nul
cls
ping localhost -n 3 >nul
echo.
echo  Now Hold First Power button and then Volume up button to for 5 sec then
echo  release it.
echo.
echo  FROM HERE Select your Volume keys to move up and down and Power Key to Select
echo.
echo  1. Go to Wipe Data Factory Reset and Fully reset your phone..
echo.
echo  2. Now select option which says "reboot to bootloader" Wait till your phones
echo     boot into bootloader..
echo.
echo  DO NOT DISCONNECT YOUR PHONE FROM PC TILL END..
echo.
echo  Once done,, press Enter..
echo.
pause
cls
ping localhost -n 2 >nul
echo  Applying a Fix 1..
ping localhost -n 6 >nul
fastboot -i 0x1EBF flash recovery recovery\%DEVICE%\recovery-TWRP-mm.img
if errorlevel 1 (
echo.
echo  OOPPS ERROR.. YOU R Not using Proper USB Cable..
ping localhost -n 2 >nul
echo  Let it be lets try again..
ping localhost -n 2 >nul
goto flashagainforsatisfaction
)
:FIREINHOLE
ping localhost -n 3 >nul
echo.
echo  TWRP FLASHED SUCCESSFULLY..
echo.
echo  OKAY NOW LISTEN.. HOLD YOUR POWER BUTTON AND VOLUME UP KEY SIMULTANEOUSLY TO BOOT
echo  INTO RECOVERY MODE :) 
ECHO.
ECHO  Once Done.. Press Enter..
echo.
pause
echo.
cls
echo.
ping localhost -n 3 >nul
echo  Now You have booted to TWRP. 
echo  OKAY Sometimes they might tell you to type 'yes' for some instance. Type 'yes' in
echo  a given box..
echo.
echo  SO, From here you first need to Go to Wipe ^> Swipe Right to wipe your phone..
echo  Once done.. Then again go to WIPE ^> Advanced wipe and Format
echo   -Dalvik \ ART Cache
echo   -Cache
echo   -Internal Storage
echo.
echo  Once Done.. Go to ADVANCED ^> ADB Sideload and Swipe right to sideload..
echo.
echo  Press Enter when done..
echo.
pause
echo.
cls
:lk
echo.
adb devices > _tmp.txt
echo I: Waiting for Device to detect in Sideload..!
ping localhost -n 2 >nul
for /F "tokens=2" %%i in (_tmp.txt) do (set fff=%%i)
if %fff%==sideload (goto lk1) else (goto lk)
:lk1
ping localhost -n 2 >nul
echo  Now We will flash Root on your device..
ping localhost -n 3 >nul
adb sideload root\BETA-SuperSU.zip
if errorlevel 1 (
echo.
echo  Opps Got an error you need to manually flash it..later,,:)
echo.
)
echo.
ping localhost -n 3 >nul
cls
ping localhost -n 2 >nul
echo.
echo  GO to BACK and..
echo.
echo  SO, again you need to Go to Wipe ^> Swipe Right to wipe your phone..
echo  Once done.. Then again go to WIPE ^> Advanced wipe and Format
echo   -Dalvik \ ART Cache
echo   -Cache
echo   -Internal Storage
echo.
echo  Once Done.. you can Reboot your Phone.. by
echo  REBOOT ^> SYSTEM
echo.
echo  That's it you have Successfully dencrypted your Phone..
echo.
echo  Note:- First Boot may take 10-15 min. to start your phone.. so have patience
echo.
pause
ping localhost -n 3 >nul
echo.
echo I: RETURNING to MAINMENU..
echo.
ping localhost -n 3 >nul
goto RESTART
:nofixforencrypt
cls
echo.
ping localhost -n 3 >nul
echo  You left your phone Encrypted..
echo.
ping localhost -n 3 >nul
echo  Be Sure..While doing this, It can be Brick also..
echo.
ping localhost -n 3 >nul
echo.
echo I: Returning to MAINMENU
echo.
ping localhost -n 3 >nul
goto RESTART
:encrytionmode
cls
echo.
ping localhost -n 3 >nul
echo  Wiping Data..
ping localhost -n 3 >nul
fastboot -i 0x1EBF -w
echo.
ping localhost -n 3 >nul
echo  Done..
ping localhost -n 4 >nul
echo.
echo  Rebooting With Auto boot..
fastboot -i 0x1EBF continue
ping localhost -n 5 >nul
echo.
echo Done..
ping localhost -n 3 >nul
echo.
echo  Now disconnect your phone and follow on screen instructions
echo  As it has been wiped you need to set it again..
ping localhost -n 3 >nul
echo.
pause
goto RESTART
:cpn5info
cls
echo.
echo  Since Our Current Repartioning System Doesn't Work on CPN5.
echo.
echo  We can't flash TWRP using loki_tool or flash_image.
echo.
echo  If you want to flash TWRP on CPN5 Head to recovery\CPN5\ directory
echo.
echo  Here you will find all recoveries for CPN5.. mm represents for Marshmallow
echo  and n represents for Noughat. Flash this recovery through Flashify App.
echo.
pause
goto flashcus
:flashagainforsatisfaction
cls
adb reboot bootloader
if errorlevel 1 (
echo.
echo  GO QUICKLY PRESS VOLUME AND POWER KEYS TO BOOT UR PHONE INTO FASTBOOT
echo.
echo  For Coolpad :- Volume UP + Down ^& Power Button for 7 secs
echo.
)
echo Press Enter Once done..
echo.
pause
fastboot -i 0x1EBF flash recovery recovery\%DEVICE%\recovery-TWRP-mm.img
if errorlevel 1 (echo. && echo You are getting again error,, check if you have left some process.. && echo. && echo I won't be helping you for this.. BYE BYE.. && pause && goto RESTART)
goto FIREINHOLE
:exit1
cls
adb kill-server
echo  ===================================================================================
echo.
echo                           THANK YOU FOR USING THIS TOOLKIT
echo.
echo                                  HAVE A GOOD DAY :)
echo.
echo                                    Written by KP
echo.
echo  ===================================================================================
:exit5
ping localhost -n 3 >nul
if exist tools\device.log (del tools\device.log /Q)
taskkill /F /IM cmd.exe >nul
EXIT
