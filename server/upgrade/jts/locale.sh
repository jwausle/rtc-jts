#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2006, 2015. All Rights Reserved.
#  
#  Note to U.S. Government Users Restricted Rights:  
#  Use, duplication or disclosure restricted by GSA ADP Schedule 
#  Contract with IBM Corp. 
#  *******************************************************************************

if [ "$SCRIPT_DIR" = "" ]; then
	LOCALE_CMD=true
	SCRIPT_DIR=`dirname $0`
else
	LOCALE_CMD=false
fi

# Messages script
if [ "$LANG" = "" ]; then
	LANGUAGE=`locale | grep "LC_MESSAGES"`
	if [ "$LANGUAGE" != "" ]; then
		LANGUAGE=`echo $LANGUAGE | cut -d'=' -f2`
		if [ _$LANGUAGE_ != __ ]; then
			TMP_LANG=`echo $LANGUAGE | cut -d'"' -f1`
			if [ "$TMP_LANG" = "" ]; then
				LANGUAGE=`echo $LANGUAGE | cut -d'"' -f2`
			else
				LANGUAGE=$TMP_LANG
			fi
			LANGUAGE=`echo $LANGUAGE | cut -d'.' -f1`
		fi
	fi
else
	LANGUAGE=`echo $LANG | cut -d'.' -f1`
fi
LANG_SUFFIX=
if [ "$LANGUAGE" = "" ]; then
	echo "No language was set so English messages will be used."
else
	LANG_GROUP=`echo $LANGUAGE | cut -d'_' -f1`
	case $LANG_GROUP in
		# Common supported language, keep only language main group
		cs | de | es | fr | hu | it | ja | ko | pl | ru | tr)
			if [ -f $SCRIPT_DIR/messages/messages_${LANG_GROUP}.sh ]; then
				LANG_SUFFIX=_${LANG_GROUP}
			elif [ $LOCALE_CMD = false ]; then
				echo "$LANGUAGE language is not supported yet. English messages will be used."
			fi
			;;
		# Specific language groups
		# Portuguese, keep only Brasilian secondary language
		pt)
			if [ -f $SCRIPT_DIR/messages/messages_${LANGUAGE}.sh ]; then
				LANG_SUFFIX=_${LANGUAGE}
			elif [ $LOCALE_CMD = false ]; then
				echo "$LANGUAGE language is not supported yet. English messages will be used."
			fi
			;;
		# Chinese, split between two groups: simplified and traditional
		zh)
			case $LANGUAGE in
				zh_TW | zh_HK)
					if [ -f $SCRIPT_DIR/messages/messages_zh_TW.sh ]; then
						LANG_SUFFIX=_zh_TW
					elif [ $LOCALE_CMD = false ]; then
						echo "$LANGUAGE language is not supported yet. English messages will be used."
					fi
					;;
				*)
					if [ -f $SCRIPT_DIR/messages/messages_zh.sh ]; then
						LANG_SUFFIX=_zh
					elif [ $LOCALE_CMD = false ]; then
						echo "$LANGUAGE language is not supported yet. English messages will be used."
					fi
					;;
			esac
			;;
		# Native language (English locales)
		en)
			;;
		# Unsupported languages
		*)
			if [ $LOCALE_CMD = false ]; then
				echo "$LANGUAGE language is not supported yet. English messages will be used."
			fi
			;;
	esac
fi
. $SCRIPT_DIR/messages/messages$LANG_SUFFIX.sh

if [ $LOCALE_CMD = true ]; then
	if [ $# -gt 0 ]; then
		case $1 in
			-jts | -ccm | -qm | -rm | -gc)
				UPGRADED_APP=`echo $1 | cut -c2-`
				shift
				;;
		esac
		if [ "$1" = "-showParamFileName" ]; then
			if [ "$UPGRADED_APP" = "" ]; then
				messages SHOW_PARAM_FILE_NAMES_LIST $SCRIPT_DIR $LANG_SUFFIX
			else
				messages SHOW_PARAM_FILE_NAME $SCRIPT_DIR/params/${UPGRADED_APP}_params${LANG_SUFFIX}.sh
			fi
		fi
	fi
fi
