#!/bin/sh
# *******************************************************************************
#  Licenc hatálya alá tartozó anyagok - Az IBM tulajdona
#  © Copyright IBM Corporation 2006, 2014. Minden jog fenntartva.
#
#  Megjegyzés az Egyesült Államok kormányzati felhasználóinak korlátozott jogaira vonatkozóan:
#  A használatot, sokszorosítást vagy közzétételt az IBM vállalattal kötött GSA ADP Schedule
#  Contract szerződés szabályozza.
#  *******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8


# #############################################################
# #
# # Adja meg a környezeti változókat, amelyek megfelelnek a
# # qm_upgrade.sh parancsfájl paramétereinek, és azok
# # alapértelmezett értékeit
# #
# #===========================================================
# #
# # Ezt a fájlt a qm_upgrade.sh parancsfájl végrehajtásának
# # kezdetekor olvassa a rendszer. Egy környezeti változót
# # állít be érvényes, előre meghatározott alapértelmezett
# # értékkel rendelkező paraméterenként.
# #
# # A felhasználók módosíthatják az alapértelmezett értéket a
# # qm_upgrade.sh parancsfájl saját értékekkel való elindításához,
# # anélkül, hogy kézzel meg kellene adniuk a paramétert és annak
# # megfelelő értékeit a parancssorban.
# #
# # FIGYELMEZTETÉS:
# # Nem minden változót szükséges beállítani minden
# # alkalmazáshoz.  Olvasson el figyelmesen minden megjegyzést az
# # érték módosítása előtt.
# #
# #############################################################

# Paraméter: -oldApplicationHome
# Használat: -oldApplicationHome <könyvtár_útvonal>
# Leírás:
# 	Az alkalmazás alapkönyvtárának teljes útvonala a régi telepítésben.
# Alapértelmezés:
# 	<nincs>
# Megszorítások:
#  - ez egy kötelező paraméter
#  - a <könyvtár_útvonal> csak egy 'server/conf' végződésű létező könyvtár lehet
#    például /Jazz/IBM/RQM_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Paraméter: -applicationContextRoot
# Használat: -applicationContextRoot <root>
# Leírás:
# 	Az alkalmazás kontextusgyökere.
# Alapértelmezés:
# 	qm
# Megszorítások:
#  - A <root> csak egy egyedülálló érvényes könyvtárnév lehet (vagyis nincs bevezető törtvonal)
#
APPLICATION_CONTEXT_ROOT=

# Paraméter: -oldApplicationVersion
# Használat: -oldApplicationVersion <verzió>
# Leírás:
# 	A frissítendő változat.  Alapértelmezés szerint ez a repotools
#   -version parancs régi alkalmazáson történő futtatásával határozható meg.
# Alapértelmezés:
# 	<nincs>
# Megszorítások:
#  - egy teljes verzió karaktersorozatnak kell lennie
#    például 3.0.0 vagy 3.0.1
#
OLD_APPLICATION_VERSION=

# Paraméter: -updateTomcatFiles
# Használat: -updateTomcatFiles <yes | no>
# Leírás:
# Megadja, hogy kell-e frissíteni a Tomcat konfigurációs fájlokat.
# Alapértelmezés:
# 	yes
# Megszorítások:
#  - Csak a 'yes' és 'no' értékek érvényesek
#
UPDATE_TOMCAT_FILES=yes

# Paraméter: -oldTomcatHome
# Használat: -oldTomcatHome <könyvtár_útvonal>
# Leírás:
# 	A Tomcat gyökérkönyvtár teljes útvonala a régi telepítésben.
# Alapértelmezés:
# 	<nincs>
# Megszorítás:
#  - Egy létező könyvtárnak kell lennie
#
OLD_TOMCAT_HOME=

# Paraméter: -newApplicationHome
# Használat: -newApplicationHome <könyvtár_útvonal>
# Leírás:
# 	Az alkalmazás alapkönyvtárának útvonala az új telepítésben.
# Alapértelmezés:
# 	conf
# Megszorítások:
#  - Csak RTC, QM és RM frissítés esetén elfogadott
#  - Ha elfogadott, akkor ez egy kötelező paraméter
#  - A <könyvtár_útvonal> csak egy 'server/conf' végződésű létező könyvtár lehet
#    például /Jazz/IBM/RQM_3.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Paraméter: -newJTSHome
# Használat: -newJTSHome <könyvtár_útvonal>
# Leírás:
# 	A JTS alapkönyvtár teljes útvonala a JTS kiszolgálón, amelyet az új telepítés használni fog.
# Alapértelmezett:
# 	Az új alkalmazás alapkönyvtár
# Megszorítások:
# - a <könyvtár útvonala> csak egy 'server\conf' végződésű létező könyvtár lehet
#    például /Jazz/IBM/RQM_3.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# Paraméter: -jtsContextRoot
# Használat: -jtsContextRoot <root>
# Leírás:
# 	A JTS kiszolgáló kontextusgyökere.
# Alapértelmezés:
# 	jts
# Megszorítások:
#  - A <root> csak egy egyedülálló érvényes könyvtárnév lehet (vagyis nincs bevezető törtvonal)
#
JTS_CONTEXT_ROOT=jts

# Paraméter: -newApplicationTomcatHome
# Használat: -newApplicationTomcatHome <könyvtár_útvonal>
# Leírás:
# 	Az alkalmazás Tomcat gyökérkönyvtárának útvonala az új telepítésben.
# Alapértelmezés:
# 	<nincs>
#
NEW_TOMCAT_HOME=

# Paraméter: -newJTSTomcatHome
# Használat: -newJTSTomcatHome <könyvtár_útvonal>
# Leírás:
# 	A JTS Tomcat gyökérkönyvtár útvonala a JTS kiszolgálón, amelyet az új telepítés használni fog.
# Alapértelmezés:
# 	<nincs>
#
NEW_JTS_TOMCAT_HOME=

#  Paraméter: -noPrompt
#  Használat: -noPrompt
#  Leírás:
#  	Ne kérdezzen rá a táblák létrehozása vagy módosítása előtt
#  Alapértelmezés:
#  	<nincs>
#  Megszorítások:
#  - A kizárólag érvényes értékek: üres vagy 'noPrompt'
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# Paraméter: -noVerify
# Használat: -noVerify
# Leírás:
# 	Ne hajtsa végre a teamserver.properties fájlok ellenőrzését.
# Alapértelmezés:
# 	<nincs>
#  Megszorítások:
#  - A kizárólag érvényes értékek: üres vagy 'noVerify'
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Paraméter: -noStepPrompt
# Használat: -noStepPrompt
# Leírás:
# 	Ne kérdezzen rá egy lépés végrehajtása előtt.
# Alapértelmezés:
# 	false
# Megszorítások:
#  - Csak a 'true' vagy 'false' értékek érvényesek
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Paraméter: -noEditor
# Használat: -noEditor
# Leírás:
#   Ne nyisson meg szerkesztőt a teamserver.properties fájlokhoz.
# Alapértelmezés:
# 	false
# Megszorítások:
# - Csak a 'true' vagy 'false' vagy üres érték érvényes
#
# NO_EDITOR=false
# NO_EDITOR=false
