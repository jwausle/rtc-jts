#!/bin/sh
# *******************************************************************************
#  Materiale su licenza - Proprietà di IBM
#  (c) Copyright IBM Corporation 2011, 2015. Tutti i diritti riservati.
#
#  Nota relativa a limitazioni dei diritti per gli utenti del Governo degli Stati Uniti:
#  L'uso, la duplicazione o la divulgazione sono limitati dal GSA ADP Schedule
#  Contract con IBM Corp.
#  *******************************************************************************

# ################################################################################
#
# File per i messaggi visualizzati dagli script di aggiornamento automatizzati.
#
# ################################################################################


# *********************
# * Funzione dei messaggi *
# *********************
messages() {

case $1 in 

# *********************************
# * Messaggi di verifica iniziale *
# *********************************

INVALID_LAUNCH )
echo ""
echo "Non eseguire direttamente lo script app_upgrade.  Per aggiornare JTS o l'applicazione, emettere uno dei seguenti comandi:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Utilizzare -help per una descrizione completa dei comandi precedenti."
;;

INVALID_START_DIR )
echo ""
echo "Except while using -help parameter, $2 script must be run from $3"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "Il file '$2' contiene i valori dei parametri per lo script di aggiornamento."
echo "Se è necessario modificare i valori dei parametri predefiniti, è possibile modificare i file oppure specificare i valori come argomenti della riga comandi sugli script di aggiornamento."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "Le seguenti serie di file contengono valori dei parametri per un'applicazione o aggiornamento JTS.  Se è necessario modificare i valori dei parametri predefiniti, è possibile modificare i file oppure specificare i valori come argomenti della riga comandi sugli script di aggiornamento."
echo "- Aggiornamento CCM: $2/params/ccm_params$3.sh"
echo "- Aggiornamento CCM: $2/params/ccm_params$3.sh"
echo "- Aggiornamento GC:  $2/params/gc_params$3.sh"
echo "- Aggiornamento QM:  $2/params/qm_params$3.sh"
echo "- Aggiornamento RM:  $2/params/rm_params$3.sh"
echo "- Aggiornamento JTS: $2/params/jts_params$3.sh"
echo ""
;;
;;


# ************************************
# * Messaggi di verifica dei parametri *
# ************************************

# Verifica intrinseca
# ======================

MISSING_APP_TYPE )
echo ""
echo "Nessun tipo di JTS o di applicazione specificato.  Per aggiornare JTS o l'applicazione, emettere uno dei seguenti comandi:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Utilizzare -help per una descrizione completa dei comandi precedenti."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2 non è un tipo di applicazione o JTS valido.  Per aggiornare JTS o l'applicazione, emettere uno dei seguenti comandi:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Utilizzare -help per una descrizione completa dei comandi precedenti."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "Valore mancante per il parametro $2."
echo "Utilizzare -help per una descrizione completa dei parametri."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "La directory $3, specificata per il parametro $2 non esiste o non è valida."
echo "Utilizzare -help per una descrizione completa dei parametri."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "La directory $3 specificata per il parametro $2 deve essere un percorso assoluto."
echo "Utilizzare -help per una descrizione completa dei parametri."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "Il file $3, specificato per il parametro $2 non esiste o non è valido."
echo "Utilizzare -help per una descrizione completa dei parametri."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3 è un valore non valido per il parametro $2."
echo "Utilizzare -help per una descrizione completa dei parametri."
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2 è un parametro sconosciuto."
echo "Utilizzare -help per una descrizione completa dei parametri."
echo ""
;;


# Verifica estrinseca
# ======================

MISSING_HOME_PARAM )
echo ""
echo "Parametro della directory home $2 mancante."
echo "Utilizzare -help per una descrizione completa dei parametri."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "La directory $2 non esiste o non è valida."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "Impossibile trovare il comando repotools dell'applicazione '$2'."
echo ""
echo "Verificare che il parametro -oldApplicationHome '$3' faccia riferimento alla vecchia directory di configurazione del server, ad esempio 'JazzInstallRoot/server/conf'."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "Impossibile trovare il comando repotools dell'applicazione '$2'."
echo ""
echo "Verificare che il parametro -oldApplicationHome '$3' faccia riferimento alla vecchia directory di configurazione del server, ad esempio 'JazzInstallRoot/server/conf' e che il parametro jtsContextRoot '$4' sia corretto."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "Impossibile trovare il file di configurazione '$2'."
echo ""
echo "Verificare che il parametro -oldApplicationHome '$3' faccia riferimento alla vecchia directory di configurazione del server, ad esempio 'JazzInstallRoot/server/conf'."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "Impossibile trovare il file di configurazione '$2'."
echo ""
echo "Verificare che il parametro -oldApplicationHome '$3' faccia riferimento alla vecchia directory di configurazione del server, ad esempio 'JazzInstallRoot/server/conf' e che il parametro jtsContextRoot '$4' sia corretto."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "Impossibile trovare il comando repotools dell'applicazione '$2'."
echo ""
echo "Verificare che il parametro -newApplicationHome '$3' faccia riferimento alla nuova directory di configurazione del server delle applicazioni, ad esempio 'JazzInstallRoot/server/conf' e che il parametro -applicationContextRoot '$4' sia corretto."
echo "Se si sta effettuando l'aggiornamento da una release precedente, verificare di aver selezionato le root di contesto corrette.  Ad esempio, se si utilizza Installation Manager, selezionare l'opzione della root di contesto $5 sul pannello "Opzioni root di contesto".  Se per sbaglio è stata selezionata un'opzione differente, reinstallare la versione the con l'opzione della root di contesto $5."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "Impossibile trovare il file di configurazione '$2'."
echo ""
echo "Verificare che il parametro -newApplicationHome '$3' faccia riferimento alla nuova directory di configurazione del server JTS, ad esempio 'JazzInstallRoot/server/conf' e che il parametro -applicationContextRoot '$4' sia corretto."
echo "Se si sta effettuando l'aggiornamento da una release precedente, verificare di aver selezionato le root di contesto corrette.  Ad esempio, se si utilizza Installation Manager, selezionare l'opzione della root di contesto $5 sul pannello "Opzioni root di contesto".  Se per sbaglio è stata selezionata un'opzione differente, reinstallare la versione the con l'opzione della root di contesto $5."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "Impossibile trovare il comando repotools JTS '$2'."
echo ""
echo "Verificare che il parametro -oldJTSHome '$3' faccia riferimento alla vecchia directory di configurazione del server JTS, ad esempio 'JazzInstallRoot/server/conf' e che il parametro jtsContextRoot '$4' sia corretto."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "Impossibile trovare il file di configurazione '$2'."
echo ""
echo "Verificare che il parametro -oldJTSHome '$3' faccia riferimento alla vecchia directory di configurazione del server JTS, ad esempio 'JazzInstallRoot/server/conf' e che il parametro jtsContextRoot '$4' sia corretto."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "Impossibile trovare il comando repotools JTS '$2'."
echo ""
echo "Verificare che il parametro -newJTSHome '$3' faccia riferimento alla nuova directory di configurazione del server JTS, ad esempio 'JazzInstallRoot/server/conf' e che il parametro jtsContextRoot '$4' sia corretto."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "Impossibile trovare il file di configurazione '$2'."
echo ""
echo "Verificare che il parametro -newJTSHome '$3' faccia riferimento alla nuova directory di configurazione del server JTS, ad esempio 'JazzInstallRoot/server/conf' e che il parametro jtsContextRoot '$4' sia corretto."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "Un file tar contenente dati 2.x è richiesto per l'aggiornamento di $2."
echo "Utilizzare -help per una descrizione completa dei parametri."
echo ""
;;


# **********************
# * Messaggi di esecuzione *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    Aggiornamento JTS    ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    Aggiornamento CCM    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    Aggiornamento GC    ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    Aggiornamento QM    ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    Aggiornamento RM    ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "Verifica della versione precedente di RM..."
;;

RM_DISPLAY_OLD_VERSION )
echo "la versione precedente di RM è '$2'"
;;

# *********************
# * Passaggio a Primi passi *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "Ultima esecuzione non riuscita al passo iniziale..."
;;

LAST_STEP_FAILED )
echo ""
echo "Ultima esecuzione non riuscita al passo $2..."
echo "Riavviare l'aggiornamento da questo passo o da un passo precedente?"
;;

ALREADY_RUN )
echo ""
echo "L'aggiornamento è già stato eseguito ed è stato completato correttamente..."
echo "Riavviarne uno nuovo da questo passo o da un passo precedente?"
;;

LAST_STEP_PASSED )
echo ""
echo "Ultima esecuzione correttamente arrestata al passo $2..."
echo "Riavviare l'aggiornamento dal passo corrente $3 o da uno precedente?"
;;

ENTER_NEXT_STEP )
echo ""
echo "Immettere il numero del passo [$2-$3] da cui riavviare l'aggiornamento oppure premere [Invio] per annullare l'operazione:"
;;

INTEGER_STEP_NUMBER )
echo ""
echo "'$2' non è un numero. Immettere un numero di passo valido."
;;

INVALID_STEP_NUMBER )
echo ""
echo "'$2' non è un numero di passo valido. Immettere un numero di passo valido."
;;

MAX_STEP_NUMBER )
echo ""
echo "L'ultimo passo è il passo $2, pertanto non è possibile riavviare l'aggiornamento al passo $3."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "Il passo $2 non è stato ancora eseguito, pertanto non è possibile riavviare l'aggiornamento al passo $3."
;;


# **********************
# * Messaggi per i passi *
# **********************

STEP_0_IBMi )
echo "Passo 0: Eliminazione di tabelle"
echo "-------------------"
;;

STEP_0 )
echo "Passo 0: Aggiornamento di file di configurazione"
echo "---------------------------"
;;

STEP_1_ADD )
echo "Passo 1: Aggiunta di tabelle"
echo "------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "Passo $2: Nuova creazione degli indici di testo"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "Passo $2: Nuova creazione di indici di ricerca e di query"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "Passo $2: Unione di LPA con JTS"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "Passo $2: Correzione dell'URL front side delle aree di archiviazione LPA"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "Passo $2: Rimozione dei friend LPA da RM"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "Passo 2: Aggiornamento dello schema del data warehouse"
echo "-------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "Passo $2: Finalizzazione dell'applicazione RM"
echo "----------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "Passo $2: Finalizzazione dell'applicazione JTS"
echo "----------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "Passo $2: Reindicizzazione dell'applicazione RM"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "L'aggiornamento $2 non è riuscito al passo $3.  Correggere il problema ed eseguire di nuovo lo script dal passo $3."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "Aggiornamento $2 riuscito.  È ora possibile aggiornare le applicazioni nel proprio ambiente."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "La parte offline dell'aggiornamento RM è riuscita. È ora possibile avviare i server nella distribuzione."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "La parte offline dell'aggiornamento RM è riuscita. È necessario un ultimo passo"
echo "per completare la migrazione, ma richiede che tutti i server che si collegano a"
echo "RM (come ad esempio RTC, RQM, JRS, GC) siano in linea. Quando possibile, attivare"
echo "tutti i server (incluso RM). Si consiglia di accedere a tutti i server ed"
echo "assicurarsi che siano correttamente in funzione. Quindi eseguire il comando:"
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "Aggiornamento $2 riuscito.  È ora possibile avviare i server nella distribuzione."
echo ""
;;

# *******************************
# * Messaggi durante l'esecuzione del passo *
# *******************************

STEP_DIR_CMD )
echo ""
echo "Directory: $2"
echo "Comando:"
;;

ENTER_STEP_ACTION )
echo "Immettere [E] per eseguire questo passo, [S] per ignorarlo oppure premere [Invio] per annullare l'esecuzione dello script:"
;;

INVALID_STEP_ACTION )
echo ""
echo "'$2' non è una voce valida, sono consentite solo le scelte 'E', 'S' o 'Invio'"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "Un editor vi verrà aperto per verificare il file $2 teamserver.properties."
echo "Verificare che la root dell'URI pubblico denotato dalla proprietà com.ibm.team.repository.server.webapp.url sia corretta."
echo "Verificare che le proprietà del database siano corrette."
echo "Una volta completato, salvare le modifiche, se presenti, e chiudere l'editor per continuare l'esecuzione dello script."
echo ""
echo "Consultare l'argomento 'Aggiornamento della soluzione Rational per CLM' della documentazione del prodotto"
echo "per informazioni sulla modalità di configurazione di ogni proprietà."
;;

PAUSE )
echo ""
echo "Immettere [C] per continuare l'esecuzione oppure premere [Invio] per annullare l'esecuzione dello script:"
;;

INVALID_PAUSE_ACTION )
echo ""
echo "'$2' è una voce non valida, sono consentiti solo 'C' o 'Invio'"
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "Copia degli indici di testo dal '$2' al '$3'."
echo "Questa operazione potrebbe richiedere diversi minuti..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "Copia delle query e degli indici di ricerca dal '$2' al '$3'." 
echo "Questa operazione potrebbe richiedere diversi minuti..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "Impossibile copiare gli indici di testo da '$2' a '$3'."
echo "Verificare la proprietà com.ibm.team.fulltext.indexLocation"
echo "definita nel file teamserver.properties."
echo "Copiare manualmente gli indici di testo in questa directory"
echo "oppure eseguire repotools -rebuildTextIndices per rigenerarli."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "Il file $NEW_APP_PARENT_DIR/RM_APP.ID non esiste"
echo "Crearlo con un'unica riga contenente l'ID applicazione di RM"
echo "e riprovare."
echo ""
;;

# *****************************************
# * Messaggi per la verifica di URI pubblici *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERRORE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Nessun URI pubblico definito in"
echo "$3,"
echo "pertanto non è possibile avviare l'aggiornamento."
echo ""
echo "È necessario che in questo file sia presente un URI pubblico definito come segue:"
echo "https\://nomehost.esempio.com\:porta/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "La proprietà dell'URI pubblico com.ibm.team.repository.server.webapp.url deve essere presente nel file teamserver.properties."
echo "Aggiungere la proprietà al file teamserver.properties dell'installazione precedente ed impostare il valore sulla root dell'URI utilizzata da tutti i client per accedere al server."
echo "La root dell'URI pubblico è essenziale per il corretto funzionamento della nuova installazione. L'aggiornamento non riuscirà senza questa proprietà.  "
echo "Per ulteriori informazioni, consultare l'argomento 'Pianificazione degli URI' nella documentazione del prodotto"
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERRORE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Tutti gli URI pubblici definiti in"
echo "$3,"
echo "sono commentati, pertanto non è possibile avviare l'aggiornamento."
echo ""
echo "In questo file deve essere presente un URI pubblico non commentato definito come segue:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "La proprietà dell'URI pubblico com.ibm.team.repository.server.webapp.url deve essere presente nel file teamserver.properties."
echo "Aggiungere la proprietà al file teamserver.properties dell'installazione precedente ed impostare il valore sulla root dell'URI utilizzata da tutti i client per accedere al server."
echo "La root dell'URI pubblico è essenziale per il corretto funzionamento della nuova installazione. L'aggiornamento non riuscirà senza questa proprietà."
echo "Per ulteriori informazioni, consultare l'argomento 'Pianificazione degli URI' nella documentazione del prodotto"
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "La root di contesto di JTS è impostata su '$2'."
echo "La root di contesto dell'applicazione è impostata su '$3'."
echo "La root di contesto di jts non può coincidere con quella dell'applicazione."
echo ""
;;

esac

}
