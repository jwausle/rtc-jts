This readme file provides instructions on how to run the Jython scripts found in 
this directory to automate the WAS configurations/deployments needed prior to 
using it with CLM.

clm_was_config.py 
-----------------
############################################################################
# Licensed Materials - Property of IBM (c) Copyright IBM Corporation 2011. #
# All Rights Reserved.                                                     #
#                                                                          #
# Pre-requisite: WAS should be installed                                   #
# This script can be run prior to installing CLM                           #
# This script does the following:                                          #
# -> De-select the option 'Use Java 2 security to restrict application     # 
#    access to local resources'                                            #
# -> Select Enable application security check box                          #
# -> Select Enable administrative security check box                       #
# -> Select 'Use available authentication data when an unprotected URI is  #
#    accessed' check box                                                   #
# -> Sets the initial and max jvm heap sizes to 4096                       #
# -> Sets the recommended JVM args.                                        #
#    * For 64-bit:                                                         #
#      o Solaris/MacOS (unofficial):                                       #
#        -Xmx4g -Xms4g -Xmn512m                                            #
#        -XX:MaxPermSize=768M -XX:ReservedCodeCacheSize=512M               # 
#        -XX:CodeCacheMinimumFreeSpace=2M"                                 #
#      o AIX:                                                              #
#        -Xmx4g -Xms4g -Xmn512m -Xgcpolicy:gencon -Xnocompressedrefs       #
#      o Other (e.g. Windows/Linux)                                        #
#        -Xmx4g -Xms4g -Xmn512m -Xgcpolicy:gencon -Xcompressedrefs         #
#        -Xgc:preferredHeapBase=0x100000000                                #     
#    * For 32-bit (deprecated):                                            #     
#      o -Xmx1200m                                                         #
# -> Adds following jvm properties:                                        #
#    * name: JAZZ_HOME value: path to config files                         #
#    * name: java.awt.headless value: true                                 #
#    * name: org.eclipse.emf.ecore.plugin.EcorePlugin.                     #
#      doNotLoadResourcesPlugin value: true                                #
#    * name: log4j.configuration value: path to startup_log4j.properties   #
# -> Conditionally adds the following jvm properties (appropriate code     #
#    needs to be uncommented)                                              #
#    * name: SQLSERVER_JDBC_DRIVER_FILE value: <Absolute path to the JDBC  #
#            driver>/sqljdbc4.jar (if connecting with JRE 6, else to       #
#            <Absolute path to the JDBC driver>/sqljdbc.jar (if connecting #
#            with JRE 5.                                                   #
#            Note: The path to the JDBC driver must be an absolute path.   #
#                  Do not use URL path (file:///)                          #
#      Uncomment code:                                                     #
#      createJVMCustomProperty(jvm, "SQLSERVER_JDBC_DRIVER_FILE",          #
#                              sqlDriverPath, "")                          #
#    * name: ORACLE_JDBC_DRIVER_FILE value: <Absolute path to the JDBC     #
#            driver>/ojdbc6.jar.                                           #
#            Note: The path to the JDBC driver must be an absolute path.   #
#                  Do not use URL path (file:///)                          #
#      Uncomment code:                                                     #
#      createJVMCustomProperty(jvm, "ORACLE_JDBC_DRIVER_FILE",             #
#                              oracleDriverPath, "")                       #
#    * name: DB2Z_JDBC value: /@db2PathPrefix@/db2910_jdbc/classes or      #
#            /@db2PathPrefix@/db2a10/jdbc/classes                          #
#            Note: Replace @db2PathPrefix@ with the path to the DB2 V9 or  #
#                  V10 JDBC license and JDBC jar files on your system.     #
#                  These files are named db2jcc_license_cisuz.jar and      #
#                  db2jcc.jar and are located by default at /usr/lpp/ plus #
#                  the version-specific path.                              #
#      Uncomment code:                                                     #
#      os_name = java.lang.System.getProperty('os.name')                   #
#      is_zOS = os_name.find('z/OS')                                       #
#      if (is_zOS != -1):                                                  #
#          createJVMCustomProperty(jvm, "DB2Z_JDBC", db2DriverPath, "")    #
#                                                                          #
# -> In a clustered environment:                                           #
#    * Make the following ORB (Object Request Broker) settings             #
#      o Request timeout = 30                                              #
#      o Connection cache maximum = 1024                                   #
#      o Connection cache minimum = 1024                                   #
#      o Locate request timeout = 30                                       #
#      o Pass by reference (noLocalCopies) = true                          #
#    * Add the following ORB custom properties                             #
#      o name: com.ibm.CORBA.ConnectionMultiplicity value: 1               #
#      o name: com.ibm.CORBA.ConnectTimeout value: 10                      #
#      o name: com.ibm.CORBA.FragmentSize value: 0                         #
#      o name: com.ibm.CORBA.FragmentTimeout value: 30                     #
#      o name: com.ibm.CORBA.NoLocalInterceptors value: true               #
#      o name: com.ibm.CORBA.ServerSocketQueueDepth value: 1024            #
#    * Make the following Thread Pool Settings                             #
#      o Minimum Size = 256                                                #
#      o Maximum Size = 256                                                #
#      o Allow thread allocation beyond maximum thread size = false        #
#                                                                          #                                       
# Usage instructions are based on WebSphere® Application Server version 7  #
#                                                                          #
# Usage (Win):                                                             #
#    wsadmin -language jython -user <username> -password <password>        #
#    -f <path to clm_was_config.py e.g.                                    #
#    C:/JazzTeamServer/server/was/clm_was_config.py>                       #
#    <path to conf directory e.g.                                          #
#    C:/JazzTeamServer/server/conf>                                        #
# Usage (Linux):                                                           #
#    ./wsadmin.sh -language jython -user <username> -password <password>   #
#    -f <path to clm_was_config.py e.g.                                    #
#    /opt/IBM/JazzTeamServer/server/was/clm_was_config.py>                 # 
#    <path to conf directory e.g.                                          #
#    /opt/IBM/JazzTeamServer/server/conf >                                 #
############################################################################

clm_deploy.py
-------------
############################################################################
# Licensed Materials - Property of IBM (c) Copyright IBM Corporation 2011. #
# All Rights Reserved.                                                     #
#                                                                          #
# Pre-requisite: WAS and CLM should be installed                           #
# This script installs all CLM apps to a single WAS server                 #
#                                                                          #
# Usage (Win):                                                             #
#    wsadmin -language jython -user <username> -password <password>        # 
#    -f <path to clm_deploy.py e.g.                                        #
#    C:/JazzTeamServer/server/was/clm_deploy.py>                           #
#    <nodename> <servername>                                               #
#    <path to war files e.g.                                               #
#    C:/JazzTeamServer/server/webapps/>                                    #
# Usage (Linux):                                                           #
#    ./wsadmin.sh -language jython -user <username> -password <password>   #
#    -f <path to clm_deploy.py e.g.                                        #
#    /opt/IBM/JazzTeamServer/server/was/clm_deploy.py>                     #
#    <nodename> <servername>                                               #
#    <path to war files e.g.                                               #
#    /opt/IBM/JazzTeamServer/server/webapps/>                              #
############################################################################

clm_deploy_distributed.py
-------------------------
############################################################################
# Licensed Materials - Property of IBM (c) Copyright IBM Corporation 2011. #
# All Rights Reserved.                                                     #
#                                                                          #
# Pre-requisite: WAS and CLM should be installed                           #
# This script installs the list of CLM apps to a single WAS server         #
#                                                                          #
# Usage (Win):                                                             #
#    wsadmin -language jython -user <username> -password <password>        # 
#    -f <path to clm_deploy_distributed.py e.g.                            #
#    C:/JazzTeamServer/server/was/clm_deploy_distributed.py>               #
#    <nodename> <servername>                                               #
#    <path to war files e.g.                                               #
#    C:/JazzTeamServer/server/webapps/>                                    #
#    <comma-separated list (no spaces) of apps to be deployed e.g. jts,ccm>#
# Usage (Linux):                                                           #
#    ./wsadmin.sh -language jython -user <username> -password <password>   #
#    -f <path to clm_deploy_distributed.py e.g.                            #
#    /opt/IBM/JazzTeamServer/server/was/clm_deploy_distributed.py>         #
#    <nodename> <servername>                                               #
#    <path to war files e.g.                                               #
#    /opt/IBM/JazzTeamServer/server/webapps/>                              #
#    <comma-separated list (no spaces) of apps to be deployed e.g. jts,ccm>#
############################################################################

clm_deploy_cluster.py
---------------------
############################################################################
# Licensed Materials - Property of IBM (c) Copyright IBM Corporation 2011. #
# All Rights Reserved.                                                     #
#                                                                          #
# Pre-requisite: WAS and CLM should be installed. Cluster should exist     #
# This script installs all CLM apps to all the app servers in a cluster    #
#                                                                          #
# Usage (Win):                                                             #
#    wsadmin -language jython -user <username> -password <password>        #  
#    -f <path to clm_deploy_cluster.py e.g.                                #
#    C:/JazzTeamServer/server/was/clm_deploy_cluster.py>                   #
#    <nodename of node running the deployment manager> <clustername>       #
#    <path to war files e.g.                                               #
#    C:/JazzTeamServer/server/webapps/>                                    #
# Usage (Linux):                                                           #
#    ./wsadmin.sh -language jython -user <username> -password <password>   #
#    -f <path to clm_deploy_cluster.py e.g.                                #
#    /opt/IBM/JazzTeamServer/server/was/clm_deploy_cluster.py>             #
#    <nodename of node running the deployment manager> <clustername>       #
#    <path to war files e.g.                                               #
#    /opt/IBM/JazzTeamServer/server/webapps/>                              #
############################################################################

clm_deploy_cluster_distributed.py
---------------------------------
############################################################################
# Licensed Materials - Property of IBM (c) Copyright IBM Corporation 2011. #
# All Rights Reserved.                                                     #
#                                                                          #
# Pre-requisite: WAS and CLM should be installed. Cluster should exist     #
# This script installs the list of CLM apps to all the app servers in a    #
# cluster                                                                  #
#                                                                          #
# Usage (Win):                                                             #
#    wsadmin -language jython -user <username> -password <password>        #  
#    -f <path to clm_deploy_cluster_distributed.py e.g.                    #
#    C:/JazzTeamServer/server/was/clm_deploy_cluster_distributed.py>       #
#    <nodename of node running the deployment manager> <clustername>       #
#    <path to war files e.g.                                               #
#    C:/JazzTeamServer/server/webapps/>                                    #
#    <comma-separated list (no spaces) of apps to be deployed e.g. jts,ccm>#
# Usage (Linux):                                                           #
#    ./wsadmin.sh -language jython -user <username> -password <password>   #
#    -f <path to clm_deploy_cluster_distributed.py e.g.                    #
#    /opt/IBM/JazzTeamServer/server/was/clm_deploy_cluster_distributed.py> #
#    <nodename of node running the deployment manager> <clustername>       #
#    <path to war files e.g.                                               #
#    /opt/IBM/JazzTeamServer/server/webapps/>                              #
#    <comma-separated list (no spaces) of apps to be deployed e.g. jts,ccm>#
############################################################################


clm_undeploy.py
---------------
############################################################################
# Licensed Materials - Property of IBM (c) Copyright IBM Corporation 2011. #
# All Rights Reserved.                                                     #
#                                                                          #
# This script un-installs all CLM apps.                                    #
#                                                                          #
# Usage (Win):                                                             #
#    wsadmin -language jython -user <username> -password <password>        #  
#    -f <path to clm_undeploy.py e.g.                                      #
#    C:/JazzTeamServer/server/was/clm_undeploy.py>                         #
# Usage (Linux):                                                           #
#    ./wsadmin.sh -language jython -user <username> -password <password>   #
#    -f <path to clm_undeploy.py e.g.                                      #
#    /opt/IBM/JazzTeamServer/server/was/clm_undeploy.py>                   #
############################################################################

clm_undeploy_distributed.py
---------------------------
############################################################################
# Licensed Materials - Property of IBM (c) Copyright IBM Corporation 2011. #
# All Rights Reserved.                                                     #
#                                                                          #
# This script un-installs the list of CLM apps specified.                  #
#                                                                          #
# Usage (Win):                                                             #
#    wsadmin -language jython -user <username> -password <password>        #  
#    -f <path to clm_undeploy_distributed.py e.g.                          #
#    C:/JazzTeamServer/server/was/clm_undeploy_distributed.py>             #
#    <comma-separated list (no spaces) of apps to be undeployed eg. jts,rm>#
# Usage (Linux):                                                           #
#    ./wsadmin.sh -language jython -user <username> -password <password>   #
#    -f <path to clm_undeploy_distributed.py e.g.                          #
#    /opt/IBM/JazzTeamServer/server/was/clm_undeploy_distributed.py>       #
#    <comma-separated list (no spaces) of apps to be undeployed eg. jts,rm>#
############################################################################