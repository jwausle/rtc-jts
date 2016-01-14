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
# # Umgebungsvariablen gemäß den Parametern und Standardwerten
# # im Script jts_upgrade.sh definieren
# #
# #===========================================================
# #
# # Diese Datei wird zu Beginn der Ausführung des Scripts
# # jts_upgrade.sh gelesen. Pro gültigem Parameter wird eine
# # Umgebungsvariable mit vordefiniertem Standardwert gesetzt.
# #
# # Benutzer können den Standardwert modifizieren und das
# # Script jts_upgrade.sh mit eigenen Werten starten. Die
# # Parameter und ihre Werte müssen dann nicht manuell in
# # der Befehlszeile eingegeben werden.
# #
# # WARNUNG:
# # Nicht alle Variablen müssen für jede Anwendung gesetzt
# # werden. Modifizieren Sie einen Wert erst, nachdem Sie
# # sorgfältig den zugehörigen Kommentar gelesen haben.
# #
# #############################################################

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

# Parameter: -jtsContextRoot
# Syntax: -jtsContextRoot <Stammverzeichnis>
# Beschreibung:
# 	JTS-Kontextstammverzeichnis
# Standardwert:
# 	jts
# Einschränkungen:
#  - <Stammverzeichnis> muss ein gültiger Verzeichnisname sein, d. h. ohne vorangestellten Schrägstrich.
#
JTS_CONTEXT_ROOT=jts

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

# Parameter: -oldJTSVersion
# Syntax: -oldJTSVersion <Version>
# Beschreibung:
# 	Die JTS-Version, für die ein Upgrade durchgeführt wird. Standardmäßig
#   wird dies durch Ausführen von repotools -version für den alten JTS ermittelt.
# Standardwert:
# 	<ohne>
# Einschränkungen:
#  - sollte eine vollständige Versionszeichenfolge sein,
#    z.B. 3.0.0 oder 3.0.1
#
OLD_JTS_VERSION=

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

# Parameter: -newJTSHome
# Syntax: -newJTSHome <Verzeichnispfad>
# Beschreibung:
# 	Pfad zum JTS-Server-Konfigurationsverzeichnis der neuen Installation.
# Standardwert:
# 	conf
# Einschränkungen:
#  - <Verzeichnispfad> muss ein vorhandenes Verzeichnis sein, das mit 'server\conf' endet.
#
NEW_JTS_HOME="$START_DIR/conf"

# Parameter: -newTomcatHome
# Syntax: -newTomcatHome <Verzeichnispfad>
# Beschreibung:
# 	Pfad zum Tomcat-Ausgangsverzeichnis der neuen Installation.
# Standardwert:
# 	<ohne>
#
NEW_TOMCAT_HOME=

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
