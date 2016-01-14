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
# # Définissez les variables d'environnement correspondant
# # aux paramètres de script rm_upgrade.sh ainsi que leurs valeurs par défaut
# #
# #===========================================================
# #
# # Ce fichier est lu au début de l'exécution du script
# # rm_upgrade.sh. Il associe une variable d'environnement
# # par paramètre valide à une valeur par défaut prédéfinie.
# #
# # Les utilisateurs peuvent modifier la valeur par défaut
# # pour lancer le script rm_upgrade.sh avec leurs propres
# # valeurs sans avoir à entrer manuellement le paramètre et
# # sa valeur correspondante sur la ligne de commande.
# #
# # AVERTISSEMENT :
# # Les variables ne doivent pas toutes être définies pour chaque
# # application.  Lisez avec attention chaque commentaire avant de
# # modifier la valeur.
# #
# #############################################################

# Paramètre : -oldApplicationHome
# Syntaxe : -oldApplicationHome <chemin rép>
# Description :
# 	Chemin d'accès complet au répertoire principal de l'application dans l'ancienne installation.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Il s'agit d'un paramètre obligatoire
#  - <chemin rép> doit être un répertoire existant qui se termine par 'server/conf',
#    par exemple /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Paramètre : -applicationContextRoot
# Syntaxe : -applicationContextRoot <racine>
# Description :
# 	Racine de contexte d'application.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - <racine> doit correspondre à un nom unique de répertoire valide (sans barre oblique au début)
#
APPLICATION_CONTEXT_ROOT=

# Paramètre : -oldApplicationVersion
# Syntaxe : -oldApplicationVersion <version>
# Description :
# 	Version mise à niveau.  Par défaut, elle est
#   déterminée par l'exécution de la commande repotools -version sur l'ancienne application.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Doit être une chaîne de version complète,
#    par exemple 5.0.0 ou 5.0.1
#
OLD_APPLICATION_VERSION=

# Paramètre : -updateTomcatFiles
# Syntaxe : -updateTomcatFiles <yes | no>
# Description :
# 	Indique si les fichiers de configuration Tomcat doivent être mis à jour.
# Valeur par défaut :
# 	yes
# Contraintes :
#  - Seules les valeurs 'yes' et 'no' sont valides
#
UPDATE_TOMCAT_FILES=yes

# Paramètre : -oldApplicationTomcatHome
# Syntaxe : -oldApplicationTomcatHome <chemin rép>
# Description :
# 	Chemin d'accès complet au répertoire principal Tomcat de l'ancienne installation.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Admis uniquement pour la mise à niveau de RM
#  - Doit être un répertoire existant
#
OLD_TOMCAT_HOME=

# Paramètre : -oldJTSTomcatHome
# Syntaxe : -oldJTSTomcatHome <chemin rép>
# Description :
# 	Chemin d'accès complet au répertoire racine Tomcat JTS dans l'ancienne installation.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Admis uniquement pour la mise à niveau de RM
#  - Doit être un répertoire existant
#
OLD_JTS_TOMCAT_HOME=

# Paramètre : -newApplicationHome
# Syntaxe : -newApplicationHome <chemin rép>
# Description :
# 	Chemin d'accès au répertoire principal de l'application dans la nouvelle installation.
# Valeur par défaut :
# 	conf
# Contraintes :
#  - Admis uniquement pour la mise à niveau de RTC, QM et RM
#  - Lorsqu'il est admis, il s'agit d'un paramètre obligatoire
#  - <chemin rép> doit correspondre à un répertoire existant se terminant par 'server\conf',
#    par exemple /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Paramètre : -newJTSHome
# Syntaxe : -newJTSHome <dir path>
# Description :
# 	Chemin d'accès au répertoire principal JTS du serveur JTS que la nouvelle installation va utiliser.
# Valeur par défaut :
# 	Répertoire principal de la nouvelle application
# Contraintes :
#  - <chemin rép> doit correspondre à un répertoire existant se terminant par 'server\conf',
#
NEW_JTS_HOME=

# Paramètre : -newJTSContextRoot
# Syntaxe : -newJTSContextRoot <racine>
# Description :
# 	Racine de contexte du nouveau serveur JTS.
# Valeur par défaut :
# 	jts
# Contraintes :
#  - <racine> doit correspondre à un nom unique de répertoire valide (sans barre oblique au début)
#
JTS_CONTEXT_ROOT=jts

# Paramètre : -newApplicationTomcatHome
# Syntaxe : -newApplicationTomcatHome <chemin rép>
# Description :
# 	Chemin d'accès au répertoire racine Tomcat de l'application dans la nouvelle installation.
# Valeur par défaut :
# 	<aucune>
#
NEW_TOMCAT_HOME=

# Paramètre : -newJTSTomcatHome
# Syntaxe : -newJTSTomcatHome <chemin rép>
# Description :
# 	Chemin d'accès au répertoire principal JTS Tomcat du serveur JTS que la nouvelle installation va utiliser.
# Valeur par défaut :
# 	<aucune>
#
NEW_JTS_TOMCAT_HOME=

# Paramètre : -overwrite
# Syntaxe : -overwrite
# Description :
# 	Forcer le remplacement (toujours utiliser overwrite=yes) lors de l'exécution des commandes repotools
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Les seules valeurs valides sont la valeur vide et la valeur 'overwrite=yes'
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# Paramètre : -noVerify
# Syntaxe : -noVerify
# Description :
# 	Ne pas demander de vérification (toujours utiliser noVerify) lors de l'exécution des commandes repotools
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Les seules valeurs valides sont la valeur vide et la valeur 'noVerify'
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Paramètre : -noStepPrompt
# Syntaxe : -noStepPrompt
# Description :
# 	Ne pas demander confirmation avant chaque étape de mise à niveau
# Valeur par défaut :
# 	false
# Contraintes :
#  - Les seules valeurs valides sont 'true' et 'false'
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Paramètre : -noEditor
# Syntaxe : -noEditor
# Description :
#   Ne pas ouvrir les fichiers teamserver.properties dans un éditeur.
# Valeur par défaut :
#   false
# Contraintes :
#  - Les seules valeurs valides sont 'true', 'false' et la valeur vide
#
# NO_EDITOR=false
NO_EDITOR=false

# Paramètre : -db.jdbc.location
# Syntaxe : -db.jdbc.location <URL_JDBC>
# Description :
# 	Emplacement JDBC de la base de données RM. (Requis uniquement lors du passage de 4.x à 5.x) 
#
#		Exemples :
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		REMARQUE :
#			Sur les systèmes *-nix, de nombreux caractères (comme |  &  ;  <  >  (  )  $  `  \  "  '  <espace>  <tab>  <nouvelleligne>) 
#			requièrent le caractère d'échappement barre oblique. 
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Admis uniquement pour la mise à niveau de RM depuis 4.x
#
DB_JDBC_LOCATION_VALUE=

# Paramètre : -db.jdbc.password
# Syntaxe : -db.jdbc.password <MOTDEPASSE_JDBC>
# Description :
# 	Mot de passe (en clair ou chiffré) qui sera indiqué si "{password}" apparaît dans l'URL JDBC. 
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Doit être spécifié si l'URL JDBC pour la base de données RM contient {password}
#
DB_JDBC_PASSWORD_VALUE=

# Paramètre : -db.db2i.schema.name
# Syntaxe : -db.db2i.schema.name <NOM_SCHEMA>
# Description :
# 	Nom de schéma de base de données DB2i.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Doit être spécifié avec le type de base de données DB2i. 
#
DB_DB2I_SCHEMA_NAME_VALUE=

# Paramètre : -db.db2.dsn.dbname
# Syntaxe : -db.db2.dsn.dbname <NOM_BD_DSN>
# Description :
# 	Nom de la base de données DSN DB2Z.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Doit être spécifié avec le type de base de données DB2z. 
#
DB_DB2_DSN_DBNAME_VALUE=

# Paramètre : -db.schemaPrefix
# Syntaxe : -db.schemaPrefix <PREFIXE_SCHEMA>
# Description :
# 	Préfixe de schéma de base de données. 
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Doit être spécifié avec le type de base de données DB2z. 
#
DB_SCHEMA_PREFIX_VALUE=

# Paramètre : -oldJTSHome
# Syntaxe : -oldJTSHome <chemin rép>
# Description :
# 	Chemin d'accès complet au répertoire principal JTS dans l'ancienne installation.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - <chemin rép> doit être un répertoire existant qui se termine par 'server/conf'
#  - Valide seulement pour les mises à niveau de RM et de JTS
#
OLD_JTS_HOME=

# Paramètre : -lpaContextRoot
# Syntaxe : -lpaContextRoot <racine>
# Description :
# 	Racine de contexte LPA
# Valeur par défaut :
# 	admin
# Contraintes :
#  -<racine> doit correspondre à un nom unique de répertoire valide (sans barre oblique au début)
#
LPA_CONTEXT_ROOT=admin
