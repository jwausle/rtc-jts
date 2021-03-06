#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2006, 2014. All Rights Reserved.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8


# #############################################################
# #
# # Define the environment variables corresponding to the
# # rm_upgrade.sh script parameters and their default values
# #
# #===========================================================
# #
# # This file is read at the beginning of the rm_upgrade.sh
# # script execution. It sets one environment variable per
# # valid parameter with a predefined default value.
# #
# # Users may want to modify the default value in order to
# # launch the rm_upgrade.sh script with their own values
# # without having to enter the parameter and its
# # corresponding value manually at the command line.
# #
# # WARNING:
# # Not all variables are required to be set for every
# # application.  Read each comment carefully before modifying
# # the value.
# #
# #############################################################

# Parameter: -oldApplicationHome
# Usage: -oldApplicationHome <dir path>
# Description:
# 	Full path to the application home directory in old installation.
# Default:
# 	<none>
# Constraints:
#  - this is a mandatory parameter
#  - <dir path> must be an existing directory ended by 'server/conf'
#    e.g. /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Parameter: -applicationContextRoot
# Usage: -applicationContextRoot <root>
# Description:
# 	Application context root.
# Default:
# 	<none>
# Constraints:
#  - <root> must be a valid directory single name (i.e. no leading slash)
#
APPLICATION_CONTEXT_ROOT=

# Parameter: -oldApplicationVersion
# Usage: -oldApplicationVersion <version>
# Description:
# 	The version that is being upgraded.  By default, this is
#   determined by running repotools -version against the old application.
# Default:
# 	<none>
# Constraints:
#  - should be a complete version string
#    e.g. 5.0.0 or 5.0.1
#
OLD_APPLICATION_VERSION=

# Parameter: -updateTomcatFiles
# Usage: -updateTomcatFiles <yes | no>
# Description:
# 	Whether to update the tomcat configuration files.
# Default:
# 	yes
# Constraints:
#  - The only valid values are 'yes' and 'no'
#
UPDATE_TOMCAT_FILES=yes

# Parameter: -oldApplicationTomcatHome
# Usage: -oldApplicationTomcatHome <dir path>
# Description:
# 	Full path to the Application Tomcat root directory in old installation.
# Default:
# 	<none>
# Constraints:
#  - Only accepted for RM upgrade
#  - Must be an existing directory
#
OLD_TOMCAT_HOME=

# Parameter: -oldJTSTomcatHome
# Usage: -oldJTSTomcatHome <dir path>
# Description:
# 	Full path to the JTS Tomcat root directory in the old installation.
# Default:
# 	<none>
# Constraints:
#  - Only accepted for RM upgrade
#  - Must be an existing directory
#
OLD_JTS_TOMCAT_HOME=

# Parameter: -newApplicationHome
# Usage: -newApplicationHome <dir path>
# Description:
# 	Path to the Application home directory in the new installation.
# Default:
# 	conf
# Constraints:
#  - Only accepted for RTC, QM and RM upgrade
#  - When accepted, this is a mandatory parameter
#  - <dir path> must be an existing directory ended by 'server/conf'
#    e.g. /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parameter: -newJTSHome
# Usage: -newJTSHome <dir path>
# Description:
# 	Full path to the JTS home directory in the JTS that the new installation will use.
# Default:
# 	The new application home directory
# Constraints:
#  - <dir path> must be an existing directory ended by 'server/conf'
#
NEW_JTS_HOME=

# Parameter: -newJTSContextRoot
# Usage: -newJTSContextRoot <root>
# Description:
# 	Context root of the new JTS server.
# Default:
# 	jts
# Constraints:
#  - <root> must be a valid directory single name (i.e. no leading slash)
#
JTS_CONTEXT_ROOT=jts

# Parameter: -newApplicationTomcatHome
# Usage: -newApplicationTomcatHome <dir path>
# Description:
# 	Path to the Application Tomcat root directory in the new installation.
# Default:
# 	<none>
#
NEW_TOMCAT_HOME=

# Parameter: -newJTSTomcatHome
# Usage: -newJTSTomcatHome <dir path>
# Description:
# 	Path to the JTS Tomcat root directory in the JTS that the new installation will use.
# Default:
# 	<none>
#
NEW_JTS_TOMCAT_HOME=

# Parameter: -overwrite
# Usage: -overwrite
# Description:
# 	Force overwrite (i.e. always use overwrite=yes) while executing any repotools commands
# Default:
# 	<none>
# Constraints:
#  - The only valid values are empty or 'overwrite=yes'
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# Parameter: -noVerify
# Usage: -noVerify
# Description:
# 	Do not perform any verification (i.e. always use noVerify) while executing any repotools commands
# Default:
# 	<none>
# Constraints:
#  - The only valid values are empty or 'noVerify'
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Parameter: -noStepPrompt
# Usage: -noStepPrompt
# Description:
# 	Do not prompt before each upgrade step
# Default:
# 	false
# Constraints:
#  - The only valid values are 'true' or 'false'
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Parameter: -noEditor
# Usage: -noEditor
# Description:
#   Do not open an editor on the teamserver.properties files.
# Default:
#   false
# Constraints:
#  - The only valid values are 'true' or 'false' or empty
#
# NO_EDITOR=false
NO_EDITOR=false

# Parameter: -db.jdbc.location
# Usage: -db.jdbc.location <JDBC_URL>
# Description:
# 	The JDBC location for the RM database. (Only needed when moving from 4.x to 5.x) 
# 
#		Examples:
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		NOTE:
#			On *-nix systems, many characters (like: |  &  ;  <  >  (  )  $  `  \  "  '  <space>  <tab>  <newline>) 
#			require escaping with a backslash. 
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# Default:
# 	<none>
# Constraints:
#  - Only accepted for RM upgrade from 4.x
#
DB_JDBC_LOCATION_VALUE=

# Parameter: -db.jdbc.password
# Usage: -db.jdbc.password <JDBC_PASSWORD>
# Description:
# 	The password (plaintext or encrypted) that will be substitute if "{password}" appears in the JDBC url. 
# Default:
# 	<none>
# Constraints:
#  - Must be specified if the JDBC URL for the RM database contains {password}
#
DB_JDBC_PASSWORD_VALUE=

# Parameter: -db.db2i.schema.name
# Usage: -db.db2i.schema.name <SCHEMA_NAME>
# Description:
# 	The DB2i DB Schema Name.
# Default:
# 	<none>
# Constraints:
#  - Must be specified using DB2i database type. 
#
DB_DB2I_SCHEMA_NAME_VALUE=

# Parameter: -db.db2.dsn.dbname
# Usage: -db.db2.dsn.dbname <DSN_DBNAME>
# Description:
# 	The DB2Z DSN DB Name.
# Default:
# 	<none>
# Constraints:
#  - Must be specified using DB2z database type. 
#
DB_DB2_DSN_DBNAME_VALUE=

# Parameter: -db.schemaPrefix
# Usage: -db.schemaPrefix <SCHEMA_PREFIX>
# Description:
# 	The DB Schema Prefix. 
# Default:
# 	<none>
# Constraints:
#  - Must be specified using DB2z database type. 
#
DB_SCHEMA_PREFIX_VALUE=

# Parameter: -oldJTSHome
# Usage: -oldJTSHome <dir path>
# Description:
# 	Full path to the JTS home directory in old installation.
# Default:
# 	<none>
# Constraints:
#  - <dir path> must be an existing directory ended by 'server/conf'
#  - Only valid for RM and JTS upgrades
#
OLD_JTS_HOME=

# Parameter: -lpaContextRoot
# Usage: -lpaContextRoot <root>
# Description:
# 	The LPA context root
# Default:
# 	admin
# Constraints:
#  - <root> must be a valid directory single name (i.e. no leading slash)
#
LPA_CONTEXT_ROOT=admin
