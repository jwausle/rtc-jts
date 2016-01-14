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
# # jts_upgrade.sh script parameters and their default values
# #
# #===========================================================
# #
# # This file is read at the beginning of the jts_upgrade.sh
# # script execution. It sets one environment variable per
# # valid parameter with a predefined default value.
# #
# # Users may want to modify the default value in order to
# # launch the jts_upgrade.sh script with their own values
# # without having to enter the parameter and its
# # corresponding value manually at the command line.
# #
# # WARNING:
# # Not all variables are required to be set for every
# # application.  Read each comment carefully before modifying
# # the value.
# #
# #############################################################

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

# Parameter: -jtsContextRoot
# Usage: -jtsContextRoot <root>
# Description:
# 	The JTS context root
# Default:
# 	jts
# Constraints:
#  - <root> must be a valid directory single name (i.e. no leading slash)
#
JTS_CONTEXT_ROOT=jts

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

# Parameter: -oldJTSVersion
# Usage: -oldJTSVersion <version>
# Description:
# 	The version of the JTS being upgraded.  By default,
#   this is determined by running repotools -version against the old JTS.
# Default:
# 	<none>
# Constraints:
#  - should be a complete version string
#    e.g. 3.0.0 or 3.0.1
#
OLD_JTS_VERSION=

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

# Parameter: -newJTSHome
# Usage: -newJTSHome <dir path>
# Description:
# 	Path to the JTS server configuration directory of the new installation.
# Default:
# 	conf
# Constraints:
#  - <dir path> must be an existing directory ended by 'server/conf'
#
NEW_JTS_HOME="$START_DIR/conf"

# Parameter: -newTomcatHome
# Usage: -newTomcatHome <dir path>
# Description:
# 	Path to the Tomcat home directory of the new installation.
# Default:
# 	<none>
#
NEW_TOMCAT_HOME=

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
