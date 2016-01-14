#!/bin/sh
# Licensed Materials - Property of IBM
# 5648-F10 (C) Copyright International Business Machines Corp. 2005, 2007
# All Rights Reserved
# US Government Users Restricted Rights - Use, duplication or disclosure
# restricted by GSA ADP Schedule Contract with IBM Corp.

supportedMozillaVersion()
{
	case "$*" in
		*rv:1.[7-9]*) return 0;;
		*rv:[2-9].[0-9]*) return 0;;
		*rv:*) return 1;;
		Mozilla\ 1.[7-9]*) return 0;;
		Mozilla\ [2-9].[0-9]*) return 0;;
		SeaMonkey\ 1.[0-9]*) return 0;;
		SeaMonkey\ [2-9].[0-9]*) return 0;;
		*) return 1;;
	esac
}

supportedFirefoxVersion()
{
	case "$*" in
		*Firefox\ [1-9].*) return 0;;
		*Firefox/[1-9].*) return 0;;
		*Firefox*) return 1;;
		*rv:1.[7-9]*) return 0;;
		*rv:[2-9].*) return 0;;
		*rv:*) return 1;;
		Mozilla*\ 1.[7-9]*) return 0;;
		Mozilla*\ [2-9].[0-9]*) return 0;;
		*) return 1;;
	esac
}

supportedSeaMonkeyVersion()
{
	case "$*" in
		SeaMonkey\ 1.[0-9]*) return 0;;
		SeaMonkey\ [2-9].[0-9]*) return 0;;
		*) return 1;;
	esac
}

whichBrowser=NoBrowser

#If BROWSER isn't set, check LaunchPadDefaultBrowser
if [ -z "$BROWSER" -o "$LaunchPadTest" ]; then
	if [ "$LaunchPadDefaultBrowser" ]; then
		#First see if LaunchPadDefaultBrowser needs to be translated from one of the supported values
		if [ $LaunchPadDefaultBrowser = "MozillaHTML" ]; then
			LaunchPadDefaultBrowser=mozilla;
		fi
		if [ $LaunchPadDefaultBrowser = "Mozilla" ]; then
			LaunchPadDefaultBrowser=mozilla;
		fi
		if [ $LaunchPadDefaultBrowser = "FirefoxHTML" ]; then
			LaunchPadDefaultBrowser=firefox;
		fi
		if [ $LaunchPadDefaultBrowser = "Firefox" ]; then
			LaunchPadDefaultBrowser=firefox;
		fi
		if [ $LaunchPadDefaultBrowser = "SeaMonkeyHTML" ]; then
			LaunchPadDefaultBrowser=seamonkey;
		fi
		if [ $LaunchPadDefaultBrowser = "SeaMonkey" ]; then
			LaunchPadDefaultBrowser=seamonkey;
		fi
		#Finally, set the browser
		BROWSER=$LaunchPadDefaultBrowser; export BROWSER;
	fi
fi

# Some versions of Eclipse are setting MOZILLA_FIVE_HOME to a location that does not have the scripts required to run mozilla -version, so we clear this variable when running from the tooling on Linux
if [ "$LaunchPadTest" ]; then
	MOZILLA_FIVE_HOME=
	export MOZILLA_FIVE_HOME
fi

if [ "$BROWSER" ]; then
	if versionString=`("$BROWSER" -version) 2>/dev/null`; then
		case "$versionString" in
			*Firefox*)	if supportedFirefoxVersion "$versionString"; then
							whichBrowser=Firefox
						fi ;;
			*Mozilla*)	if supportedMozillaVersion "$versionString"; then
							whichBrowser=Mozilla
						fi ;;
			*SeaMonkey*)if supportedSeaMonkeyVersion "$versionString"; then
							whichBrowser=SeaMonkey
						fi ;;
		esac
	fi
fi

if [ $whichBrowser = NoBrowser ]; then
	PATH="$PATH:/usr/X11R6/bin:/usr/local/bin:/usr/bin:/opt/seamonkey:/usr/seamonkey:/usr/sfw/lib/mozilla:/usr/local/seamonkey/";export PATH
	if versionString=`(seamonkey -version) 2>/dev/null`; then
		BROWSER=seamonkey; export BROWSER
		if supportedSeaMonkeyVersion "$versionString"; then
			whichBrowser=SeaMonkey
		fi
	fi
fi

if [ $whichBrowser = NoBrowser ]; then
	PATH="$PATH:/usr/X11R6/bin:/usr/local/bin:/usr/bin:/opt/firefox:/usr/firefox:/usr/firefox/sfw/lib/firefox";export PATH
	if versionString=`(firefox -version) 2>/dev/null`; then
		BROWSER=firefox; export BROWSER
		if supportedFirefoxVersion "$versionString"; then
			whichBrowser=Firefox
		fi
	fi
fi

if [ $whichBrowser = NoBrowser ]; then
	PATH="$PATH:/usr/X11R6/bin:/usr/local/bin:/usr/bin:/opt/mozilla:/usr/mozilla:/usr/sfw/lib/mozilla";export PATH
	if versionString=`(mozilla -version) 2>/dev/null`; then
		BROWSER=mozilla; export BROWSER
		if supportedMozillaVersion "$versionString"; then
			whichBrowser=Mozilla
		fi
	fi
fi

LaunchPadBrowserPath=$PATH; export LaunchPadBrowserPath
LaunchPadDefaultBrowser=$BROWSER; export LaunchPadDefaultBrowser
export whichBrowser
if [ "$LaunchPadTest" ]; then
    echo $LaunchPadBrowserPath
    echo $BROWSER
fi

