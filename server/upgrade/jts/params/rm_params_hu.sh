#!/bin/sh
# *******************************************************************************
#  Licenc hatálya alá tartozó anyagok - Az IBM tulajdona
#  (c) Copyright IBM Corporation 2006, 2014. Minden jog fenntartva.
#
#  Megjegyzés az Egyesült Államok kormányzati felhasználóinak korlátozott jogaira vonatkozóan:
#  A használatot, sokszorosítást vagy közzétételt az IBM vállalattal kötött GSA ADP Schedule
#  Contract szerződés szabályozza.
#  *******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8



# #############################################################
# #
# # Adja meg a környezeti változókat, amelyek megfelelnek az
# # rm_upgrade.sh parancsfájl paramétereinek, és azok
# # alapértelmezett értékeit
# #
# #===========================================================
# #
# # Ezt a fájlt az rm_upgrade.sh parancsfájl végrehajtásának
# # kezdetekor olvassa a rendszer. Egy környezeti változót
# # állít be érvényes, előre meghatározott alapértelmezett
# # értékkel rendelkező paraméterenként.
# #
# # A felhasználók módosíthatják az alapértelmezett értéket az
# # rm_upgrade.sh parancsfájl saját értékekkel való elindításához,
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
#    például /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Paraméter: -applicationContextRoot
# Használat: -applicationContextRoot <root>
# Leírás:
# 	Az alkalmazás kontextusgyökere.
# Alapértelmezés:
# 	<nincs>
# Megszorítások:
#  - A <root> csak egy egyedülálló érvényes könyvtárnév lehet (vagyis nincs bevezető törtvonal)
#
APPLICATION_CONTEXT_ROOT=

# Paraméter: -oldApplicationVersion
# Használat: -oldApplicationVersion <verzió>
# Leírás:
# 	A frissítendő változat. Alapértelmezés szerint ez a repotools
#   -version parancs régi alkalmazáson történő futtatásával határozható meg.
# Alapértelmezés:
# 	<nincs>
# Megszorítások:
#  - egy teljes verzió karaktersorozatnak kell lennie
#    például 5.0.0 vagy 5.0.1
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

# Paraméter: -oldApplicationTomcatHome
# Használat: -oldApplicationTomcatHome <könyvtár_útvonal>
# Leírás:
# 	Az alkalmazás Tomcat gyökérkönyvtár teljes útvonala a régi telepítésben.
# Alapértelmezés:
# 	<nincs>
# Megszorítás:
#  -  Csak RM frissítés esetén elfogadott
#  - Egy létező könyvtárnak kell lennie
#
OLD_TOMCAT_HOME=

# Paraméter: -oldJTSTomcatHome
# Használat: -oldJTSTomcatHome <könyvtár_útvonal>
# Leírás:
# 	A JTS Tomcat gyökérkönyvtár teljes útvonala a régi telepítésben.
# Alapértelmezés:
# 	<nincs>
# Megszorítás:
#  -  Csak RM frissítés esetén elfogadott
#  - Egy létező könyvtárnak kell lennie
#
OLD_JTS_TOMCAT_HOME=

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
#    például /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
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
#
NEW_JTS_HOME=

# Paraméter: -newJTSContextRoot
# Használat: -newJTSContextRoot <root>
# Leírás:
# 	Az új JTS kiszolgáló kontextusgyökere.
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

# Paraméter: -overwrite
# Használat: -overwrite
# Leírás:
# 	Felülírás kényszerítése (vagyis mindig az overwrite=yes beállítás használata) bármely repotools parancs futtatásakor
# Alapértelmezés:
# 	<nincs>
#  Megszorítások:
#  - A kizárólag érvényes értékek: üres vagy 'overwrite=yes'
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# Paraméter: -noVerify
# Használat: -noVerify
# Leírás:
# 	Ellenőrzések kihagyása (vagyis mindig a -noVerify beállítás használata) bármely repotools parancs futtatásakor
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
# 	Ne kérdezzen rá az egyes frissítési lépések előtt
# Alapértelmezés:
#  false
# Megszorítások:
# - A kizárólag érvényes értékek: 'true' 'false'
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


# Paraméter: -db.jdbc.location
# Használat: -db.jdbc.location <JDBC_URL>
# Leírás:
# 	A JDBC helye az RM adatbázis esetén. (Csak 4.x -> 5.x áttérés esetén szükséges)
#
#		Példák:
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		MEGJEGYZÉS:
#			*-nix rendszerek számos karakter (például: |  &  ;  <  >  (  )  $  `  \  "  '  <space>  <tab>  <newline>)
#			megköveteli a fordított törtvonal vezérlőkarakter alkalmazását.
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# Alapértelmezés:
# 	<nincs>
# Megszorítások:
#  - Csak 4.x változatról történő RM frissítés esetén elfogadott
#
DB_JDBC_LOCATION_VALUE=

# Paraméter: -db.jdbc.password
# Használat: -db.jdbc.password <JDBC_PASSWORD>
# Leírás:
# 	A jelszó (sima szöveg vagy titkosított), amely be lesz helyettesítve, ha a JDBC URL címben szerepel a "{password}" változó.
# Alapértelmezés:
# 	<nincs>
# Megszorítások:
#  - Ha az RM adatbázis JDBC URL címe tartalmazza a {password} változót, akkor meg kell adni
#
DB_JDBC_PASSWORD_VALUE=

# Paraméter: -db.db2i.schema.name
# Használat: -db.db2i.schema.name <SCHEMA_NAME>
# Leírás:
# 	A DB2i adatbázis séma neve.
# Alapértelmezés:
# 	<nincs>
# Megszorítások:
#  - A DB2i adatbázistípus használatával kell megadni.
#
DB_DB2I_SCHEMA_NAME_VALUE=

# Paraméter: -db.db2.dsn.dbname
# Használat: -db.db2.dsn.dbname <DSN_DBNAME>
# Leírás:
# 	A DB2Z DSN adatbázisnév.
# Alapértelmezés:
# 	<nincs>
# Megszorítások:
#  - A DB2z adatbázistípus használatával kell megadni.
#
DB_DB2_DSN_DBNAME_VALUE=

# Paraméter: -db.schemaPrefix
# Használat: -db.schemaPrefix <SÉMA_ELŐTAG>
# Leírás:
#  Az adatbázis séma előtag.
# Alapértelmezés:
# 	<nincs>
# Megszorítások:
#  - A DB2z adatbázistípus használatával kell megadni.
#
DB_SCHEMA_PREFIX_VALUE=

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
