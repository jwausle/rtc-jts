#!/bin/sh
# *******************************************************************************
#  Licencované materiály - vlastnictví IBM
#  (c) Copyright IBM Corporation 2011, 2015. Všechna práva vyhrazena.
#
#  Omezená práva uživatelů z řad amerických vládních institucí:
#  Použití, kopírování a zveřejnění je omezeno v souladu se smlouvou GSA ADP
#  Schedule Contract se společností IBM Corp.
#  *******************************************************************************

# ################################################################################
#
# Soubor pro zprávy, jež zobrazují skripty automatického provedení upgradu.
#
# ################################################################################


# *********************
# * Funkce zpráv *
# *********************
messages() {

case $1 in 

# *********************************
# * Zprávy počáteční verifikace   *
# *********************************

INVALID_LAUNCH )
echo ""
echo "Neprovádějte skript app_upgrade přímo. Chcete-li provést upgrade JTS nebo aplikace, spusťte jeden z těchto příkazů:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Úplný popis výše uvedených příkazů získáte pomocí volby -help."
;;

INVALID_START_DIR )
echo ""
echo "S výjimkou použití parametru -help musí být skript $2 spouštěn z $3"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "Soubor '$2' obsahuje hodnoty parametrů pro skript pro přechod na vyšší verzi."
echo "Potřebujete-li upravit libovolnou z výchozích hodnot parametrů, můžete provést úpravu těchto souborů nebo můžete hodnoty parametrů zadat jako argumenty příkazového řádku pro skripty pro přechod na vyšší verzi."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "Následující sada souborů obsahuje výchozí hodnoty parametrů pro přechod na vyšší verzi aplikace nebo serveru JTS. Potřebujete-li upravit libovolnou z výchozích hodnot parametrů, můžete provést úpravu těchto souborů nebo můžete hodnoty parametrů zadat jako argumenty příkazového řádku pro skripty pro přechod na vyšší verzi."
echo "- Upgrade aplikace CCM: $2/params/ccm_params$3.sh"
echo "- Upgrade aplikace GC:  $2/params/gc_params$3.sh"
echo "- Upgrade aplikace QM:  $2/params/qm_params$3.sh"
echo "- Upgrade aplikace RM:  $2/params/rm_params$3.sh"
echo "- Upgrade aplikace JTS: $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Zprávy verifikace platnosti parametrů *
# ************************************

# Vnitřní verifikace
# ======================

MISSING_APP_TYPE )
echo ""
echo "Nebyl určen typ aplikace nebo JTS. Chcete-li provést upgrade JTS nebo aplikace, spusťte jeden z těchto příkazů:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Úplný popis výše uvedených příkazů získáte pomocí volby -help."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2 není platný typ aplikace nebo JTS. Chcete-li provést upgrade JTS nebo aplikace, spusťte jeden z těchto příkazů:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Úplný popis výše uvedených příkazů získáte pomocí volby -help."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "Chybí hodnota parametru $2."
echo "Úplný popis parametrů získáte pomocí volby -help."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "Adresář $3, který byl zadán v parametru $2, neexistuje nebo je neplatný."
echo "Úplný popis parametrů získáte pomocí volby -help."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "Adresář $3 zadaný pro parametr $2 musí být určen jako absolutní cesta."
echo "Úplný popis parametrů získáte pomocí volby -help."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "Soubor $3, který byl zadán v parametru $2, neexistuje nebo je neplatný."
echo "Úplný popis parametrů získáte pomocí volby -help."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3 je neplatná hodnota parametru $2."
echo "Úplný popis parametrů získáte pomocí volby -help."
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2 je neplatný parametr."
echo "Úplný popis parametrů získáte pomocí volby -help."
echo ""
;;


# Vnější verifikace
# ======================

MISSING_HOME_PARAM )
echo ""
echo "Chybí parametr domovského adresáře $2."
echo "Úplný popis parametrů získáte pomocí volby -help."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "Adresář $2 neexistuje nebo je neplatný."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "Nebyl nalezen příkaz aplikace repotools '$2'."
echo ""
echo "Ověřte, že parametr -oldApplicationHome '$3' ukazuje na původní konfigurační adresář serveru, například 'JazzInstallRoot/server/conf'."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "Nelze nalézt příkaz repotools aplikace '$2'."
echo ""
echo "Ověřte, zda parametr -oldApplicationHome '$3' ukazuje na starý konfigurační adresář serveru, například 'JazzInstallRoot/server/conf', a dále ověřte správnost parametru jtsContextRoot '$4'."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "Nebyl nalezen konfigurační soubor '$2'."
echo ""
echo "Ověřte, že parametr -oldApplicationHome '$3' ukazuje na původní konfigurační adresář serveru, například 'JazzInstallRoot/server/conf'."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "Nebyl nalezen konfigurační soubor '$2'."
echo ""
echo "Ověřte, zda parametr -oldApplicationHome '$3' ukazuje na starý konfigurační adresář serveru, například 'JazzInstallRoot/server/conf', a dále ověřte správnost parametru jtsContextRoot '$4'."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "Nelze nalézt příkaz repotools aplikace '$2'."
echo ""
echo "Ověřte, zda parametr -newApplicationHome '$3' ukazuje na nový konfigurační adresář aplikačního serveru, například 'JazzInstallRoot/server/conf', a dále ověřte správnost parametru applicationContextRoot '$4'."
echo "Provádíte-li upgrade z předchozí verze, zajistěte výběr správných kontextových kořenových adresářů. Například pokud používáte produkt Installation Manager, musíte na panelu "Volby kontextového kořenového adresáře" vybrat volbu kontextový kořenový adresář $5.  Pokud jste náhodou vybrali jinou volbu, musíte produkt přeinstalovat s volbou kontextový kořenový adresář $5."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "Nebyl nalezen konfigurační soubor '$2'."
echo ""
echo "Ověřte, zda parametr -newApplicationHome '$3' ukazuje na nový konfigurační adresář serveru JTS, například 'JazzInstallRoot/server/conf', a dále ověřte správnost parametru applicationContextRoot '$4'."
echo "Provádíte-li upgrade z předchozí verze, zajistěte výběr správných kontextových kořenových adresářů. Například pokud používáte produkt Installation Manager, musíte na panelu "Volby kontextového kořenového adresáře" vybrat volbu kontextový kořenový adresář $5.  Pokud jste náhodou vybrali jinou volbu, musíte produkt přeinstalovat s volbou kontextový kořenový adresář $5."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "Nelze nalézt příkaz repotools JTS '$2'."
echo ""
echo "Ověřte, zda parametr -oldJTSHome '$3' ukazuje na starý konfigurační adresář serveru JTS, například 'JazzInstallRoot/server/conf', a dále ověřte správnost parametru jtsContextRoot '$4'."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "Nebyl nalezen konfigurační soubor '$2'."
echo ""
echo "Ověřte, zda parametr -oldJTSHome '$3' ukazuje na starý konfigurační adresář serveru JTS, například 'JazzInstallRoot/server/conf', a dále ověřte správnost parametru jtsContextRoot '$4'."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "Nelze nalézt parametr repotools JTS '$2'."
echo ""
echo "Ověřte, zda parametr -newJTSHome '$3' ukazuje na nový konfigurační adresář serveru JTS, například 'JazzInstallRoot/server/conf', a dále ověřte správnost parametru jtsContextRoot '$4'."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "Nebyl nalezen konfigurační soubor '$2'."
echo ""
echo "Ověřte, zda parametr -newJTSHome '$3' ukazuje na nový konfigurační adresář serveru JTS, například 'JazzInstallRoot/server/conf', a dále ověřte správnost parametru jtsContextRoot '$4'."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "Pro upgrade na verzi $2 je zapotřebí soubor TAR obsahující data verze 2.x."
echo "Úplný popis parametrů získáte pomocí volby -help."
echo ""
;;


# **********************
# * Zprávy provedení *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    Upgrade aplikace JTS    ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    Upgrade aplikace CCM    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    Upgrade aplikace GC    ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    Upgrade aplikace QM    ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    Upgrade aplikace RM    ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "Probíhá kontrola staré verze aplikace RM..."
;;

RM_DISPLAY_OLD_VERSION )
echo "Stará verze aplikace RM je '$2'"
;;

# *********************
# * Přepínač prvního kroku *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "Poslední provedení se nezdařilo v prvním kroku..."
;;

LAST_STEP_FAILED )
echo ""
echo "Poslední provedení se nezdařilo v kroku $2..."
echo "Chcete spustit upgrade od tohoto nebo od předchozího kroku?"
;;

ALREADY_RUN )
echo ""
echo "Upgrade již byl proveden a úspěšně dokončen..."
echo "Chcete znovu spustit nový upgrade ve specifickém kroku?"
;;

LAST_STEP_PASSED )
echo ""
echo "Poslední provedení bylo úspěšně zastaveno v kroku $2..."
echo "Chcete provést opětovné spuštění upgradu v aktuálním kroku $3 nebo v předchozím kroku?"
;;

ENTER_NEXT_STEP )
echo ""
echo "Zadejte číslo kroku [$2-$3], v němž chcete spustit upgrade nebo operaci zrušte stisknutím klávesy [Enter]:"
;;

INTEGER_STEP_NUMBER )
echo ""
echo "'$2' není číslo. Zadejte platné číslo kroku."
;;

INVALID_STEP_NUMBER )
echo ""
echo "'$2' je neplatné číslo kroku. Zadejte platné číslo kroku."
;;

MAX_STEP_NUMBER )
echo ""
echo "Posledním krokem je krok $2, proto není možné znovu spustit upgrade od kroku $3."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "Ještě nebyl proveden krok $2, proto nelze znovu spustit upgrade od kroku $3."
;;


# **********************
# * Zprávy pro kroky *
# **********************

STEP_0_IBMi )
echo "Krok 0: Zrušit tabulky"
echo "-------------------"
;;

STEP_0 )
echo "Krok 0: Aktualizovat konfigurační soubory"
echo "---------------------------"
;;

STEP_1_ADD )
echo "Krok 1: Přidat tabulky"
echo "------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "Krok $2: Znovu sestavit textové indexy"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "Krok $2: Znovu vytvořit indexy dotazů a hledání"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "Krok $2: Sloučit LPA do JTS"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "Krok $2: Opravit předřazenou adresu URL oblastí úložiště LPA"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "Krok $2: Odebrat spřátelenou položku LPA z RM"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "Krok 2: Provést upgrade schématu datového skladu"
echo "-------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "Krok $2: Dokončit aplikaci RM"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "Krok $2: Dokončit aplikaci JTS"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "Krok $2: Reindexovat aplikaci RM"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "Upgrade $2 se nezdařil v kroku $3. Opravte problém a spusťte skript znovu od kroku $3."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "Upgrade $2 byl úspěšně proveden. Nyní můžete ve vašem prostředí provést upgrade aplikací."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "Část upgradu RM v režimu offline byla provedena úspěšně. Nyní můžete spustit servery ve vaší implementaci."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "Část upgradu aplikace RM v režimu offline byla provedena úspěšně. K dokončení migrace"
echo "zbývá provést jeden nezbytný krok, který však vyžaduje, aby všechny servery odkazující"
echo "na aplikaci RM (jako např. RTC, RQM, JRS, GC) byly online. Až to bude vhodné, vyvolejte"
echo "všechny servery (včetně RM). Doporučuje se, abyste se ke každému serveru přihlásili a"
echo "zkontrolovali, zda správně funguje. Poté spusťte následující příkaz:"
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "Upgrade $2 byl úspěšně proveden. Nyní můžete spustit servery ve vaší implementaci."
echo ""
;;

# *******************************
# * Zprávy při provádění kroku *
# *******************************

STEP_DIR_CMD )
echo ""
echo "Adresář: $2"
echo "Příkaz:"
;;

ENTER_STEP_ACTION )
echo "Stisknutím klávesy [E] provedete tento krok, stisknutím klávesy [S] jej přeskočíte a stisknutím klávesy [Enter] zrušíte provádění skriptu:"
;;

INVALID_STEP_ACTION )
echo ""
echo "'$2' je neplatnou položkou, povoleny jsou pouze klávesy 'E', 'S' nebo 'Enter'"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "Otevře se editor vi, který vám umožní ověřit soubor vlastností teamserver.properties $2."
echo "Ověřte správnost kořenu veřejného identifikátoru URI určeného vlastností com.ibm.team.repository.server.webapp.url."
echo "Ověřte správnost vlastností databáze."
echo "Po dokončení uložte případné změny a zavřete editor, aby mohlo pokračovat provádění skriptu."
echo ""
echo "Přečtěte si téma 'Upgrade produktu Rational Solution for CLM' v dokumentaci produktu,"
echo "kde naleznete informace, které budete potřebovat ke správné konfiguraci jednotlivých vlastností."
;;

PAUSE )
echo ""
echo "Zadejte [C], pokud chcete pokračovat v provedení, nebo stiskněte [Enter], pokud chcete provedení skriptu zrušit:"
;;

INVALID_PAUSE_ACTION )
echo ""
echo "'$2' je neplatný vstup, povoleno je pouze 'C' nebo 'Enter'."
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "Probíhá kopírování textových indexů z '$2' do '$3'."
echo "To může několik minut trvat..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "Probíhá kopírování indexů dotazů a vyhledávacích indexů z '$2' do '$3'." 
echo "To může několik minut trvat..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "Nezdařilo se zkopírovat textové indexy z '$2' do '$3'."
echo "Ověřte vlastnost com.ibm.team.fulltext.indexLocation"
echo "definovanou v souboru teamserver.properties."
echo "Ručně zkopírujte textové indexy do tohoto adresáře",
echo "nebo spusťte příkaz repotools -rebuildTextIndices a znovu je sestavte."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "Soubor $NEW_APP_PARENT_DIR/RM_APP.ID neexistuje."
echo "Vytvořte tento soubor pomocí jediného řádku obsahujícího ID aplikace RM"
echo "a operaci opakujte."
echo ""
;;

# *****************************************
# * Zprávy pro verifikaci veřejných identifikátorů URI *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CHYBA !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Není definován veřejný identifikátor URI v souboru"
echo "$3,"
echo "proto není možné zahájit upgrade."
echo ""
echo "V tomto souboru musí být definován jeden veřejný identifikátor URI, a to tímto způsobem:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Vlastnost Veřejný identifikátor URI com.ibm.team.repository.server.webapp.url musí být přítomna v souboru teamserver.properties."
echo "Přidejte vlastnost do souboru teamserver.properties staré instalace a jako hodnotu nastavte kořen identifikátoru URI, který všichni klienti používají k dosažení serveru."
echo "Kořen veřejného identifikátoru URI je nezbytný pro správné fungování nové instalace. Upgrade se bez této vlastnosti nezdaří. "
echo "Další informace naleznete v tématu 'Plánování identifikátorů URI' v dokumentaci produktu."
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CHYBA !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Všechny veřejné identifikátory URI definované v souboru"
echo "$3"
echo "jsou označené jako komentáře, proto nelze zahájit upgrade."
echo ""
echo "V tomto souboru musí být jeden veřejný identifikátor URI bez znaku komentáře. Definice musí vypadat takto:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Vlastnost Veřejný identifikátor URI com.ibm.team.repository.server.webapp.url musí být přítomna v souboru teamserver.properties."
echo "Přidejte vlastnost do souboru teamserver.properties staré instalace a jako hodnotu nastavte kořen identifikátoru URI, který všichni klienti používají k dosažení serveru."
echo "Kořen veřejného identifikátoru URI je nezbytný pro správné fungování nové instalace. Upgrade se bez této vlastnosti nezdaří."
echo "Další informace naleznete v tématu 'Plánování identifikátorů URI' v dokumentaci produktu."
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "Kontextový kořenový adresář pro JTS je nastaven na '$2'."
echo "Kontextový kořenový adresář pro aplikaci je nastaven na '$3'."
echo "Kontextový kořenový adresář pro jts a aplikaci nemůže být stejný."
echo ""
;;

esac

}
