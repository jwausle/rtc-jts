############################################################################
# Licensed Materials - Property of IBM (c) Copyright IBM Corporation 2011. #
# All Rights Reserved.                                                     #
#                                                                          #
# This script un-installs the list of CLM apps specified.                  #
#                                                                          #
# Usage (Win):                                                             #
#  wsadmin -language jython -user <username> -password <password>          #  
#    -f <path to clm_undeploy_distributed.py e.g.                          #
#        C:/JazzTeamServer/server/was/clm_undeploy_distributed.py>         #
#    <comma-separated list (no spaces) of apps to be undeployed eg. jts,rm>#
# Usage (Linux):                                                           #
#  ./wsadmin.sh -language jython -user <username> -password <password>     #
#    -f <path to clm_undeploy_distributed.py e.g.                          #
#        /opt/IBM/JazzTeamServer/server/was/clm_undeploy_distributed.py>   #
#    <comma-separated list (no spaces) of apps to be undeployed eg. jts,rm>#
############################################################################

# use regular expressions to classify error messages below
import re

# Determine the offsets of the arguments
if (sys.argv[0] == '-language'):
	firstArgIndex = 2
else:
	firstArgIndex = 0

# get list of apps to be un-deployed
apps=sys.argv[firstArgIndex]
apps=apps [0:len(apps)].split(",")

# un-deploy all the apps
for app in apps:
	try:
		_excp_ = 0
		print "Un-installing "+app+"..."
		AdminApp.uninstall(app + ".war")
		AdminConfig.save()
	
	except:
		_type_, _value_, _tbck_ = sys.exc_info()
		error = `_value_`

		#An informative message will be printed instead of an error
		#if the exception thrown has the syntax below:
		missingAppPattern = re.compile('(.*)An application with name (.*) does not exist(.*)')
		
		if (missingAppPattern.match(error)):
			print "  Info: "+app+" is not installed - skipped"
		else:
			print "  Error Message = "+error
		#endIf
	#endTry 
#endFor