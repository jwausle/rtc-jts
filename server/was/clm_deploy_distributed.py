############################################################################
# Licensed Materials - Property of IBM (c) Copyright IBM Corporation 2011. #
# All Rights Reserved.                                                     #
#                                                                          #
# Pre-requisite: WAS and CLM should be installed                           #
# This script installs the list of CLM apps to a single WAS server         #
#                                                                          #
# Usage (Win):                                                             #
#  wsadmin -language jython -user <username> -password <password>          # 
#    -f <path to clm_deploy_distributed.py e.g.                            #
#        C:/JazzTeamServer/server/was/clm_deploy_distributed.py>           #
#    <nodename>                                                            #
#    <servername>                                                          #
#    <path to war files e.g. C:/JazzTeamServer/server/webapps>             #
#    <comma-separated list (no spaces) of apps to be deployed e.g. jts,ccm>#
#                                                                          #
# Usage (Linux):                                                           #
#  ./wsadmin.sh -language jython -user <username> -password <password>     #
#    -f <path to clm_deploy_distributed.py e.g.                            #
#        /opt/IBM/JazzTeamServer/server/was/clm_deploy_distributed.py>     #
#    <nodename>                                                            #
#    <servername>                                                          #
#    <path to war files e.g. /opt/IBM/JazzTeamServer/server/webapps>       #
#    <comma-separated list (no spaces) of apps to be deployed e.g. jts,ccm>#
############################################################################

import os.path

# Determine the offsets of the arguments
if (sys.argv[0] == '-language'):
	firstArgIndex = 2
else:
	firstArgIndex = 0

# Get the node from commandline
node = sys.argv[firstArgIndex]
# Get the server name from commandline
server = sys.argv[firstArgIndex+1]
# Get the location of the war files
war_location = sys.argv[firstArgIndex+2]

# list of CLM apps to be deployed
apps=sys.argv[firstArgIndex+3]
apps=apps [0:len(apps)].split(",")

#######################
# deploy all the apps #
#######################

for app in apps:

	try:
		print "Installing "+app
		full_path_to_app = war_location + "/" +app + ".war"
		# check to see if the .war for the expected app exists in the specified directory; if not, skip it.
		if (os.path.isfile(full_path_to_app)):
			attrs = ['-appname', app+".war", '-defaultbinding.virtual.host default_host -usedefaultbindings', '-node', node, '-server', server, '-contextroot',  "/"+app]
			error = AdminApp.install(full_path_to_app , attrs)
			AdminConfig.save()
		else:
			print "  Info: Unable to locate the following application - skipping install:"
			print "  "+full_path_to_app
			print "  "
	except:
		_type_, _value_, _tbck_ = sys.exc_info()
		error = `_value_`
		print "Error Installing Application "
		print "Error Message = "+error
		#endIf
	#endTry 
#endFor

print "The installed application(s) may be started from the Integrated Solutions Console in WebSphere."


# Example of how to set role/mapping for jts.war
# AdminApp.edit('jts.war', '[-MapRolesToUsers [["JazzAdmins" No No "" admins]["JazzDWAdmins" No No "" admins]["JazzUsers" No No "" users]["JazzGuests" No No "" users]["JazzProjectAdmins" No No "" admins]]]')
# AdminConfig.save() 