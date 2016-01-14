#!/bin/sh
# ********************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2011, 2015. All Rights Reserved.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************

# ################################################################################
#
# Plik komunikatów wyświetlanych przez zautomatyzowane pliki aktualizacji.
#
# ################################################################################


# ***********************
# * Funkcja komunikatów *
# ***********************
messages() {

case $1 in 

# ***************************************
# * Komunikaty sprawdzania początkowego *
# ***************************************

INVALID_LAUNCH )
echo ""
echo "Nie należy wykonywać skryptu app_upgrade bezpośrednio.  Aby zaktualizować serwer JTS lub aplikację, wykonaj jedną z następujących komend:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Aby wyświetlić pełny opis parametrów, użyj opcji -help."
;;

INVALID_START_DIR )
echo ""
echo "Skrypt $2 musi zostać uruchomiony z katalogu $3, chyba że używany jest parametr -help."
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "Plik $2 zawiera wartości parametrów skryptów aktualizacji."
echo "Jeśli wystąpi potrzeba zmodyfikowania domyślnych wartości parametrów, można edytować te pliki lub określić wartości parametrów jako argumenty wiersza komend skryptów aktualizacji."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "Następujący zestaw plików zawiera domyślne wartości parametrów aplikacji lub aktualizacji JTS.  Jeśli wystąpi potrzeba zmodyfikowania domyślnych wartości parametrów, można edytować te pliki lub określić wartości parametrów jako argumenty wiersza komend skryptów aktualizacji."
echo "- aktualizacja CCM: $2/params/ccm_params$3.sh"
echo "- aktualizacja GC: $2/params/gc_params$3.sh"
echo "- aktualizacja QM: $2/params/qm_params$3.sh"
echo "- aktualizacja RM: $2/params/rm_params$3.sh"
echo "- aktualizacja JTS: $2/params/jts_params$3.sh"
echo ""
;;


# *************************************
# * Komunikaty sprawdzania parametrów *
# *************************************

# Weryfikacja wewnętrzna
# ======================

MISSING_APP_TYPE )
echo ""
echo "Nie określono typu aplikacji lub serwera JTS.  Aby zaktualizować serwer JTS lub aplikację, wykonaj jedną z następujących komend:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Aby wyświetlić pełny opis parametrów, użyj opcji -help."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "Niepoprawny typ aplikacji lub serwera JTS: $2.  Aby zaktualizować serwer JTS lub aplikację, wykonaj jedną z następujących komend:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Aby wyświetlić pełny opis parametrów, użyj opcji -help."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "Brak wartości dla parametru $2."
echo "Aby wyświetlić pełny opis parametrów, należy użyć opcji -help."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "Katalog $3 określony dla parametru $2 nie istnieje lub nie jest poprawny."
echo "Aby wyświetlić pełny opis parametrów, należy użyć opcji -help."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "Katalog $3 dla parametru $2 musi zostać określony przy użyciu pełnej ścieżki."
echo "Aby wyświetlić pełny opis parametrów, należy użyć opcji -help."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "Plik $3 określony dla parametru $2 nie istnieje lub jest niepoprawny."
echo "Aby wyświetlić pełny opis parametrów, należy użyć opcji -help."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "Wartość $3 jest niepoprawna dla parametru $2."
echo "Aby wyświetlić pełny opis parametrów, należy użyć opcji -help."
echo ""
;;

INVALID_PARAM )
echo ""
echo "Parametr $2 jest nieznany."
echo "Aby wyświetlić pełny opis parametrów, należy użyć opcji -help."
echo ""
;;


# Weryfikacja zewnętrzna
# ======================

MISSING_HOME_PARAM )
echo ""
echo "Brak parametru katalogu głównego $2."
echo "Aby wyświetlić pełny opis parametrów, należy użyć opcji -help."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "Katalog $2 nie istnieje lub jest niepoprawny."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "Nie można znaleźć komendy repotools aplikacji: $2."
echo ""
echo "Sprawdź, czy parametr -oldApplicationHome $3 wskazuje stary katalog konfiguracji serwera, np. JazzInstallRoot/server/conf."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "Nie można znaleźć komendy repotools aplikacji: $2."
echo ""
echo "Sprawdź, czy parametr -oldApplicationHome $3 wskazuje stary katalog konfiguracji serwera, np. JazzInstallRoot/server/conf oraz czy parametr jtsContextRoot $4 jest poprawny."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "Nie można znaleźć pliku konfiguracyjnego $2."
echo ""
echo "Sprawdź, czy parametr -oldApplicationHome $3 wskazuje stary katalog konfiguracji serwera, np. JazzInstallRoot/server/conf."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "Nie można znaleźć pliku konfiguracyjnego $2."
echo ""
echo "Sprawdź, czy parametr -oldApplicationHome $3 wskazuje stary katalog konfiguracji serwera, np. JazzInstallRoot/server/conf oraz czy parametr jtsContextRoot $4 jest poprawny."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "Nie można znaleźć komendy repotools aplikacji: $2."
echo ""
echo "Sprawdź, czy parametr -newApplicationHome $3 wskazuje nowy katalog konfiguracji serwera aplikacji, np. JazzInstallRoot/server/conf, oraz czy parametr applicationContextRoot $4 jest poprawny."
echo "W przypadku aktualizacji z poprzedniej wersji upewnij się, że wybrano poprawne kontekstowe katalogi główne.  Na przykład w przypadku używania programu Installation Manager należy wybrać opcję kontekstowego katalogu głównego $5 na panelu Opcje kontekstowego katalogu głównego.  Jeśli przypadkowo wybrano inną opcję, konieczne jest zreinstalowanie produktu przy użyciu opcji kontekstowego katalogu głównego $5."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "Nie można znaleźć pliku konfiguracyjnego $2."
echo ""
echo "Sprawdź, czy parametr -newApplicationHome $3 wskazuje nowy katalog konfiguracji serwera JTS, np. JazzInstallRoot/server/conf, oraz czy parametr applicationContextRoot $4 jest poprawny."
echo "W przypadku aktualizacji z poprzedniej wersji upewnij się, że wybrano poprawne kontekstowe katalogi główne.  Na przykład w przypadku używania programu Installation Manager należy wybrać opcję kontekstowego katalogu głównego $5 na panelu Opcje kontekstowego katalogu głównego.  Jeśli przypadkowo wybrano inną opcję, konieczne jest zreinstalowanie produktu przy użyciu opcji kontekstowego katalogu głównego $5."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "Nie można znaleźć komendy repotools serwera JTS: $2."
echo ""
echo "Sprawdź, czy parametr -oldJTSHome $3 wskazuje stary katalog konfiguracji serwera JTS, np. JazzInstallRoot/server/conf oraz czy parametr jtsContextRoot $4 jest poprawny."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "Nie można znaleźć pliku konfiguracyjnego $2."
echo ""
echo "Sprawdź, czy parametr -oldJTSHome $3 wskazuje stary katalog konfiguracji serwera JTS, np. JazzInstallRoot/server/conf oraz czy parametr jtsContextRoot $4 jest poprawny."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "Nie można znaleźć komendy repotools serwera JTS: $2."
echo ""
echo "Sprawdź, czy parametr -newJTSHome $3 wskazuje nowy katalog konfiguracji serwera JTS, np. JazzInstallRoot/server/conf oraz czy parametr jtsContextRoot $4 jest poprawny."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "Nie można znaleźć pliku konfiguracyjnego $2."
echo ""
echo "Sprawdź, czy parametr -newJTSHome $3 wskazuje nowy katalog konfiguracji serwera JTS, np. JazzInstallRoot/server/conf oraz czy parametr jtsContextRoot $4 jest poprawny."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "Na potrzeby aktualizacji $2 wymagany jest plik tar zawierający dane wersji 2.x."
echo "Aby wyświetlić pełny opis parametrów, należy użyć opcji -help."
echo ""
;;


# ************************
# * Komunikaty wykonania *
# ************************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    Aktualizacja aplikacji JTS    ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    Aktualizacja aplikacji CCM    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    Aktualizacja aplikacji GC         ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    Aktualizacja aplikacji QM    ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    Aktualizacja aplikacji RM   ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "Sprawdzanie wersji starej aplikacji RM..."
;;

RM_DISPLAY_OLD_VERSION )
echo "Wersja starej aplikacji RM to $2"
;;

# *********************************
# * Przełączanie pierwszego kroku *
# *********************************

INITIAL_STEP_FAILED )
echo ""
echo "Ostatnie wykonanie nie powiodło się podczas kroku początkowego."
;;

LAST_STEP_FAILED )
echo ""
echo "Ostatnie wykonanie nie powiodło się podczas kroku $2."
echo "Czy zrestartować aktualizowanie od tego kroku, czy od poprzedniego kroku?"
;;

ALREADY_RUN )
echo ""
echo "Aktualizacja została już przeprowadzona i pomyślnie zakończona."
echo "Czy zrestartować aktualizowanie od konkretnego kroku?"
;;

LAST_STEP_PASSED )
echo ""
echo "Ostatnie wykonanie zostało pomyślnie zatrzymane na kroku $2."
echo "Czy zrestartować aktualizowanie od bieżącego kroku $3, czy od poprzedniego kroku?"
;;

ENTER_NEXT_STEP )
echo ""
echo "Wprowadź numer kroku [$2-$3], od którego ma zostać zrestartowane aktualizowanie, lub naciśnij klawisz [Enter], aby anulować:"
;;

INTEGER_STEP_NUMBER )
echo ""
echo "Wartość $2 nie jest liczbą. Wprowadź poprawny numer kroku."
;;

INVALID_STEP_NUMBER )
echo ""
echo "Wartość $2 jest niepoprawnym numerem kroku. Wprowadź poprawny numer kroku."
;;

MAX_STEP_NUMBER )
echo ""
echo "Ostatnim krokiem jest krok $2, a więc nie można zrestartować aktualizowania od kroku $3."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "Krok $2 nie został jeszcze wykonany, a więc nie można zrestartować aktualizowania od kroku $3."
;;


# *************************
# * Komunikaty dla kroków *
# *************************

STEP_0_IBMi )
echo "Krok 0: usuwanie tabel"
echo "-------------------"
;;

STEP_0 )
echo "Krok 0: aktualizowanie plików konfiguracyjnych"
echo "----------------------------------------------"
;;

STEP_1_ADD )
echo "Krok 1: dodawanie tabel"
echo "-----------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "Krok $2: odbudowywanie indeksów tekstowych"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "Krok $2: ponowne tworzenie indeksów zapytań i wyszukiwania"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "Krok $2: scalanie LPA w JTS"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "Krok $2: naprawianie przedniego adresu URL obszarów pamięci masowej LPA"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "Krok $2: usuwanie zaprzyjaźnionych LPA z aplikacji RM"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "Krok 2: aktualizowanie schematu hurtowni danych"
echo "-------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "Krok $2: finalizowanie aplikacji RM"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "Krok $2: finalizowanie aplikacji JTS"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "Krok $2: ponowne indeksowanie aplikacji RM"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "Aktualizacja $2 nie powiodła się w kroku $3.  Usuń problem i uruchom ponownie skrypt, począwszy od kroku $3."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "Aktualizacja $2 powiodła się.  Teraz można zaktualizować dowolne aplikacje w środowisku."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "Część aktualizacji aplikacji RM wykonywana w trybie bez połączenia powiodła się. Można teraz uruchomić serwery we wdrożeniu."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "Część aktualizacji aplikacji RM wykonywana w trybie bez połączenia powiodła się. Istnieje jeden pozostały"
echo "krok wymagany do zakończenia migracji, ale wymaga, aby wszystkie serwery, które"
echo "są połączone z aplikacją RM (np. RTC, RQM, JRS, GC), działały w trybie z połączeniem. W dogodnym momencie włącz"
echo "wszystkie serwery (w tym serwer RM). Zalecamy, aby zalogować się do każdego serwera"
echo "i upewnić się, że działa on prawidłowo. Następnie uruchom następującą komendę:"
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "Aktualizacja $2 powiodła się.  Można teraz uruchomić serwery we wdrożeniu."
echo ""
;;

# ****************************************
# * Komunikaty podczas wykonywania kroku *
# ****************************************

STEP_DIR_CMD )
echo ""
echo "Katalog: $2"
echo "Komenda:"
;;

ENTER_STEP_ACTION )
echo "Wprowadź opcję [E], aby wykonać ten krok, opcję [S], aby pominąć ten krok, lub naciśnij klawisz [Enter], aby anulować wykonanie skryptu:"
;;

INVALID_STEP_ACTION )
echo ""
echo "Opcja $2 jest niepoprawna. Dozwolone są tylko opcje E, S lub klawisz Enter."
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "Zostanie otworzony edytor vi umożliwiający sprawdzenie pliku teamserver.properties $2."
echo "Sprawdź, czy katalog główny publicznego identyfikatora URI określonego we właściwości the com.ibm.team.repository.server.webapp.url jest poprawny."
echo "Sprawdź, czy właściwości bazy danych są poprawne."
echo "Po zakończeniu zapisz wprowadzone zmiany i zamknij edytor, aby kontynuować wykonywanie skryptu."
echo ""
echo "W temacie Aktualizowanie produktu Rational solution for CLM w dokumentacji produktu"
echo "można znaleźć informacje o poprawnym konfigurowaniu każdej właściwości."
;;

PAUSE )
echo ""
echo "Naciśnij klawisz C, aby kontynuować, lub Enter, aby anulować wykonywanie skryptu:"
;;

INVALID_PAUSE_ACTION )
echo ""
echo "Wprowadzono niepoprawny znak $2, dozwolony jest tylko znak C lub klawisz Enter."
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "Kopiowanie indeksów tekstowych z $2 do $3."
echo "Operacja może potrwać kilka minut..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "Kopiowanie indeksów zapytań i wyszukiwania z $2 do $3." 
echo "Operacja może potrwać kilka minut..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "Nie powiodło się kopiowanie indeksów tekstowych z $2 do $3."
echo "Sprawdź właściwość com.ibm.team.fulltext.indexLocation"
echo "zdefiniowaną w pliku teamserver.properties."
echo "Ręcznie skopiuj indeksy tekstowe do tego katalogu"
echo "lub uruchom komendę repotools -rebuildTextIndices, aby je odbudować."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "Plik $NEW_APP_PARENT_DIR/RM_APP.ID nie istnieje"
echo "Utwórz ten plik i zapisz w nim jeden wiersz zawierający identyfikator aplikacji RM,"
echo "a następnie spróbuj ponownie."
echo ""
;;

# **********************************************************
# * Komunikaty sprawdzania publicznych identyfikatorów URI *
# **********************************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo " BŁĄD!"
echo ""
echo "Nie zdefiniowano publicznego identyfikatora URI w pliku"
echo "$3."
echo "Nie można uruchomić aktualizowania."
echo ""
echo "W tym pliku musi występować jeden publiczny identyfikator URI zdefiniowany w następujący sposób:"
echo "https\://nazwa_hosta.przykładowa_domena.com\:port/$2"
echo ""
echo ""
echo ""
echo "Właściwość publicznego identyfikatora URI com.ibm.team.repository.server.webapp.url musi istnieć w pliku teamserver.properties."
echo "Dodaj tę właściwość do pliku teamserver.properties w starej instalacji i ustaw wartość katalogu głównego identyfikatora URI, który jest używany przez wszystkie klienty do uzyskiwania dostępu do serwera."
echo "Katalog główny publicznego identyfikatora URI jest bardzo istotny dla poprawnego działania nowej instalacji. Aktualizacja nie powiedzie się bez tej właściwości.  "
echo "Więcej informacji zawiera temat w dokumentacji produktu Planowanie identyfikatorów URI."
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo " BŁĄD!"
echo ""
echo "Wszystkie publiczne identyfikatory URI zdefiniowane w pliku"
echo "$3"
echo "znajdują się w komentarzach. Nie można uruchomić aktualizowania."
echo ""
echo "W tym pliku musi występować jeden publiczny identyfikator URI poza komentarzem zdefiniowany w następujący sposób:"
echo "https\://nazwa_hosta.przykładowa_domena.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Właściwość publicznego identyfikatora URI com.ibm.team.repository.server.webapp.url musi istnieć w pliku teamserver.properties."
echo "Dodaj tę właściwość do pliku teamserver.properties w starej instalacji i ustaw wartość katalogu głównego identyfikatora URI, który jest używany przez wszystkie klienty do uzyskiwania dostępu do serwera."
echo "Katalog główny publicznego identyfikatora URI jest bardzo istotny dla poprawnego działania nowej instalacji. Aktualizacja nie powiedzie się bez tej właściwości."
echo "Więcej informacji zawiera temat w dokumentacji produktu Planowanie identyfikatorów URI."
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "Kontekstowy katalog główny ustawiony dla serwera JTS to $2."
echo "Kontekstowy katalog główny ustawiony dla aplikacji to $3."
echo "Nie można ustawić tego samego kontekstowego katalogu głównego dla serwera JTS i aplikacji."
echo ""
;;

esac

}
