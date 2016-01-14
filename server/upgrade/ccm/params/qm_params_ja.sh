#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  © Copyright IBM Corporation 2006, 2014. All Rights Reserved.
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
# # qm_upgrade.sh script parameters and their default values
# #
# #===========================================================
# #
# # This file is read at the beginning of the qm_upgrade.sh
# # script execution. It sets one environment variable per
# # valid parameter with a predefined default value.
# #
# # Users may want to modify the default value in order to
# # launch the qm_upgrade.sh script with their own values
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
#    e.g. /Jazz/IBM/RQM_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Parameter: -applicationContextRoot
# Usage: -applicationContextRoot <root>
# Description:
# 	Application context root.
# Default:
# 	qm
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
#    e.g. 3.0.0 or 3.0.1
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

# Parameter: -oldTomcatHome
# Usage: -oldTomcatHome <dir path>
# Description:
# 	Full path to the Tomcat root directory in the old installation.
# Default:
# 	<none>
# Constraints:
#  - Must be an existing directory
#
OLD_TOMCAT_HOME=

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
#    e.g. /Jazz/IBM/RQM_3.0/JazzTeamServer/server/conf
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
#    e.g. /Jazz/IBM/RQM_3.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# Parameter: -jtsContextRoot
# Usage: -jtsContextRoot <root>
# Description:
# 	Context root of the JTS server.
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

# Parameter: -noPrompt
# Usage: -noPrompt
# Description:
# 	Do not prompt before creating or modifying the tables
# Default:
# 	<none>
# Constraints:
#  - The only valid values are empty or 'noPrompt'
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# Parameter: -noVerify
# Usage: -noVerify
# Description:
# 	Do not perform teamserver.properties files verification.
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
# 	Do not prompt before executing a step.
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
