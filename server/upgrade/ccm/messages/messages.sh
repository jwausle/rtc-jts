#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2011, 2015. All Rights Reserved.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************

# ################################################################################
#
# File for messages displayed by the upgrade automated scripts.
#
# ################################################################################


# *********************
# * Messages function *
# *********************
messages() {

case $1 in 

# *********************************
# * Initial verification messages *
# *********************************

INVALID_LAUNCH )
echo ""
echo "Do not execute the app_upgrade script directly.  To upgrade the JTS or application, run one of the following commands:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Use -help for a complete description of the above commands."
;;

INVALID_START_DIR )
echo ""
echo "Except while using -help parameter, $2 script must be run from $3"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "The file '$2' contains the parameter values for the upgrade script."
echo "If you need to modify any of the default parameter values, you can edit these files or you can specify the parameter values as command line arguments to the upgrade scripts."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "The following set of files contain default parameter values for an application or JTS upgrade.  If you need to modify any of the default parameter values, you can edit these files or you can specify the parameter values as command line arguments to the upgrade scripts."
echo "- CCM upgrade: $2/params/ccm_params$3.sh"
echo "- GC upgrade:  $2/params/gc_params$3.sh"
echo "- QM upgrade:  $2/params/qm_params$3.sh"
echo "- RM upgrade:  $2/params/rm_params$3.sh"
echo "- JTS upgrade: $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Parameters verification messages *
# ************************************

# Intrinsic verification
# ======================

MISSING_APP_TYPE )
echo ""
echo "No JTS or application type was specified.  To upgrade the JTS or application, run one of the following commands:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Use -help for a complete description of the above commands."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2 is not a valid JTS or application type.  To upgrade the JTS or application, run one of the following commands:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Use -help for a complete description of the above commands."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "Missing value for parameter $2."
echo "Use -help for a complete description of parameters."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "The directory $3, specified for $2 parameter, does not exist or is not valid."
echo "Use -help for a complete description of parameters."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "The directory $3 specified for $2 parameter must be an absolute path."
echo "Use -help for a complete description of parameters."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "The file $3, specified for $2 parameter, does not exist or is not valid."
echo "Use -help for a complete description of parameters."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3 is an invalid value for $2 parameter."
echo "Use -help for a complete description of parameters."
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2 is an unknown parameter."
echo "Use -help for a complete description of parameters."
echo ""
;;


# Extrinsic verification
# ======================

MISSING_HOME_PARAM )
echo ""
echo "Missing home directory parameter $2."
echo "Use -help for a complete description of parameters."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "The directory $2 does not exist or is not valid."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "Cannot find the application repotools command '$2'."
echo ""
echo "Verify that the -oldApplicationHome parameter '$3' is pointing to the old server configuration directory, for example, 'JazzInstallRoot/server/conf'."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "Cannot find the application repotools command '$2'."
echo ""
echo "Verify that the -oldApplicationHome parameter '$3' is pointing to the old server configuration directory, for example, 'JazzInstallRoot/server/conf' and that the jtsContextRoot parameter '$4' is correct."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "Cannot find the configuration file '$2'."
echo ""
echo "Verify that the -oldApplicationHome parameter '$3' is pointing to the old server configuration directory, for example, 'JazzInstallRoot/server/conf'."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "Cannot find the configuration file '$2'."
echo ""
echo "Verify that the -oldApplicationHome parameter '$3' is pointing to the old server configuration directory, for example, 'JazzInstallRoot/server/conf' and that the jtsContextRoot parameter '$4' is correct."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "Cannot find the application repotools command '$2'."
echo ""
echo "Verify that the -newApplicationHome parameter '$3' is pointing to the new application server configuration directory, for example, 'JazzInstallRoot/server/conf' and that the applicationContextRoot parameter '$4' is correct."
echo "If you are upgrading from a previous release, ensure that you selected the correct context roots.  For example, if using Installation Manager, you must select the $5 context root option on the "Context Root Options" panel.  If you accidentally selected a different option, you must reinstall the product with the $5 context root option."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "Cannot find the configuration file '$2'."
echo ""
echo "Verify that the -newApplicationHome parameter '$3' is pointing to the new JTS server configuration directory, for example, 'JazzInstallRoot/server/conf' and that the applicationContextRoot parameter '$4' is correct."
echo "If you are upgrading from a previous release, ensure that you selected the correct context roots.  For example, if using Installation Manager, you must select the $5 context root option on the "Context Root Options" panel.  If you accidentally selected a different option, you must reinstall the product with the $5 context root option."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "Cannot find the JTS repotools command '$2'."
echo ""
echo "Verify that the -oldJTSHome parameter '$3' is pointing to the old JTS server configuration directory, for example, 'JazzInstallRoot/server/conf' and that the jtsContextRoot parameter '$4' is correct."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "Cannot find the configuration file '$2'."
echo ""
echo "Verify that the -oldJTSHome parameter '$3' is pointing to the old JTS server configuration directory, for example, 'JazzInstallRoot/server/conf' and that the jtsContextRoot parameter '$4' is correct."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "Cannot find the JTS repotools command '$2'."
echo ""
echo "Verify that the -newJTSHome parameter '$3' is pointing to the new JTS server configuration directory, for example, 'JazzInstallRoot/server/conf' and that the jtsContextRoot parameter '$4' is correct."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "Cannot find the configuration file '$2'."
echo ""
echo "Verify that the -newJTSHome parameter '$3' is pointing to the new JTS server configuration directory, for example, 'JazzInstallRoot/server/conf' and that the jtsContextRoot parameter '$4' is correct."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "A tar file containing 2.x data is required for $2 upgrade."
echo "Use -help for a complete description of parameters."
echo ""
;;


# **********************
# * Execution messages *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    JTS Upgrade    ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    CCM Upgrade    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    GC Upgrade    ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    QM Upgrade    ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    RM Upgrade    ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "Checking the RM old application version..."
;;

RM_DISPLAY_OLD_VERSION )
echo "RM old application version is '$2'"
;;

# *********************
# * First step switch *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "Last execution failed at initial step..."
;;

LAST_STEP_FAILED )
echo ""
echo "Last execution failed at step $2..."
echo "Do you want to restart the upgrade from this step or a previous one?"
;;

ALREADY_RUN )
echo ""
echo "The upgrade was already done and finished successfully..."
echo "Do you want to restart a new one from a specific step?"
;;

LAST_STEP_PASSED )
echo ""
echo "Last execution was successfully stopped at step $2..."
echo "Do you want to restart the upgrade from current step $3 or a previous one?"
;;

ENTER_NEXT_STEP )
echo ""
echo "Enter the step number [$2-$3] you want to restart the upgrade from or [Enter] to Cancel:"
;;

INTEGER_STEP_NUMBER )
echo ""
echo "'$2' is not a number. Please enter a valid step number."
;;

INVALID_STEP_NUMBER )
echo ""
echo "'$2' is an invalid step number. Please enter a valid step number."
;;

MAX_STEP_NUMBER )
echo ""
echo "Last step is step $2, therefore you cannot restart the upgrade at step $3."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "Step $2 was not run yet, therefore you cannot restart the upgrade at step $3."
;;


# **********************
# * Messages for Steps *
# **********************

STEP_0_IBMi )
echo "Step 0: Drop tables"
echo "-------------------"
;;

STEP_0 )
echo "Step 0: Update config files"
echo "---------------------------"
;;

STEP_1_ADD )
echo "Step 1: Add tables"
echo "------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "Step $2: Rebuild text indices"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "Step $2: Recreate query and search indexes"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "Step $2: Merge LPA to JTS"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "Step $2: Fix the front side URL of LPA storage areas"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "Step $2: Remove LPA Friend from RM"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "Step 2: Upgrade data warehouse schema"
echo "-------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "Step $2: Finalize RM application"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "Step $2: Finalize JTS application"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "Step $2: Re-index RM application"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "The $2 upgrade failed at step $3.  Correct the problem and run the script again starting at step $3."
echo "" 
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "The $2 upgrade succeeded.  You may upgrade any applications in your environment now."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "The offline portion of the RM upgrade succeeded. You may now start the servers in your deployment."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "The offline portion of the RM upgrade succeeded. There is one remaining" 
echo "step necessary to finish migration, but it requires that all servers that" 
echo "link to RM (such as RTC, RQM, JRS, GC) are online. When convenient, bring up"
echo "all servers (including RM). It is recommended that you login to each server"
echo "and ensure that they are working properly. Then run the following command:"
echo ""
messages STEP_DIR_CMD $2 
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "The $2 upgrade succeeded.  You may now start the servers in your deployment."
echo ""
;;

# *******************************
# * Messages while running step *
# *******************************

STEP_DIR_CMD )
echo ""
echo "Directory: $2"
echo "Command:"
;;

ENTER_STEP_ACTION )
echo "Enter [E] to execute this step, [S] to skip it or hit [Enter] to cancel the script execution:"
;;

INVALID_STEP_ACTION )
echo ""
echo "'$2' is an invalid entry, only 'E', 'S' or 'Enter' are allowed"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "A vi editor will be opened to let you verify the $2 teamserver.properties file."
echo "Verify that the Public URI root denoted by the com.ibm.team.repository.server.webapp.url property is correct."
echo "Verify that the database properties are correct."
echo "When done, save your changes if any and close the editor to continue the script execution."
echo ""
echo "Consult the 'Upgrading the Rational solution for CLM' topic of the product documentation"
echo "for information on how to properly configure each property."
;;

PAUSE )
echo ""
echo "Enter [C] to continue the execution or hit [Enter] to cancel the script execution:"
;;

INVALID_PAUSE_ACTION )
echo ""
echo "'$2' is an invalid entry, only 'C' or 'Enter' are allowed"
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "Copying text indices from '$2' to '$3'."
echo "This may take several minutes..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "Copying query and search indices from '$2' to '$3'." 
echo "This may take several minutes..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "Failed to copy text indices from '$2' to '$3'."
echo "Verify the com.ibm.team.fulltext.indexLocation property"
echo "defined in the teamserver.properties file."
echo "Manually copy the text indices to this directory"
echo "or run repotools -rebuildTextIndices to rebuild them."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "The file $NEW_APP_PARENT_DIR/RM_APP.ID does not exist"
echo "Create this file with the single line that contains the RM Application ID"
echo "and try again."
echo ""
;;

# *****************************************
# * Messages for Public URIs verification *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "There is no Public URI defined in"
echo "$3,"
echo "therefore the upgrade cannot be started."
echo ""
echo "There must be one Public URI in this file defined as follows:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "The Public URI property com.ibm.team.repository.server.webapp.url must be present in the teamserver.properties file."
echo "Add the property to the old installation teamserver.properties file and set the value to be the URI root that all clients use to reach the server."
echo "The Public URI root is essential for the proper functioning of your new installation. The upgrade will not succeed without this property.  "
echo "For more information, see the product documentation topic on 'Planning your URIs'."
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "All Public URIs defined in"
echo "$3,"
echo "are commented out, therefore the upgrade cannot be started."
echo ""
echo "It should have one uncommented Public URI in this file defined as follows:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "The Public URI property com.ibm.team.repository.server.webapp.url must be present in the teamserver.properties file."
echo "Add the property to the old installation teamserver.properties file and set the value to be the URI root that all clients use to reach the server."
echo "The Public URI root is essential for the proper functioning of your new installation. The upgrade will not succeed without this property."
echo "For more information, see the product documentation topic on 'Planning your URIs'."
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "The context root for the JTS is set to '$2'."
echo "The context root for the application is set to '$3'."
echo "The context root for the jts and application cannot be the same."
echo ""
;;

esac

}
