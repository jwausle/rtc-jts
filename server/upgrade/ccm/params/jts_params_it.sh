#!/bin/sh
# *******************************************************************************
#  Materiali su licenza - Proprietà di IBM
#  © Copyright IBM Corporation 2006, 2014. Tutti i diritti riservati.
#
#  Nota relativa a limitazioni dei diritti per gli utenti del Governo degli Stati Uniti:
#  L'uso, la duplicazione o la divulgazione sono limitati dal GSA ADP Schedule
#  Contract con IBM Corp.
#  ******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8


# #############################################################
# #
# # Definire le variabili d'ambiente corrispondenti ai parametri
# # dello script jts_upgrade.sh ed ai relativi valori predefiniti
# #
# #===========================================================
# #
# # Questo file viene letto all'inizio dell'esecuzione dello
# # script jts_upgrade.sh. Imposta una variabile di ambiente per
# # parametro valido con un valore predefinito.
# #
# # È possibile che gli utenti desiderino modificare il valore
# # predefinito per avviare lo script jts_upgrade.sh con i propri
# # valori senza dover immettere manualmente il parametro ed il
# # relativo valore corrispondente dalla riga comandi.
# #
# # AVVERTENZA:
# # Non è necessario impostare tutte le variabili per tutte le
# # applicazioni.  Prima di modificare il valore, leggere con
# # attenzione ciascun commento.
# #
# #############################################################

# Parametro: -oldJTSHome
# Utilizzo: -oldJTSHome <percorso dir>
# Descrizione:
# 	Percorso completo della directory home di JTS nell'installazione precedente.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - <percorso dir> deve essere una directory esistente che termina con 'server/conf'
#  - Valido solo per gli aggiornamenti di RM e JTS
#
OLD_JTS_HOME=

# Parametro: -jtsContextRoot
# Utilizzo: -jtsContextRoot <root>
# Descrizione:
# La root di contesto JTS
# Valore predefinito:
# 	jts
# Limitazioni:
#  - <root> deve essere una singola directory valida (senza barra iniziale)
#
JTS_CONTEXT_ROOT=jts

# Parametro: -lpaContextRoot
# Uso: -lpaContextRoot <root>
# Descrizione:
# La root di contesto LPA
# Valore predefinito:
# 	admin
# Limitazioni:
#  - <root> deve essere una singola directory valida (senza barra iniziale)
#
LPA_CONTEXT_ROOT=admin

# Parametro: -oldJTSVersion
# Utilizzo: -oldJTSVersion <version>
# Descrizione:
# La versione del JTS in fase di aggiornamento.  Per impostazione predefinita,
# viene determinata tramite l'esecuzione di repotools -version per il vecchio JTS.
# Valore predefinito:
# 	<nessuno>
# Vincoli:
#  - deve essere una stringa di versione completa
#    ad es. 3.0.0 o 3.0.1
#
OLD_JTS_VERSION=

# Parametro: -updateTomcatFiles
# Utilizzo: -updateTomcatFiles <yes | no>
# Descrizione:
# 	Indica se aggiornare i file di configurazione tomcat.
# Valore predefinito:
# 	yes
# Limitazioni:
#  - Gli unici valori validi sono 'yes' e 'no'
#
UPDATE_TOMCAT_FILES=yes

# Parametro: -oldTomcatHome
# Utilizzo: -oldTomcatHome <percorso dir>
# Descrizione:
# 	Percorso completo della directory root Tomcat nell'installazione precedente.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Deve essere una directory esistente
#
OLD_TOMCAT_HOME=

# Parametro: -newJTSHome
# Utilizzo: -newJTSHome <percorso dir>
# Descrizione:
# 	Percorso della directory di configurazione del server JTS nella nuova installazione.
# Valore predefinito:
# 	conf
# Limitazioni:
#  - <percorso dir> deve essere una directory esistente che termina con 'server/conf'
#
NEW_JTS_HOME="$START_DIR/conf"

# Parametro: -newTomcatHome
# Utilizzo: -newTomcatHome <percorso dir>
# Descrizione:
# 	Percorso della directory home Tomcat nella nuova installazione.
# Valore predefinito:
# 	<nessuno>
#
NEW_TOMCAT_HOME=

# Parametro: -noPrompt
# Uso: -noPrompt
# Descrizione:
# Non richiede prima di creare o modificare le tabelle
# Valore predefinito:
# 	<nessun valore>
# Limitazioni:
#  - Gli unici valori validi sono 'noPrompt' o nessun valore
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# Parametro: -noVerify
# Uso: -noVerify
# Descrizione:
# Non esegue la verifica dei file teamserver.properties.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Gli unici valori validi sono 'noVerify' oppure nessun valore
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Parametro: -noStepPrompt
# Uso: -noStepPrompt
# Descrizione:
# Non richiede prima di eseguire un passo.
# Valore predefinito:
# 	false
# Limitazioni:
#  - Gli unici valori validi sono 'true' o 'false'
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Parametro: -noEditor
# Uso: -noEditor
# Descrizione:
#   Non apre un editore sul file teamserver.properties.
# Valore predefinito:
# 	false
# Limitazioni:
#  - Gli unici valori validi sono 'true' e 'false' o vuoto
#
# NO_EDITOR=false
NO_EDITOR=false
