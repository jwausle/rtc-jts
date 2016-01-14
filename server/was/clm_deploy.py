############################################################################
# Licensed Materials - Property of IBM (c) Copyright IBM Corporation 2011. #
# All Rights Reserved.                                                     #
#                                                                          #
# Pre-requisite: WAS and CLM should be installed                           #
# This script installs all CLM apps to a single WAS server                 #
#                                                                          #
# Usage (Win):                                                             #
#  wsadmin -language jython -user <username> -password <password>          # 
#    -f <path to clm_deploy.py e.g.                                        #
#        C:/JazzTeamServer/server/was/clm_deploy.py>                       #
#    <nodename>                                                            #
#    <servername>                                                          #
#    <path to war files e.g. C:/JazzTeamServer/server/webapps>             #
#                                                                          #
# Usage (Linux):                                                           #
#  ./wsadmin.sh -language jython -user <username> -password <password>     #
#    -f <path to clm_deploy.py e.g.                                        #
#        /opt/IBM/JazzTeamServer/server/was/clm_deploy.py>                 #
#    <nodename>                                                            #
#    <servername>                                                          #
#    <path to war files e.g. /opt/IBM/JazzTeamServer/server/webapps>       #
############################################################################

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
	else:
		print "Error: the following directory is invalid: "+dir
	return apps
#endDef

# Determine the offsets of the arguments
if (sys.argv[0] == '-language'):
	firstArgIndex = 2
else:
	firstArgIndex = 0

# Get the node from commandline
node = sys.argv[firstArgIndex+0]
# Get the server name from commandline
server = sys.argv[firstArgIndex+1]
# Get the location of the war files
war_location = sys.argv[firstArgIndex+2]

#######################
# deploy all the apps #
#######################

# Get available apps from war_location
apps = constructAppsList(war_location)

for app in apps:
	try:
		print "Installing "+app
		full_path_to_app = war_location + "/" +app+".war"
		attrs = ['-appname', app, '-defaultbinding.virtual.host default_host -usedefaultbindings', '-node', node, '-server', server, '-contextroot',  "/"+app]
		error = AdminApp.install(full_path_to_app , attrs)
		AdminConfig.save()

	except:
		_type_, _value_, _tbck_ = sys.exc_info()
		error = `_value_`
		print "Error Installing Application "
		print "Error Message = "+error
	#endTry 
#endFor
print "The installed applications may be started from the Integrated Solutions Console in WebSphere."

# Example of how to set role/mapping for jts.war
# AdminApp.edit('jts.war', '[-MapRolesToUsers [["JazzAdmins" No No "" admins]["JazzDWAdmins" No No "" admins]["JazzUsers" No No "" users]["JazzGuests" No No "" users]["JazzProjectAdmins" No No "" admins]]]')
# AdminConfig.save() 