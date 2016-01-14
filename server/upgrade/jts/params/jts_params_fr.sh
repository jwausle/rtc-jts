#!/bin/sh
# *******************************************************************************
#  Eléments sous licence - Propriété d'IBM
#  © Copyright IBM Corporation 2006, 2014. All Rights Reserved.
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
# # aux paramètres de script jts_upgrade.sh ainsi que leurs valeurs par défaut
# #
# #===========================================================
# #
# # Ce fichier est lu au début de l'exécution du script
# # jts_upgrade.sh. Il associe une variable d'environnement
# # par paramètre valide à une valeur par défaut prédéfinie.
# #
# # Les utilisateurs peuvent modifier la valeur par défaut
# # pour lancer le script jts_upgrade.sh avec leurs propres
# # valeurs sans avoir à entrer manuellement le paramètre et
# # sa valeur correspondante sur la ligne de commande.
# #
# # AVERTISSEMENT :
# # Les variables ne doivent pas toutes être définies pour chaque
# # application.  Lisez avec attention chaque commentaire avant de
# # modifier la valeur.
# #
# #############################################################

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

# Paramètre : -jtsContextRoot
# Syntaxe : -jtsContextRoot <racine>
# Description :
# 	Racine de contexte JTS
# Valeur par défaut :
# 	jts
# Contraintes:
#  - <racine> doit correspondre à un nom unique de répertoire valide (sans barre oblique au début)
#
JTS_CONTEXT_ROOT=jts

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

# Paramètre : -oldJTSVersion
# Syntaxe : -oldJTSVersion <version>
# Description :
# 	Version de JTS qui est mise à niveau.  Par défaut, cela est déterminé en
#   exécutant la commande repotools -version sur l'ancien serveur JTS.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - doit être une chaîne de version complète
#    exemple : 3.0.0 ou 3.0.1
#
OLD_JTS_VERSION=

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

# Paramètre : -oldTomcatHome
# Syntaxe : -oldTomcatHome <chemin rép>
# Description :
# 	Chemin d'accès complet au répertoire principal Tomcat de l'ancienne installation.
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Doit être un répertoire existant
#
OLD_TOMCAT_HOME=

# Paramètre : -newJTSHome
# Syntaxe : -newJTSHome <chemin rép>
# Description :
# 	Chemin d'accès au répertoire de configuration du serveur JTS de la nouvelle installation.
# Valeur par défaut :
# 	conf
# Contraintes :
#  - <chemin rép> doit correspondre à un répertoire existant se terminant par 'server\conf'
#
NEW_JTS_HOME="$START_DIR/conf"

# Paramètre : -newTomcatHome
# Syntaxe : -newTomcatHome <chemin rép>
# Description :
# 	Chemin d'accès au répertoire principal Tomcat de la nouvelle installation.
# Valeur par défaut :
# 	<aucune>
#
NEW_TOMCAT_HOME=

# Paramètre : -noPrompt
# Syntaxe : -noPrompt
# Description :
# 	Ne pas demander confirmation avant la création ou la modification des tables
# Valeur par défaut :
# 	<aucune>
# Contraintes :
#  - Les seules valeurs valides sont la valeur vide et la valeur 'noPrompt'
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# Paramètre : -noVerify
# Syntaxe : -noVerify
# Description :
# 	Ne pas vérifier les fichiers teamserver.properties.
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
#  - Les seules valeurs valides sont 'true', 'false' et la valeur vide
#
# NO_EDITOR=false
NO_EDITOR=false
