@ECHO off
REM Licensed Materials - Property of IBM
REM 5648-F10 (C) Copyright International Business Machines Corp. 2005 
REM All Rights Reserved
REM US Government Users Restricted Rights- Use, duplication or disclosure
REM restricted by GSA ADP Schedule Contract with IBM Corp.

SETLOCAL

    CALL "%~dp0GetShortName.bat" "%~dp0" LaunchPadBatchPath
    CALL "%LaunchPadBatchPath%\SetTmp.bat"
    CALL "%LaunchPadBatchPath%\GetLocale.bat"
    IF exist "%LaunchPadBrowser%" GOTO :gotbrowser
    CALL "%LaunchPadBatchPath%\readRegistry.bat" "HKEY_LOCAL_MACHINE\Software\Clients\StartMenuInternet\MOZILLA.EXE\shell\open\command" @ moz LaunchPadMozillaPath

    REM Normalize the path by removing all quotes
    SET LaunchPadMozillaPath=%LaunchPadMozillaPath:"=%

    CALL "%LaunchPadBatchPath%\GetShortName.bat" "%LaunchPadMozillaPath%" LaunchPadBrowser
:gotbrowser
    IF not exist "%LaunchPadBrowser%" (
	SET LaunchPadBrowser=
	SET LaunchPadDefaultBrowser=
	GOTO :forceIE
    )
    IF not exist "%systemroot%\system32\mshta.exe" SET LaunchPadNoHTA=true
    IF not {%LaunchPadNoHTA%} == {} goto :forceNoHTA
:forceIE
    "%LaunchPadBatchPath%\IExplore.bat"

:forceNoHTA
    SET MOZ_NO_REMOTE=1
    SET LaunchPadProfileName=IBM_LaunchPad_%RANDOM%
    COPY /Y "%USERPROFILE%\Application Data\Mozilla\registry.dat" %LaunchPadTemp%\%LaunchPadProfileName%.dat >nul 2>&1
    "%LaunchPadBrowser%" -nosplash -CreateProfile %LaunchPadProfileName%

    SET LaunchPadProfilePath=
    ( FOR /f "tokens=1" %%A in ('DIR "%USERPROFILE%\Application Data\Mozilla\Profiles\%LaunchPadProfileName%\*.slt" /a:d /b /o:d') DO SET LaunchPadProfilePath=%USERPROFILE%\Application Data\Mozilla\Profiles\%LaunchPadProfileName%\%%A) 2>nul

    IF "{%LaunchPadProfilePath%}" == {} (
        COPY /Y %LaunchPadTemp%\%LaunchPadProfileName%.dat "%USERPROFILE%\Application Data\Mozilla\registry.dat" >nul 2>&1
	SET LaunchPadBrowser=
	SET LaunchPadDefaultBrowser=
	GOTO :forceIE
    )

    ECHO user_pref("browser.frames.enabled", true); >"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("browser.shell.checkDefaultBrowser", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("javascript.enabled", true); >>"%LaunchPadProfilePath%\user.js"
	ECHO user_pref("security.fileuri.origin_policy", 4); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("security.enable_java", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("security.xpconnect.plugin.unrestricted", true); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("security.warn_entering_secure", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("security.warn_leaving_secure", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("security.warn_entering_weak", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("security.warn_viewing_mixed", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("security.warn_submit_insecure", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("signon.rememberSignons", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("update_notifications.enabled", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("browser.bookmarks.added_static_root", true); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("intl.charsetmenu.browser.cache", "ISO-8859-1"); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("autoadmin.failover_to_cached", true); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("advanced.always_load_images", true); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("advanced.system.supportDDEExec", true); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("browser.PICS.disable_for_this_session", true); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("privacy.popups.first_popup", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("browser.allowpopups", true); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("browser.block.target_new_window", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("browser.cache.enable", true); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("browser.turbo.enabled", false); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("dom.allow_scripts_to_close_windows", true); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("dom.disable_window_move_resize", false); >>"%LaunchPadProfilePath%\user.js"    
    ECHO user_pref("nglayout.initialpaint.delay", 0); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("capability.principal.codebase.p0.granted", "UniversalXPConnect UniversalBrowserWrite"); >>"%LaunchPadProfilePath%\user.js"
    ECHO user_pref("browser.tabs.autoHide", true); >>"%LaunchPadProfilePath%\user.js"
         
rem browser.helperApps.neverAsk.saveToDisk

    SET LaunchPadURL=file://
    SET LaunchPadSourcePathTemp=%LaunchPadBatchPath%\%Mozilla.html
    REM Check for UNC (no :)
    FOR /f "tokens=1-2  delims=:" %%A in ("%LaunchPadSourcePathTemp%") DO IF {%%B} == {} SET LaunchPadURL=%LaunchPadURL%//
:getURL
    FOR /f "tokens=1* delims=\" %%A in ("%LaunchPadSourcePathTemp%") DO (
	IF {%%A} == {} GOTO :gotURL
	SET LaunchPadURL=%LaunchPadURL%/%%A
	SET LaunchPadSourcePathTemp=%%B
        GOTO :getURL
    )
:gotURL
    ECHO user_pref("capability.principal.codebase.p0.id", "%LaunchPadURL%?%LaunchPadLocale%"); >>"%LaunchPadProfilePath%\user.js"
    CALL "%LaunchPadBatchPath%\getOS.bat"
    SET LaunchPadOSType=windows

    COPY /Y "%LaunchPadBatchPath%\RunMozilla.bat" "%LaunchPadTemp%\RunMozilla.bat" >nul 2>&1
    "%LaunchPadTemp%\RunMozilla.bat" 2>nul

ENDLOCAL
