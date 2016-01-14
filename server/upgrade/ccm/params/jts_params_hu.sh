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
# # jts_upgrade.sh parancsfájl paramétereinek, és azok
# # alapértelmezett értékeit
# #
# #===========================================================
# #
# # Ezt a fájlt a jts_upgrade.sh parancsfájl végrehajtásának
# # kezdetekor olvassa a rendszer. Egy környezeti változót
# # állít be érvényes, előre meghatározott alapértelmezett
# # értékkel rendelkező paraméterenként.
# #
# # A felhasználók módosíthatják az alapértelmezett értéket a
# # jts_upgrade.sh parancsfájl saját értékekkel való elindításához,
# # anélkül, hogy kézzel meg kellene adniuk a paramétert és annak
# # megfelelő értékeit a parancssorban.
# #
# # FIGYELMEZTETÉS:
# # Nem minden változót szükséges beállítani minden
# # alkalmazáshoz.  Olvasson el figyelmesen minden megjegyzést az
# # érték módosítása előtt.
# #
# #############################################################

# Paraméter: -oldJTSHome
# Használat: -oldJTSHome <könyvtár_útvonal>
# Leírás:
# 	A JTS alapkönyvtár teljes útvonala a régi telepítésben.
# Alapértelmezés:
# 	<nincs>
# Megszorítások:
#  - a <könyvtár_útvonal> csak egy 'server/conf' végződésű létező könyvtár lehet
#  - Csak RM és JTS frissítések esetén érvényes
#
OLD_JTS_HOME=

# Paraméter: -jtsContextRoot
# Használat: -jtsContextRoot <root>
# Leírás:
# 	A JTS kontextusgyökér
# Alapértelmezés:
# 	jts
# Megszorítások:
#  - A <root> csak egy egyedülálló érvényes könyvtárnév lehet (vagyis nincs bevezető törtvonal)
#
JTS_CONTEXT_ROOT=jts

# Paraméter: -lpaContextRoot
# Használat: -lpaContextRoot <root>
# Leírás:
# 	Az LPA kontextusgyökér
# Alapértelmezés:
# 	admin
# Megszorítások:
#  - A <root> csak egy egyedülálló érvényes könyvtárnév lehet (vagyis nincs bevezető törtvonal)
#
LPA_CONTEXT_ROOT=admin

# Paraméter: -oldJTSVersion
# Használat: -oldJTSVersion <verzió>
# Leírás:
# 	A frissítendő JTS változat.  Alapértelmezés szerint ez a régi JTS kiszolgálón
#    a repotools -version parancs futtatásával határozható meg.
# Alapértelmezés:
# 	<nincs>
# Megszorítások:
#  - egy teljes verzió karaktersorozatnak kell lennie
#    például 3.0.0 vagy 3.0.1
#
OLD_JTS_VERSION=

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

# Paraméter: -newJTSHome
# Használat: -newJTSHome <könyvtár_útvonal>
# Leírás:
# 	Az új telepítés JTS kiszolgáló konfigurációs könyvtárának útvonala.
# Alapértelmezés:
# 	conf
# Megszorítások:
# - a <könyvtár útvonala> csak egy 'server\conf' végződésű létező könyvtár lehet
#
NEW_JTS_HOME="$START_DIR/conf"

# Paraméter: -newTomcatHome
# Használat: -newTomcatHome <könyvtár_útvonal>
# Leírás:
# 	A Tomcat alapkönyvtár útvonala az új telepítésben.
# Alapértelmezés:
# 	<nincs>
#
NEW_TOMCAT_HOME=

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
