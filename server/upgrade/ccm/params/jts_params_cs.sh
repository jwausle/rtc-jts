#!/bin/sh
# *******************************************************************************
#  Licencované materiály - vlastnictví IBM
#  © Copyright IBM Corporation 2006, 2014. Všechna práva vyhrazena.
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
# # skriptu jts_upgrade.sh a jejich výchozím hodnotám
# #
# #===========================================================
# #
# # Tento soubor se čte na začátku provedení skriptu
# # jts_upgrade.sh. Nastavuje jednu proměnnou prostředí pro
# # jeden platný parametr pomocí předdefinované výchozí hodnoty.
# #
# # Uživatelé mohou výchozí hodnotu upravit, a docílit tak
# # spouštění skriptu jts_upgrade.sh se svými vlastními hodnotami
# # bez nutnosti ručního zadávání parametrů s jejich hodnotami
# # do příkazového řádku.
# #
# # VAROVÁNÍ:
# # Není nutné nastavovat všechny proměnné pro každou
# # aplikaci. Před úpravou hodnoty si pozorně přečtěte
# # komentář.
# #
# #############################################################

# Parametr: -oldJTSHome
# Použití: -oldJTSHome <cesta_k_adresáři>
# Popis:
# 	Úplná cesta k domovskému adresáři aplikace ve staré instalaci.
# Výchozí:
# 	<není>
# Omezení:
#  - <cesta_k_adresáři> musí určovat existující adresář a končit řetězcem 'server/conf'
#  - Platné pouze pro upgrady aplikací RM a JTS
#
OLD_JTS_HOME=

# Parametr: -jtsContextRoot
# Použití: -jtsContextRoot <root>
# Popis:
# 	Kontextový kořenový adresář JTS
# Výchozí:
# 	jts
# Omezení:
#  - <kořen> musí být platný název jednoho adresáře (tj. bez úvodního lomítka)
#
JTS_CONTEXT_ROOT=jts

# Parametr: -lpaContextRoot
# Použití: -lpaContextRoot <root>
# Popis:
# 	Kontextový kořenový adresář LPA
# Výchozí:
# 	admin
# Omezení:
#  - <kořen> musí být platný název jednoho adresáře (tj. bez úvodního lomítka)
#
LPA_CONTEXT_ROOT=admin

# Parametr: -oldJTSVersion
# Použití: -oldJTSVersion <verze>
# Popis:
# 	Verze upgragovaného serveru JTS. Ve výchozím nastavení
#   se toto určuje spuštěním nástrojů Repotool -version proti starému serveru JTS.
# Výchozí:
# 	<není>
# Omezení:
#  - musí se jednat o úplný řetězec verze
#    např. 3.0.0 nebo 3.0.1
#
OLD_JTS_VERSION=

# Parametr: -updateTomcatFiles
# Použití: -updateTomcatFiles <yes | no>
# Popis:
# 	Zda mají být aktualizovány konfigurační soubory tomcat.
# Výchozí:
# 	yes
# Omezení:
#  - Jediné platné hodnoty: 'yes' a 'no'
#
UPDATE_TOMCAT_FILES=yes

# Parametr: -oldTomcatHome
# Použití: -oldTomcatHome <cesta_k_adresáři>
# Popis:
# 	Úplná cesta ke kořenovému adresáři Tomcat ve staré instalaci.
# Výchozí:
# 	<není>
# Omezení:
#  - Musí být existujícím adresářem
#
OLD_TOMCAT_HOME=

# Parametr: -newJTSHome
# Použití: -newJTSHome <cesta_k_adresáři>
# Popis:
# 	Cesta ke konfiguračnímu adresáři serveru JTS nové instalace.
# Výchozí:
# 	conf
# Omezení:
#  - <cesta_k_adresáři> musí odkazovat na existující adresář a musí končit
#    řetězcem 'server/conf'
#
NEW_JTS_HOME="$START_DIR/conf"

# Parametr: -newTomcatHome
# Použití: -newTomcatHome <cesta k adresáři>
# Popis:
# 	Cesta k domovskému adresáři Tomcat nové instalace.
# Výchozí:
# 	<není>
#
NEW_TOMCAT_HOME=

# Parametr: -noPrompt
# Použití: -noPrompt
# Popis:
# 	Nedotazovat se před vytvořením či úpravou tabulek
# Výchozí:
# 	<není>
# Omezení:
#  - Jediné platné hodnoty: empty nebo 'noPrompt'
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# Parametr: -noVerify
# Použití: -noVerify
# Popis:
# 	Neprovádět verifikaci platnosti souborů teamserver.properties.
# Výchozí:
# 	<není>
# Omezení:
#  - Jediné platné hodnoty: empty nebo 'noVerify'
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Parametr: -noStepPrompt
# Použití: -noStepPrompt
# Popis:
# 	Nedotazovat se před provedením kroku.
# Výchozí:
#   false
# Omezení:
#  - Jediné platné hodnoty: 'true' nebo 'false'
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
#  - Jediné platné hodnoty: 'true' nebo 'false' nebo empty
#
# NO_EDITOR=false
NO_EDITOR=false
