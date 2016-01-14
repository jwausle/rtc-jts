#!/bin/sh
# *******************************************************************************
#  Licencované materiály - vlastnictví IBM
#  (c) Copyright IBM Corporation 2006, 2014. Všechna práva vyhrazena.
#
#  Omezená práva uživatelů z řad amerických vládních institucí:
#  Použití, kopírování a zveřejnění je omezeno v souladu se smlouvou GSA ADP
#  Schedule Contract se společností IBM Corp.
#  *******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8


# #############################################################
# #
# # Definujte proměnné prostředí odpovídající parametrům
# # skriptu rm_upgrade.sh a jejich výchozím hodnotám
# #
# #===========================================================
# #
# # Tento soubor se čte na začátku provedení skriptu
# # rm_upgrade.sh. Nastavuje jednu proměnnou prostředí pro
# # jeden platný parametr pomocí předdefinované výchozí hodnoty.
# #
# # Uživatelé mohou výchozí hodnotu upravit, a docílit tak
# # spouštění skriptu rm_upgrade.sh se svými vlastními hodnotami
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
# Použití: -oldApplicationHome <cesta_k_adresáři>
# Popis:
# 	Úplná cesta k domovskému adresáři aplikace ve staré instalaci.
# Výchozí:
# 	<není>
# Omezení:
#  - toto je povinný parametr
#  - <cesta_k_adresáři> musí určovat existující adresář a musí končit řetězcem 'server/conf'
#    např. /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Parametr: -applicationContextRoot
# Použití: -applicationContextRoot <kořen>
# Popis:
# Kontextový kořenový adresář aplikace.
# Výchozí:
# 	<není>
# Omezení:
#  - <kořen> musí být platný název jednoho adresáře (tj. bez úvodního lomítka)
#
APPLICATION_CONTEXT_ROOT=

# Parametr: -oldApplicationVersion
# Použití: -oldApplicationVersion <verze>
# Popis:
# 	Upgradovaná verze. Ve výchozím nastavení je
#   toto určeno spuštěním nástrojů repotool -version vůči staré aplikaci.
# Výchozí:
# 	<není>
# Omezení:
#  - musí se jednat o úplný řetězec verze
#    např. 5.0.0 nebo 5.0.1
#
OLD_APPLICATION_VERSION=

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

# Parametr: -oldApplicationTomcatHome
# Použití: -oldApplicationTomcatHome <cesta_k_adresáři>
# Popis:
# 	Úplná cesta ke kořenovému adresáři aplikací serveru Tomcat ve staré instalaci.
# Výchozí:
# 	<není>
# Omezení:
#  - Akceptuje se pouze pro upgrade RM
#  - Musí být existujícím adresářem
#
OLD_TOMCAT_HOME=

# Parametr: -oldJTSTomcatHome
# Použití: -oldJTSTomcatHome <cesta k adresáři>
# Popis:
# 	Úplná cesta ke kořenovému adresáři Tomcat ve staré instalaci.
# Výchozí:
# 	<není>
# Omezení:
#  - Akceptuje se pouze pro upgrade RM
#  - Musí být existujícím adresářem
#
OLD_JTS_TOMCAT_HOME=

# Parametr: -newApplicationHome
# Použití: -newApplicationHome <cesta k adresáři>
# Popis:
# 	Cesta k domovskému adresáři aplikace v nové instalaci.
# Výchozí:
# 	conf
# Omezení:
#  - Akceptuje se pouze pro upgrade produktů RTC, QM a RM
#  - Je-li akceptován, jde o povinný parametr
#  - <cesta_k_adresáři> musí odkazovat na existující adresář a musí končit
#    řetězcem 'server/conf'
#    např. /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parametr: -newJTSHome
# Použití: -newJTSHome <cesta_k_adresáři>
# Popis:
# 	Úplná cesta k domovskému adresáři JTS na serveru JTS pro novou instalaci.
# Výchozí:
#  Nový	domovský adresář nové aplikace
# Omezení:
#  - <cesta_k_adresáři> musí odkazovat na existující adresář a musí končit
#    řetězcem 'server/conf'
#
NEW_JTS_HOME=

# Parametr: -newJTSContextRoot
# Použití: -newJTSContextRoot <kořen>
# Popis:
# 	Kontextový kořenový adresář nového serveru JTS.
# Výchozí:
# 	jts
# Omezení:
#  - <kořen> musí být platný název jednoho adresáře (tj. bez úvodního lomítka)
#
JTS_CONTEXT_ROOT=jts

# Parametr: -newApplicationTomcatHome
# Použití: -newApplicationTomcatHome <cesta k adresáři>
# Popis:
# 	Cesta ke kořenovému adresáři aplikací serveru Tomcat v nové instalaci.
# Výchozí:
# 	<není>
#
NEW_TOMCAT_HOME=

# Parametr: -newJTSTomcatHome
# Použití: -newJTSTomcatHome <cesta_k_adresáři>
# Popis:
# 	Cesta ke kořenovému adresáři JTS Tomcat na serveru JTS pro novou instalaci.
# Výchozí:
# 	<není>
#
NEW_JTS_TOMCAT_HOME=

# Parametr: -overwrite
# Použití: -overwrite
# Popis:
# 	Vynutit přepsání (tj. vždy použít overwrite=yes) při provádění veškerých příkazů repotools
# Výchozí:
# 	<není>
# Omezení:
#  - Jediné platné hodnoty: empty nebo 'overwrite=yes'
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# Parametr: -noVerify
# Použití: -noVerify
# Popis:
# 	Nevyžadovat potvrzení (tj. vždy použít noVerify) při provádění veškerých příkazů repotools
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
# 	Nedotazovat se před jednotlivými kroky upgradu
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
#  - Jediné platné hodnoty: 'true' nebo 'false' nebo empty
#
# NO_EDITOR=false
NO_EDITOR=false

# Parametr: -db.jdbc.location
# Použití: -db.jdbc.location <JDBC_URL>
# Popis:
# 	Umístění JDBC databáze RM. (Nezbytné pouze při přechodu z verze 4.x na verzi 5.x)
#
#		Příklady:
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		POZNÁMKA:
#			V systémech *-nix vyžaduje mnoho znaků (např.: |  &  ;  <  >  (  )  $  `  \  "  '  <mezera>  <tabulátor>  <nový řádek>)
#			změnu významu (uvození) pomocí zpětného lomítka. #		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# Výchozí:
# 	<není>
# Omezení:
#  - Akceptuje se pouze pro upgrade RM z verze 4.x
#
DB_JDBC_LOCATION_VALUE=

# Parametr: -db.jdbc.password
# Použití: -db.jdbc.password <JDBC_PASSWORD>
# Popis:
# 		Heslo (prostý text nebo šifrované), které bude dosazeno, pokud se v adrese URL JDBC objeví "{heslo}". # Výchozí:
# 	<není>
# Omezení:
#  - Musí být určeno, pokud adresa URL JDBC pro databázi RM obsahuje {heslo}
#
DB_JDBC_PASSWORD_VALUE=

# Parametr: -db.db2i.schema.name
# Použití: -db.db2i.schema.name <SCHEMA_NAME>
# Popis:
# 	Název schématu DB2i DB.
# Výchozí:
# 	<není>
# Omezezní:
#  - Musí být určeno pomocí typu databáze DB2i. 
#
DB_DB2I_SCHEMA_NAME_VALUE=

# Parametr: -db.db2.dsn.dbname
# Použití: -db.db2.dsn.dbname <DSN_DBNAME>
# Popis:
# 	Název DB2Z DSN DB.
# Výchozí:
# 	<není>
# Omezezní:
#  - Musí být určeno pomocí typu databáze DB2z. 
#
DB_DB2_DSN_DBNAME_VALUE=

# Parametr: -db.schemaPrefix
# Použití: -db.schemaPrefix <SCHEMA_PREFIX>
# Popis:
# 	Předpona schématu DB. 
# Výchozí:
# 	<není>
# Omezezní:
#  - Musí být určeno pomocí typu databáze DB2z. 
#
DB_SCHEMA_PREFIX_VALUE=

# Parametr: -oldJTSHome
# Použití: -oldJTSHome <cesta_k_adresáři>
# Popis:
# 	Úplná cesta k domovskému adresáři aplikace ve staré instalaci.
# Výchozí:
# 	<není>
# Omezení:
#  - <cesta_k_adresáři> musí odkazovat na existující adresář a končit řetězcem 'server/conf'
#  - Platný pouze pro upgrady RM a JTS
#
OLD_JTS_HOME=

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
