#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2006, 2014. All Rights Reserved.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8


# #############################################################
# #
# # Umgebungsvariablen gemäß den Parametern und Standard-
# # werten im Script rm_upgrade.sh definieren
# #
# #===========================================================
# #
# # Diese Datei wird zu Beginn der Ausführung des Scripts
# # rm_upgrade.sh gelesen. It sets one environment variable per
# # valid parameter with a predefined default value.
# #
# # Benutzer können den Standardwert modifizieren und das
# # Script rm_upgrade.sh mit eigenen Werten starten. Die
# # Parameter und ihre Werte müssen dann nicht manuell in
# # der Befehlszeile eingegeben werden.
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
#    z. B. '/Jazz/IBM/RRC_3.x/jazz/server/conf'.
#
OLD_APPLICATION_HOME=

# Parameter: -applicationContextRoot
# Syntax: -applicationContextRoot <Stammverzeichnis>
# Beschreibung:
# 	Kontextstammverzeichnis der Anwendung.
# Standardwert:
# 	<ohne>
# Einschränkungen:
#   - <Stammverzeichnis> muss ein gültiger einfacher Name eines Verzeichnisses sein (d. h. ohne führenden Schrägstrich)
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
#    z.B. 5.0.0 oder 5.0.1
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

# Parameter: -oldApplicationTomcatHome
# Syntax: -oldApplicationTomcatHome <Verzeichnispfad>
# Beschreibung:
# 	Vollständiger Pfad zum Tomcat-Stammverzeichnis für Anwendungen in der alten Installation.
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - Wird nur für RM-Upgrades akzeptiert
#  - Das Verzeichnis muss vorhanden sein.
#
OLD_TOMCAT_HOME=

# Parameter: -oldJTSTomcatHome
# Syntax: -oldJTSTomcatHome <Verzeichnispfad>
# Beschreibung:
# 	Vollständiger Pfad zum Tomcat-Stammverzeichnis für JTS in der alten Installation
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - Wird nur für RM-Upgrades akzeptiert
#  - Das Verzeichnis muss vorhanden sein.
#
OLD_JTS_TOMCAT_HOME=

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
#    d.h. /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
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
#
NEW_JTS_HOME=

# Parameter: -newJTSContextRoot
# Syntax: -newJTSContextRoot <Stammverzeichnis>
# Beschreibung:
# 	Kontextstammverzeichnis des neuen JTS
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

# Parameter: -overwrite
# Syntax: -overwrite
# Beschreibung:
# 	Beim Ausführen von repotools-Befehlen die Überschreibung immer
#  durchsetzen (d. h. immer overwrite=yes verwenden)
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - Die einzigen gültigen Werte sind eine leere Zeichenfolge und 'overwrite=yes'.
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# Parameter: -noVerify
# Syntax: -noVerify
# Beschreibung:
# 	Beim Ausführen von repotools-Befehlen keine Verifizierung anfordern
#  (d. h. immer noVerify verwenden)
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
# 	Bei Upgradeschritten keine Bestätigung anfordern
#  (d. h. immer noPrompt verwenden)
# Standardwert:
# 	false
# Einschränkungen:
#  - Die einzigen gültigen Werte sind 'true' und 'false'.
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

# Parameter: -db.jdbc.location
# Syntax: -db.jdbc.location <JDBC-URL>
# Beschreibung:
# 	Die JDBC-Position für die RM-Datenbank. (Nur beim Wechseln von 4.x zu 5.x erforderlich)
#
#		Beispiele:
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		ANMERKUNG:
#			Auf *-nix-Systemen benötigen viele Zeichen (beispielsweise: |  &  ;  <  >  (  )  $  `  \  "  '  <Leerzeichen>  <Tabulator>  <Zeilenumbruch>)
#			einen umgekehrten Schrägstrich als Escapezeichen.
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# Standard:
# 	<ohne>
# Vorgaben:
#  - Nur für RM-Upgrades ab 4.x akzeptiert
#
DB_JDBC_LOCATION_VALUE=

# Parameter: -db.jdbc.password
# Syntax: -db.jdbc.password <JDBC-KENNWORT>
# Beschreibung:
# 	Das Kennwort (einfacher Text oder verschlüsselt), das eingesetzt wird, wenn "{password}" in der JDBC-URL erscheint.
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - Muss angegeben werden, wenn die JDBC-URL für die RM-Datenbank {password} enthält
#
DB_JDBC_PASSWORD_VALUE=

# Parameter: -db.db2i.schema.name
# Syntax: -db.db2i.schema.name <SCHEMANAME>
# Beschreibung:
# 	Der DB2i-Datenbankschemaname.
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - Muss bei Verwendung des DB2i-Datenbanktyps angegeben werden.
#
DB_DB2I_SCHEMA_NAME_VALUE=

# Parameter: -db.db2.dsn.dbname
# Syntax: -db.db2.dsn.dbname <DSN-DATENBANKNAME>
# Beschreibung:
# 	Der DB2Z-DSN-Datenbankname.
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - Muss bei Verwendung des DB2z-Datenbanktyps angegeben werden.
#
DB_DB2_DSN_DBNAME_VALUE=

# Parameter: -db.schemaPrefix
# Syntax: -db.schemaPrefix <SCHEMAPRÄFIX>
# Beschreibung:
# 	Das Datenbankschemapräfix.
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - Muss bei Verwendung des DB2z-Datenbanktyps angegeben werden.
#
DB_SCHEMA_PREFIX_VALUE=

# Parameter: -oldJTSHome
# Syntax: -oldJTSHome <Verzeichnispfad>
# Beschreibung:
# 	Vollständiger Pfad zum Ausgangsverzeichnis der Anwendung in der alten Installation.
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - <Verzeichnispfad> muss ein vorhandenes Verzeichnis sein, das mit 'server/conf' endet
#  - Nur für RM- und JTS-Upgrades gültig
#
OLD_JTS_HOME=

# Parameter: -lpaContextRoot
# Syntax: -lpaContextRoot <Stammverzeichnis>
# Beschreibung:
# 	LPA-Kontextstammverzeichnis
# Standardwert:
# 	admin
# Einschränkungen:
#  - <Stammverzeichnis> muss ein gültiger Verzeichnisname sein, d. h. ohne vorangestellten Schrägstrich.
#
LPA_CONTEXT_ROOT=admin
