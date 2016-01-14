############################################################################
# Licensed Materials - Property of IBM (c) Copyright IBM Corporation 2011. #
# All Rights Reserved.                                                     #
#                                                                          #
# This script un-installs all CLM apps.                                    #
#                                                                          #
# Usage (Win):                                                             #
#  wsadmin -language jython -user <username> -password <password>          #  
#    -f <path to clm_undeploy.py e.g.                                      #
#        C:/JazzTeamServer/server/was/clm_undeploy.py>                     #
#       <path to war files e.g. C:/JazzTeamServer/server/webapps>          #
# Usage (Linux):                                                           #
#  ./wsadmin.sh -language jython -user <username> -password <password>     #
#    -f <path to clm_undeploy.py e.g.                                      #
#        /opt/IBM/JazzTeamServer/server/was/clm_undeploy.py>               #
#       <path to war files e.g. /opt/IBM/JazzTeamServer/server/webapps>    #
############################################################################

# use regular expressions to classify error messages below
import re
import os

# retrieve all .war files from directory
def constructAppsList(dir):
	apps = []
	if os.path.exists(dir):
		for filename in os.listdir(dir):
			if filename.endswith('.war'):
				apps.append(filename.replace(".war", ""))
			#endIf
		#endFor
		# admin.war may have been installed from 5.0.1 or earlier
		apps.append("admin")
	else:
		print "Error: the following directory is invalid: "+dir
	return apps
#endDef

# Argument check: this script expects an argument for war_location
if len(sys.argv) < 1 or (sys.argv[0] == '-language' and len(sys.argv) < 3):
	print "Error: Missing argument for war_location.  See usage for details."
else:
	# Determine the offsets of the arguments
	if (sys.argv[0] == '-language'):
		firstArgIndex = 2
	else:
		firstArgIndex = 0

	# Get the location of the war files
	war_location = sys.argv[firstArgIndex]

	# Get available apps from war_location
	apps = constructAppsList(war_location)
	# To deploy/undeploy a specific list of wars, comment out the above line,
	# uncomment the below apps definition and adjust it for your set of wars.
	#apps = ["jts","clmhelp"]

	# un-deploy all the apps
	for app in apps:
		try:
			_excp_ = 0
			print "Un-installing "+app+"..."
			AdminApp.uninstall(app)
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
#endIf

