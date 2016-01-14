#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2015. Wszelkie prawa zastrzeżone.
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
# # skryptu gc_upgrade.sh i ich domyślnym wartościom
# #
# #===========================================================
# #
# # Ten plik jest odczytywany na początku wykonania skryptu
# # gc_upgrade.sh. Ustawia on po jednej zmiennej
# # środowiskowej dla każdego poprawnego parametru
# # o zdefiniowanej wstępnie wartości domyślnej.
# #
# # Użytkownicy mogą modyfikować wartość domyślną w celu
# # uruchomienia skryptu gc_upgrade.sh z własnymi
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
#  Pełna ścieżka do katalogu głównego aplikacji w instalacji 3.0.1.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - to jest parametr obowiązkowy
#  - <ścieżka do katalogu> musi być ścieżką do istniejącego katalogu zakończoną łańcuchem server/conf
#    np. /QIBM/UserData/JazzTeamServer301Backup/server/conf
#
OLD_APPLICATION_HOME=

# Parametr: -applicationContextRoot
# Składnia: -applicationContextRoot <katalog główny>
# Opis:
# 	Kontekstowy katalog główny aplikacji serwera 3.0.1.
# Wartość domyślna:
# 	gc
# Ograniczenia:
#  - <katalog główny> musi być poprawną nazwą pojedynczego katalogu (tzn. bez początkowego ukośnika)
#
APPLICATION_CONTEXT_ROOT=

# Parametr: -oldApplicationVersion
# Składnia: -oldApplicationVersion <wersja>
# Opis:
# 	Wersja 3.0.x, która jest aktualizowana.  Domyślnie jest ona
#  określana poprzez uruchomienie komendy repotools -version dla starej aplikacji.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - wymagany jest pełny łańcuch wersji,
#    np. 3.0.0 lub 3.0.1
#
OLD_APPLICATION_VERSION=

# Parametr: -updateTomcatFiles
# Składnia: -updateTomcatFiles <yes | no>
# Opis:
# 	Określa, czy mają być aktualizowane pliki konfiguracyjne serwera Tomcat.
# Wartość domyślna:
# 	no
# Ograniczenia:
#  - jedyne poprawne wartości to yes i no.
#
UPDATE_TOMCAT_FILES=no

# Parametr: -oldTomcatHome
# Składnia: -oldTomcatHome <ścieżka do katalogu>
# Opis:
#  Pełna ścieżka do katalogu głównego Tomcat w instalacji 3.0.1.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - Ścieżka musi wskazywać istniejący katalog.
#
OLD_TOMCAT_HOME=

# Parametr: -newApplicationHome
# Składnia: -newApplicationHome <ścieżka do katalogu>
# Opis:
# 	Ścieżka do katalogu głównego aplikacji w instalacji 4.0.
# Wartość domyślna:
# 	conf
# Ograniczenia:
#  - akceptowany tylko dla aktualizacji aplikacji RTC, QM, GC i RM
#  - jeśli jest akceptowany, jest to parametr obowiązkowy
#  - <ścieżka do katalogu> musi być ścieżką do istniejącego katalogu zakończoną łańcuchem server/conf
#    np. /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parametr: -newJTSHome
# Składnia: -newJTSHome <ścieżka do katalogu>
# Opis:
#  Pełna ścieżka do katalogu głównego JTS w instalacji 4.0.
# Wartość domyślna:
#  Nowy katalog główny aplikacji
# Ograniczenia:
#  - <ścieżka do katalogu> musi być ścieżką do istniejącego katalogu zakończoną łańcuchem server/conf
#    np. /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# Parametr: -jtsContextRoot
# Składnia: -jtsContextRoot <katalog główny>
# Opis:
#  Kontekstowy katalog główny serwera JTS 4.0.
# Wartość domyślna:
# 	jts
# Ograniczenia:
#  - <katalog główny> musi być poprawną nazwą pojedynczego katalogu (tzn. bez początkowego ukośnika)
#
JTS_CONTEXT_ROOT=jts

# Parametr: -newApplicationTomcatHome
# Składnia: -newApplicationTomcatHome <ścieżka do katalogu>
# Opis:
# 	Ścieżka do katalogu głównego Tomcat aplikacji w instalacji 4.0.
# Wartość domyślna:
# 	<brak>
#
NEW_TOMCAT_HOME=

# Parametr: -newJTSTomcatHome
# Składnia: -newJTSTomcatHome <ścieżka do katalogu>
# Opis:
# 	Ścieżka do katalogu głównego JTS Tomcat w instalacji 4.0.
# Wartość domyślna:
# 	<brak>
#
NEW_JTS_TOMCAT_HOME=

# Parametr: -ignoreJTSVersionCheck
# Składnia: -ignoreJTSVersionCheck
# Opis:
# 	Nie sprawdzaj, czy wersja aplikacji jest
#   zgodna z wersją serwera Jazz Team Server w położeniu newJTSHome.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - Jedyne poprawne wartości to wartość pusta lub wartość ignoreJTSVersionCheck.
#
IGNORE_JTS_VERSION_CHECK=

# Parametr: -noPrompt
# Składnia: -noPrompt
# Opis:
# 	Wyłącza wyświetlanie zapytania przed utworzeniem lub zmodyfikowaniem tabel.
# Wartość domyślna:
# 	noPrompt
# Ograniczenia:
#  - Jedyne poprawne wartości to wartość pusta lub wartość noPrompt.
#
# NO_PROMPT=
NO_PROMPT=noPrompt

# Parametr: -noVerify
# Składnia: -noVerify
# Opis:
# 	Nie sprawdzaj poprawności plików teamserver.properties.
# Wartość domyślna:
# 	noVerify
# Ograniczenia:
#  - Jedyne poprawne wartości to wartość pusta lub wartość noVerify.
#
# NO_VERIFY=
NO_VERIFY=noVerify

# Parametr: -noStepPrompt
# Składnia: -noStepPrompt
# Opis:
# 	Nie wyświetlaj zapytania przed wykonaniem kroku.
# Wartość domyślna:
# 	false
# Ograniczenia:
#  - Jedyne poprawne wartości to true i false.
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Parametr: -noEditor
# Składnia: -noEditor
# Opis:
#   Nie otwieraj plików teamserver.properties w edytorze.
# Wartość domyślna:
# 	false
# Ograniczenia:
#  - Jedyne poprawne wartości to true i false.
#
# NO_EDITOR=false
NO_EDITOR=false
