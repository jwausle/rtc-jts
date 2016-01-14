#!/bin/sh
#
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2006, 2015. All Rights Reserved.
#  
#  Note to U.S. Government Users Restricted Rights:  
#  Use, duplication or disclosure restricted by GSA ADP Schedule 
#  Contract with IBM Corp. 
#  *******************************************************************************


# ******************
# * Initialization *
# ******************

START_DIR=`pwd`
RM_40x=false
# Ensure the app_upgrade script was not called directly.
if [ "$SCRIPT_DIR" = "" ]; then
	INVALID_LAUNCH=true
	SCRIPT_DIR=`dirname $0`
else
	INVALID_LAUNCH=false
fi

# Read functions
. $SCRIPT_DIR/functions.sh
setSafePath
getAbsolutePath $SCRIPT_DIR
SCRIPT_DIR=$ABSOLUTE_PATH

# Messages script
. $SCRIPT_DIR/locale.sh
. $SCRIPT_DIR/messages/messages$LANG_SUFFIX.sh

# Exit in case of invalid launch
if [ $INVALID_LAUNCH = true ]; then
	messages INVALID_LAUNCH
	exit 10
fi

# First argument is the kind of upgrading
# Should be only -jts, -rtc, -rqm, -rm or -gc
if [ $# -eq 0 ]; then
	messages MISSING_APP_TYPE
	exit 10
fi
case $1 in
	-jts | -ccm | -qm | -rm | -gc)
		UPGRADED_APP=`echo $1 | cut -c2-`
		shift
		;;
	*)
		messages INVALID_APP_TYPE $1
		exit 10
		;;
esac

# Set parameters values from file
. $SCRIPT_DIR/params/${UPGRADED_APP}_params$LANG_SUFFIX.sh
if [ -n "${DB_JDBC_LOCATION_VALUE}" ]; then
	DB_JDBC_LOCATION=db.jdbc.location=$DB_JDBC_LOCATION_VALUE
fi
if [ -n "${DB_JDBC_PASSWORD_VALUE}" ]; then
	DB_JDBC_PASSWORD=db.jdbc.password=$DB_JDBC_PASSWORD_VALUE
fi
if [ -n "${DB_DB2I_SCHEMA_NAME_VALUE}" ]; then
	DB_DB2I_SCHEMA_NAME_VALUE=db.db2i.schema.name=$DB_DB2I_SCHEMA_NAME_VALUE
fi
if [ -n "${DB_DB2_DSN_DBNAME_VALUE}" ]; then
	DB_DB2_DSN_DBNAME_VALUE=db.db2.dsn.dbname=$DB_DB2_DSN_DBNAME_VALUE
fi
if [ -n "${DB_SCHEMA_PREFIX_VALUE}" ]; then
	DB_SCHEMA_PREFIX_VALUE=db.schemaPrefix=$DB_SCHEMA_PREFIX_VALUE
fi
# Starting dir should be server dir
getAbsolutePath $SCRIPT_DIR/..
SERVER_DIR=`dirname $ABSOLUTE_PATH`
if [ $START_DIR != $SERVER_DIR ]; then
	if [ "$1" = "-help" ]; then
		help
	else
		messages INVALID_START_DIR ${UPGRADED_APP}_upgrade.sh $SERVER_DIR
	fi
	exit 10
fi

# *********************
# * Arguments reading *
# *********************
while [ $# -gt 0 ]
do
	case $1 in
		-oldApplicationHome | -oldapplicationhome )
			if [ $UPGRADED_APP = jts ]; then
				messages INVALID_PARAM $1
				exit 1
			else
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				if [ -d $2 ]; then
					if [ "`echo $2 | cut -d'/' -f1`" = "" ]; then
						OLD_APPLICATION_HOME=$2
						shift
					else
						messages RELATIVE_PARAM_DIR $1 $2
						exit 1
					fi
				else
					messages INVALID_PARAM_DIR $1 $2
					exit 1
				fi
			fi
			;;
		-applicationContextRoot | -applicationcontextroot)
			if [ $UPGRADED_APP = jts ]; then
				messages INVALID_PARAM $1
				exit 1
			else
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1;
				fi
				APPLICATION_CONTEXT_ROOT=$2
				shift
			fi
			;;
		-newApplicationHome | -newapplicationhome)
			if [ $UPGRADED_APP = jts ]; then
				messages INVALID_PARAM $1
				exit 1
			else
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				if [ -d $2 ]; then
					getAbsolutePath $2
					NEW_APPLICATION_HOME=$ABSOLUTE_PATH
					shift
				else
					messages INVALID_PARAM_DIR $1 $2
					exit 1
				fi
			fi
			;;
		-oldJTSHome | -oldjtshome)
			if [ $UPGRADED_APP = jts ] || [ $UPGRADED_APP = rm ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				if [ -d $2 ]; then
					if [ "`echo $2 | cut -d'/' -f1`" = "" ]; then
						OLD_JTS_HOME=$2
						shift
					else
						messages RELATIVE_PARAM_DIR $1 $2
						exit 1
					fi
				else
					messages INVALID_PARAM_DIR $1 $2
					exit 1
				fi
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-updateTomcatFiles | -updatetomcatfiles)
			if [ $# -eq 1 ]; then
				messages MISSING_PARAM_VALUE $1
				exit 1
			fi
			if [ "$2" != "yes" ] && [ "$2" != "no" ]; then
				messages INVALID_PARAM_VALUE $1 $2
				exit 1
			fi
			UPDATE_TOMCAT_FILES=$2
			shift
			;;
		-oldJTSContextRoot | -oldjtscontextroot)
			if [ $UPGRADED_APP = rm ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				OLD_JTS_CONTEXT_ROOT=$2
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-oldApplicationTomcatHome | -oldapplicationtomcathome)
			if [ $UPGRADED_APP = rm ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				if [ "`echo $2 | cut -d'/' -f1`" = "" ]; then
					OLD_TOMCAT_HOME=$2
					shift
				else
					messages RELATIVE_PARAM_DIR $1 $2
					exit 1
				fi
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-oldJTSTomcatHome | -oldjtstomcathome)
			if [ $UPGRADED_APP = rm ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				if [ "`echo $2 | cut -d'/' -f1`" = "" ]; then
					OLD_JTS_TOMCAT_HOME=$2
					shift
				else
					messages RELATIVE_PARAM_DIR $1 $2
					exit 1
				fi
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-newJTSContextRoot | -newjtscontextroot)
			if [ $UPGRADED_APP = rm ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				JTS_CONTEXT_ROOT=$2
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-db.jdbc.location) 
			if [ $UPGRADED_APP = rm ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				DB_JDBC_LOCATION=db.jdbc.location=$2
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-db.jdbc.password) 
			if [ $UPGRADED_APP = rm ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				DB_JDBC_PASSWORD=db.jdbc.password=$2
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-db.db2i.schema.name) 
			if [ $UPGRADED_APP = rm ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				DB_DB2I_SCHEMA_NAME=db.db2i.schema.name=$2
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-db.db2.dsn.dbname) 
			if [ $UPGRADED_APP = rm ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				DB_DB2_DSN_DBNAME=db.db2.dsn.dbname=$2
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-db.schemaPrefix) 
			if [ $UPGRADED_APP = rm ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				DB_SCHEMA_PREFIX=db.schemaPrefix=$2
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-oldTomcatHome | -oldtomcathome)
			if [ $UPGRADED_APP != rm ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				if [ "`echo $2 | cut -d'/' -f1`" = "" ]; then
					OLD_TOMCAT_HOME=$2
					shift
				else
					messages RELATIVE_PARAM_DIR $1 $2
					exit 1
				fi
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-jtsContextRoot | -jtscontextroot)
			if [ $# -eq 1 ]; then
				messages MISSING_PARAM_VALUE $1
				exit 1
			fi
			JTS_CONTEXT_ROOT=$2
			shift
			;;
		-lpaContextRoot | -lpacontextroot)
			if [ $UPGRADED_APP = jts ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				LPA_CONTEXT_ROOT=$2
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;			
		-newTomcatHome | -newtomcathome)
			if [ $UPGRADED_APP = jts ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				getAbsolutePath $2
				NEW_TOMCAT_HOME=$ABSOLUTE_PATH
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-newApplicationTomcatHome | -newapplicationtomcathome)
			if [ $UPGRADED_APP != jts ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				getAbsolutePath $2
				NEW_TOMCAT_HOME=$ABSOLUTE_PATH
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-newJTSTomcatHome | -newjtstomcathome)
			if [ $UPGRADED_APP != jts ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				getAbsolutePath $2
				NEW_JTS_TOMCAT_HOME=$ABSOLUTE_PATH
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-newJTSHome | -newjtshome)
			if [ $# -eq 1 ]; then
				messages MISSING_PARAM_VALUE $1
				exit 1
			fi
			if [ -d $2 ]; then
				getAbsolutePath $2
				NEW_JTS_HOME=$ABSOLUTE_PATH
				shift
			else
				messages INVALID_PARAM_DIR $1 $2
				exit 1
			fi
			;;
		-oldApplicationVersion | -oldapplicationversion)
			if [ $UPGRADED_APP != jts ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				OLD_APPLICATION_VERSION=$2
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-oldJTSVersion | -oldjtsversion)
			if [ $UPGRADED_APP = jts ]; then
				if [ $# -eq 1 ]; then
					messages MISSING_PARAM_VALUE $1
					exit 1
				fi
				OLD_JTS_VERSION=$2
				shift
			else
				messages INVALID_PARAM $1
				exit 1
			fi
			;;
		-ignoreJTSVersionCheck | -ignorejtsversioncheck)
			if [ $UPGRADED_APP = jts ]; then
				messages INVALID_PARAM $1
				exit 1
			else
				IGNORE_JTS_VERSION_CHECK=ignoreJTSVersionCheck
			fi
			;;
		-ignoreLPA | -ignorelpa)
		    if [ $UPGRADED_APP != jts ]; then
		       messages INVALID_PARM $1
		       exit 1
		    else
		       IGNORE_LPA=ignoreLPA
		    fi   
		    ;;   
		-noPrompt | -noprompt)
			NO_PROMPT=noPrompt
			;;
	   -noVerify | -noverify)
            NO_VERIFY=false
            ;;
		-noEditor)
			NO_EDITOR=true
			;;
        -noStepPrompt | -nostepprompt)
            NO_STEP_PROMPT=true
            ;;
		-help)
			help
			exit 2
			;;
		*)
			messages INVALID_PARAM $1
			exit 1
			;;
	esac
	shift
done


# ************************
# * Parameters verifying *
# ************************
#
# RTC parameters rules
# ====================
#
# 1) 3.x to 4.0 upgrade
# ---------------------
#  -oldApplicationHome: mandatory, no default
#  -applicationRoot:    optional, default=jazz
#  -oldJTSHome:         mandatory, no default
#  -jtsContextRoot:     optional, default=jts
#  -lpaContextRoot:     optional, default=admin
#  -updateType:         optional, default=JAZZ_AND_TOMCAT
#  -oldTomcatHome:      optional, default=tomcat
#  -newApplicationHome: mandatory, no default
#  -newJtsHome:         optional, default=newAppHome
#  -newTomcatHome:      optional, default=tomcat

#$SCRIPT_DIR\rtc_debug.sh

# Infer command file suffix depending on OS type
CMD_SUFFIX=sh
if [ "$OSTYPE" = "os400" ]; then
	#it ends with .qsh for v3.0 on IBM i, but .sh for later versions
		CMD_SUFFIX=sh
fi

# Infer the previous version based on the existence of the scr.xml file
PREVIOUS_VERSION=3.0
case $UPGRADED_APP in
	jts)
		PREVIOUS_VERSION=3.0
		;;
	ccm | qm | rm | gc)
		if [ "$APPLICATION_CONTEXT_ROOT" = "" ]; then
			if [ -f $OLD_APPLICATION_HOME/$UPGRADED_APP/scr.xml ]; then
				PREVIOUS_VERSION=3.0
				APPLICATION_CONTEXT_ROOT=$UPGRADED_APP
			else
				if [ $UPGRADED_APP = rm ]; then
					APPLICATION_CONTEXT_ROOT=rdm
				else
					APPLICATION_CONTEXT_ROOT=jazz
				fi
			fi
		fi
		if [ -f $OLD_APPLICATION_HOME/$APPLICATION_CONTEXT_ROOT/scr.xml ]; then
			PREVIOUS_VERSION=3.0
		fi
		;;
esac

# Set default OLD JTS Context root if necessary
if [ $UPGRADED_APP = rm ]; then
	if [ "$OLD_JTS_CONTEXT_ROOT" = "" ]; then		
			OLD_JTS_CONTEXT_ROOT=$JTS_CONTEXT_ROOT
	elif [ $OLD_JTS_CONTEXT_ROOT != $JTS_CONTEXT_ROOT ]; then
		messages INVALID_PARAM_VALUE -oldJTSContextRoot $OLD_JTS_CONTEXT_ROOT
		messages INVALID_PARAM_VALUE -newJTSContextRoot $JTS_CONTEXT_ROOT
		exit 3
	fi
fi

if [ $UPGRADED_APP = jts ]; then
	if [ "$OLD_JTS_CONTEXT_ROOT" = "" ]; then		
			OLD_JTS_CONTEXT_ROOT=$JTS_CONTEXT_ROOT
	fi
fi

# Old version parameters
if [ $UPGRADED_APP = jts ]; then
	if [ "$OLD_JTS_VERSION" != "" ]; then
		OLD_JTS_VERSION_ARG=oldJTSVersion=$OLD_JTS_VERSION
	fi
else
	if [ "$OLD_APPLICATION_VERSION" != "" ]; then
		OLD_APPLICATION_VERSION_ARG=oldApplicationVersion=$OLD_APPLICATION_VERSION
	fi
fi

# Verify old application parameters
# -------------------------------------------
if [ $UPGRADED_APP != jts ]; then
	# Home directory: OLD_APPLICATION_HOME
	if [ "$OLD_APPLICATION_HOME" = "" ]; then
		messages MISSING_HOME_PARAM -oldApplicationHome
		exit 3
	fi
	if [ ! \( -d $OLD_APPLICATION_HOME \) ]; then
		messages DIR_NOT_FOUND $OLD_APPLICATION_HOME
		exit 3
	fi
	cd $OLD_APPLICATION_HOME/..

	# Context root: APPLICATION_CONTEXT_ROOT
	if [ "$APPLICATION_CONTEXT_ROOT" = "" ]; then
		APPLICATION_CONTEXT_ROOT=jazz
	fi

	# Do not validate the existence of repotools or teamserver.properties on RM 3.0.x since
	# they do not exist.
	if [ $UPGRADED_APP = rm ]; then
		RM_40x=true	
	fi
	# Repotools command: OLD_APPLICATION_CMD	
	CMD_NAME=repotools-$APPLICATION_CONTEXT_ROOT.$CMD_SUFFIX

	OLD_APP_PARENT_DIR=`pwd`
	if [ "$OSTYPE" != "os400" ] && [ $RM_40x = false ] && [ "$OLD_APPLICATION_VERSION_ARG" = "" ] && [ ! \( -f $OLD_APP_PARENT_DIR/$CMD_NAME \) ]; then		
		messages CMD_NOT_FOUND_OLD_APP $OLD_APP_PARENT_DIR/$CMD_NAME $OLD_APPLICATION_HOME $APPLICATION_CONTEXT_ROOT		
		exit 3
	fi

	# Old application teamserver.properties file
	OLD_APP_TSP_FILE=$OLD_APPLICATION_HOME/$APPLICATION_CONTEXT_ROOT/teamserver.properties
	if [ $RM_40x = false ] && [ ! \( -f $OLD_APP_TSP_FILE \) ]; then		
		messages TSP_NOT_FOUND_OLD_APP $OLD_APP_TSP_FILE $OLD_APPLICATION_HOME $APPLICATION_CONTEXT_ROOT		
		exit 3
	fi

	# Home directory: NEW_APPLICATION_HOME
	if [ "$NEW_APPLICATION_HOME" = "" ]; then
		messages MISSING_HOME_PARAM -newApplicationHome
		exit 3
	fi
	if [ ! \( -d $NEW_APPLICATION_HOME \) ]; then
		messages DIR_NOT_FOUND $NEW_APPLICATION_HOME
		exit 3
	fi
	cd $NEW_APPLICATION_HOME/..

	# Repotools command: NEW_APP_CMD
	NEW_APP_PARENT_DIR=`pwd`
	NEW_APPLICATION_CMD=repotools-$APPLICATION_CONTEXT_ROOT.sh
	if [ ! \( -f $NEW_APP_PARENT_DIR/$NEW_APPLICATION_CMD \) ]; then
		messages CMD_NOT_FOUND_NEW_APP $NEW_APP_PARENT_DIR/$NEW_APPLICATION_CMD $NEW_APPLICATION_HOME $APPLICATION_CONTEXT_ROOT $PREVIOUS_VERSION
		exit 3
	fi

	# New application teamserver.properties file
	NEW_APP_TSP_FILE=$NEW_APPLICATION_HOME/$APPLICATION_CONTEXT_ROOT/teamserver.properties
	if [ ! \( -f $NEW_APP_TSP_FILE \) ]; then
		messages TSP_NOT_FOUND_NEW_APP $NEW_APP_TSP_FILE $NEW_APPLICATION_HOME $APPLICATION_CONTEXT_ROOT $PREVIOUS_VERSION
		exit 3
	fi
	
fi


# Infer and verify JTS parameters
# -------------------------------

# Context root: JTS_CONTEXT_ROOT (always defined)
if [ "$JTS_CONTEXT_ROOT" = "" ]; then
	JTS_CONTEXT_ROOT=jts
fi

if [ $UPGRADED_APP != jts ]; then
  if [ $JTS_CONTEXT_ROOT = $APPLICATION_CONTEXT_ROOT ]; then  
	messages CONTEXT_ROOTS_CANNOT_BE_EQUAL $JTS_CONTEXT_ROOT $APPLICATION_CONTEXT_ROOT
	exit 3
  fi
fi

# Context root: JTS_CONTEXT_ROOT (always defined)
if [ "$LPA_CONTEXT_ROOT" = "" ]; then
	LPA_CONTEXT_ROOT=admin
fi

# Old Home directory: OLD_JTS_HOME (not defined for 2.x upgrade or JTS already upgraded)
if [ $UPGRADED_APP = jts ]; then
	if [ "$OLD_JTS_HOME" = "" ]; then
		messages MISSING_PARAM_VALUE -oldJTSHome
		exit 3
	else
		if [ ! \( -d $OLD_JTS_HOME \) ]; then
			messages DIR_NOT_FOUND $OLD_JTS_HOME
			exit 3
		fi
		cd $OLD_JTS_HOME/..

		# Check old repotools command
		OLD_JTS_PARENT_DIR=`pwd`
		if [ "$OSTYPE" != "os400" ] && [ "$OLD_JTS_VERSION_ARG" = "" ]; then
			if [ ! \( -f $OLD_JTS_PARENT_DIR/repotools-$JTS_CONTEXT_ROOT.$CMD_SUFFIX \) ]; then
				messages CMD_NOT_FOUND_OLD_JTS $OLD_JTS_PARENT_DIR/repotools-$JTS_CONTEXT_ROOT.$CMD_SUFFIX $OLD_JTS_HOME $JTS_CONTEXT_ROOT
				exit 3
			fi
		fi

		# Check old JTS teamserver.properties file
		OLD_JTS_TSP_FILE=$OLD_JTS_HOME/$JTS_CONTEXT_ROOT/teamserver.properties
		if [ ! \( -f $OLD_JTS_TSP_FILE \) ]; then
			messages TSP_NOT_FOUND_OLD_JTS $OLD_JTS_TSP_FILE $OLD_JTS_HOME $JTS_CONTEXT_ROOT
			exit 3
		fi
	fi
fi

# New Home directory: NEW_JTS_HOME (always defined)
if [ "$NEW_JTS_HOME" = "" ]; then
	if [ $UPGRADED_APP = jts ]; then
		NEW_JTS_HOME="$START_DIR/conf"
	else
		NEW_JTS_HOME=$NEW_APPLICATION_HOME
	fi
fi
if [ ! \( -d $NEW_JTS_HOME \) ]; then
	messages DIR_NOT_FOUND $NEW_JTS_HOME
	exit 3
fi
cd $NEW_JTS_HOME/..

# Repotools command: NEW_JTS_CMD (not defined for 3.0 upgrade)
NEW_JTS_PARENT_DIR=`pwd`
NEW_JTS_CMD=repotools-$JTS_CONTEXT_ROOT.sh
if [ ! \( -f $NEW_JTS_PARENT_DIR/$NEW_JTS_CMD \) ]; then
	messages CMD_NOT_FOUND_NEW_JTS $NEW_JTS_PARENT_DIR/$NEW_JTS_CMD $NEW_JTS_HOME $JTS_CONTEXT_ROOT
	exit 3
fi

# Check new JTS teamserver.properties file
NEW_JTS_TSP_FILE=$NEW_JTS_HOME/$JTS_CONTEXT_ROOT/teamserver.properties
if [ ! \( -f $NEW_JTS_TSP_FILE \) ]; then
	messages TSP_NOT_FOUND_NEW_JTS $NEW_JTS_TSP_FILE $NEW_JTS_HOME $JTS_CONTEXT_ROOT
	exit 3
fi

# For JTS upgrade the new application command is the new JTS repotools
if [ $UPGRADED_APP = jts ]; then
	NEW_APPLICATION_CMD=$NEW_JTS_CMD
	NEW_APP_PARENT_DIR=$NEW_JTS_PARENT_DIR
fi


# Verify Tomcat parameters
# ----------------------------------
if [ "$UPDATE_TOMCAT_FILES" != "" ]; then
	UPDATE_TOMCAT_FILES_ARG="updateTomcatFiles=$UPDATE_TOMCAT_FILES"
fi

# Old Tomcat home
if [ "$OLD_TOMCAT_HOME" != "" ]; then
	if [ ! \( -d $OLD_TOMCAT_HOME \) ]; then
		if [ ! \( -d $OLD_APP_PARENT_DIR/$OLD_TOMCAT_HOME \) ]; then
			if [ "`echo $OLD_TOMCAT_HOME | cut -d'/' -f1`" = "" ]; then
				messages DIR_NOT_FOUND $OLD_TOMCAT_HOME
			else
				messages DIR_NOT_FOUND $OLD_APP_PARENT_DIR/$OLD_TOMCAT_HOME
			fi
			exit 3
		fi
	fi
	if [ $UPGRADED_APP = rm ]; then
		OLD_TOMCAT_HOME_ARG="oldApplicationTomcatHome=$OLD_TOMCAT_HOME"
	else
		OLD_TOMCAT_HOME_ARG="oldTomcatHome=$OLD_TOMCAT_HOME"
	fi
fi


# New Tomcat home
if [ "$NEW_TOMCAT_HOME" != "" ]; then
	if [ ! \( -d $NEW_TOMCAT_HOME \) ]; then
		if [ ! \( -d $NEW_APP_PARENT_DIR/$NEW_TOMCAT_HOME \) ]; then
			if [ "`echo $NEW_TOMCAT_HOME | cut -d'/' -f1`" = "" ]; then
				messages DIR_NOT_FOUND $NEW_TOMCAT_HOME
			else
				messages DIR_NOT_FOUND $NEW_APP_PARENT_DIR/$NEW_TOMCAT_HOME
			fi
			exit 3
		fi
	fi
	if [ $UPGRADED_APP = jts ]; then
		NEW_TOMCAT_HOME_ARG="newTomcatHome=$NEW_TOMCAT_HOME"
	else
		NEW_TOMCAT_HOME_ARG="newApplicationTomcatHome=$NEW_TOMCAT_HOME"
	fi
fi
if [ $UPGRADED_APP != jts ]; then
	if [ "$NEW_JTS_TOMCAT_HOME" != "" ]; then
		if [ ! \( -d $NEW_JTS_TOMCAT_HOME \) ]; then
			if [ ! \( -d $NEW_APP_PARENT_DIR/$NEW_JTS_TOMCAT_HOME \) ]; then
				if [ "`echo $NEW_JTS_TOMCAT_HOME | cut -d'/' -f1`" = "" ]; then
					messages DIR_NOT_FOUND $NEW_JTS_TOMCAT_HOME
				else
					messages DIR_NOT_FOUND $NEW_APP_PARENT_DIR/$NEW_JTS_TOMCAT_HOME
				fi
				exit 3
			fi
		fi
		NEW_JTS_TOMCAT_HOME_ARG="newJTSTomcatHome=$NEW_JTS_TOMCAT_HOME"
	fi
fi


# Other verifications
# -------------------

# Check data warehouse
UPGRADE_DATA_WAREHOUSE=false
if [ $UPGRADED_APP = jts ]; then
	# Check if property is set in the new JTS TSP
	DATAWAREHOUSE_TSP_LINE=`grep "com.ibm.team.datawarehouse.db.jdbc.location" $OLD_JTS_TSP_FILE | grep -v "#com.ibm.team.datawarehouse.db.jdbc.location"`
	if [ "$DATAWAREHOUSE_TSP_LINE" != "" ]; then
		UPGRADE_DATA_WAREHOUSE=true
	fi
fi

# Read old JTS version
if [ $UPGRADED_APP = jts ]; then
	FIX_LPA_FRONTSIDE_URLS=false
	MERGE_LPA_JTS=false
	if [ "$IGNORE_LPA" = "" ]; then
		if [ "$OLD_JTS_VERSION" = "" ]; then
			OLD_JTS_VERSION=`cd $OLD_JTS_HOME/.. && ./repotools-$JTS_CONTEXT_ROOT.$CMD_SUFFIX -version | tail -1`
		fi
		OLD_JTS_MAJOR_VERSION=`echo $OLD_JTS_VERSION|awk '{ print $1; }'`
		OLD_JTS_MINOR_VERSION=`echo $OLD_JTS_VERSION|awk '{ print $2; }'`
		OLD_JTS_MAJOR_VERSION_FIRST_NUMBER=`echo $OLD_JTS_MAJOR_VERSION|awk -F '.' '{ print $1; }'`
		OLD_JTS_MAJOR_VERSION_FIRST_THREE_NUMBER=`echo $OLD_JTS_MAJOR_VERSION|awk -F '.' '{ print $1"."$2"."$3 }'`
		# Check if need to run -mergeLPAJTS command
		if [ "$OLD_JTS_MAJOR_VERSION_FIRST_NUMBER" = "4" ] || [ "$OLD_JTS_MAJOR_VERSION" = "5.0" ] || [ "$OLD_JTS_MAJOR_VERSION" = "5.0.1" ] || [ "$OLD_JTS_MAJOR_VERSION_FIRST_THREE_NUMBER" = "5.0.0" ] || [ "$OLD_JTS_MAJOR_VERSION_FIRST_THREE_NUMBER" = "5.0.1" ]; then
			MERGE_LPA_JTS=true
		else 
			if [ "$OLD_JTS_MAJOR_VERSION" = "5.0.2" ] && [ "$OLD_JTS_MINOR_VERSION" = "M1" ]; then
				MERGE_LPA_JTS=true
			fi
		fi
		# Check if need to run -fixLPAStorageInvalidFrontsideUrls command
		if [ "$OLD_JTS_MAJOR_VERSION" = "5.0.2" ] && [ "$OLD_JTS_MINOR_VERSION" != "M1" ]; then
			FIX_LPA_FRONTSIDE_URLS=true
		else
			if [ "$OLD_JTS_MAJOR_VERSION" = "6.0" ]&& [ "$OLD_JTS_MINOR_VERSION" = "M7" ]; then
				FIX_LPA_FRONTSIDE_URLS=true
			fi
		fi
		
	fi
fi


# **************
# * Start exec *
# **************

messages BANNER_$UPGRADED_APP $PREVIOUS_VERSION


# *********************
# * First step switch *
# *********************

cd $START_DIR

# Init variables
INITIAL_STEP=0
REBUILD_TXT_INDICES="false"
REBUILD_JFS_INDICES="false"

# **********************
# * RM Version check   *
# **********************
if [ $UPGRADED_APP = rm ]; then
	messages RM_CHECK_OLD_VERSION
	if [ "$OLD_APPLICATION_VERSION" != "" ]; then
		RM_VERSION=$OLD_APPLICATION_VERSION
	else 
		if [ ! -f $OLD_APPLICATION_HOME/$APPLICATION_CONTEXT_ROOT/teamserver.properties ]; then
			RM_VERSION=4
		else 
			RM_VERSION=`cd $OLD_APPLICATION_HOME/.. && ./repotools-$APPLICATION_CONTEXT_ROOT.$CMD_SUFFIX -version | tail -1`
		fi
	fi
	
	if [ "$OLD_JTS_HOME" = "" ]; then
		OLD_JTS_HOME=$OLD_APPLICATION_HOME
	fi
	
	OLD_RM_MAJOR_VERSION=`echo $RM_VERSION|awk '{ print $1; }'`
	OLD_RM_MINOR_VERSION=`echo $RM_VERSION|awk '{ print $2; }'`
	OLD_RM_MAJOR_VERSION_FIRST_NUMBER=`echo $OLD_RM_MAJOR_VERSION|awk -F '.' '{ print $1; }'`
	OLD_RM_MAJOR_VERSION_FIRST_THREE_NUMBER=`echo $OLD_RM_MAJOR_VERSION|awk -F '.' '{ print $1"."$2"."$3 }'`
	# Check if need to run -mergeLPAJTS command
	MERGE_LPA_JTS=false
	if [ "$OLD_RM_MAJOR_VERSION_FIRST_NUMBER" = "4" ] || [ "$OLD_RM_MAJOR_VERSION" = "5.0" ] || [ "$OLD_RM_MAJOR_VERSION" = "5.0.1" ] || [ "$OLD_RM_MAJOR_VERSION_FIRST_THREE_NUMBER" = "5.0.0" ] || [ "$OLD_RM_MAJOR_VERSION_FIRST_THREE_NUMBER" = "5.0.1" ]; then
		MERGE_LPA_JTS=true
	else 
		if [ "$OLD_RM_MAJOR_VERSION" = "5.0.2" ] && [ "$OLD_RM_MINOR_VERSION" = "M1" ]; then
			MERGE_LPA_JTS=true
		fi
	fi
	
	messages RM_DISPLAY_OLD_VERSION $RM_VERSION
fi

# Set max steps to execute
case $UPGRADED_APP in
	jts)
		if [ $UPGRADE_DATA_WAREHOUSE = true ]; then
			MAX_STEPS=2
		else
			MAX_STEPS=1
		fi
		if [ $MERGE_LPA_JTS = true ]; then
			MAX_STEPS=`expr $MAX_STEPS + 1`
		fi
		if [ $FIX_LPA_FRONTSIDE_URLS = true ]; then
			MAX_STEPS=`expr $MAX_STEPS + 1`
		fi
		;;
	rm)		
		if [ 4 = `echo $RM_VERSION | cut -c1,1` ]; then
			# update config
			# add tables
			# finalize rm
			# finalize jts
			# reindex  
			MAX_STEPS=4
		else 
			# update config
			# add tables
			MAX_STEPS=1
		fi
		if [ $MERGE_LPA_JTS = true ]; then
			MAX_STEPS=`expr $MAX_STEPS + 1`
		fi
		;;
	qm)		
		MAX_STEPS=1		
		;;
	gc)
		MAX_STEPS=1		
		;;
	ccm)		
		MAX_STEPS=1		
		;;
esac

# Get last execution information
LAST_STEP=-1
LAST_RETURN=0
LOG_FILE=$SCRIPT_DIR/.${UPGRADED_APP}_app_upgrade.log
if [ -f $LOG_FILE ]; then
	LAST_STEP=`cut -f1 -d' ' $LOG_FILE`
	LAST_RETURN=`cut -f2 -d' ' $LOG_FILE`
	LAST_STEP_INFO=`cut -f3 -d' ' $LOG_FILE`
	if [ "$LAST_STEP_INFO" = "REBUILD_TXT_INDICES" ]; then
		MAX_STEPS=`expr $MAX_STEPS + 1`
		REBUILD_TXT_INDICES="true"
		echo "WAS TRUE"
	fi
	if [ "$LAST_STEP_INFO" = "REBUILD_JFS_INDICES" ]; then
		MAX_STEPS=`expr $MAX_STEPS + 1`
		REBUILD_JFS_INDICES="true"
	fi
	setFirstStep
else
	CURRENT_STEP=$INITIAL_STEP
fi

# **********************
# * Verify Public URIs *
# **********************
if [ $CURRENT_STEP -ne $INITIAL_STEP ]; then
	verify_all -clean
fi
		
# **************
# * Steps loop *
# **************
while [ $CURRENT_STEP -le $MAX_STEPS ]
do
	case $CURRENT_STEP in
		0)						
			CURRENT_STEP_MSG=STEP_0
			case $UPGRADED_APP in
				jts)
					CMD_ARGUMENTS="oldJTSHome=$OLD_JTS_HOME jtsContextRoot=$JTS_CONTEXT_ROOT $UPDATE_TOMCAT_FILES_ARG $OLD_TOMCAT_HOME_ARG newJTSHome=$NEW_JTS_HOME $NEW_TOMCAT_HOME_ARG $OLD_JTS_VERSION_ARG $IGNORE_LPA lpaContextRoot=$LPA_CONTEXT_ROOT"
					;;
				rm)
					CMD_ARGUMENTS="oldApplicationHome=$OLD_APPLICATION_HOME applicationContextRoot=$APPLICATION_CONTEXT_ROOT $UPDATE_TOMCAT_FILES_ARG $OLD_TOMCAT_HOME_ARG $OLD_JTS_TOMCAT_HOME_ARG newApplicationHome=$NEW_APPLICATION_HOME newJTSHome=$NEW_JTS_HOME newJTSContextRoot=$JTS_CONTEXT_ROOT $NEW_TOMCAT_HOME_ARG $NEW_JTS_TOMCAT_HOME_ARG $IGNORE_JTS_VERSION_CHECK $OLD_APPLICATION_VERSION_ARG $NO_PROMPT $DB_JDBC_LOCATION $DB_JDBC_PASSWORD $DB_DB2I_SCHEMA_NAME $DB_DB2_DSN_DBNAME $DB_SCHEMA_PREFIX"
					;;
				qm | ccm | gc)
					CMD_ARGUMENTS="oldApplicationHome=$OLD_APPLICATION_HOME applicationContextRoot=$APPLICATION_CONTEXT_ROOT $UPDATE_TOMCAT_FILES_ARG $OLD_TOMCAT_HOME_ARG newApplicationHome=$NEW_APPLICATION_HOME newJTSHome=$NEW_JTS_HOME jtsContextRoot=$JTS_CONTEXT_ROOT $NEW_TOMCAT_HOME_ARG $NEW_JTS_TOMCAT_HOME_ARG $IGNORE_JTS_VERSION_CHECK $OLD_APPLICATION_VERSION_ARG"
					;;
			esac
			if [ $UPGRADED_APP = jts ]; then
				STEP_DIR=$NEW_JTS_PARENT_DIR
			else
				STEP_DIR=$NEW_APP_PARENT_DIR
			fi
			STEP_CMD="$NEW_APPLICATION_CMD -migration_${UPGRADED_APP}_updateConfigurationFiles $CMD_ARGUMENTS"
			runStep $STEP_DIR
			
			# If step was not skipped
			# Verify teamserver.properties and		
			# Copy text indices if necessary
			if [ $? -eq 1 ]; then
				# Check error from merge, if it succeeded keep going
				# Fix for WI 193178
				if [ $ERROR_REPOTOOLS -eq 0 ]; then
					#skip this step for IBM i 
					if [ "$OSTYPE" != "os400" ] && [ "$NO_EDITOR" != "true" ]; then
						# Verify teamserver.properties files
						messages EDIT_TEAMSERVER_PROPERTIES JTS
						pause
						vi $NEW_JTS_TSP_FILE
						if [ $UPGRADED_APP != jts ]; then
							messages EDIT_TEAMSERVER_PROPERTIES $UPGRADED_APP
							pause
							vi $NEW_APP_TSP_FILE
						fi
					fi
					# Verify all teamserver.properties files
					verify_all

    				# RM's indexes will be copied over by the jts
    				if [ $UPGRADED_APP != rm ] || [ $UPGRADED_APP = rm -a 5 = `echo $RM_VERSION | cut -c1,1` ]; then
    				    if [ $UPGRADED_APP = jts ]; then
    				      copy_text_indices $OLD_JTS_TSP_FILE $OLD_JTS_HOME $NEW_JTS_TSP_FILE $NEW_JTS_HOME
    				    elif [ $UPGRADED_APP = rm ]; then
    				      #positive return code for rm to skip this step
    				      true
    				    else
    				      copy_text_indices $OLD_APP_TSP_FILE $OLD_APPLICATION_HOME $NEW_APP_TSP_FILE $NEW_APPLICATION_HOME
    				    fi
    					error_copy=$?
    					if [ $error_copy -ne 0 ] && [ $REBUILD_TXT_INDICES = "false" ]; then
    			
    						MAX_STEPS=`expr $MAX_STEPS + 1`
    						REBUILD_TXT_INDICES="true"
    					fi
    					
    					if [ $UPGRADED_APP = jts ]; then
    						copy_jfs_indices $OLD_JTS_TSP_FILE $OLD_JTS_HOME $OLD_JTS_CONTEXT_ROOT $NEW_JTS_TSP_FILE $NEW_JTS_HOME $JTS_CONTEXT_ROOT
    					else
    						copy_jfs_indices $OLD_APP_TSP_FILE $OLD_APPLICATION_HOME $APPLICATION_CONTEXT_ROOT $NEW_APP_TSP_FILE $NEW_APPLICATION_HOME $APPLICATION_CONTEXT_ROOT
    					fi
    					# if text indices copy fails in any way, then force a text indices rebuild
    					error_copy=$?
    					if [ $error_copy -ne 0 ] && [ $REBUILD_JFS_INDICES = "false" ]; then					    
    						MAX_STEPS=`expr $MAX_STEPS + 1`
    						REBUILD_JFS_INDICES="true"						
    					fi
    				else 
    					# rm version 4
    					REBUILD_JFS_INDICES="true"
    				fi
                fi  
			fi
			;;

		1)

			CURRENT_STEP_MSG=STEP_1_ADD
			STEP_CMD="$NEW_APPLICATION_CMD -addTables $NO_PROMPT"

			if [ $UPGRADED_APP = jts ]; then
				STEP_DIR=$NEW_JTS_PARENT_DIR
			else
				STEP_DIR=$NEW_APP_PARENT_DIR
			fi
			runStep $STEP_DIR
			;;

		2)
			if [ $UPGRADED_APP = jts ]; then
				# %UPGRADE_DATA_WAREHOUSE% is true in this case...
				CURRENT_STEP_MSG=STEP_2_UPGRADE_DATA_WAREHOUSE
				STEP_CMD="$NEW_JTS_CMD -upgradeWarehouse teamserver.properties=$NEW_JTS_TSP_FILE $NO_PROMPT"
				runStep $NEW_JTS_PARENT_DIR
			elif [ $UPGRADED_APP = rm -a 4 = `echo $RM_VERSION | cut -c1,1` ]; then
				CURRENT_STEP_MSG=RM_APPLICATION_FINALIZE
				STEP_CMD="$NEW_APPLICATION_CMD -finalizeApplicationMigration"	
						
				runStep $NEW_APP_PARENT_DIR
				
				if [ $? -eq 1 ]; then
					# if step was not skipped, save app id to RM_APP.ID file
					cat $NEW_APP_PARENT_DIR/repotools-${APPLICATION_CONTEXT_ROOT}_finalizeApplicationMigration.log | grep applicationId | sed -e 's/.*applicationId\=\(.*\)".*/\1/g' > $NEW_APP_PARENT_DIR/RM_APP.ID
				fi
			elif [ $REBUILD_TXT_INDICES = "true" ]; then
				CURRENT_STEP_MSG=FULL_TEXT_INDICES_STEP				
				STEP_CMD="$NEW_APPLICATION_CMD -rebuildTextIndices"
				runStep $NEW_APP_PARENT_DIR
			elif [ $REBUILD_JFS_INDICES = "true" ]; then
				CURRENT_STEP_MSG=JFS_INDICES_STEP
				if [  $UPGRADED_APP = rm ]; then		
					STEP_CMD="$NEW_APPLICATION_CMD -reindex all"
				else
					STEP_CMD="$NEW_APPLICATION_CMD -reindex"
				fi
				runStep $NEW_APP_PARENT_DIR
			elif [ $UPGRADED_APP = rm ] && [ $MERGE_LPA_JTS = true ]; then
				CURRENT_STEP_MSG=RM_REMOVE_LPA_FRIEND_STEP
			  	STEP_CMD="$NEW_APPLICATION_CMD -mergeLPAJTS lpaContextRoot=$LPA_CONTEXT_ROOT applicationContextRoot=$APPLICATION_CONTEXT_ROOT oldJTSHome=$OLD_JTS_HOME onlyRemoveFriend=true oldApplicationHome=$OLD_APPLICATION_HOME oldApplicationVersion=$RM_VERSION"
				runStep $NEW_APP_PARENT_DIR		
			fi
			;;
			
		3)
		    if [ $UPGRADED_APP = jts ] && [ $REBUILD_TXT_INDICES = "true" ]; then
				CURRENT_STEP_MSG=FULL_TEXT_INDICES_STEP				
				STEP_CMD="$NEW_APPLICATION_CMD -rebuildTextIndices"
				runStep $NEW_APP_PARENT_DIR
			elif [ $UPGRADED_APP = jts ] && [ $MERGE_LPA_JTS = true ]; then
				CURRENT_STEP_MSG=JTS_MERGE_LPA_JTS_STEP
			  	STEP_CMD="$NEW_JTS_CMD -mergeLPAJTS lpaContextRoot=$LPA_CONTEXT_ROOT jtsContextRoot=$JTS_CONTEXT_ROOT oldJTSHome=$OLD_JTS_HOME $OLD_JTS_VERSION_ARG"
				runStep $NEW_JTS_PARENT_DIR		
			elif [ $UPGRADED_APP = jts ] && [ $FIX_LPA_FRONTSIDE_URLS = true ]; then
				CURRENT_STEP_MSG=JTS_FIX_LPA_FRONTSIDE_URLS_STEP
			  	STEP_CMD="$NEW_JTS_CMD -fixLPAStorageInvalidFrontsideUrls"
				runStep $NEW_JTS_PARENT_DIR		
			elif [ $UPGRADED_APP = rm -a 4 = `echo $RM_VERSION | cut -c1,1` ]; then
				if [ -f $NEW_APP_PARENT_DIR/RM_APP.ID ]; then
					CURRENT_STEP_MSG=JTS_APPLICATION_FINALIZE		 
					RM_PUBLIC_URI="`cat $NEW_APPLICATION_HOME/$APPLICATION_CONTEXT_ROOT/teamserver.properties | grep com.ibm.team.repository.server.webapp.url | cut -d'=' -f2 | sed 's/\\\\//g'`"
					STEP_CMD="$NEW_JTS_CMD -finalizeApplicationMigration checkOauthDomain=true applicationId=`cat $NEW_APP_PARENT_DIR/RM_APP.ID` newPublicUrl=$RM_PUBLIC_URI"
					runStep $NEW_JTS_PARENT_DIR
				else 
					ERROR_REPOTOOLS=1
					messages JTS_APPLICATION_FINALIZE $CURRENT_STEP	$CURRENT_STEP	
					messages RM_APP_ID_NOEXIST
				fi	
			elif [ $REBUILD_JFS_INDICES = "true" ]; then
				CURRENT_STEP_MSG=JFS_INDICES_STEP
			  	STEP_CMD="$NEW_JTS_CMD -reindex"
				runStep $NEW_JTS_PARENT_DIR		
			fi
			;;
		4)
			if [ $UPGRADED_APP = jts ] && [ $REBUILD_JFS_INDICES = "true" ]; then
				CURRENT_STEP_MSG=JFS_INDICES_STEP
			  	STEP_CMD="$NEW_JTS_CMD -reindex"
				runStep $NEW_JTS_PARENT_DIR		
			elif [ $UPGRADED_APP = jts ] && [ $MERGE_LPA_JTS = true ]; then
				CURRENT_STEP_MSG=JTS_MERGE_LPA_JTS_STEP
			  	STEP_CMD="$NEW_JTS_CMD -mergeLPAJTS lpaContextRoot=$LPA_CONTEXT_ROOT jtsContextRoot=$JTS_CONTEXT_ROOT oldJTSHome=$OLD_JTS_HOME $OLD_JTS_VERSION_ARG"
				runStep $NEW_JTS_PARENT_DIR		
			elif [ $UPGRADED_APP = jts ] && [ $FIX_LPA_FRONTSIDE_URLS = true ]; then
				CURRENT_STEP_MSG=JTS_FIX_LPA_FRONTSIDE_URLS_STEP
			  	STEP_CMD="$NEW_JTS_CMD -fixLPAStorageInvalidFrontsideUrls"
				runStep $NEW_JTS_PARENT_DIR		
			elif [ $UPGRADED_APP = rm ]; then
				CURRENT_STEP_MSG=RM_REINDEX_ALL
			  	STEP_CMD="$NEW_APPLICATION_CMD -reindex all"
				runStep $NEW_APP_PARENT_DIR		
			fi
			;;
		5)
			if [ $UPGRADED_APP = jts ] && [ $MERGE_LPA_JTS = true ]; then
				CURRENT_STEP_MSG=JTS_MERGE_LPA_JTS_STEP
			  	STEP_CMD="$NEW_JTS_CMD -mergeLPAJTS lpaContextRoot=$LPA_CONTEXT_ROOT jtsContextRoot=$JTS_CONTEXT_ROOT oldJTSHome=$OLD_JTS_HOME $OLD_JTS_VERSION_ARG"
				runStep $NEW_JTS_PARENT_DIR		
			elif [ $UPGRADED_APP = jts ] && [ $FIX_LPA_FRONTSIDE_URLS = true ]; then
				CURRENT_STEP_MSG=JTS_FIX_LPA_FRONTSIDE_URLS_STEP
			  	STEP_CMD="$NEW_JTS_CMD -fixLPAStorageInvalidFrontsideUrls"
				runStep $NEW_JTS_PARENT_DIR		
			elif [ $UPGRADED_APP = rm ] && [ $MERGE_LPA_JTS = true ]; then
				CURRENT_STEP_MSG=RM_REMOVE_LPA_FRIEND_STEP
			  	STEP_CMD="$NEW_APPLICATION_CMD -mergeLPAJTS lpaContextRoot=$LPA_CONTEXT_ROOT applicationContextRoot=$APPLICATION_CONTEXT_ROOT oldJTSHome=$OLD_JTS_HOME onlyRemoveFriend=true oldApplicationHome=$OLD_APPLICATION_HOME oldApplicationVersion=$RM_VERSION"
				runStep $NEW_APP_PARENT_DIR		
			fi
			;;
	esac

	# Store information to restart properly
	if [ $CURRENT_STEP -eq $MAX_STEPS ]; then
		echo "$CURRENT_STEP $ERROR_REPOTOOLS" > $LOG_FILE
	elif [ $REBUILD_TXT_INDICES != "true" ] && [ $REBUILD_JFS_INDICES != "true" ]; then
		echo "$CURRENT_STEP $ERROR_REPOTOOLS" > $LOG_FILE
	elif [ $REBUILD_TXT_INDICES = "true" ]; then
		echo "$CURRENT_STEP $ERROR_REPOTOOLS REBUILD_TXT_INDICES" > $LOG_FILE
	else
		echo "$CURRENT_STEP $ERROR_REPOTOOLS REBUILD_JFS_INDICES" > $LOG_FILE
	fi
	
	# Verify that command was run successfully
	if [ $ERROR_REPOTOOLS -eq 0 ]; then
		if [ $CURRENT_STEP -eq $MAX_STEPS ]; then
			if [ $UPGRADED_APP = jts ]; then
				messages OVERALL_MIGRATION_SUCCESS_JTS $UPGRADED_APP
			elif [ $UPGRADED_APP = rm ]; then
				if [ 4 = `echo $RM_VERSION | cut -c1,1` ]; then
					RM_PUBLIC_URI="`cat $NEW_APPLICATION_HOME/$APPLICATION_CONTEXT_ROOT/teamserver.properties | grep com.ibm.team.repository.server.webapp.url | cut -d'=' -f2 | sed 's/\\\\//g'`"
					RM_BACKLINKS_CMD="$NEW_APPLICATION_CMD -rmUpdateProjectBackLinksOnline adminUserId=<ADMIN_USERID> adminPassword=<ADMIN_PASSWORD> repositoryURL=$RM_PUBLIC_URI"
			   		messages OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 $NEW_APP_PARENT_DIR $UPGRADED_APP
			   	else
			   		messages OVERALL_MIGRATION_SUCCESS_RM $UPGRADED_APP
			   	fi
			else
				messages OVERALL_MIGRATION_SUCCESS_CCM_QM $UPGRADED_APP
			fi
		fi	
		CURRENT_STEP=`expr $CURRENT_STEP + 1`
	else
		messages OVERALL_MIGRATION_FAILED $UPGRADED_APP $CURRENT_STEP
		exit $ERROR_REPOTOOLS
	fi
done
