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
# # Zdefiniuj zmienne środowiskowe odpowiadające parametrom
# # skryptu rm_upgrade.sh i ich domyślnym wartościom
# #
# #===========================================================
# #
# # Ten plik jest odczytywany na początku wykonania skryptu
# # rm_upgrade.sh. Ustawia on po jednej zmiennej
# # środowiskowej dla każdego poprawnego parametru
# # o zdefiniowanej wstępnie wartości domyślnej.
# #
# # Użytkownicy mogą modyfikować wartość domyślną w celu
# # uruchomienia skryptu rm_upgrade.sh z własnymi
# # wartościami bez konieczności ręcznego wprowadzania
# # parametru i jego odpowiedniej wartości w wierszu komend.
# #
# # OSTRZEŻENIE:
# # Nie wszystkie zmienne są wymagane dla każdej
# # aplikacji.  Należy przeczytać uważnie każdy komentarz przed
# # zmodyfikowaniem wartości.
# #
# #############################################################

# Parametr: -oldApplicationHome
# Składnia: -oldApplicationHome <ścieżka do katalogu>
# Opis:
#  Pełna ścieżka do katalogu głównego aplikacji w starszej instalacji.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - to jest parametr obowiązkowy
#  - <ścieżka do katalogu> musi być ścieżką do istniejącego katalogu zakończoną łańcuchem server/conf
#    np. /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Parametr: -applicationContextRoot
# Składnia: -applicationContextRoot <katalog główny>
# Opis:
# 	Kontekstowy katalog główny aplikacji.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - <katalog główny> musi być poprawną nazwą pojedynczego katalogu (tzn. bez początkowego ukośnika).
#
APPLICATION_CONTEXT_ROOT=

# Parametr: -oldApplicationVersion
# Składnia: -oldApplicationVersion <wersja>
# Opis:
# 	Wersja, która jest aktualizowana.  Domyślnie jest ona
#  określana poprzez uruchomienie komendy repotools -version dla starej aplikacji.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - wymagany jest pełny łańcuch wersji,
#    np. 5.0.0 lub 5.0.1
#
OLD_APPLICATION_VERSION=

# Parametr: -updateTomcatFiles
# Składnia: -updateTomcatFiles <yes | no>
# Opis:
# 	Określa, czy mają być aktualizowane pliki konfiguracyjne serwera Tomcat.
# Wartość domyślna:
# 	yes
# Ograniczenia:
#  - jedyne poprawne wartości to yes i no.
#
UPDATE_TOMCAT_FILES=yes

# Parametr: -oldApplicationTomcatHome
# Składnia: -oldApplicationTomcatHome <ścieżka do katalogu>
# Opis:
#  Pełna ścieżka do katalogu głównego Tomcat aplikacji w starej instalacji.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - Akceptowany jedynie w przypadku aktualizacji aplikacji RM.
#  - Ścieżka musi wskazywać istniejący katalog.
#
OLD_TOMCAT_HOME=

# Parametr: -oldJTSTomcatHome
# Składnia: -oldJTSTomcatHome <ścieżka do katalogu>
# Opis:
#  Pełna ścieżka do katalogu głównego JTS Tomcat w starej instalacji.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - Akceptowany jedynie w przypadku aktualizacji aplikacji RM.
#  - Ścieżka musi wskazywać istniejący katalog.
#
OLD_JTS_TOMCAT_HOME=

# Parametr: -newApplicationHome
# Składnia: -newApplicationHome <ścieżka do katalogu>
# Opis:
# 	Ścieżka do katalogu głównego aplikacji w nowej instalacji.
# Wartość domyślna:
# 	conf
# Ograniczenia:
#  - akceptowany tylko dla aktualizacji aplikacji RTC, QM i RM
#  - jeśli jest akceptowany, jest to parametr obowiązkowy
#  - <ścieżka do katalogu> musi być ścieżką do istniejącego katalogu zakończoną łańcuchem server/conf
#    np. /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parametr: -newJTSHome
# Składnia: -newJTSHome <ścieżka do katalogu>
# Opis:
#  Ścieżka do katalogu głównego serwera JTS, który będzie używany przez nową instalację.
# Wartość domyślna:
#  Nowy katalog główny aplikacji
# Ograniczenia:
#  - <ścieżka do katalogu> musi być ścieżką do istniejącego katalogu zakończoną łańcuchem server/conf
#
NEW_JTS_HOME=

# Parametr: -newJTSContextRoot
# Składnia: -newJTSContextRoot <katalog główny>
# Opis:
#  Kontekstowy katalog główny nowego serwera JTS.
# Wartość domyślna:
# 	jts
# Ograniczenia:
#  - <katalog główny> musi być poprawną nazwą pojedynczego katalogu (tzn. bez początkowego ukośnika)
#
JTS_CONTEXT_ROOT=jts

# Parametr: -newApplicationTomcatHome
# Składnia: -newApplicationTomcatHome <ścieżka do katalogu>
# Opis:
# 	Ścieżka do katalogu głównego Tomcat aplikacji w nowej instalacji.
# Wartość domyślna:
# 	<brak>
#
NEW_TOMCAT_HOME=

# Parametr: -newJTSTomcatHome
# Składnia: -newJTSTomcatHome <ścieżka do katalogu>
# Opis:
#  Ścieżka do katalogu głównego serwera Tomcat dla serwera JTS, który będzie używany przez nową instalację.
# Wartość domyślna:
# 	<brak>
#
NEW_JTS_TOMCAT_HOME=

# Parametr: -overwrite
# Składnia: -overwrite
# Opis:
#  Wymuszaj nadpisywanie (zawsze używaj wartości overwrite=yes) podczas wykonywania komend repotools.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - Jedyne poprawne wartości to wartość pusta lub wartość overwrite=yes.
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# Parametr: -noVerify
# Składnia: -noVerify
# Opis:
#  Nie przeprowadzaj weryfikacji (zawsze używaj wartości noVerify) podczas wykonywania komend repotools.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - Jedyne poprawne wartości to wartość pusta lub wartość noVerify.
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Parametr: -noStepPrompt
# Składnia: -noStepPrompt
# Opis:
#  Nie wyświetlaj podpowiedzi przed każdym krokiem aktualizacji.
# Wartość domyślna:
# 	false
# Ograniczenia:
#  - jedynymi poprawnymi wartościami są true i false.
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Parametr: -noEditor
# Składnia: -noEditor
# Opis:
#   Nie otwieraj plików teamserver.properties w edytorze.
# Wartość domyślna:
#   false
# Ograniczenia:
#  - Jedyne poprawne wartości to true, false lub pusta.
#
# NO_EDITOR=false
NO_EDITOR=false

# Parametr: -db.jdbc.location
# Składnia: -db.jdbc.location <adres_URL_interfejsu_JDBC>
# Opis:
# 	Położenie interfejsu JDBC bazy danych aplikacji RM. (Wymagany tylko w przypadku przeniesienia z wersji 4.x do wersji 5.x). 
#
#		Przykłady:
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		Uwaga:
#			W systemach *-nix wiele znaków (na przykład: |  &  ;  <  >  (  )  $  `  \  "  '  <space>  <tab>  <newline>) 
#			musi zostać poprzedzonych ukośnikiem odwrotnym. 
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - Akceptowane tylko w przypadku aktualizacji aplikacji RM 4.x.
#
DB_JDBC_LOCATION_VALUE=

# Parametr: -db.jdbc.password
# Składnia: -db.jdbc.password <hasło_JDBC>
# Opis:
# 	Hasło (jawnym tekstem lub zaszyfrowane), które zostanie podstawione za zmienną {password} w adresie URL JDBC. 
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - ten parametr musi zostać określony, jeśli adres URL interfejsu JDBC bazy danych aplikacji RM zawiera łańcuch {password}
#
DB_JDBC_PASSWORD_VALUE=

# Parametr: -db.db2i.schema.name
# Składnia: -db.db2i.schema.name <nazwa_schematu>
# Opis:
# 	Nazwa schematu bazy danych DB2i.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  – Musi zostać określony, gdy używany jest typ bazy danych DB2i. 
#
DB_DB2I_SCHEMA_NAME_VALUE=

# Parametr: -db.db2.dsn.dbname
# Składnia: -db.db2.dsn.dbname <NAZWA_BAZY_DANYCH_DSN>
# Opis:
# 	Nazwa bazy danych DB2Z DSN.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  – Musi zostać określony, gdy używany jest typ bazy danych DB2z. 
#
DB_DB2_DSN_DBNAME_VALUE=

# Parametr: -db.schemaPrefix
# Składnia: -db.schemaPrefix <przedrostek_schematu>
# Opis:
# 	Przedrostek schematu bazy danych. 
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  – Musi zostać określony, gdy używany jest typ bazy danych DB2z. 
#
DB_SCHEMA_PREFIX_VALUE=

# Parametr: -oldJTSHome
# Składnia: -oldJTSHome <ścieżka do katalogu>
# Opis:
#  Pełna ścieżka do katalogu głównego JTS w starszej instalacji.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - <ścieżka do katalogu> musi być ścieżką do istniejącego katalogu zakończoną łańcuchem server/conf.
#  - Poprawne tylko dla aktualizacji aplikacji RM i JTS.
#
OLD_JTS_HOME=

# Parametr: -lpaContextRoot
# Składnia: -lpaContextRoot <katalog główny>
# Opis:
# 	Kontekstowy katalog główny aplikacji LPA.
# Wartość domyślna:
# 	admin
# Ograniczenia:
#  - <katalog główny> musi być poprawną nazwą pojedynczego katalogu (tzn. bez początkowego ukośnika).
#
LPA_CONTEXT_ROOT=admin
