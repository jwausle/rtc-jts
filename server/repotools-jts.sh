#!/bin/sh
#*******************************************************************************
# Licensed Materials - Property of IBM
# (c) Copyright IBM Corporation 2006, 2015. All Rights Reserved.
# 
# Note to U.S. Government Users Restricted Rights:  
# Use, duplication or disclosure restricted by GSA ADP Schedule 
# Contract with IBM Corp. 
#*******************************************************************************
# Jazz RepoTools Launcher

DEFINE="$DEFINE_INIT $DEFINE"

OS_TYPE=`uname`
if [ "$OS_TYPE" = SunOS ];
  then
    SPACE_PATTERN=' ' ;
    VMARGS="$VMARGS -d64 -XX:MaxPermSize=256m -XX:ReservedCodeCacheSize=256M -XX:CodeCacheMinimumFreeSpace=2M" ;
    DEFINE="$DEFINE -Djava.protocol.handler.pkgs=com.ibm.net.ssl.www2.protocol" ;
    PATH=/usr/xpg4/bin:/usr/bin
  else
    # For Mac OS X (unsupported, but used by developers)
    if [ "$OS_TYPE" != Darwin ]
      then
        VMARGS="$VMARGS -Xjit:exclude={org.apache.xerces.parsers.AbstractSAXParser.*}" ;
    fi
    SPACE_PATTERN='[[:space:]]' ;
    PATH=/bin:/usr/bin
fi

pwd | grep "$SPACE_PATTERN"
if [ $? -eq 0 ];
  then /bin/echo \
ERROR:  The Jazz Team Server may not be installed in a directory whose name contains a space character.  Please relocate the jazz directory and try again.
  exit 1
fi

START_DIR=`dirname "$0"`
SCRIPT_NAME="$0"
FQ_START_DIR=`pwd`

echo $TMP | grep "$SPACE_PATTERN"
if [ $? -eq 0 ];
  then TEMP_DIR=/tmp ;
  else TEMP_DIR=${TMP:-/tmp} ;
fi

if [ -z "$JAZZ_CONTEXT_PATH" ] ; then
  JAZZ_CONTEXT_PATH=jts ;
fi

if [ -z "$JAZZ_PROVISION_PROFILES" ] ; then
  JAZZ_PROVISION_PROFILES=$START_DIR/conf/$JAZZ_CONTEXT_PATH/provision_profiles ;
fi

if [ ! -d $JAZZ_PROVISION_PROFILES ] ;
  then /bin/echo \
ERROR:  Could not find configuration directory $JAZZ_PROVISION_PROFILES.  If you have moved or renamed your configuration directory, you can use the environment variable JAZZ_PROVISION_PROFILES to point to its new location.
  exit 1
fi

# The following four environment variables are used to point to the appropriate
# JDBC jar file supplied by the database vendor.  For Oracle and SQL Server, the
# environment variable should point to the driver file itself; for db2i and
# db2z, the variable should point to the directory that contains the multiple
# necessary jdbc driver files required on those platforms (for example, 
# /opt/ibm/db2/V9.7/java). For DB2, the use of DB2_ABSPATH var is optional; if not
# set the default driver packaged with the server will be used.

# Users should set these variables; if they are set, the script will respect
# their value.  If they are unset, we try locating the driver files in a
# directory under <JazzInstallDir>/server.  (For example, the default location
# for the Oracle JDBC driver is under <JazzInstallDir>/server/oracle/ojdbc6.jar).

if [ -z "$ORACLE_JDBC_DRIVER_FILE" ] ; then
  ORACLE_JDBC_DRIVER_FILE="`cd \"$START_DIR\" 2>/dev/null && pwd || echo \"$START_DIR\"`/oracle/ojdbc6.jar" ;
fi

if [ -z "$SQLSERVER_JDBC_DRIVER_FILE" ] ; then
  SQLSERVER_JDBC_DRIVER_FILE="`cd \"$START_DIR\" 2>/dev/null && pwd || echo \"$START_DIR\"`/sqlserver/sqljdbc4.jar" ;
fi

if [ -z "$DB2I_ABSPATH" ] ; then
  DB2I_ABSPATH="`cd \"$START_DIR\" 2>/dev/null && pwd || echo \"$START_DIR\"`/db2i" ;
fi

if [ -z "$DB2Z_ABSPATH" ] ; then
  DB2Z_ABSPATH="`cd \"$START_DIR\" 2>/dev/null && pwd || echo \"$START_DIR\"`/db2z" ;
fi

#DEFINE="$DEFINE -Dcom.ibm.team.repotools.rcp.allowInvalidBundles=true"
DEFINE="$DEFINE -Dcom.ibm.team.repotools.rcp.scriptName=$SCRIPT_NAME"
DEFINE="$DEFINE -Dcom.ibm.team.repository.provision.profile=$JAZZ_PROVISION_PROFILES"
DEFINE="$DEFINE -Dcom.ibm.team.repository.provision.context.path=$JAZZ_CONTEXT_PATH"
DEFINE="$DEFINE -Dorg.eclipse.emf.ecore.plugin.EcorePlugin.doNotLoadResourcesPlugin=true"
DEFINE="$DEFINE -Djava.awt.headless=true"
DEFINE="$DEFINE -DORACLE_JDBC_DRIVER_FILE=$ORACLE_JDBC_DRIVER_FILE"
DEFINE="$DEFINE -DSQLSERVER_JDBC_DRIVER_FILE=$SQLSERVER_JDBC_DRIVER_FILE"
DEFINE="$DEFINE -DDB2I_JDBC=$DB2I_ABSPATH"
DEFINE="$DEFINE -DDB2Z_JDBC=$DB2Z_ABSPATH"
if [ -n "$DB2_ABSPATH" ] ; then
  DEFINE="$DEFINE -DDB2_ABSPATH=$DB2_ABSPATH/"
fi
DEFINE="$DEFINE -DJAZZ_HOME=file://$FQ_START_DIR/conf"
DEFINE="$DEFINE -Dcom.ibm.team.repository.tempDir=$TEMP_DIR"
DEFINE="$DEFINE -Dlog4j.configuration=file://$FQ_START_DIR/conf/startup_log4j.properties"
DEFINE="$DEFINE -Dosgi.framework.library.extensions=.a,.so"
DEFINE="$DEFINE -Dcom.ibm.team.migration.ignoreDataMigrationHandlerNotPresentForComponents="
DEFINE="$DEFINE -Dcom.ibm.team.repository.provision.bundle.resolve.only=true"

## Patch service options.
#DEFINE="$DEFINE -Dcom.ibm.team.osgi.patch.disable=true"
#DEFINE="$DEFINE -Dcom.ibm.team.osgi.patch.directory=patch"
DEFINE="$DEFINE -Dcom.ibm.team.osgi.patch.logLevel=WARNING"

#Comment out the following to allow repotools to run on a server that reports
#corrupted package names (CRJAZ0179I) 
DEFINE="$DEFINE -Dcom.ibm.team.repository.marshal.tolerance=false"

VMARGS="$VMARGS -Xmx${REPOTOOLS_MX_SIZE:-1500}M"
#VMARGS="$VMARGS -Xgcpolicy:gencon"
#VMARGS="$VMARGS -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=localhost:8888"

if [ "$OS_TYPE" = Darwin ];
  then
    JAVA="/usr/bin/java"
    VMARGS="$VMARGS -XX:MaxPermSize=384m -XX:ReservedCodeCacheSize=384M -XX:CodeCacheMinimumFreeSpace=2M"
    DEFINE="$DEFINE -Dcom.ibm.team.repotools.rcp.allowInvalidBundles=true"
  else
    JAVA="$START_DIR/jre/bin/java"
fi
LAUNCHER=org.eclipse.equinox.launcher_1.1.1.R36x_v20101122_1400.jar         
JAR="$START_DIR/../repotools/$JAZZ_CONTEXT_PATH/eclipse/plugins/$LAUNCHER"
APPLICATION=com.ibm.team.repotools.rcp.repotools_application
CONFIGURATION="$START_DIR/../repotools/$JAZZ_CONTEXT_PATH/eclipse/configuration"
WORKSPACE="$START_DIR/../repotools/$JAZZ_CONTEXT_PATH/workspace"
    
$JAVA $VMARGS $DEFINE -jar $JAR -application $APPLICATION -configuration $CONFIGURATION -data $WORKSPACE "$@" 
