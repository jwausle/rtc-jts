#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2015. All Rights Reserved.
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
# # aux paramètres de script gc_upgrade.sh ainsi que leurs valeurs par défaut
# #
# #===========================================================
# #
# # Ce fichier est lu au début de l'exécution du script
# # gc_upgrade.sh. Il associe une variable d'environnement
# # par paramètre valide à une valeur par défaut prédéfinie.
# #
# # Les utilisateurs peuvent modifier la valeur par défaut
# # pour lancer le script gc_upgrade.sh avec leurs propres
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
# 	Chemin d'accès complet au répertoire principal de l'application dans l'installation 3.0.1.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Il s'agit d'un paramètre obligatoire
#  - <chemin rép> doit être un répertoire existant qui se termine par 'server/conf',
#    par exemple /QIBM/UserData/JazzTeamServer301Backup/server/conf
#
OLD_APPLICATION_HOME=

# Paramètre : -applicationContextRoot
# Syntaxe : -applicationContextRoot <racine>
# Description :
# 	Racine de contexte d'application du serveur 3.0.1.
# Valeur par défaut :
# 	gc
# Contraintes :
#  - <racine> doit correspondre à un nom unique de répertoire valide (sans barre oblique au début)
#
APPLICATION_CONTEXT_ROOT=

# Paramètre : -oldApplicationVersion
# Syntaxe : -oldApplicationVersion <version>
# Description :
# 	Version 3.0.x mise à niveau.  Par défaut, elle est
#   déterminée par l'exécution de la commande repotools -version sur l'ancienne application.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Il doit s'agir d'une chaîne de version complète,
#    par exemple 3.0.0 ou 3.0.1
#
OLD_APPLICATION_VERSION=

# Paramètre : -updateTomcatFiles
# Syntaxe : -updateTomcatFiles <yes | no>
# Description :
# 	Indique si les fichiers de configuration Tomcat doivent être mis à jour.
# Valeur par défaut :
# 	no
# Contraintes :
#  - Seules les valeurs 'yes' et 'no' sont valides
#
UPDATE_TOMCAT_FILES=no

# Paramètre : -oldTomcatHome
# Syntaxe : -oldTomcatHome <chemin rép>
# Description :
# 	Chemin d'accès complet au répertoire principal Tomcat de l'installation 3.0.1.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Doit être un répertoire existant
#
OLD_TOMCAT_HOME=

# Paramètre : -newApplicationHome
# Syntaxe : -newApplicationHome <chemin rép>
# Description :
# 	Chemin d'accès au répertoire principal de l'application dans l'installation 4.0.
# Valeur par défaut :
# 	conf
# Contraintes :
#  - Admis uniquement pour la mise à niveau de RTC, QM, GC et RM
#  - Lorsqu'il est admis, il s'agit d'un paramètre obligatoire
#  - <chemin rép> doit correspondre à un répertoire existant se terminant par 'server\conf',
#    par exemple /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Paramètre : -newJTSHome
# Syntaxe : -newJTSHome <dir path>
# Description :
# 	Chemin d'accès complet au répertoire principal JTS dans l'installation 4.0.
# Valeur par défaut :
# 	Répertoire principal de la nouvelle application
# Contraintes :
#  - <chemin rép> doit correspondre à un répertoire existant se terminant par 'server\conf',
#    par exemple /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# Paramètre : -jtsContextRoot
# Syntaxe : -jtsContextRoot <racine>
# Description :
# 	Racine de contexte du serveur JTS 4.0.
# Valeur par défaut :
# 	jts
# Contraintes :
#  - <racine> doit correspondre à un nom unique de répertoire valide (sans barre oblique au début)
#
JTS_CONTEXT_ROOT=jts

# Paramètre : -newApplicationTomcatHome
# Syntaxe : -newApplicationTomcatHome <chemin rép>
# Description :
# 	Chemin d'accès au répertoire racine Tomcat de l'application dans l'installation 4.0.
# Valeur par défaut :
# 	<aucune>
#
NEW_TOMCAT_HOME=

# Paramètre : -newJTSTomcatHome
# Syntaxe : -newJTSTomcatHome <chemin rép>
# Description :
# 	Chemin d'accès au répertoire racine Tomcat JTS 4.0.
# Valeur par défaut :
# 	<aucune>
#
NEW_JTS_TOMCAT_HOME=

# Paramètre : -ignoreJTSVersionCheck
# Syntaxe : -ignoreJTSVersionCheck
# Description :
# 	Ne pas tenter de vérifier que la version d'application est
#   compatible avec la version de Jazz Team Server qui se trouve à l'emplacement newJTSHome.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Les seules valeurs valides sont la valeur vide et la valeur 'ignoreJTSVersionCheck'
#
IGNORE_JTS_VERSION_CHECK=

# Paramètre : -noPrompt
# Syntaxe : -noPrompt
# Description :
# 	Ne pas demander confirmation avant la création ou la modification des tables
# Valeur par défaut :
# 	noPrompt
# Contraintes :
#  - Les seules valeurs valides sont la valeur vide et la valeur 'noPrompt'
#
# NO_PROMPT=
NO_PROMPT=noPrompt

# Paramètre : -noVerify
# Syntaxe : -noVerify
# Description :
# 	Ne pas vérifier les fichiers teamserver.properties.
# Valeur par défaut :
#   noVerify
# Contraintes :
#  - Les seules valeurs valides sont la valeur vide et la valeur 'noVerify'
#
# NO_VERIFY=
NO_VERIFY=noVerify

# Paramètre : -noStepPrompt
# Syntaxe : -noStepPrompt
# Description :
# 	Ne pas demander confirmation avant l'exécution d'une étape.
# Valeur par défaut :
#   false
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
#  - Les seules valeurs valides sont 'true' et 'false'
#
# NO_EDITOR=false
NO_EDITOR=false
