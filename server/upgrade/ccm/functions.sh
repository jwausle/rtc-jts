#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2006, 2015. All Rights Reserved.
#  
#  Note to U.S. Government Users Restricted Rights:  
#  Use, duplication or disclosure restricted by GSA ADP Schedule 
#  Contract with IBM Corp. 
#  *******************************************************************************


# *****************
# * Help function *
# *****************
help() {
	cat $SCRIPT_DIR/doc/${UPGRADED_APP}_help$LANG_SUFFIX.txt
}

# **************************
# * Set safe path function *
# **************************
setSafePath()  {
    # Set a safe path for scripts
    OS_TYPE=`uname`
    if [ "$OS_TYPE" = SunOS ];
      then
          # On Solaris, need to use the programs from /usr/xpg4/bin if we can
          PATH=/usr/bin/xpg4/bin:/usr/bin
      else if [ "$OS_TYPE" = "OS400" ]; then
          # On i Series, need to include /QOpenSys because that's where awk lives
          PATH=/usr/bin:/QOpenSys/usr/bin
        else
          # For all other UNIX-like systems, use the standard
          PATH=/bin:/usr/bin
        fi
      fi
}

# ************************
# * First step functions *
# ************************

# Set first step depending on previous results
setFirstStep() {
	# Previous execution might have finished with an error
	if [ $LAST_RETURN -eq 0 ]; then
		CURRENT_STEP=`expr $LAST_STEP + 1`
		if [ $LAST_STEP -ge $MAX_STEPS ]; then
			messages ALREADY_RUN
			STEP_NUM_MAX=$MAX_STEPS
			enterFirstStep
		else
			messages LAST_STEP_PASSED $LAST_STEP $CURRENT_STEP
			STEP_NUM_MAX=$CURRENT_STEP
			enterFirstStep
		fi
	else
		CURRENT_STEP=$LAST_STEP
		echo ""
		if [ $LAST_STEP -eq $INITIAL_STEP ]; then
			messages INITIAL_STEP_FAILED
			CURRENT_STEP=$INITIAL_STEP
			return
		fi
		messages LAST_STEP_FAILED $LAST_STEP
		STEP_NUM_MAX=$LAST_STEP
		enterFirstStep
	fi
}

# Enter first step value
enterFirstStep() {
	messages ENTER_NEXT_STEP $INITIAL_STEP $STEP_NUM_MAX
	read answer
	echo ""
	if [ "$answer" = "" ]; then
		exit 1
	fi
	if [ `echo $answer | grep "[^0-9]"` ]; then
		messages INTEGER_STEP_NUMBER $answer
		enterFirstStep
	fi
	if [ $answer -lt $INITIAL_STEP ]; then
		messages INVALID_STEP_NUMBER $answer
		enterFirstStep
	fi
	if [ $answer -gt $MAX_STEPS ]; then
		messages MAX_STEP_NUMBER $MAX_STEPS $answer
		enterFirstStep
	fi
	if [ $answer -gt $STEP_NUM_MAX ]; then
		messages NUM_MAX_STEP_NUMBER $STEP_NUM_MAX $answer
		enterFirstStep
	fi
	CURRENT_STEP=$answer
}

# Run the current step
runStep() {
	echo ""
	messages $CURRENT_STEP_MSG $CURRENT_STEP
	messages STEP_DIR_CMD $1
	echo "    $STEP_CMD"
	echo ""
	confirm_step
	CONFIRMED=$?
	if [ $CONFIRMED -eq 1 ]; then
		cd $1
		./$STEP_CMD
		ERROR_REPOTOOLS=$?
	else
		ERROR_REPOTOOLS=0
	fi
	return $CONFIRMED
}


# *******************
# * Pause functions *
# *******************

pause() {
	messages PAUSE
	read answer
	echo ""
	if [ "$answer" = "" ]; then
		exit 2
	elif [ "$answer" != "c" ] && [ "$answer" != "C" ]; then
		messages INVALID_PAUSE_ACTION $answer
		pause
		return $?
	fi	
}

confirm_step() {
	answer=
	if [ "$NO_STEP_PROMPT" != "true" ]; then
		messages ENTER_STEP_ACTION
		read answer
		echo ""
	else
		answer=e
	fi
	if [ "$answer" = "s" ] || [ "$answer" = "S" ]; then
		return 0
	elif [ "$answer" = "" ]; then
		exit 2
	elif [ "$answer" != "e" ] && [ "$answer" != "E" ]; then
		messages INVALID_STEP_ACTION $answer
		confirm_step
		return $?
	fi
	return 1
}


# ********************
# * Verify functions *
# ********************

# Verify that public URLs are well defined
# in a teamserver.properties file
verify() {
	# Init
	RETURN_VALUE=0
	file=$2/$3/teamserver.properties
	n1=0
	n2=0

	# Check Public URI presence in the file
	n1=`grep -c "com.ibm.team.repository.server.webapp.url" $file`
	if [ $n1 -eq 0 ]; then
		# None was found => error
		messages MISSING_PUBLIC_URI $3 $file
		RETURN_VALUE=1
	else
		n2=`grep -c "#com.ibm.team.repository.server.webapp.url" $file`
		if [ $n1 -eq $n2 ]; then
			# All public URLs are commented => error
			messages COMMENTED_PUBLIC_URI $3 $file
			RETURN_VALUE=1
		fi
	fi

	# Store result
	echo "$1: $n1 $n2" >> $4

	# Return
	return $RETURN_VALUE
}

# Verify both JTS and Application teamserver.properties files
verify_all() {
	VERIFY_LOG_FILE="$SCRIPT_DIR/.${UPGRADED_APP}_verify.log"

	if [ -f $VERIFY_LOG_FILE ]; then
		rm -f $VERIFY_LOG_FILE
	fi

	if [ "$NO_VERIFY" != "false" ];  then
		# Verify JTS and Application teamserver.properties files
		verify JTS $NEW_JTS_HOME $JTS_CONTEXT_ROOT $VERIFY_LOG_FILE
		verify_jts=$?
		if [ $UPGRADED_APP = jts ] || [ $UPGRADED_APP = rm ]; then
			verify_app=0
		else
			verify Application $NEW_APPLICATION_HOME $APPLICATION_CONTEXT_ROOT $VERIFY_LOG_FILE
			verify_app=$?
		fi
		if [ $verify_jts -ne 0 ]; then
			messages OVERALL_MIGRATION_FAILED $UPGRADED_APP 0	
			exit $verify_jts
		elif [ $verify_app -ne 0 ]; then
			messages OVERALL_MIGRATION_FAILED $UPGRADED_APP 0
			exit $verify_app
		fi
	fi
}


# ******************
# * Util functions *
# ******************

# Get the absolute path from a given dir or file
getAbsolutePath() {
	pos=1
	first="`echo $1 | cut -d'/' -f$pos`"

	# No slash in argument, do not loop
	if [ "$first" = "$1" ]; then
		ABSOLUTE_PATH=`pwd`
		if [ "$1" = ".." ]; then
		ABSOLUTE_PATH=`dirname $ABSOLUTE_PATH`
		elif [ "$1" != "." ]; then
			ABSOLUTE_PATH="`pwd`/$1"
		fi
		return
	fi

	# Test whether it's an absolute path or not to set dir starting point
	if [ "$first" = "" ]; then
		# absolute path
		ABSOLUTE_PATH=""
		pos=`expr $pos + 1`
		first="`echo $1 | cut -d'/' -f$pos`"
	else
		ABSOLUTE_PATH=`pwd`
	fi

	# At least one slash in argument, loop on path names
	while [ "$first" != "" ]
			do
		case $first in
			.)
				;;
			..)
				ABSOLUTE_PATH=`dirname $ABSOLUTE_PATH`
				;;
			*)
				ABSOLUTE_PATH="$ABSOLUTE_PATH/$first"
				;;
		esac
		pos=`expr $pos + 1`
		first="`echo $1 | cut -d'/' -f$pos`"
			done
}

# **********************************************************
# Copy text indices from old to new full text index location
# Succeed only if the com.ibm.team.fulltext.indexLocation
# property exists both in old and new TSP. Otherwise, error
# out with the new message COPY_INDICES_FAILED.
# Note that nothing happens if absolute paths are the same 
# **********************************************************
copy_text_indices() {
	OLD_TSP_FILE=$1
	OLD_HOME=$2
	NEW_TSP_FILE=$3
	NEW_HOME=$4
	
	# Old Application TSP
	# ===================

	# Check property in the TSP file
	n1=`grep -c "com.ibm.team.fulltext.indexLocation" $OLD_TSP_FILE`
	if [ $n1 -eq 0 ]; then
		# None was found => return
		messages COPY_INDICES_FAILED not-defined not-checked
		return 1
	else
		# Check at least one line with property is not commented
		n2=`grep -c "#com.ibm.team.fulltext.indexLocation" $OLD_TSP_FILE`
		if [ $n1 -le $n2 ]; then
			# All lines with property are commented => return
			messages COPY_INDICES_FAILED not-defined not-checked
			return 1
		fi
	fi

	# Check whether the text indices path is relative or not
	OLD_TEXT_INDICES_DIR=`grep "com.ibm.team.fulltext.indexLocation" $OLD_TSP_FILE | grep -v "#com.ibm.team.fulltext.indexLocation" | cut -d'=' -f2 | tr -d [:cntrl:]`
	# debug:	echo "OLD_TEXT_INDICES_DIR=$OLD_TEXT_INDICES_DIR"
	cd $OLD_HOME/..
	getAbsolutePath $OLD_TEXT_INDICES_DIR
	OLD_TEXT_INDICES_DIR=$ABSOLUTE_PATH
	# debug:	echo "OLD_TEXT_INDICES_DIR=$OLD_TEXT_INDICES_DIR"
	
	# No copy is necessary if the old text indices directory does not exist
	if [ ! \( -d $OLD_TEXT_INDICES_DIR \) ]; then
		return 10
	fi

	# New Application TSP
	# ===================

	# Check property in the TSP file
	n1=`grep -c "com.ibm.team.fulltext.indexLocation" $NEW_TSP_FILE`
	if [ $n1 -eq 0 ]; then
		# None was found => return
		messages COPY_INDICES_FAILED $OLD_TEXT_INDICES_DIR not-defined
		return 1
	else
		# Check at least one line with property is not commented
		n2=`grep -c "#com.ibm.team.fulltext.indexLocation" $NEW_TSP_FILE`
		if [ $n1 -le $n2 ]; then
			# All lines with property are commented => return
			messages COPY_INDICES_FAILED $OLD_TEXT_INDICES_DIR not-defined
			return 1
		fi
	fi

	# Check whether the text indices path is relative or not
	NEW_TEXT_INDICES_DIR=`grep "com.ibm.team.fulltext.indexLocation" $NEW_TSP_FILE | grep -v "#com.ibm.team.fulltext.indexLocation" | cut -d'=' -f2 | tr -d [:cntrl:]`
	# debug:	echo "NEW_TEXT_INDICES_DIR=$NEW_TEXT_INDICES_DIR"
	cd $NEW_HOME/..
	getAbsolutePath $NEW_TEXT_INDICES_DIR
	NEW_TEXT_INDICES_DIR=$ABSOLUTE_PATH
	# debug:	echo "NEW_TEXT_INDICES_DIR=$NEW_TEXT_INDICES_DIR"

	# Copy the old indices directory to the new indices directory if the two directories are different
	if [ $OLD_TEXT_INDICES_DIR = $NEW_TEXT_INDICES_DIR ]; then
		# debug:		echo The directories match, not copying indices
		return 0
	fi
	
	if [ "$last" != "/" ]; then
    	OLD_TEXT_INDICES_DIR=$OLD_TEXT_INDICES_DIR/
    fi
    
	# debug:	echo The directories do not match, copying indices
	if [ ! \( -d $NEW_TEXT_INDICES_DIR \) ]; then
		mkdir -p $NEW_TEXT_INDICES_DIR
	fi
	ls -l $OLD_TEXT_INDICES_DIR* > /dev/null 2<&1
	if [ "$?" = "0" ]; then
		messages COPY_TXT_INDICES_INPROGRESS $OLD_TEXT_INDICES_DIR $NEW_TEXT_INDICES_DIR
		cp -r -p $OLD_TEXT_INDICES_DIR* $NEW_TEXT_INDICES_DIR/
	fi
	# Everything is fine to copy text indices
	return $?
}

# ***********************************************************************
# Similar to copy_text_indices, but the jts copy is a little more tricky.  
# It needs to use the root indices directory
# or the JFS specified indices dir 
# ***********************************************************************
copy_jfs_indices(){
	OLD_TSP_FILE=$1
	OLD_HOME=$2
	OLD_CONTEXT_ROOT=$3
	NEW_TSP_FILE=$4
	NEW_HOME=$5
	NEW_CONTEXT_ROOT=$6
	
	# Old JTS TSP
	# ===================

	# Check property in the TSP file
	n1=`grep -c "com.ibm.team.jfs.index.root.directory" $OLD_TSP_FILE`
	if [ $n1 -eq 0 ]; then
		# None was found => return
		messages COPY_INDICES_FAILED not-defined not-checked
		return 1
	else
		# Check at least one line with property is not commented
		n2=`grep -c "#com.ibm.team.jfs.index.root.directory" $OLD_TSP_FILE`
		if [ $n1 -le $n2 ]; then
			# All lines with property are commented => return
			messages COPY_INDICES_FAILED not-defined not-checked
			return 1
		fi
	fi

	# Check whether the text indices path is relative or not
	OLD_JFS_INDICES_DIR=`grep "com.ibm.team.jfs.index.root.directory" $OLD_TSP_FILE | grep -v "#com.ibm.team.jfs.index.root.directory" | cut -d'=' -f2 | tr -d [:cntrl:]`
	# debug:	echo "OLD_JFS_INDICES_DIR=$OLD_JFS_INDICES_DIR"
	cd $OLD_HOME/$OLD_CONTEXT_ROOT
	getAbsolutePath $OLD_JFS_INDICES_DIR
	OLD_JFS_INDICES_DIR=$ABSOLUTE_PATH
	 
	# debug:	echo "OLD_JFS_INDICES_DIR=$OLD_JFS_INDICES_DIR"
	
	
	# No copy is necessary if the old text indices directory does not exist
	if [ ! \( -d $OLD_JFS_INDICES_DIR \) ]; then
		return 10
	fi

	# New JTS TSP
	# ===================

	# Check property in the TSP file
	n1=`grep -c "com.ibm.team.jfs.index.root.directory" $NEW_TSP_FILE`
	if [ $n1 -eq 0 ]; then
		# None was found => return
		messages COPY_INDICES_FAILED not-defined not-checked
		return 1
	else
		# Check at least one line with property is not commented
		n2=`grep -c "#com.ibm.team.jfs.index.root.directory" $NEW_TSP_FILE`
		if [ $n1 -le $n2 ]; then
			# All lines with property are commented => return
			messages COPY_INDICES_FAILED not-defined not-checked
			return 1
		fi
	fi

	# Check whether the text indices path is relative or not
	NEW_JFS_INDICES_DIR=`grep "com.ibm.team.jfs.index.root.directory" $NEW_TSP_FILE | grep -v "#com.ibm.team.jfs.index.root.directory" | cut -d'=' -f2 | tr -d [:cntrl:]`
	
	# debug:	echo "OLD_JFS_INDICES_DIR=$OLD_JFS_INDICES_DIR"
	cd $NEW_HOME/$NEW_CONTEXT_ROOT
	getAbsolutePath $NEW_JFS_INDICES_DIR
	NEW_JFS_INDICES_DIR=$ABSOLUTE_PATH
	# debug:	echo "NEW_JFS_INDICES_DIR=$NEW_JFS_INDICES_DIR"
	
	# Copy the old indices directory to the new indices directory if the two directories are different
	if [ $OLD_JFS_INDICES_DIR = $NEW_JFS_INDICES_DIR ]; then
		# debug:		echo The directories match, not copying indices
		return 0
	fi
	
	last=`echo $OLD_JFS_INDICES_DIR | sed -e "s/^.*\(.\)$/\1/"`
    if [ "$last" != "/" ]; then
    	OLD_JFS_INDICES_DIR=$OLD_JFS_INDICES_DIR/
    fi
	
	# debug:	echo The directories do not match, copying indices
	if [ ! \( -d $NEW_JFS_INDICES_DIR \) ]; then
		mkdir -p $NEW_JFS_INDICES_DIR
	fi
	ls -l $OLD_JFS_INDICES_DIR* > /dev/null 2<&1
	if [ "$?" = "0" ]; then
		messages COPY_JFS_INDICES_INPROGRESS $OLD_JFS_INDICES_DIR $NEW_JFS_INDICES_DIR
		cp -r -p $OLD_JFS_INDICES_DIR* $NEW_JFS_INDICES_DIR/
	fi

	# Everything is fine to copy text indices
	return $?
}
