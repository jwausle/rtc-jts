#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  © Copyright IBM Corporation 2006, 2014. Wszelkie prawa zastrzeżone.
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
# # skryptu jts_upgrade.sh i ich domyślnym wartościom
# #
# #===========================================================
# #
# # Ten plik jest odczytywany na początku wykonania skryptu
# # jts_upgrade.sh. Ustawia on po jednej zmiennej
# # środowiskowej dla każdego poprawnego parametru
# # o zdefiniowanej wstępnie wartości domyślnej.
# #
# # Użytkownicy mogą modyfikować wartość domyślną w celu
# # uruchomienia skryptu jts_upgrade.sh z jego własnymi
# # wartościami bez konieczności ręcznego wprowadzania
# # parametru i jego odpowiedniej wartości w wierszu komend.
# #
# # OSTRZEŻENIE:
# # Nie wszystkie zmienne są wymagane dla każdej
# # aplikacji.  Należy przeczytać uważnie każdy komentarz przed
# # zmodyfikowaniem wartości.
# #
# #############################################################

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

# Parametr: -jtsContextRoot
# Składnia: -jtsContextRoot <katalog główny>
# Opis:
# 	Kontekstowy katalog główny aplikacji JTS.
# Wartość domyślna:
# 	jts
# Ograniczenia:
#  - <katalog główny> musi być poprawną nazwą pojedynczego katalogu (tzn. bez początkowego ukośnika).
#
JTS_CONTEXT_ROOT=jts

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

# Parametr: -oldJTSVersion
# Składnia: -oldJTSVersion <wersja>
# Opis:
# 	Wersja aktualizowanego serwera JTS.  Domyślnie
#   wersja jest określana przez uruchomienie komendy repotools -version dla starego serwera JTS.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - wymagany jest pełny łańcuch wersji,
#    np. 3.0.0 lub 3.0.1
#
OLD_JTS_VERSION=

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

# Parametr: -oldTomcatHome
# Składnia: -oldTomcatHome <ścieżka do katalogu>
# Opis:
#  Pełna ścieżka do katalogu głównego Tomcat w starej instalacji.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - Ścieżka musi wskazywać istniejący katalog.
#
OLD_TOMCAT_HOME=

# Parametr: -newJTSHome
# Składnia: -newJTSHome <ścieżka do katalogu>
# Opis:
# 	Ścieżka do katalogu konfiguracyjnego serwera JTS w nowej instalacji.
# Wartość domyślna:
#  conf
# Ograniczenia:
#  - <ścieżka do katalogu> musi być ścieżką do istniejącego katalogu zakończoną łańcuchem server/conf.
#
NEW_JTS_HOME="$START_DIR/conf"

# Parametr: -newTomcatHome
# Składnia: -newTomcatHome <ścieżka do katalogu>
# Opis:
# 	Ścieżka do katalogu głównego serwera Tomcat w nowej instalacji.
# Wartość domyślna:
# 	<brak>
#
NEW_TOMCAT_HOME=

# Parametr: -noPrompt
# Składnia: -noPrompt
# Opis:
# 	Wyłącza wyświetlanie zapytania przed utworzeniem lub zmodyfikowaniem tabel.
# Wartość domyślna:
# 	<brak>
# Ograniczenia:
#  - Jedyne poprawne wartości to wartość pusta lub wartość noPrompt.
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# Parametr: -noVerify
# Składnia: -noVerify
# Opis:
# 	Nie sprawdzaj poprawności plików teamserver.properties.
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
#   false
# Ograniczenia:
#  - Jedyne poprawne wartości to true, false lub pusta.
#
# NO_EDITOR=false
NO_EDITOR=false
