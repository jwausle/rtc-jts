#!/bin/sh
# *******************************************************************************
#  Materiali su licenza - Proprietà di IBM
#  (c) Copyright IBM Corporation 2015. Tutti i diritti riservati.
#
#  Nota relativa a limitazioni per gli utenti del Governo degli Stati Uniti:
#  L'uso, la duplicazione o la divulgazione sono limitati dal GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8


# #############################################################
# #
# # Definire le variabili di ambiente corrispondenti ai parametri
# # dello script gc_upgrade.sh ed i relativi valori predefiniti
# #
# #===========================================================
# #
# # Questo file viene letto all'inizio dell'esecuzione dello
# # script gc_upgrade.sh. Imposta una variabile di ambiente per
# # parametro valido con un valore predefinito.
# #
# # Gli utenti possono modificare il valore predefinito per
# # avviare lo script gc_upgrade.sh con i propri valori senza
# # dover immettere manualmente il parametro ed il relativo
# # valore dalla riga comandi.
# #
# # AVVERTENZA:
# # Non è necessario impostare tutte le variabili per tutte le
# # applicazioni.  Prima di modificare il valore, leggere con
# # attenzione ciascun commento.
# #
# #############################################################

# Parametro: -oldApplicationHome
# Utilizzo: -oldApplicationHome <percorso dir>
# Descrizione:
# 	Percorso completo della directory home dell'applicazione nell'installazione 3.0.1.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - questo è un parametro obbligatorio
#  - <percorso dir> deve essere una directory esistente che termina con 'server/conf'
#    Ad esempio, /QIBM/UserData/JazzTeamServer301Backup/server/conf
#
OLD_APPLICATION_HOME=

# Parametro: -applicationContextRoot
# Utilizzo: -applicationContextRoot <root>
# Descrizione:
# 	Root di contesto dell'applicazione del server 3.0.1.
# Valore predefinito:
# 	gc
# Limitazione:
#  - <root> deve essere il nome singolo di una directory valido (senza barre iniziali)
#
APPLICATION_CONTEXT_ROOT=

# Parametro: -oldApplicationVersion
# Utilizzo: -oldApplicationVersion <versione>
# Descrizione:
# 	La versione 3.0.x in fase di aggiornamento. Per impostazione predefinita, questa è
#  determinata eseguendo repotools -version rispetto alla vecchia applicazione.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - deve essere una stringa di versione completa
#    Ad esempio, 3.0.0 o 3.0.1
#
OLD_APPLICATION_VERSION=

# Parametro: -updateTomcatFiles
# Utilizzo: -updateTomcatFiles <yes | no>
# Descrizione:
# 	Indica se aggiornare i file di configurazione tomcat.
# Valore predefinito:
# 	no
# Limitazioni:
#  - Gli unici valori validi sono 'yes' e 'no'
#
UPDATE_TOMCAT_FILES=no

# Parametro: -oldTomcatHome
# Utilizzo: -oldTomcatHome <percorso dir>
# Descrizione:
# 	Percorso completo della directory root Tomcat nell'installazione 3.0.1.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Deve essere una directory esistente
#
OLD_TOMCAT_HOME=

# Parametro: -newApplicationHome
# Utilizzo: -newApplicationHome <percorso dir>
# Descrizione:
# 	Percorso della directory home dell'applicazione nell'installazione 4.0.
# Valore predefinito:
# 	conf
# Limitazioni:
#  - Accettato solo per l'aggiornamento di RTC, QM, GC e RM
#  - Quando accettato, è un parametro obbligatorio
#  - <percorso dir> deve essere una directory esistente che termina con 'server/conf'
#    Ad esempio,  /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parametro: -newJTSHome
# Utilizzo: -newJTSHome <percorso dir>
# Descrizione:
# 	Percorso completo della directory home JTS nell'installazione 4.0.
# Valore predefinito:
# 	La nuova directory home dell'applicazione
# Limitazioni:
#  - <percorso dir> deve essere una directory esistente che termina con 'server/conf'
#    Ad esempio, /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# Parametro: -jtsContextRoot
# Utilizzo: -jtsContextRoot <root>
# Descrizione:
# 	Rotto di contesto del server JTS 4.0.
# Valore predefinito:
# 	jts
# Limitazioni:
#  - <root> deve essere il nome singolo di una directory valido (senza barre iniziali)
#
JTS_CONTEXT_ROOT=jts

# Parametro: -newApplicationTomcatHome
# Utilizzo: -newApplicationTomcatHome <percorso dir>
# Descrizione:
# 	Percorso della directory root Tomcat dell'applicazione nell'installazione 4.0.
# Valore predefinito:
# 	<nessuno>
#
NEW_TOMCAT_HOME=

# Parametro: -newJTSTomcatHome
# Utilizzo: -newJTSTomcatHome <percorso dir>
# Descrizione:
# 	Percorso della directory root Tomcat JTS nell'installazione 4.0.
# Valore predefinito:
# 	<nessuno>
#
NEW_JTS_TOMCAT_HOME=

# Parametro: -ignoreJTSVersionCheck
# Utilizzo: -ignoreJTSVersionCheck
# Descrizione:
# 	Non provare a verificare che la versione dell'applicazione è
#   compatibile con la versione di Jazz Team Server presente in newJTSHome.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Gli unici valori validi sono 'ignoreJTSVersionCheck' o nessun valore
#
IGNORE_JTS_VERSION_CHECK=

# Parametro: -noPrompt
# Utilizzo: -noPrompt
# Descrizione:
# 	Non richiede prima di creare o modificare le tabelle
# Valore predefinito:
# 	noPrompt
# Limitazioni:
#  - Gli unici valori validi sono 'noPrompt' o nessun valore
#
# NO_PROMPT=
NO_PROMPT=noPrompt

# Parametro: -noVerify
# Uso: -noVerify
# Descrizione:
# Non esegue la verifica dei file teamserver.properties.
# Valore predefinito:
#   noVerify
# Limitazioni:
#  - Gli unici valori validi sono 'noVerify' o nessun valore
#
# NO_VERIFY=
NO_VERIFY=noVerify

# Parametro: -noStepPrompt
# Uso: -noStepPrompt
# Descrizione:
# Non richiede prima di eseguire un passo.
# Valore predefinito:
#   false
# Limitazioni:
#  - Gli unici valori validi sono 'true' o 'false'
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Parametro: -noEditor
# Utilizzo: -noEditor
# Descrizione:
#   Non apre un editor sui file teamserver.properties.
# Valore predefinito:
#   false
# Limitazioni:
#  - Gli unici valori validi sono 'true' o 'false'
#
# NO_EDITOR=false
NO_EDITOR=false
