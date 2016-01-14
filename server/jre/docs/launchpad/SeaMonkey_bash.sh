#!/bin/bash
# Licensed Materials - Property of IBM
# 5648-F10 (C) Copyright International Business Machines Corp. 2005, 2007
# All Rights Reserved
# US Government Users Restricted Rights - Use, duplication or disclosure
# restricted by GSA ADP Schedule Contract with IBM Corp.

case "$BROWSER" in
   !) BROWSER="";;  
   "") PATH="$PATH:/usr/X11R6/bin:/usr/local/bin:/usr/bin:/opt/seamonkey:/usr/seamonkey:/usr/sfw/lib/mozilla:/usr/local/seamonkey/"; BROWSER=seamonkey; export BROWSER;;
esac
LaunchPadBrowser=$BROWSER; export LaunchPadBrowser
locale=`$installsourcepath/GetLocale.sh`
if [ -n "$LaunchPadBrowser" ]; then
    case `("$LaunchPadBrowser" -version) 2>/dev/null` in
        *rv:1.[7-9]*) :;;
        *rv:[2-9].[0-9]*) :;;
        *rv:*) LaunchPadBrowser="";;
        SeaMonkey\ 1.[0-9]*) :;;
        SeaMonkey\ [2-9].[0-9]*) :;;
        *) LaunchPadBrowser="";;
    esac
fi
if [ -z "$LaunchPadBrowser" ]; then
    \cd ..
    rm -rf $LaunchPadTmpDir
    $installsourcepath/NoBrowser.sh
    exit 1
fi
LaunchPadURL="file://$installsourcepath/Mozilla.html"
[ -f $HOME/.mozilla-license ] && ln -sf $HOME/.mozilla-license $LaunchPadTmpDir 2>/dev/null
[ -f $HOME/.Xauthority ] && ln -sf $HOME/.Xauthority $LaunchPadTmpDir 2>/dev/null
LaunchPadOS=`uname`; export LaunchPadOS
LaunchPadOSType=unix; export LaunchPadOSType
[ -n "$LaunchPadLocale" ] || LaunchPadLocale=$locale; export LaunchPadLocale
LaunchPadHOME=$HOME; export LaunchPadHOME
HOME=$LaunchPadTmpDir; export HOME
LaunchPadProfileName=IBM_LaunchPad_$$

LaunchPadLogName=$LOGNAME; export LaunchPadLogName
#typeset +r LOGNAME 2>/dev/null
#LOGNAME=lp_user_$$; export LOGNAME

MOZ_NO_REMOTE=1; export MOZ_NO_REMOTE

"$LaunchPadBrowser" -nosplash -CreateProfile "$LaunchPadProfileName $LaunchPadTmpDir/Profiles" >/dev/null 2>&1

for userprefpath in $LaunchPadTmpDir/Profiles/$LaunchPadProfileName/*.slt;do 
    if [ ! -d $userprefpath ]; then
	set -x
	"$LaunchPadBrowser" -nosplash -CreateProfile "$LaunchPadProfileName $LaunchPadTmpDir/Profiles"
	set +x
	\cd ..
	rm -rf $LaunchPadTmpDir
	$installsourcepath/NoBrowser.sh
	exit 2
    fi
    mkdir $userprefpath/chrome >/dev/null 2>&1
    echo 'user_pref("capability.principal.codebase.p0.granted", "UniversalXPConnect UniversalBrowserWrite");' >$userprefpath/user.js
    echo 'user_pref("capability.principal.codebase.p0.id", "'${LaunchPadURL}'");' >>$userprefpath/user.js
    echo 'user_pref("browser.frames.enabled", true);' >>$userprefpath/user.js
    echo 'user_pref("browser.shell.checkDefaultBrowser", false);' >>$userprefpath/user.js
    echo 'user_pref("javascript.enabled", true);' >>$userprefpath/user.js
    echo 'user_pref("security.fileuri.origin_policy", 4);' >>$userprefpath/user.js
    echo 'user_pref("security.enable_java", false);' >>$userprefpath/user.js
    echo 'user_pref("security.xpconnect.plugin.unrestricted", true);' >>$userprefpath/user.js
    echo 'user_pref("update_notifications.enabled", false);' >>$userprefpath/user.js
    echo 'user_pref("security.warn_entering_secure", false);' >>$userprefpath/user.js
    echo 'user_pref("security.warn_leaving_secure", false);' >>$userprefpath/user.js
    echo 'user_pref("security.warn_entering_weak", false);' >>$userprefpath/user.js
    echo 'user_pref("security.warn_viewing_mixed", false);' >>$userprefpath/user.js
    echo 'user_pref("security.warn_submit_insecure", false);' >>$userprefpath/user.js
    echo 'user_pref("signon.rememberSignons", false);' >>$userprefpath/user.js
    echo 'user_pref("browser.bookmarks.added_static_root", true);' >>$userprefpath/user.js
    echo 'user_pref("intl.charsetmenu.browser.cache", "ISO-8859-1");' >>$userprefpath/user.js
    echo 'user_pref("browser.search.opensidebarsearchpanel", false);' >>$userprefpath/user.js
    echo 'user_pref("privacy.popups.first_popup", false);' >>$userprefpath/user.js
    echo 'user_pref("browser.allowpopups", true);' >>$userprefpath/user.js
    echo 'user_pref("dom.allow_scripts_to_close_windows", true);' >>$userprefpath/user.js
    echo 'user_pref("dom.disable_window_move_resize", false);' >>$userprefpath/user.js
    echo 'user_pref("nglayout.initialpaint.delay", 0);' >>$userprefpath/user.js
    echo 'user_pref("security.fileuri.strict_origin_policy", false);' >>$userprefpath/user.js
    echo 'user_pref("browser.tabs.autoHide", true);' >>$userprefpath/user.js
done

exec /bin/sh -c "trap '' 1
  ( set -x
  \"$LaunchPadBrowser\" -nosplash -P $LaunchPadProfileName $LaunchPadURL )
  \cd ..
  rm -rf $LaunchPadTmpDir"
