#!/bin/sh
# *******************************************************************************
#  Licencované materiály - vlastnictví IBM
#  (c) Copyright IBM Corporation 2015. Všechna práva vyhrazena.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8


# #############################################################
# #
# # Definujte proměnné prostředí odpovídající parametrům
# # gc_upgrade.sh script a jejich výchozím hodnotám
# #
# #===========================================================
# #
# # Tento soubor se čte na začátku provedení skriptu
# # gc_upgrade.sh. Nastavuje jednu proměnnou prostředí pro
# # jeden platný parametr pomocí předdefinované výchozí hodnoty.
# #
# # Uživatelé mohou výchozí hodnotu upravit, a docílit tak
# # spouštění skriptu gc_upgrade.sh se svými vlastními hodnotami
# # bez nutnosti ručního zadávání parametrů s jejich hodnotami
# # do příkazového řádku.
# #
# # VAROVÁNÍ:
# # Není nutné nastavovat všechny proměnné pro každou
# # aplikaci. Před úpravou hodnoty si pozorně přečtěte
# # komentář.
# #
# #############################################################

# Parametr: -oldApplicationHome
# Použití: -oldApplicationHome <dir path>
# Popis:
# 	Úplná cesta k domovskému adresáři aplikace v instalaci 3.0.1.
# Výchozí:
# 	<není>
# Omezení:
#  - toto je povinný parametr
#  - <cesta_k_adresáři> musí určovat existující adresář a musí končit řetězcem 'server/conf'
#    např. /QIBM/UserData/JazzTeamServer301Backup/server/conf
#
OLD_APPLICATION_HOME=

# Parametr: -applicationContextRoot
# Použití: -applicationContextRoot<root>
# Popis:
# 	Kontextový kořenový adresář aplikace serveru 3.0.1.x.
# Výchozí:
# 	gc
# Omezení:
#  - <kořen> musí být platný název jednoho adresáře (tj. bez úvodního lomítka)
#
APPLICATION_CONTEXT_ROOT=

# Parametr: -oldApplicationVersion
# Použití: -oldApplicationVersion <verze>
# Popis:
# 	Verze 3.0.x, pro kterou je proveden upgrade. Ve výchozím nastavení je
#   toto určeno spuštěním nástrojů repotool -version vůči staré aplikaci.
# Výchozí:
# 	<není>
# Omezení:
#  - musí se jednat o úplný řetězec verze
#    např. 3.0.0 nebo 3.0.1
#
OLD_APPLICATION_VERSION=

# Parametr: -updateTomcatFiles
# Použití: -updateTomcatFiles <yes | no>
# Popis:
# 	Zda mají být aktualizovány konfigurační soubory tomcat.
# Výchozí:
# 	no
# Omezení:
#  - Jediné platné hodnoty: 'yes' a 'no'
#
UPDATE_TOMCAT_FILES=no

# Parametr: -oldTomcatHome
# Použití: -oldTomcatHome <cesta k adresáři>
# Popis:
# 	Úplná cesta ke kořenovému adresáři Tomcat v instalaci 3.0.1.x.
# Výchozí:
# 	<není>
# Omezení:
#  - Musí být existujícím adresářem
#
OLD_TOMCAT_HOME=

# Parametr: -newApplicationHome
# Použití: -newApplicationHome <cesta k adresáři>
# Popis:
# 	Cesta k domovskému adresáři aplikace v instalaci 4.0.
# Výchozí:
# 	conf
# Omezení:
#  - Akceptuje se pouze pro upgrade aplikací RTC, QM, GC a RM
#  - Je-li akceptován, jde o povinný parametr
#  - <cesta_k_adresáři> musí odkazovat na existující adresář a musí končit 'server/conf'
#    např. /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parametr: -newJTSHome
# Použití: -newJTSHome <cesta k adresáři>
# Popis:
# 	Úplná cesta k domovskému adresáři JTS v instalaci 4.0.
# Výchozí:
#  Nový	domovský adresář nové aplikace
# Omezení:
#  - <cesta_k_adresáři> musí odkazovat na existující adresář a musí končit řetězcem 'server/conf'
#    např. /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# Parametr: -jtsContextRoot
# Použití: -jtsContextRoot <root>
# Popis:
# 	Kontextový kořenový adresář serveru 4.0 JTS.
# Výchozí:
# 	jts
# Omezení:
#  - <kořen> musí být platný název jednoho adresáře (tj. bez úvodního lomítka)
#
JTS_CONTEXT_ROOT=jts

# Parametr: -newApplicationTomcatHome
# Použití: -newApplicationTomcatHome <cesta k adresáři>
# Popis:
# 	Cesta ke kořenovému adresáři aplikací serveru Tomcat v instalaci 4.0.
# Výchozí:
# 	<není>
#
NEW_TOMCAT_HOME=

# Parametr: -newJTSTomcatHome
# Použití: -newJTSTomcatHome <cesta k adresáři>
# Popis:
# 	Cesta ke kořenovému adresáři aplikací serveru Tomcat v instalaci 4.0.
# Výchozí:
# 	<není>
#
NEW_JTS_TOMCAT_HOME=

# Parametr: -ignoreJTSVersionCheck
# Použití: -ignoreJTSVersionCheck
# Popis:
# 	Nepokoušejte se ověřit, zda je verze aplikace
#   kompatibilní s verzí serveru Jazz Team Server umístěnou v newJTSHome.
# Výchozí:
# 	<není>
# Omezení:
#  - Jediné platné hodnoty: empty nebo 'ignoreJTSVersionCheck'
#
IGNORE_JTS_VERSION_CHECK=

# Parametr: -noPrompt
# Použití: -noPrompt
# Popis:
# 	Nedotazovat se před vytvořením či úpravou tabulek
# Výchozí:
# 	noPrompt
# Omezení:
#  - Jediné platné hodnoty: empty nebo 'noPrompt'
#
# NO_PROMPT=
NO_PROMPT=noPrompt

# Parametr: -noVerify
# Použití: -noVerify
# Popis:
# 	Neprovádět verifikaci platnosti souborů teamserver.properties.
# Výchozí:
#   noVerify
# Omezení:
#  - Jediné platné hodnoty: empty nebo 'noVerify'
#
# NO_VERIFY=
NO_VERIFY=noVerify

# Parametr: -noStepPrompt
# Použití: -noStepPrompt
# Popis:
# 	Nedotazovat se před provedením kroku.
# Výchozí:
# 	false
# Omezení:
#  - Jediné platné hodnoty: 'true' a 'false'
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Parametr: -noEditor
# Použití: -noEditor
# Popis:
#   Neotevírat editor v souborech teamserver.properties.
# Výchozí:
#   false
# Omezení:
#  - Jediné platné hodnoty: 'true' nebo 'false'
#
# NO_EDITOR=false
NO_EDITOR=false
