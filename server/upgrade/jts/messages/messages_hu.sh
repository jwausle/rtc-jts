#!/bin/sh
# *******************************************************************************
#  Licenc hatálya alá tartozó anyagok - Az IBM tulajdona
#  (c) Copyright IBM Corporation 2011, 2015. All Rights Reserved.
#
#  Megjegyzés az Egyesült Államok kormányzati felhasználóinak korlátozott jogaira vonatkozóan:
#  A használatot, sokszorosítást vagy közzétételt az IBM vállalattal kötött GSA ADP Schedule
#  Contract szerződés szabályozza.
#  *******************************************************************************

# ################################################################################
#
# Fájl a frissítési automatizált parancsfájlok által megjelenített üzeneteknek.
#
# ################################################################################


# *********************
# * Üzenetek funkció *
# *********************
messages() {

case $1 in 

# *********************************
# * Kezdeti ellenőrzési üzenetek *
# *********************************

INVALID_LAUNCH )
echo ""
echo "Ne hajtsa végre közvetlenül az app_upgrade parancsfájlt.  A JTS kiszolgáló vagy alkalmazás frissítéséhez futtassa a következő parancsok egyikét:"
echo "     ccm_upgrade"
echo "     gc_upgrade"
echo "     jts_upgrade"
echo "     qm_upgrade"
echo "     rm_upgrade"
echo "A fenti parancsok teljes leírásának megtekintéséhez használja a -help parancsot."
;;

INVALID_START_DIR )
echo ""
echo "A(z) $2 parancsfájl csak a(z) $3 könyvtárból futtatható, kivéve ha a -help paramétert használja"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "A(z) '$2' fájl tartalmazza a frissítési parancsfájl paraméterértékeit."
echo "Ha módosítania kell bármely alapértelmezett paraméterértéket, szerkesztheti ezeket a fájlokat vagy a paraméterértékeket parancssori argumentumokként adhatja meg a frissítési parancsfájlok számára."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "A következő fájlok egy alkalmazás vagy egy JTS frissítésének alapértelmezett paraméterértékeit tartalmazzák.  Ha módosítania kell bármely alapértelmezett paraméterértéket, szerkesztheti ezeket a fájlokat vagy a paraméterértékeket parancssori argumentumokként adhatja meg a frissítési parancsfájlok számára."
echo "- CCM upgrade: $2/params/ccm_params$3.sh"
echo "- GC upgrade:  $2/params/gc_params$3.sh"
echo "- QM upgrade:  $2/params/qm_params$3.sh"
echo "- RM upgrade:  $2/params/rm_params$3.sh"
echo "- JTS upgrade: $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Paraméterek ellenőrzési üzenetei *
# ************************************

# Belső ellenőrzés
# ======================

MISSING_APP_TYPE )
echo ""
echo "Nem lett megadva JTS vagy alkalmazástípus.  A JTS kiszolgáló vagy alkalmazás frissítéséhez futtassa a következő parancsok egyikét:"
echo "     ccm_upgrade"
echo "     gc_upgrade"
echo "     jts_upgrade"
echo "     qm_upgrade"
echo "     rm_upgrade"
echo "A fenti parancsok teljes leírásának megtekintéséhez használja a -help parancsot."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "A(z) $2 érvénytelen JTS vagy alkalmazástípus.  A JTS kiszolgáló vagy alkalmazás frissítéséhez futtassa a következő parancsok egyikét:"
echo "     ccm_upgrade"
echo "     gc_upgrade"
echo "     jts_upgrade"
echo "     qm_upgrade"
echo "     rm_upgrade"
echo "A fenti parancsok teljes leírásának megtekintéséhez használja a -help parancsot."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "A(z) $2 paraméter értéke hiányzik."
echo "Használja a -help parancsot a paraméterek teljes leírásának megtekintéséhez."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "A(z) $2 paraméterhez megadott $3 könyvtár nem létezik, vagy nem érvényes."
echo "Használja a -help parancsot a paraméterek teljes leírásának megtekintéséhez."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "A(z) $2 paraméterhez megadott $3 könyvtárnak abszolút elérési útnak kell lennie."
echo "Használja a -help parancsot a paraméterek teljes leírásának megtekintéséhez."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "A(z) $2 paraméterhez megadott $3 fájl nem létezik, vagy nem érvényes."
echo "Használja a -help parancsot a paraméterek teljes leírásának megtekintéséhez."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3 érvénytelen érték a(z) $2 paraméterhez."
echo "Használja a -help parancsot a paraméterek teljes leírásának megtekintéséhez."
echo ""
;;

INVALID_PARAM )
echo ""
echo "A(z) $2 egy ismeretlen paraméter."
echo "Használja a -help parancsot a paraméterek teljes leírásának megtekintéséhez."
echo ""
;;


# Külső ellenőrzés
# ======================

MISSING_HOME_PARAM )
echo ""
echo "Hiányzó alapkönyvtár paraméter: $2."
echo "Használja a -help parancsot a paraméterek teljes leírásának megtekintéséhez."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "A(z) $2 könyvtár nem létezik vagy nem érvényes."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "A(z) '$2' alkalmazás repotools parancs nem található'."
echo ""
echo "Ellenőrizze, hogy a(z) '$3' -oldApplicationHome paraméter a régi kiszolgáló konfigurációs könyvtárára mutat-e, például: 'JazzInstallRoot/server/conf'."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "A(z) '$2' alkalmazás repotools parancs nem található'."
echo ""
echo "Ellenőrizze, hogy a(z) '$3' -oldApplicationHome paraméter a régi kiszolgáló konfigurációs könyvtárára mutat-e, például 'JazzInstallRoot/server/conf', és hogy a(z) '$4' jtsContextRoot paraméter helyes-e."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "A(z) '$2' konfigurációs fájl nem található."
echo ""
echo "Ellenőrizze, hogy a(z) '$3' -oldApplicationHome paraméter a régi kiszolgáló konfigurációs könyvtárára mutat-e, például: 'JazzInstallRoot/server/conf'."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "A(z) '$2' konfigurációs fájl nem található."
echo ""
echo "Ellenőrizze, hogy a(z) '$3' -oldApplicationHome paraméter a régi kiszolgáló konfigurációs könyvtárára mutat-e, például 'JazzInstallRoot/server/conf', és hogy a(z) '$4' jtsContextRoot paraméter helyes-e."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "A(z) '$2' alkalmazás repotools parancs nem található'."
echo ""
echo "Ellenőrizze, hogy a(z) '$3' -newApplicationHome paraméter az új alkalmazáskiszolgáló konfigurációs könyvtárára mutat-e, például 'JazzInstallRoot/server/conf', és hogy a(z) '$4' applicationContextRoot paraméter helyes-e."
echo "Ha egy korábbi kiadásról frissít, győződjön meg róla, hogy a megfelelő kontextusgyökereket választotta.  Ha például az Installation Manager eszközt használja, a "Kontextusgyökér beállításai" panelen található $5 kontextusgyökér lehetőséget kell választania.  Ha véletlenül más lehetőséget választott, újra kell telepítenie a terméket a(z) $5 kontextusgyökér beállítással."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "A(z) '$2' konfigurációs fájl nem található."
echo ""
echo "Ellenőrizze, hogy a(z) '$3' -newApplicationHome paraméter az új JTS kiszolgáló konfigurációs könyvtárára mutat-e, például 'JazzInstallRoot/server/conf', és hogy a(z) '$4' applicationContextRoot paraméter helyes-e."
echo "Ha egy korábbi kiadásról frissít, győződjön meg róla, hogy a megfelelő kontextusgyökereket választotta.  Ha például az Installation Manager eszközt használja, a "Kontextusgyökér beállításai" panelen található $5 kontextusgyökér lehetőséget kell választania.  Ha véletlenül más lehetőséget választott, újra kell telepítenie a terméket a(z) $5 kontextusgyökér beállítással."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "A(z) '$2' JTS repotools parancs nem található."
echo ""
echo "Ellenőrizze, hogy a(z) '$3' -oldJTSHome paraméter a régi JTS konfigurációs könyvtárára mutat-e, például 'JazzInstallRoot/server/conf', és hogy a(z) '$4' jtsContextRoot paraméter helyes-e."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "A(z) '$2' konfigurációs fájl nem található."
echo ""
echo "Ellenőrizze, hogy a(z) '$3' -oldJTSHome paraméter a régi JTS konfigurációs könyvtárára mutat-e, például 'JazzInstallRoot/server/conf', és hogy a(z) '$4' jtsContextRoot paraméter helyes-e."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "A(z) '$2' JTS repotools parancs nem található."
echo ""
echo "Ellenőrizze, hogy a(z) '$3' -newJTSHome paraméter az új JTS kiszolgáló konfigurációs könyvtárára mutat-e, például 'JazzInstallRoot/server/conf', és hogy a(z) '$4' jtsContextRoot paraméter helyes-e."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "A(z) '$2' konfigurációs fájl nem található."
echo ""
echo "Ellenőrizze, hogy a(z) '$3' -newJTSHome paraméter az új JTS kiszolgáló konfigurációs könyvtárára mutat-e, például 'JazzInstallRoot/server/conf', és hogy a(z) '$4' jtsContextRoot paraméter helyes-e."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "A(z) $2 frissítéséhez egy 2.x adatokat tartalmazó tar fájl szükséges."
echo "Használja a -help parancsot a paraméterek teljes leírásának megtekintéséhez."
echo ""
;;


# **********************
# * Végrehajtási üzenetek *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    JTS frissítés   ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    CCM frissítés    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    GC frissítés    ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    QM frissítés    ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    RM frissítés    ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "Az RM régi alkalmazásváltozat ellenőrzése..."
;;

RM_DISPLAY_OLD_VERSION )
echo "Az RM régi alkalmazásváltozat '$2'"
;;

# *********************
# * Első lépés kapcsoló *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "A legutóbbi végrehajtás meghiúsult a kezdeti lépésnél..."
;;

LAST_STEP_FAILED )
echo ""
echo "A legutóbbi végrehajtás meghiúsult a(z) $2. lépésnél..."
echo "Kívánja újraindítani a frissítést ettől vagy egy korábbi lépéstől?"
;;

ALREADY_RUN )
echo ""
echo "A frissítés már végre lett hajtva, és sikeresen befejeződött..."
echo "Kíván újraindítani egy új frissítést egy adott lépéstől?"
;;

LAST_STEP_PASSED )
echo ""
echo "A legutóbbi végrehajtás sikeresen leállt a(z) $2. lépésnél..."
echo "Kívánja újraindítani a frissítést a jelenlegi $3. vagy egy korábbi lépéstől?"
;;

ENTER_NEXT_STEP )
echo ""
echo "Írja be a lépés számát ([$2-$3]), amelytől újra kívánja indítani a frissítést, vagy [Enter] érték a megszakításhoz:"
;;

INTEGER_STEP_NUMBER )
echo ""
echo "A(z) '$2' nem szám. Adjon meg egy érvényes lépésszámot."
;;

INVALID_STEP_NUMBER )
echo ""
echo "A(z) '$2' érvénytelen lépésszám. Adjon meg egy érvényes lépésszámot."
;;

MAX_STEP_NUMBER )
echo ""
echo "Az utolsó lépés a(z) $2. lépés, ezért nem indíthatja újra a frissítést a(z) $3. lépéstől."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "A(z) $2. lépés még nem futott, ezért nem indíthatja újra a frissítést a(z) $3. lépéstől."
;;


# **********************
# * Üzenetek a lépésekhez *
# **********************

STEP_0_IBMi )
echo "0. lépés: Táblák elvetése"
echo "-------------------"
;;

STEP_0 )
echo "0. lépés: Konfigurációs fájlok frissítése"
echo "---------------------------"
;;

STEP_1_ADD )
echo "1. lépés: Táblák hozzáadása"
echo "------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "$2. lépés: Szövegindexek újraépítése"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "$2. lépés: Lekérdezés újralétrehozása és indexek keresése"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "$2. lépés: LPA összefésülése a JTS kiszolgálóval"
echo "------------------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "$2. lépés: Az LPA tárterületek elülső oldali URL címének javítása"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "$2. lépés: LPA barát eltávolítása az RM alkalmazásból"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "2. lépés: Adattárház séma frissítése"
echo "-------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "$2. lépés: RM alkalmazás véglegesítése"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "$2. lépés: JTS alkalmazás véglegesítése"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "$2. lépés: RM alkalmazás újraindexelése"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "A(z) $2 frissítés a(z) $3 lépésnél meghiúsult.  Javítsa ki a problémát, és futtassa újra a parancsfájlt a(z) $3 lépéstől."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "A(z) $2 frissítés sikeres.  Most frissítheti a környezetben található alkalmazásokat. "
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "Az RM frissítés kapcsolat nélküli része sikeres. Most elindíthatja a telepítésben lévő kiszolgálókat."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "Az RM frissítés offline része sikerült. Az átállítás befejezéséhez még egy"
echo "lépés szükséges, de ez megköveteli, hogy az összes kiszolgáló, amely az"
echo "RM alkalmazáshoz csatlakozik (például RTC, RQM, JRS, GC) online legyen. Amikor"
echo "kényelmes, állítsa online állapotúra az összes kiszolgálót"
echo "(az RM kiszolgálót is). Ajánlott bejelentkezni minden kiszolgálóra, és"
echo "meggyőződni a megfelelő működésükről. Ezután futtassa a következő parancsot:"
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "A(z) $2 frissítés sikeres.  Most elindíthatja a telepítésben lévő kiszolgálókat."
echo ""
;;

# *******************************
# * Üzenetek lépések futtatása közben *
# *******************************

STEP_DIR_CMD )
echo ""
echo "Könyvtár: $2"
echo "Parancs:"
;;

ENTER_STEP_ACTION )
echo "Írjon be [E] értéket ennek a lépésnek a végrehajtásához, [S] értéket a kihagyásához, vagy nyomja meg az [Enter] billentyűt a parancsfájl végrehajtásának visszavonásához:"
;;

INVALID_STEP_ACTION )
echo ""
echo "A(z) '$2' érvénytelen bejegyzés, csak 'E', 'S' vagy 'Enter' engedélyezett"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "Megnyílik a vi szerkesztő, amely segítségével ellenőrizheti a(z) $2 teamserver.properties fájlt."
echo "Ellenőrizze, hogy a com.ibm.team.repository.server.webapp.url tulajdonsággal jelölt Nyilvános URI gyökér helyes-e."
echo "Ellenőrizze, hogy az adatbázis-tulajdonságok helyesek-e."
echo "Ha befejezte, mentse az esetleges módosításokat, és zárja be a szerkesztőt a parancsfájl végrehajtásának folytatásához."
echo ""
echo "Az egyes tulajdonságok megfelelő konfigurálásával kapcsolatos információkért"
echo "tekintse meg a termékdokumentáció 'Rational solution for CLM frissítése' című témakörét."
;;

PAUSE )
echo ""
echo "Nyomja meg a [C] billentyűt a végrehajtás folytatásához, vagy nyomja meg az [Enter] billentyűt a parancsfájl végrehajtásának visszavonásához:"  
;;

INVALID_PAUSE_ACTION )
echo ""
echo "A(z) '$2' érvénytelen bejegyzés, csak 'C' vagy 'Enter' engedélyezett"
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "Szövegindexek másolása: '$2' - '$3'."
echo "Ez több percig is tarthat..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "Lekérdezés másolása és indexek keresése: '$2' - '$3'." 
echo "Ez több percig is tarthat..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "A szövegindexek másolása meghiúsult. Forrás: '$2', cél: '$3'."
echo "Győződjön meg róla, hogy a com.ibm.team.fulltext.indexLocation"
echo "tulajdonság meg van határozva a teamserver.properties fájlban."
echo "Kézzel másolja át a szövegindexeket ebbe a könyvtárba,"
echo "vagy futtassa a -rebuildTextIndices parancsot az újraépítésükhöz."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "A(z) $NEW_APP_PARENT_DIR/RM_APP.ID fájl nem létezik"
echo "Hozza létre ezt a fájlt egyetlen sorral, amely tartalmazza az RM alkalmazás"
echo "azonosítóját, majd próbálkozzon újra."
echo ""
;;

# *****************************************
# * Üzenetek a nyilvános URI-k ellenőrzéséhez *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! HIBA !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Nincs nyilvános URI meghatározva itt:"
echo "$3,"
echo "így a frissítés nem indítható el."
echo ""
echo "Legalább egy nyilvános URI elemnek jelen kell lennie ebben a fájlban a következőképpen megadva:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "A com.ibm.team.repository.server.webapp.url Nyilvános URI tulajdonságnak jelen kell lennie a teamserver.properties fájlban."
echo "Adja hozzá a tulajdonságot a régi telepítés teamserver.properties fájljához, és állítsa be az értékét arra az URI gyökérre, amelyet minden ügyfél használhat a kiszolgáló eléréséhez."
echo "A Nyilvános URI gyökér alapvető fontosságú az új telepítés megfelelő működéséhez. A frissítés sikertelen lesz ezen tulajdonság nélkül.  "
echo "További információkért tekintse meg a termékdokumentáció 'URI azonosítók tervezése' című témakörét."
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! HIBA !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Minden nyilvános, a(z)"
echo "$3"
echo "helyen meghatározott URI megjegyzéssel van ellátva, így a frissítés nem indítható el."
echo ""
echo "Jelen kell lennie ebben a fájlban egy nyilvános URI elemnek a következőképpen megadva:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "A com.ibm.team.repository.server.webapp.url Nyilvános URI tulajdonságnak jelen kell lennie a teamserver.properties fájlban."
echo "Adja hozzá a tulajdonságot a régi telepítés teamserver.properties fájljához, és állítsa be az értékét arra az URI gyökérre, amelyet minden ügyfél használhat a kiszolgáló eléréséhez."
echo "A Nyilvános URI gyökér alapvető fontosságú az új telepítés megfelelő működéséhez. A frissítés sikertelen lesz ezen tulajdonság nélkül."
echo "További információkért tekintse meg a termékdokumentáció 'URI azonosítók tervezése' című témakörét."
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "A JTS kontextusgyökere a következőre van beállítva: '$2'."
echo "Az alkalmazás kontextusgyökere a következőre van beállítva: '$3'."
echo "A jts és az alkalmazás kontextusgyökere nem lehet azonos. "
echo ""
;;

esac

}
