#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2011, 2015. All Rights Reserved.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************

# ################################################################################
#
# File for messages displayed by the upgrade automated scripts.
#
# ################################################################################


# *********************
# * Messages function *
# *********************
messages() {

case $1 in 

# *********************************
# * Initial verification messages *
# *********************************

INVALID_LAUNCH )
echo ""
echo "N'exécutez pas le script app_upgrade directement.  Pour mettre à jour le serveur JTS ou l'application, exécutez l'une des commandes suivantes :"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Entrez -help pour afficher la description complète des commandes ci-dessus."
;;

INVALID_START_DIR )
echo ""
echo "Sauf si vous utilisez le paramètre -help, le script $2 doit être exécuté depuis $3"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "Le fichier '$2' contient les valeurs de paramètre pour le script de mise à niveau."
echo "Pour modifier ces valeurs de paramètre par défaut, éditez ces fichiers ou spécifiez les valeurs de paramètre sous forme d'arguments de ligne de commande pour les scripts de mise à niveau."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "L'ensemble de fichiers ci-dessous contient les valeurs de paramètre par défaut pour la mise à niveau d'une application ou d'un serveur JTS.  Pour modifier ces valeurs de paramètre par défaut, éditez ces fichiers ou spécifiez les valeurs de paramètre sous forme d'arguments de ligne de commande pour les scripts de mise à niveau."
echo "- Mise à niveau CCM : $2/params/ccm_params$3.sh"
echo "- Mise à niveau GC :  $2/params/gc_params$3.sh"
echo "- Mise à niveau QM :  $2/params/qm_params$3.sh"
echo "- Mise à niveau RM :  $2/params/rm_params$3.sh"
echo "- Mise à niveau JTS : $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Parameters verification messages *
# ************************************

# Vérification intrinsèque
# ========================

MISSING_APP_TYPE )
echo ""
echo "Aucun type de serveur JTS ou d'application n'a été spécifié.  Pour mettre à jour le serveur JTS ou l'application, exécutez l'une des commandes suivantes :"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Entrez -help pour afficher la description complète des commandes ci-dessus."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2 n'est pas un type de serveur JTS ou d'application valide.  Pour mettre à jour le serveur JTS ou l'application, exécutez l'une des commandes suivantes :"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Entrez -help pour afficher la description complète des commandes ci-dessus."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "Valeur manquante pour le paramètre $2."
echo "Entrez -help pour afficher la description complète des paramètres."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "Le répertoire $3, spécifié pour le paramètre $2, n'existe pas ou n'est pas valide."
echo "Entrez -help pour afficher la description complète des paramètres."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "Le répertoire $3 spécifié pour le paramètre $2 doit être un chemin d'accès absolu."
echo "Entrez -help pour afficher la description complète des paramètres."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "Le fichier $3, spécifié pour le paramètre $2, n'existe pas ou n'est pas valide."
echo "Entrez -help pour afficher la description complète des paramètres."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3 est une valeur non valide pour le paramètre $2."
echo "Entrez -help pour afficher la description complète des paramètres."
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2 est un paramètre inconnu."
echo "Entrez -help pour afficher la description complète des paramètres."
echo ""
;;


# Vérification extrinsèque
# ========================

MISSING_HOME_PARAM )
echo ""
echo "Paramètre de répertoire principal $2 manquant."
echo "Entrez -help pour afficher la description complète des paramètres."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "Le répertoire $2 n'existe pas ou n'est pas valide."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "Impossible de trouver la commande repotools de l'application '$2'."
echo ""
echo "Vérifiez que le paramètre -oldApplicationHome '$3' désigne l'ancien répertoire de configuration du serveur, par exemple 'RacineInstallationJazz/server/conf'."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "Impossible de trouver la commande repotools de l'application '$2'."
echo ""
echo "Vérifiez que le paramètre -oldApplicationHome '$3' désigne l'ancien répertoire de configuration du serveur, par exemple 'RacineInstallationJazz/server/conf' et que le paramètre jtsContextRoot '$4' est correct."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "Fichier de configuration '$2' introuvable."
echo ""
echo "Vérifiez que le paramètre -oldApplicationHome '$3' désigne l'ancien répertoire de configuration du serveur, par exemple 'RacineInstallationJazz/server/conf'."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "Fichier de configuration '$2' introuvable."
echo ""
echo "Vérifiez que le paramètre -oldApplicationHome '$3' désigne l'ancien répertoire de configuration du serveur, par exemple 'RacineInstallationJazz/server/conf' et que le paramètre jtsContextRoot '$4' est correct."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "Impossible de trouver la commande repotools de l'application '$2'."
echo ""
echo "Vérifiez que le paramètre -newApplicationHome '$3' désigne le nouveau répertoire de configuration du serveur d'applications, par exemple 'RacineInstallationJazz/server/conf' et que le paramètre applicationContextRoot '$4' est correct."
echo "Si vous procédez à une mise à niveau depuis une édition précédente, vérifiez que vous avez sélectionné les racines de contexte correctes.  Par exemple, si vous utilisez Installation Manager, vous devez sélectionner l'option de racine de contexte $5 dans le panneau "Options de racine de contexte".  Si vous avez sélectionné une autre option par inadvertance, vous devez réinstaller le produit avec l'option de racine de contexte $5."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "Fichier de configuration '$2' introuvable."
echo ""
echo "Vérifiez que le paramètre -newApplicationHome '$3' désigne le nouveau répertoire de configuration du serveur JTS, par exemple 'RacineInstallationJazz/server/conf' et que le paramètre applicationContextRoot '$4' est correct."
echo "Si vous procédez à une mise à niveau depuis une édition précédente, vérifiez que vous avez sélectionné les racines de contexte correctes.  Par exemple, si vous utilisez Installation Manager, vous devez sélectionner l'option de racine de contexte $5 dans le panneau "Options de racine de contexte".  Si vous avez sélectionné une autre option par inadvertance, vous devez réinstaller le produit avec l'option de racine de contexte $5."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "Impossible de trouver la commande repotools JTS '$2'."
echo ""
echo "Vérifiez que le paramètre -oldJTSHome '$3' désigne l'ancien répertoire de configuration du serveur JTS, par exemple 'RacineInstallationJazz/server/conf' et que le paramètre jtsContextRoot '$4' est correct."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "Fichier de configuration '$2' introuvable."
echo ""
echo "Vérifiez que le paramètre -oldJTSHome '$3' désigne l'ancien répertoire de configuration du serveur JTS, par exemple 'RacineInstallationJazz/server/conf' et que le paramètre jtsContextRoot '$4' est correct."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "Impossible de trouver la commande repotools JTS '$2'."
echo ""
echo "Vérifiez que le paramètre -newJTSHome '$3' désigne le nouveau répertoire de configuration du serveur JTS, par exemple 'RacineInstallationJazz/server/conf' et que le paramètre jtsContextRoot '$4' est correct."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "Fichier de configuration '$2' introuvable."
echo ""
echo "Vérifiez que le paramètre -newJTSHome '$3' désigne le nouveau répertoire de configuration du serveur JTS, par exemple 'RacineInstallationJazz/server/conf' et que le paramètre jtsContextRoot '$4' est correct."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "Un fichier tar contenant des données 2.x est requis pour la mise à niveau de $2."
echo "Entrez -help pour afficher la description complète des paramètres."
echo ""
;;


# **********************
# * Execution messages *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===         Mise à niveau de JTS          ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===         Mise à niveau de CCM          ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===         Mise à niveau de GC          ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===          Mise à niveau de QM         ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===         Mise à niveau de RM          ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "Vérification de la version précédente de l'application RM..."
;;

RM_DISPLAY_OLD_VERSION )
echo "La version précédente de l'application RM est '$2'"
;;

# *********************
# * First step switch *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "La dernière exécution a échoué à l'étape initiale..."
;;

LAST_STEP_FAILED )
echo ""
echo "La dernière exécution a échoué à l'étape $2..."
echo "Voulez-vous redémarrer la mise à niveau à partir de cette étape ou d'une étape précédente ?"
;;

ALREADY_RUN )
echo ""
echo "La mise à niveau a déjà été effectuée et a abouti..."
echo "Voulez-vous en redémarrer une nouvelle à partir d'une étape spécifique ?"
;;

LAST_STEP_PASSED )
echo ""
echo "La dernière exécution a été arrêtée à l'étape $2..."
echo "Voulez-vous redémarrer la mise à niveau à partir de l'étape $3 ou d'une étape précédente ?"
;;

ENTER_NEXT_STEP )
echo ""
echo "Entrez le numéro de l'étape [$2-$3] à partir de laquelle redémarrer la mise à niveau ou appuyez sur [Entrée] pour annuler :"
;;

INTEGER_STEP_NUMBER )
echo ""
echo "'$2' n'est pas un nombre. Entrez un numéro d'étape valide."
;;

INVALID_STEP_NUMBER )
echo ""
echo "'$2' n'est pas un numéro d'étape valide. Entrez un numéro d'étape valide."
;;

MAX_STEP_NUMBER )
echo ""
echo "La dernière étape est l'étape $2 ; par conséquent, vous ne pouvez pas redémarrer la mise à niveau à l'étape $3."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "L'étape $2 n'a pas encore été exécutée ; par conséquent, vous ne pouvez pas redémarrer la mise à niveau à l'étape $3."
;;


# **********************
# * Messages for Steps *
# **********************

STEP_0_IBMi )
echo "Etape 0 : Suppression des tables"
echo "--------------------------------"
;;

STEP_0 )
echo "Etape 0 : Mise à jour des fichiers de configuration"
echo "---------------------------------------------------"
;;

STEP_1_ADD )
echo "Etape 1 : Ajout de tables"
echo "-------------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "Etape $2 : Régénération des index de texte"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "Etape $2 : Recréation des index de requête et de recherche"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "Step $2 : Fusion de LPA dans JTS"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "Etape $2 : Correction de l'URL frontale des zones de stockage LPA"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "Etape $2 : Suppression de l'ami LPA de RM"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "Etape 2 : Mise à niveau du schéma d'entrepôt de données"
echo "-------------------------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "Etape $2 : Finalisation de l'application RM"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "Etape $2 : Finalisation de l'application JTS"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "Etape $2 : Réindexation de l'application RM"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "La mise à niveau de $2 a échoué à l'étape $3.  Corrigez le problème et exécutez à nouveau le script à partir de l'étape $3."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "La mise à niveau de $2 a abouti.  Vous devez mettre à niveau les applications de votre environnement maintenant."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "La partie hors ligne de la mise à niveau de RM a abouti. Vous pouvez à présent démarrer les serveurs de l'environnement de déploiement."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "La partie hors ligne de la mise à niveau de RM a abouti. Il reste une"
echo "étape à effectuer pour terminer la migration, mais elle requiert que tous les"
echo "serveurs liés à RM (comme RTC, RQM, JRS, GC) soient démarrés. Si approprié, démarrez"
echo "tous les serveurs (y compris RM). Il est recommandé de se connecter à chaque serveur"
echo "pour vérifier son fonctionnement. Ensuite, exécutez la commande suivante :"
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "La mise à niveau de $2 a abouti.  Vous pouvez à présent démarrer les serveurs de l'environnement de déploiement."
echo ""
;;

# *******************************
# * Messages while running step *
# *******************************

STEP_DIR_CMD )
echo ""
echo "Répertoire : $2"
echo "Commande :"
;;

ENTER_STEP_ACTION )
echo "Entrez [E] pour exécuter cette étape, [S] pour l'ignorer ou appuyez sur [Entrée] pour annuler l'exécution du script :"
;;

INVALID_STEP_ACTION )
echo ""
echo "'$2' n'est pas une entrée valide ; 'E', 'S' et 'Entrée' seulement sont admis"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "Un éditeur vi va s'ouvrir pour que vous puissiez vérifier le fichier teamserver.properties $2."
echo "Vérifiez que la racine d'URI public indiquée par la propriété com.ibm.team.repository.server.webapp.url est correcte."
echo "Vérifiez que les propriétés de la base de données sont correctes."
echo "Lorsque vous avez terminé, sauvegardez vos modifications, le cas échéant, puis fermez l'éditeur afin de continuer l'exécution du script."
echo ""
echo "Consultez la rubrique 'Mise à niveau de la solution Rational pour CLM' du centre de documentation"
echo "pour des informations sur la configuration de chaque propriété."
;;

PAUSE )
echo ""
echo "Entrez [C] pour continuer l'exécution ou appuyez sur [Entrée] pour annuler l'exécution du script :"
;;

INVALID_PAUSE_ACTION )
echo ""
echo "'$2' n'est pas une entrée valide ; 'C' ou 'Entrée' seulement sont admis"
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "Copie des index de texte de '$2' vers '$3'."
echo "L'opération peut prendre plusieurs minutes..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "Copie de la requête et des index de recherche de '$2' vers '$3'." 
echo "L'opération peut prendre plusieurs minutes..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "Echec de la copie des index de texte de '$2' vers '$3'."
echo "Vérifiez la propriété com.ibm.team.fulltext.indexLocation"
echo "définie dans le fichier teamserver.properties."
echo "Copiez manuellement les index de texte vers ce répertoire"
echo "ou exécutez la commande repotools -rebuildTextIndices pour les régénérer."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "Le fichier $NEW_APP_PARENT_DIR/RM_APP.ID n'existe pas"
echo "Créez-le avec la ligne unique contenant l'ID d'application RM"
echo "et essayez à nouveau."
echo ""
;;

# *****************************************
# * Messages for Public URIs verification *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERREUR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Aucun URI public n'est défini dans"
echo "$3,"
echo "par conséquent la mise à niveau ne peut pas être démarrée."
echo ""
echo "Ce fichier doit comporter un URI public défini comme suit :"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "La propriété d'URI public com.ibm.team.repository.server.webapp.url doit être indiquée dans le fichier teamserver.properties."
echo "Ajoutez la propriété au fichier teamserver.properties de l'ancienne installation et associez sa valeur à l'URI racine que tous les clients utilisent pour accéder au serveur."
echo "La racine d'URI public est indispensable au bon fonctionnement de votre nouvelle installation. Sans cette propriété, la mise à niveau ne pourra pas aboutir.  "
echo "Pour plus d'informations, voir la rubrique 'Planification de vos URI' dans la documentation du produit."
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERREUR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Tous les URI publics définis dans"
echo "$3,"
echo "sont mis en commentaire ; par conséquent la mise à niveau ne peut pas être démarrée."
echo ""
echo "Ce fichier doit comporter un URI public non commenté défini comme suit :"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "La propriété d'URI public com.ibm.team.repository.server.webapp.url doit être indiquée dans le fichier teamserver.properties."
echo "Ajoutez la propriété au fichier teamserver.properties de l'ancienne installation et associez sa valeur à l'URI racine que tous les clients utilisent pour accéder au serveur."
echo "La racine d'URI public est indispensable au bon fonctionnement de votre nouvelle installation. Sans cette propriété, la mise à niveau ne pourra pas aboutir."
echo "Pour plus d'informations, voir la rubrique 'Planification de vos URI' dans la documentation du produit."
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "La racine de contexte de JTS est définie sur '$2'."
echo "La racine de contexte de l'application est définie sur '$3'."
echo "La racine de contexte de jts et de l'application ne peuvent pas être identiques."
echo ""
;;

esac

}
