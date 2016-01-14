#!/bin/sh
#set -o xtrace 
#(C) COPYRIGHT International Business Machines Corp., 2004, 2011, 2014. All Rights Reserved * Licensed Materials - Property of IBM

JAVA_HOME=../../server/jre

os=`uname`
if [ $os != 'SunOS' ]
then
#Save original value
oldIFS=$IFS
#Just a newline char
IFS='
'
fi

# save the path used to run this script
rundir=`dirname $0`

#set DEBUG_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000

cd $rundir
CUR_DIR=`pwd`
AUTOPD_HOME=$CUR_DIR

export AUTOPD_HOME

LOG_CONFIG=$AUTOPD_HOME/properties/logger.properties

DATA_HOME=$AUTOPD_HOME
TMP_DIR=$AUTOPD_HOME/tmp
USEHOME=false
LAPSTATUS_HOME=${AUTOPD_HOME}/lap_status
COLLECTOR_BASE=false

for PARM in $1 $2 $3 $4 $5 $6 $7 $8 $9
   do
      if [ "X$PARM" = "X-useHome" ] 
         then
            USEHOME=true
         fi
	if [ "X$PARM" = "X-collectorBase" ] 
        then
           COLLECTOR_BASE=true
       fi
   done 
   
for f in `find . -name '*.sh'`
   do 
      if [ ! -x $f ] 
         then 
            if [ -w $f ]
               then
                  chmod +x $f
               fi     
            if [ ! -x $f ] 		
               then
                  NOT_EXEC=$NOT_EXEC\ $f
               fi
         fi 
   done 

if [ X != X$NOT_EXEC ]
   then
      echo WARNING:  The following files are not executable.  This may 
      echo result in unpredictable results or failure.
      echo $NOT_EXEC 
   fi

# set the default locale when LANG=C
if [ X$LANG = X ] || [ $LANG = C ] 
then
    if [ $os != 'OS/390' ] 
    then
		loc=`locale -a | grep -i en_us | head -1`
    else
        loc=`locale -a | grep -i '^en_us$'`
    fi
    if [ X$loc != X ]
    then
		LANG=$loc
		export LANG
	fi
fi
   
if [ "$USEHOME" = "true" ] || [ "$COLLECTOR_BASE" = "true" ] 
   then
      PID=$$
      TMP_DIR=/tmp/.isadc_${USER}_$PID
      DATA_HOME=$HOME/.isadc
      if [ ! -d ${DATA_HOME} ];
      then
         mkdir $DATA_HOME 
      fi
      LOG_CONFIG=$AUTOPD_HOME/properties/logger-home.properties
      
      LAPSTATUS_HOME=${DATA_HOME}/lap_status  
      if [ ! -d ${LAPSTATUS_HOME} ];
      then
          mkdir $LAPSTATUS_HOME 
      fi
      if [ ! -d ${LAPSTATUS_HOME}/license ];
      then
          mkdir $LAPSTATUS_HOME/license
      fi
      if test -f $AUTOPD_HOME/lap_status/license/status.dat 
        then
          cp $AUTOPD_HOME/lap_status/license/status.dat $LAPSTATUS_HOME/license/status.dat
      fi
   else
	if [ ! -d ${DATA_HOME}/log ];
	then
	   mkdir $DATA_HOME/log
	fi
fi
   

# cd $TMP_DIR

if [ ! -d $TMP_DIR/properties ]
   then
      mkdir -p $TMP_DIR/properties
   fi
JAVA_VER=$TMP_DIR/properties/java_ver.txt

if [ "${1}" = "-help" ]; then

	#The logic in this script presumes that translated user help files will be found
	#in the util\help directory located under the ISA Lite install root directory.
	#These files must be of the form userhelp_la_CC.txt or userhelp_la.txt, where la is
	#the ISO language code in lowercase and CC is the country code.

	#Grab the first 5 chars of $LANG
	_lang=`echo ${LANG} | cut -c1-5`

	#Grab the first 2 chars of $LANG and make them lowercase
	_lang2=`echo ${LANG} | cut -c1-2 | tr '[A-Z]' '[a-z]'`
	
	#Grab chars 3 thru 5 of $LANG
	_lang3=`echo ${LANG} | cut -c3-5`

	#Define the path in which all translated scripts must exist
	_isaBase=${AUTOPD_HOME}/util/help/userhelp_
	#This _file1 represents an exact match of the first 5 chars of $LANG and the script name
	_file1=${_isaBase}${_lang}.txt
	#This _file2 represents a match of the first 5 chars where the first 2 chars are in lowercase
	_file2=${_isaBase}${_lang2}${_lang3}.txt
	#This _file3 represents a match of the first 2 chars which have been lowercased
	_file3=${_isaBase}${_lang2}.txt

	#From this point, we just test whether each file exists, stopping at the first match
	if test -f ${_file1}
	then
		scriptFile=${_file1}
	else
		if test -f ${_file2}
		then
			scriptFile=${_file2}
		else
			if test -f ${_file3}
			then
				scriptFile=${_file3}
			else
				# no translated script found, must use english script instead
				scriptFile=${_isaBase}en.txt
			fi
		fi
	fi

	cat ${scriptFile}
	exit 0
fi


if [ "${1}" = "-version" ]; then
	VERSIONFILE=properties/version/version.properties
	for LINE in `cat $VERSIONFILE`
	do
		TMP=`echo $LINE | grep '='`
		#Check to see if an '=' delimeter was found, if not then ignore that line
		if [ "$TMP" != "" ]; then
			#Replace the '_' char with a space char
			echo "$LINE" | tr '_' ' '
		fi
	done
	exit 0
fi

#set the modified AutoPD Classpath
AUTOPD_LIB=${AUTOPD_HOME}/lib

CISA_HOME=${AUTOPD_HOME}/cisa
CISA_CP=${CISA_HOME}
for filename in ${CISA_HOME}/lib/*.jar
do
  CISA_CP=$CISA_CP:$filename
done

LV_HOME=${AUTOPD_HOME}/levelreport

#RASUtils_LIB=${AUTOPD_HOME}/lib/rasutils

AUTOPD_PROPERTIES=${AUTOPD_HOME}/properties

#AUTOPD_XML_CP=${AUTOPD_LIB}/xercesImpl.jar:${AUTOPD_LIB}/xmlParserAPIs.jar:${AUTOPD_LIB}/resolver.jar:${AUTOPD_LIB}/ant-jsch.jar:${AUTOPD_LIB}/jsch-0.1.40.jar

#AUTOPD_ANT_CP=${AUTOPD_LIB}/ant.jar:${AUTOPD_LIB}/ant-launcher.jar:${AUTOPD_LIB}/jakarta-oro-2.0.7.jar

AUTOPD_JARS=${AUTOPD_LIB}
for jarfile in ${AUTOPD_LIB}/*.jar
do
	AUTOPD_JARS=$AUTOPD_JARS:$jarfile
done

#Set up a directory for the front of the classpath for patches
if [ -r ${AUTOPD_HOME}/patch ];
then
	AUTOPD_PATCH=${AUTOPD_HOME}/patch
	for jarfilename in ${AUTOPD_HOME}/patch/*.jar 
	do 
		AUTOPD_PATCH=$AUTOPD_PATCH:$jarfilename
	done
fi

AUTOPD_LV_CP=${LV_HOME}/lib/invtool.jar:${LV_HOME}/lib/xsdbeans.jar:${LV_HOME}/lib/depcheck.jar:${LV_HOME}/lib/itj157minimal.jar:${LV_HOME}/lib/xalan.jar

#AUTOPD_CP=${AUTOPD_HOME}:${AUTOPD_LIB}/autopd.jar:${AUTOPD_LIB}/autopdswing.jar:${RASUtils_LIB}/RASUtils.jar:${AUTOPD_PROPERTIES}:${AUTOPD_ANT_CP}:${CISA_CP}:${AUTOPD_LV_CP}:${AUTOPD_ANT_CP}:${AUTOPD_XML_CP}:${AUTOPD_LIB}/collector.jar:${AUTOPD_LIB}/com.ibm.icu.jar:${AUTOPD_LIB}/esa.jar:${AUTOPD_LIB}/commons-net-1.4.1.jar

AUTOPD_CP=${AUTOPD_HOME}:${AUTOPD_JARS}:${AUTOPD_PROPERTIES}:${CISA_CP}:${AUTOPD_LV_CP}
if [ -z "$AUTOPD_PATCH" ];
then
    AUTOPD_CP=${AUTOPD_PATCH}:${AUTOPD_CP}
fi

PATH_TMP=${PATH}

PATH=${CISA_HOME}/bin:${LV_HOME}:${LV_HOME}/lib:${PATH}


#try to call setupJava.sh
if [ -r ${AUTOPD_HOME}/util/setupJava.sh ];
then
    . ${AUTOPD_HOME}/util/setupJava.sh
fi

#loop until we find an acceptable java or the user quits
while test "$JAVA_FOUND" != "0"
do

	#If JAVA_HOME is not set, we will try running the java command from the system path
	#If that doesn't succeed, then we will set JAVA_NOTAVAILABLE variable
	#ISALite can only run, if JAVA_NOTAVAILABLE is not set
	
	if [ -z "${JAVA_HOME}" ]; 
	then
	  #Try the 'java -version' command to see if java can be found in the system path.
	  JAVA_CMD=java
	else
	  JAVA_CMD=$JAVA_HOME/bin/java
	fi

    $JAVA_CMD -version > $JAVA_VER 2>&1
	Result=$?
    if [ ! $Result -eq 0 ]
	then
	  JAVA_NOTAVAILABLE=1
	fi
	#echo Java command used: $JAVA_CMD
	
	#java command is available either from the system path or JAVA_HOME has been set.
	if [ -z "${JAVA_NOTAVAILABLE}" ]
	then
		
		#proceed only if we have a java executable to use (i.e., java is on the path or JAVA_HOME resolves to a file called 'java')
		if [ $Result -eq 0 ] || ( [ ! -z "${JAVA_HOME}" ] && [ -f ${JAVA_CMD} ] )
		then
	
			#get the java version - pipes to standard err
			#${JAVA_CMD} -version 2> $JAVA_VER
			chmod 777 $JAVA_VER
			#check that JRE is not on excluded list
		
			# determine the OS we are running on
	        if [ $os = "SunOS" ]
	        then
	        	GREP_CMD=egrep
	        else
	        	GREP_CMD=grep 
	        fi    
            if [ `$GREP_CMD -c -f util/jre_exclude_list.txt $JAVA_VER` -gt 0 ]; then
	        	echo "ERROR: The following Java Runtime Environment (JRE) is not supported."
				echo " "
				${JAVA_CMD} -version
				echo " "
				echo "Please set JAVA_HOME to select another JRE or download one from"
				echo "IBM (https://www.ibm.com/developerworks/java/jdk/)"
				echo "or"
				echo "Oracle (http://java.com/en/download/manual.jsp)"
	        	#exit 0
	        	JAVA_NOTSUPPORTED=1
	        	JAVA_NOTAVAILABLE=1
	    	fi	
			
			if [ -z "${JAVA_NOTSUPPORTED}" ]
			then
		    	javaresult=`grep -c 'java version "1\.[234]' $JAVA_VER`
				if [ $javaresult -gt 0 ]
				then
		       		echo "ERROR: This tool requires JRE 1.5 or greater to run."
		       		#set the flag so that we can prompt the user for a valid java
					JAVA_NOTAVAILABLE=1
				else
					#found a java that meets all our tests, so set the flag to come out of the loop
					JAVA_FOUND=0
		       		LICENSE_HOME=${AUTOPD_HOME}/licenses
		       		if [ ! -f ${LAPSTATUS_HOME}/license/status.dat ]
		         	then
		         		#Status file does not exist, check if GUI or Console
		         		${JAVA_CMD} -cp ${AUTOPD_CP} com.ibm.autopd.lap.ConsoleGUI $*
		         		RETURN_CODE=$?
		         		echo Return Code=${RETURN_CODE}
		         		if [ "x${RETURN_CODE}" = "x1" ]
		           		then
		          			 CONSOLE_MODE=-text_only
		         		else
		           			CONSOLE_MODE=
		         		fi
		         		echo "Running License Acceptance Process Tool"
		         		${JAVA_CMD} -cp ${LICENSE_HOME}/LAPApp.jar  com.ibm.lex.lapapp.LAP -l ${LICENSE_HOME} -s ${LAPSTATUS_HOME}  ${CONSOLE_MODE}
		       		fi
		       
		       		#Check to see if license was accepted 
		       		if [ -f ${LAPSTATUS_HOME}/license/status.dat ]
		        	then	
		        		if [ "$USEHOME" = "true" ] || [ "$COLLECTOR_BASE" = "true" ] 
   						then
   							COLLECTOR_INIT=${DATA_HOME}/tmp/collectorInit.sh
                            COLLECTOR_INIT_ZOS=${DATA_HOME}/tmp/collectorInitZOS.sh

		        			if [ -f $COLLECTOR_INIT ]
		        			then
		        				rm -f $COLLECTOR_INIT
		        			fi
                            if [ -f $COLLECTOR_INIT_ZOS ]
		        			then
		        				rm -f $COLLECTOR_INIT_ZOS
		        			fi

			    	 		${JAVA_CMD} $DEBUG_OPTS -Xms64M -Xmx128M -cp ${AUTOPD_CP} -Dautopd.home=$AUTOPD_HOME -Djava.util.logging.config.file=${LOG_CONFIG} com.ibm.autopd.internal.console.ISACollectorConsole $* -init
		        			if [ -f $COLLECTOR_INIT ]
		        			then
		        				chmod a+x $COLLECTOR_INIT
                                if [ $os = 'OS/390' ] 
                                then
                            	    iconv -f ISO8859-1 -t IBM-1047 $COLLECTOR_INIT > $COLLECTOR_INIT_ZOS
                                    chmod a+x $COLLECTOR_INIT_ZOS
                                    . $COLLECTOR_INIT_ZOS
                                else
		        					. $COLLECTOR_INIT
                                fi
								${JAVA_CMD} $DEBUG_OPTS -Xms64M -Xmx128M -cp ${AUTOPD_CP}:${COLLECTOR_CLASSPATH} -Dautopd.home=$AUTOPD_HOME -Djava.util.logging.config.file=${LOG_CONFIG} com.ibm.autopd.internal.console.ISACollectorConsole $*		        				
		        			fi
		    	    	else
		    	    		${JAVA_CMD} $DEBUG_OPTS -Xms64M -Xmx128M -cp ${AUTOPD_CP} -Dautopd.home=$AUTOPD_HOME -Djava.util.logging.config.file=${LOG_CONFIG} com.ibm.autopd.internal.console.ISACollectorConsole $*
		    	    	fi
		    	 		PATH=${PATH_TMP}
		    		else
		           		echo "You must accept the license before running ISA Data Collector"
		
		        	fi   
	        	fi   
			fi
		else
			#no valid java found, so set the flag which will prompt the user for a (hopefully) valid java
			JAVA_NOTAVAILABLE=1
	    fi
	else
		#This is where we prompt the user for a valid java
		echo " "
	    echo "ISA Data Collector cannot automatically detect a usable Java executable." 
	    echo "If Java 1.5 is not available, and you are running on IBM hardware," 
	    echo "you can download one from"
	    echo "https://www.ibm.com/developerworks/java/jdk/"
	    echo " "
	    echo "Please enter the path to a Java installation (i.e.: /opt/IBM/Java50) "
        if [ $os = 'SunOS' ] || [ $os = 'AIX' ]
           then
              echo "or 'q' to quit: \c"     
           else
              echo -n "or 'q' to quit: "
        fi
	    read JAVA_HOME
	    
		if [ "$JAVA_HOME" = "q" ]
		then
			#user wants to quit, so set the flag which terminates the loop
			JAVA_FOUND=0
		fi
	
		echo " "
		#unset this flag, so that we will once again test this new java for validity
		JAVA_NOTAVAILABLE=
		JAVA_NOTSUPPORTED=
	fi

done

cd ${CUR_DIR}
