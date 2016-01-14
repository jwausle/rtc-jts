#!/bin/sh
# *******************************************************************************
#  Materiali su licenza - Proprietà di IBM
#  (c) Copyright IBM Corporation 2006, 2014. Tutti i diritti riservati.
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
# # dello script rm_upgrade.sh ed i relativi valori predefiniti
# #
# #===========================================================
# #
# # Questo file viene letto all'inizio dell'esecuzione dello
# # script rm_upgrade.sh. Imposta una variabile di ambiente per
# # parametro valido con un valore predefinito.
# #
# # È possibile che gli utenti desiderino modificare il valore
# # predefinito per avviare lo script rm_upgrade.sh con i propri
# # valori senza dover immettere manualmente il parametro ed il
# # relativo valore corrispondente dalla riga comandi.
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
# 	Percorso completo della directory home di installazione nell'installazione precedente.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - questo è un parametro obbligatorio
#  - <percorso dir> deve essere una directory esistente che termina con 'server/conf'
#    Ad esempio, /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Parametro: -applicationContextRoot
# Utilizzo: -applicationContextRoot <root>
# Descrizione:
# 	Root di contesto dell'applicazione.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - <root> deve essere il nome singolo di una directory valido (senza barre iniziali)
#
APPLICATION_CONTEXT_ROOT=

# Parametro: -oldApplicationVersion
# Utilizzo: -oldApplicationVersion <versione>
# Descrizione:
# 	La versione in fase di aggiornamento.  Per impostazione predefinita, questa è
#  determinata eseguendo repotools -version rispetto alla vecchia applicazione.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - deve essere una stringa di versione completa
#    Ad esempio, 5.0.0 o 5.0.1
#
OLD_APPLICATION_VERSION=

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

# Parametro: -oldApplicationTomcatHome
# Utilizzo: -oldApplicationTomcatHome <percorso dir>
# Descrizione:
# 	Percorso completo della directory root Tomcat dell'applicazione nell'installazione precedente.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Accettato solo per l'aggiornamento di RM
#  - Deve essere una directory esistente
#
OLD_TOMCAT_HOME=

# Parametro: -oldJTSTomcatHome
# Utilizzo: -oldJTSTomcatHome <percorso dir>
# Descrizione:
# 	Percorso completo della directory root Tomcat JTS nell'installazione precedente.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Accettato solo per l'aggiornamento di RM
#  - Deve essere una directory esistente
#
OLD_JTS_TOMCAT_HOME=

# Parametro: -newApplicationHome
# Utilizzo: -newApplicationHome <percorso dir>
# Descrizione:
# 	Percorso della directory home dell'applicazione nella nuova installazione.
# Valore predefinito:
# 	conf
# Limitazioni:
#  - Accettato solo per l'aggiornamento di RTC, QM e RM
#  - Quando è accettato, è un parametro obbligatorio
#  - <percorso dir> deve essere una directory esistente che termina con 'server/conf'
#    Ad esempio, /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parametro: -newJTSHome
# Utilizzo: -newJTSHome <percorso dir>
# Descrizione:
# 	Percorso completo della directory home JTS nel JTS che verrà utilizzato dalla nuova installazione.
# Valore predefinito:
# La nuova directory home dell'applicazione
# Limitazioni:
#  - <percorso dir> deve essere una directory esistente che termina con 'server/conf'
#
NEW_JTS_HOME=

# Parametro: -newJTSContextRoot
# Utilizzo: -newJTSContextRoot <root>
# Descrizione:
# 	Root di contesto del nuovo server JTS.
# Valore predefinito:
# 	jts
# Limitazioni:
#  - <root> deve essere il nome singolo di una directory valido (senza barre iniziali)
#
JTS_CONTEXT_ROOT=jts

# Parametro: -newApplicationTomcatHome
# Utilizzo: -newApplicationTomcatHome <percorso dir>
# Descrizione:
# 	Percorso della directory root Tomcat dell'applicazione nella nuova installazione.
# Valore predefinito:
# 	<nessuno>
#
NEW_TOMCAT_HOME=

# Parametro: -newJTSTomcatHome
# Utilizzo: -newJTSTomcatHome <percorso dir>
# Descrizione:
# 	Percorso della directory root Tomcat JTS nel JTS che verrà utilizzato dalla nuova installazione.
# Valore predefinito:
# 	<nessuno>
#
NEW_JTS_TOMCAT_HOME=

# Parametro: -overwrite
# Utilizzo: -overwrite
# Descrizione:
# 	Forza la sovrascrittura (utilizza sempre overwrite=yes) durante l'esecuzione dei comandi repotools
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Gli unici valori validi sono 'overwrite=yes' o nessun valore
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# Parametro: -noVerify
# Utilizzo: -noVerify
# Descrizione:
# 	Non esegue alcuna verifica (utilizza sempre noVerify) durante l'esecuzione dei comandi repotools
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Gli unici valori validi sono 'noVerify' oppure nessun valore
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Parametro: -noStepPrompt
# Utilizzo: -noStepPrompt
# Descrizione:
# 	Non richiede conferma prima di ciascun passo di aggiornamento
# Valore predefinito:
# 	false
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
#  - Gli unici valori validi sono 'true', 'false' o nessun valore
#
# NO_EDITOR=false
NO_EDITOR=false


# Parametro: -db.jdbc.location
# Utilizzo: -db.jdbc.location <JDBC_URL>
# Descrizione:
# 	Il percorso JDBC per il database RM. (Necessario solo per il passaggio da 4.x a 5.x) 
#
#		Esempi:
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		NOTA:
#			Su sistemi *-nix, molti caratteri (ad esempio: |  &  ;  <  >  (  )  $  `  \  "  '  <spazio>  <tab>  <nuova riga>) 
#			richiedono il tasto Esc con una barra retroversa. 
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Accettato solo per l'aggiornamento di RM da 4.x
#
DB_JDBC_LOCATION_VALUE=

# Parametro: -db.jdbc.password
# Uso: -db.jdbc.password <JDBC_PASSWORD>
# Descrizione:
# 	La password (con o senza codifica) che verrà sostituita se nell'URL JDBC è visualizzata la stringa "{password}". 
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Deve essere specificato se l'URL JDBC URL per il database RM contiene la stringa {password}
#
DB_JDBC_PASSWORD_VALUE=

# Parametro: -db.db2i.schema.name
# Uso: -db.db2i.schema.name <SCHEMA_NAME>
# Descrizione:
# 	Il nome dello schema DB DB2i.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Deve essere specificato utilizzando il tipo di database DB2i. 
#
DB_DB2I_SCHEMA_NAME_VALUE=

# Parametro: -db.db2.dsn.dbname
# Uso: -db.db2.dsn.dbname <DSN_DBNAME>
# Descrizione:
# 	Il nome DB DSN DB2Z.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Deve essere specificato utilizzando il tipo di database DB2z. 
#
DB_DB2_DSN_DBNAME_VALUE=

# Parametro: -db.schemaPrefix
# Uso: -db.schemaPrefix <SCHEMA_PREFIX>
# Descrizione:
# 	Il prefisso dello schema DB. 
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - Deve essere specificato utilizzando il tipo di database DB2z. 
#
DB_SCHEMA_PREFIX_VALUE=

# Parametro: -oldJTSHome
# Utilizzo: -oldJTSHome <percorso dir>
# Descrizione:
# 	Percorso completo della directory home JTS nell'installazione precedente.
# Valore predefinito:
# 	<nessuno>
# Limitazioni:
#  - <percorso dir> deve essere una directory esistente che termina con 'server/conf'
#  - Valido solo per gli aggiornamenti di RM e JTS
#
OLD_JTS_HOME=

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
