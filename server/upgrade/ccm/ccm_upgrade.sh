#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2011. All Rights Reserved.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************

SCRIPT_DIR=`dirname $0`
export SCRIPT_DIR
$SCRIPT_DIR/app_upgrade.sh -ccm $*
