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
echo "Führen Sie das Script Anwendung_upgrade nicht direkt aus. Führen Sie für ein Upgrade von JTS oder der Anwendung einen der folgenden Befehle aus:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Mit -help können Sie eine vollständige Beschreibung der obigen Befehle anzeigen."
;;

INVALID_START_DIR )
echo ""
echo "Das Script $2 muss im Verzeichnis $3 ausgeführt werden, außer Sie verwenden den Parameter -help."
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "Die Datei '$2' enthält die Parameterwerte für das Upgrade-Script."
echo "Falls Sie Standardparameterwerte modifizieren müssen, können Sie diese Dateien bearbeiten oder die Parameterwerte als Befehlszeilenargumente für die Upgrade-Scripts angeben."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "Die Standardparameterwerte für ein Anwendungsupgrade oder ein JTS-Upgrade sind in folgenden Dateien enthalten. Falls Sie Standardparameterwerte modifizieren müssen, können Sie diese Dateien bearbeiten oder die Parameterwerte als Befehlszeilenargumente für die Upgrade-Scripts angeben."
echo "- CCM-Upgrade: $2/params/ccm_params$3.sh"
echo "- GC-Upgrade:  $2/params/gc_params$3.sh"
echo "- QM-Upgrade:  $2/params/qm_params$3.sh"
echo "- RM-Upgrade:  $2/params/rm_params$3.sh"
echo "- JTS-Upgrade: $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Parameters verification messages *
# ************************************

# Intrinsic verification
# ======================

MISSING_APP_TYPE )
echo ""
echo "Es wurde kein JTS oder Anwendungstyp angegeben. Führen Sie für ein Upgrade von JTS oder der Anwendung einen der folgenden Befehle aus:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Mit -help können Sie eine vollständige Beschreibung der obigen Befehle anzeigen."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2 ist kein gültiger JTS oder Anwendungstyp. Führen Sie für ein Upgrade von JTS oder der Anwendung einen der folgenden Befehle aus:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Mit -help können Sie eine vollständige Beschreibung der obigen Befehle anzeigen."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "Fehlender Wert für den Parameter $2"
echo "Mit -help können Sie eine vollständige Parameterbeschreibung anzeigen."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "Das für den Parameter $2 angegebene Verzeichnis $3 ist nicht vorhanden oder ungültig."
echo "Mit -help können Sie eine vollständige Parameterbeschreibung anzeigen."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "Das für den Parameter $2 angegebene Verzeichnis $3 muss ein absoluter Pfad sein."
echo "Mit -help können Sie eine vollständige Parameterbeschreibung anzeigen."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "Die für den Parameter $2 angegebene Datei $3 ist nicht vorhanden oder ungültig."
echo "Mit -help können Sie eine vollständige Parameterbeschreibung anzeigen."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3 ist ein ungültiger Wert für den Parameter $2."
echo "Mit -help können Sie eine vollständige Parameterbeschreibung anzeigen."
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2 ist ein unbekannter Parameter."
echo "Mit -help können Sie eine vollständige Parameterbeschreibung anzeigen."
echo ""
;;


# Extrinsic verification
# ======================

MISSING_HOME_PARAM )
echo ""
echo "Fehlender Parameter $2 für das Ausgangsverzeichnis."
echo "Mit -help können Sie eine vollständige Parameterbeschreibung anzeigen."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "Das Verzeichnis $2 ist nicht vorhanden oder ungültig."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "Der repotools-Befehl '$2' für die Anwendung wurde nicht gefunden."
echo ""
echo "Stellen Sie sicher, dass der Parameter -oldApplicationHome ('$3') auf das alte Serverkonfigurationsverzeichnis zeigt, z. B. auf 'Jazz-Installationsstammverzeichnis/server/conf'."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "Der repotools-Befehl '$2' für die Anwendung wurde nicht gefunden."
echo ""
echo "Stellen Sie sicher, dass der Parameter -oldApplicationHome ('$3') auf das alte Serverkonfigurationsverzeichnis zeigt, z. B. auf 'Jazz-Installationsstammverzeichnis/server/conf', und dass der Parameter '$4' für das JTS-Kontextstammverzeichnis korrekt ist."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "Die Konfigurationsdatei '$2' wurde nicht gefunden."
echo ""
echo "Stellen Sie sicher, dass der Parameter -oldApplicationHome ('$3') auf das alte Serverkonfigurationsverzeichnis zeigt, z. B. auf 'Jazz-Installationsstammverzeichnis/server/conf'."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "Die Konfigurationsdatei '$2' wurde nicht gefunden."
echo ""
echo "Stellen Sie sicher, dass der Parameter -oldApplicationHome ('$3') auf das alte Serverkonfigurationsverzeichnis zeigt, z. B. auf 'Jazz-Installationsstammverzeichnis/server/conf', und dass der Parameter '$4' für das JTS-Kontextstammverzeichnis korrekt ist."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "Der repotools-Befehl '$2' für die Anwendung wurde nicht gefunden."
echo ""
echo "Stellen Sie sicher, dass der Parameter -newApplicationHome ('$3') auf das neue Serverkonfigurationsverzeichnis der Anwendung zeigt, z. B. auf 'Jazz-Installationsstammverzeichnis/server/conf', und dass der Parameter '$4' für das Anwendungsstammverzeichnis korrekt ist."
echo "Falls Sie ein Upgrade für ein früheres Release durchführen, vergewissern Sie sich, dass Sie die richtigen Kontextstammverzeichnisse ausgewählt haben. Bei Verwendung des Installation Manager müssen Sie beispielsweise in der Anzeige "Context Root Options" die Option für das $5-Kontextstammverzeichnis auswählen. Sollten Sie versehentlich eine andere Option ausgewählt haben, müssen Sie das Produkt mit der Option für das $5.x-Kontextstammverzeichnis neu installieren."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "Die Konfigurationsdatei '$2' wurde nicht gefunden."
echo ""
echo "Stellen Sie sicher, dass der Parameter -newApplicationHome ('$3') auf das neue JTS-Konfigurationsverzeichnis zeigt, z. B. auf 'Jazz-Installationsstammverzeichnis/server/conf', und dass der Parameter '$4' für das Anwendungsstammverzeichnis korrekt ist."
echo "Falls Sie ein Upgrade für ein früheres Release durchführen, vergewissern Sie sich, dass Sie die richtigen Kontextstammverzeichnisse ausgewählt haben. Bei Verwendung des Installation Manager müssen Sie beispielsweise in der Anzeige "Context Root Options" die Option für das $5-Kontextstammverzeichnis auswählen. Sollten Sie versehentlich eine andere Option ausgewählt haben, müssen Sie das Produkt mit der Option für das $5.x-Kontextstammverzeichnis neu installieren."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "Der repotools-Befehl '$2' für JTS wurde nicht gefunden."
echo ""
echo "Stellen Sie sicher, dass der Parameter -oldJTSHome ('$3') auf das alte JTS-Konfigurationsverzeichnis zeigt, z. B. auf 'Jazz-Installationsstammverzeichnis/server/conf', und dass der Parameter '$4' für das JTS-Kontextstammverzeichnis korrekt ist."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "Die Konfigurationsdatei '$2' wurde nicht gefunden."
echo ""
echo "Stellen Sie sicher, dass der Parameter -oldJTSHome ('$3') auf das alte JTS-Konfigurationsverzeichnis zeigt, z. B. auf 'Jazz-Installationsstammverzeichnis/server/conf', und dass der Parameter '$4' für das JTS-Kontextstammverzeichnis korrekt ist."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "Der repotools-Befehl '$2' für JTS wurde nicht gefunden."
echo ""
echo "Stellen Sie sicher, dass der Parameter -newJTSHome ('$3') auf das neue JTS-Konfigurationsverzeichnis zeigt, z. B. auf 'Jazz-Installationsstammverzeichnis/server/conf', und dass der Parameter '$4' für das JTS-Kontextstammverzeichnis korrekt ist."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "Die Konfigurationsdatei '$2' wurde nicht gefunden."
echo ""
echo "Stellen Sie sicher, dass der Parameter -newJTSHome ('$3') auf das neue JTS-Konfigurationsverzeichnis zeigt, z. B. auf 'Jazz-Installationsstammverzeichnis/server/conf', und dass der Parameter '$4' für das JTS-Kontextstammverzeichnis korrekt ist."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "Für das $2-Upgrade ist eine TAR-Datei mit 2.x-Daten erforderlich."
echo "Mit -help können Sie eine vollständige Parameterbeschreibung anzeigen."
echo ""
;;


# **********************
# * Execution messages *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    JTS-Upgrade    ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    CCM-Upgrade    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    GC-Upgrade    ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    QM-Upgrade    ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    RM-Upgrade    ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "Die Version der alten RM-Anwendung wird überprüft..."
;;

RM_DISPLAY_OLD_VERSION )
echo "Die Version der alten RM-Anwendung ist '$2'."
;;

# *********************
# * First step switch *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "Letzte Ausführung beim ersten Schritt fehlgeschlagen"
;;

LAST_STEP_FAILED )
echo ""
echo "Letzte Ausführung bei Schritt $2 fehlgeschlagen"
echo "Soll das Upgrade bei diesem oder einem früheren Schritt neu gestartet werden?"
;;

ALREADY_RUN )
echo ""
echo "Das Upgrade wurde bereits durchgeführt und erfolgreich abgeschlossen."
echo "Soll ein neues Upgrade bei einem bestimmten Schritt gestartet werden?"
;;

LAST_STEP_PASSED )
echo ""
echo "Letzte Ausführung bei Schritt $2 erfolgreich gestoppt"
echo "Soll das Upgrade bei dem aktuellen Schritt $3 oder einem früheren Schritt neu gestartet werden?"
;;

ENTER_NEXT_STEP )
echo ""
echo "Geben Sie die Nummer des Schrittes [$2-$3] ein, bei dem das Upgrade neu gestartet werden soll, oder brechen Sie mit [Eingabetaste] ab."
;;

INTEGER_STEP_NUMBER )
echo ""
echo "'$2' ist keine Zahl. Geben Sie eine gültige Schrittnummer ein."
;;

INVALID_STEP_NUMBER )
echo ""
echo "'$2' ist eine ungültige Schrittnummer. Geben Sie eine gültige Schrittnummer ein."
;;

MAX_STEP_NUMBER )
echo ""
echo "Der letzte Schritt ist Schritt $2, sodass das Upgrade nicht bei Schritt $3 neu gestartet werden kann."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "Schritt $2 wurde noch nicht ausgeführt, sodass Sie das Upgrade nicht bei Schritt $3 neu starten können."
;;


# **********************
# * Messages for Steps *
# **********************

STEP_0_IBMi )
echo "Schritt 0: Tabellen löschen"
echo "---------------------------"
;;

STEP_0 )
echo "Schritt 0: Konfigurationsdateien aktualisieren"
echo "----------------------------------------------"
;;

STEP_1_ADD )
echo "Schritt 1: Tabellen hinzufügen"
echo "------------------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "Schritt $2: Textindizes neu erstellen"
echo "-------------------------------------"
;;

JFS_INDICES_STEP )
echo "Schritt $2: Abfrage- und Suchindizes neu erstellen"
echo "--------------------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "Schritt $2: LPA mit JTS mischen"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "Schritt $2: Frontside-URL von LPA-Speicherbereichen korrigieren"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "Schritt $2: LPA-Friend aus RM entfernen"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "Schritt 2: Upgrade für Data-Warehouse-Schema"
echo "--------------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "Schritt $2: RM-Anwendung fertigstellen"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "Schritt $2: JTS-Anwendung fertigstellen"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "Schritt $2: RM-Anwendung neu indexieren "
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "Das $2-Upgrade ist bei Schritt $3 fehlgeschlagen. Lösen Sie das Problem. Führen Sie das Script dann erneut ab Schritt $3 aus."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "Das $2-Upgrade war erfolgreich. Sie können jetzt ein Upgrade für alle Anwendungen in Ihrer Umgebung durchführen."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "Der Offlineabschnitt des RM-Upgrades war erfolgreich. Jetzt können Sie die Server Ihrer Implementierung starten."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "Der Offlineabschnitt des RM-Upgrades war erfolgreich. Noch ein Schritt "
echo "verbleibt zum erfolgreichen Fertigstellen der Migration. Dieser erfordert jedoch, dass alle Server, die zu"
echo "RM verlinken (wie RTC, RQM, JRS, GC), online sind. Wenn möglich, starten Sie"
echo "alle Server (einschließlich RM). Es empfiehlt sich, dass Sie sich bei allen Servern anmelden"
echo "und sicherstellen, dass sie ordnungsgemäß funktionieren. Führen Sie dann den folgenden Befehl aus:"
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "Das $2-Upgrade war erfolgreich. Jetzt können Sie die Server Ihrer Implementierung starten."
echo ""
;;

# *******************************
# * Messages while running step *
# *******************************

STEP_DIR_CMD )
echo ""
echo "Verzeichnis: $2"
echo "Befehl:"
;;

ENTER_STEP_ACTION )
echo "Geben Sie [E] für die Ausführung dieses Schritts oder [S] zum Überspringen ein oder brechen Sie die Script-Ausführung mit [Eingabetaste] ab."
;;

INVALID_STEP_ACTION )
echo ""
echo "'$2' ist eine ungültige Eingabe. Erlaubt sind nur 'E', 'S' oder 'Eingabetaste'."
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "Ein Editor vi wird geöffnet, in dem Sie die Datei teamserver.properties von $2 überprüfen können."
echo "Prüfen Sie, ob das von der Eigenschaft com.ibm.team.repository.server.webapp.url angegebene Stammelement des öffentlichen URI stimmt."
echo "Prüfen Sie, ob die Datenbankeigenschaften korrekt sind."
echo "Speichern Sie ggf. vorgenommene Änderungen. Schließen Sie dann den Editor und fahren Sie mit der Script-Ausführung fort."
echo ""
echo "Lesen Sie im Artikel 'Upgrade für die Rational-Lösung für CLM durchführen' der Produktdokumentation nach,"
echo "wie die einzelnen Eigenschaften ordnungsgemäß konfiguriert werden."
;;

PAUSE )
echo ""
echo "Geben Sie C ein, um die Ausführung fortzusetzen, oder drücken Sie die Eingabetaste, um die Script-Ausführung abzubrechen."
;;

INVALID_PAUSE_ACTION )
echo ""
echo "'$2' ist eine ungültige Eingabe. Erlaubt sind nur 'C' oder 'Eingabetaste'."
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "Textindizes werden von '$2' nach '$3' kopiert."
echo "Dies kann einige Minuten dauern..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "Abfrage- und Suchindizes werden von '$2' nach '$3' kopiert."
echo "Dies kann einige Minuten dauern..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "Die Indizes konnten nicht von '$2' in '$3' kopiert werden."
echo "Überprüfen Sie die Eigenschaft com.ibm.team.fulltext.indexLocation,"
echo "die in der Datei teamserver.properties definiert ist."
echo "Kopieren Sie die Textindizes manuell in dieses Verzeichnis oder führen"
echo "Sie repotools -rebuildTextIndices aus, um die Indizes neu zu erstellen."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "Die Datei $NEW_APP_PARENT_DIR/RM_APP.ID ist nicht vorhanden."
echo "Erstellen Sie diese Datei mit einer einzigen Zeile, die die RM-Anwendungs-ID enthält,"
echo "und versuchen Sie es erneut."
echo ""
;;

# *****************************************
# * Messages for Public URIs verification *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! FEHLER !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Kein öffentlicher URI definiert in"
echo "$3."
echo "Das Upgrade kann somit nicht gestartet werden."
echo ""
echo "Diese Datei muss einen wie folgt definierten öffentlichen URI enthalten:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Die Eigenschaft com.ibm.team.repository.server.webapp.url für den öffentlichen URI muss in der Datei teamserver.properties enthalten sein."
echo "Fügen Sie die Eigenschaft zur Datei teamserver.properties der alten Installation hinzu und legen Sie als Wert für den Kontakt zum Server für alle Clients das URI-Stammelement sein soll."
echo "Das Stammelement des öffentlichen URI ist wesentlich, damit Ihre neue Installation ordnungsgemäß funktioniert. Ohne diese Eigenschaft ist kein erfolgreiches Upgrade möglich. "
echo "Weitere Informationen enthält der Artikel 'URIs planen' in der Produktdokumentation."
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! FEHLER !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Alle öffentlichen URIs, die in"
echo "$3 definiert sind, sind auf Kommentar"
echo "gesetzt, sodass das Upgrade nicht gestartet werden kann."
echo ""
echo "Diese Datei sollte einen wie folgt definierten, nicht auf Kommentar gesetzten öffentlichen URI enthalten:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Die Eigenschaft com.ibm.team.repository.server.webapp.url für den öffentlichen URI muss in der Datei teamserver.properties enthalten sein."
echo "Fügen Sie die Eigenschaft zur Datei teamserver.properties der alten Installation hinzu und legen Sie als Wert für den Kontakt zum Server für alle Clients das URI-Stammelement sein soll."
echo "Das Stammelement des öffentlichen URI ist wesentlich, damit Ihre neue Installation ordnungsgemäß funktioniert. Ohne diese Eigenschaft ist kein erfolgreiches Upgrade möglich."
echo "Weitere Informationen enthält der Artikel 'URIs planen' in der Produktdokumentation."
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "Das Kontextstammverzeichnis für JTS ist auf '$2' gesetzt."
echo "Das Kontextstammverzeichnis für die Anwendung ist auf '$3' gesetzt."
echo "Das Kontextstammverzeichnis von JTS darf nicht dasselbe wie das der Anwendung sein."
echo ""
;;

esac

}
