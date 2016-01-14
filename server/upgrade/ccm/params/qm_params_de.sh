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
# # qm_upgrade.sh script parameters and their default values
# #
# #===========================================================
# #
# # This file is read at the beginning of the qm_upgrade.sh
# # script execution. It sets one environment variable per
# # valid parameter with a predefined default value.
# #
# # Users may want to modify the default value in order to
# # launch the qm_upgrade.sh script with their own values
# # without having to enter the parameter and its
# # corresponding value manually at the command line.
# #
# # WARNING:
# # Not all variables are required to be set for every
# # application.  Read each comment carefully before modifying
# # the value.
# #
# #############################################################

# Parameter: -oldApplicationHome
# Syntax: -oldApplicationHome <Verzeichnispfad>
# Beschreibung:
# 	Vollständiger Pfad zum Ausgangsverzeichnis der Anwendung in der alten Installation.
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - Dies ist ein obligatorischer Parameter.
#  - <Verzeichnispfad> muss ein vorhandenes Verzeichnis sein, das mit 'server/conf' endet
#    z. B. /Jazz/IBM/RQM_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Parameter: -applicationContextRoot
# Syntax: -applicationContextRoot <Stammverzeichnis>
# Beschreibung:
# 	Kontextstammverzeichnis der Anwendung.
# Standardwert:
# 	qm
# Einschränkungen:
#  - <Stammverzeichnis> muss ein gültiger Verzeichnisname sein, d. h. ohne vorangestellten Schrägstrich.
#
APPLICATION_CONTEXT_ROOT=

# Parameter: -oldApplicationVersion
# Syntax: -oldApplicationVersion <Version>
# Beschreibung:
# 	Die Version, für die das Upgrade durchgeführt wird. Standardmäßig wird dies durch
#   repotools -version für die alte Anwendung ermittelt.
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - sollte eine vollständige Versionszeichenfolge sein,
#    z.B. 3.0.0 oder 3.0.1
#
OLD_APPLICATION_VERSION=

# Parameter: -updateTomcatFiles
# Syntax: -updateTomcatFiles <yes | no>
# Beschreibung:
# 	Angabe, ob die Tomcat-Konfigurationsdateien aktualisiert werden sollen.
# Standardwert:
# 	yes
# Einschränkungen:
#  - Gültig sind nur die Werte 'yes' und 'no'.
#
UPDATE_TOMCAT_FILES=yes

# Parameter: -oldTomcatHome
# Syntax: -oldTomcatHome <Verzeichnispfad>
# Beschreibung:
# 	Vollständiger Pfad zum Tomcat-Stammverzeichnis der alten Installation
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - Das Verzeichnis muss vorhanden sein
#
OLD_TOMCAT_HOME=

# Parameter: -newApplicationHome
# Syntax: -newApplicationHome <Verzeichnispfad>
# Beschreibung:
# 	Pfad zum Ausgangsverzeichnis für Anwendungen in der neuen Installation.
# Standardwert:
# 	conf
# Einschränkungen:
#  - Nur akzeptiert für RTC-, QM- und RM-Upgrade
#  - Wenn akzeptiert, handelt es sich um einen obligatorischen Parameter
#  - <Verzeichnispfad> muss ein vorhandenes Verzeichnis sein, das mit 'server/conf' endet
#    z. B. /Jazz/IBM/RQM_3.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parameter: -newJTSHome
# Syntax: -newJTSHome <Verzeichnispfad>
# Description:
# 	Vollständiger Pfad zum JTS-Ausgangsverzeichnis im JTS, das die neue Installation verwenden wird.
# Standardwert:
# 	Ausgangsverzeichnis der neuen Anwendung
# Einschränkungen:
#  - <Verzeichnispfad> muss ein vorhandenes Verzeichnis sein, das mit
#    'server/conf' endet.
#    z. B. /Jazz/IBM/RQM_3.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# Parameter: -jtsContextRoot
# Syntax: -jtsContextRoot <Stammverzeichnis>
# Beschreibung:
# Kontextstammverzeichnis des JTS-Servers.
# Standardwert:
# 	jts
# Einschränkungen:
#  - <Stammverzeichnis> muss ein gültiger Verzeichnisname sein, d. h. ohne vorangestellten Schrägstrich.
#
JTS_CONTEXT_ROOT=jts

# Parameter: -newApplicationTomcatHome
# Beschreibung: -newApplicationTomcatHome <Verzeichnispfad>
# Beschreibung:
# 	Vollständiger Pfad zum Tomcat-Stammverzeichnis der neuen Installation.
# Standardwert:
# 	<ohne>
#
NEW_TOMCAT_HOME=

# Parameter: -newJTSTomcatHome
# Syntax: -newJTSTomcatHome <Verzeichnispfad>
# Beschreibung:
# 	Pfad zum JTS-Tomcat-Stammverzeichnis im JTS, das die neue Installation verwenden wird.
# Standardwert:
# 	<ohne>
#
NEW_JTS_TOMCAT_HOME=

# Parameter: -noPrompt
# Syntax: -noPrompt
# Beschreibung:
# 	Vor dem Erstellen oder Modifizieren der Tabellen keine Bestätigung anfordern
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - Die einzigen gültigen Werte sind ein leerer Wert und 'noPrompt'.
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# Parameter: -noVerify
# Syntax: -noVerify
# Beschreibung:
# 	Keine Verifizierung der Dateien mit Team-Server-Eigenschaften.
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - Gültig sind nur ein leerer Wert und 'noVerify'.
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Parameter: -noStepPrompt
# Syntax: -noStepPrompt
# Beschreibung:
# 	Vor Ausführung eines Schritts keine Bestätigung anfordern.
# Standardwert:
# 	false
# Einschränkungen:
#  - Gültig sind nur die Werte 'true' und 'false'.
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Parameter: -noEditor
# Syntax: -noEditor
# Beschreibung:
#   Keinen Editor für die teamserver.properties-Dateien öffnen.
# Standardwert:
#   false
# Einschränkungen:
#  - Gültig sind nur die Werte 'true' und 'false'.
#
# NO_EDITOR=false
NO_EDITOR=false
