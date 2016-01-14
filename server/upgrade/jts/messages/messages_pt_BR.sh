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
echo "Não execute o script app_upgrade diretamente.  Para fazer upgrade do JTS ou do aplicativo, execute um dos comandos a seguir:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Use -help para uma descrição completa dos comandos acima."
;;

INVALID_START_DIR )
echo ""
echo "Exceto ao usar o parâmetro -help, o script $2 deve ser executado em $3"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "O arquivo '$2' contém os valores de parâmetro para script de atualização."
echo "Se precisar modificar qualquer valor de parâmetro padrão, é possível editar estes arquivos ou especificar os valores de parâmetro como argumentos de linha de comandos para os scripts de atualização."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "O seguinte conjunto de arquivos contém valores de parâmetro padrão para um aplicativo ou atualização de JTS.  Se for necessário modificar qualquer valor de parâmetro padrão, é possível editar estes arquivos ou especificar os valores de parâmetro como argumentos de linha de comandos para os scripts de atualização."
echo "- Upgrade do CCM: $2/params/ccm_params$3.sh"
echo "- Upgrade do GC:  $2/params/gc_params$3.sh"
echo "- Upgrade do QM:  $2/params/qm_params$3.sh"
echo "- Upgrade do RM:  $2/params/rm_params$3.sh"
echo "- Upgrade do JTS: $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Parameters verification messages *
# ************************************

# Intrinsic verification
# ======================

MISSING_APP_TYPE )
echo ""
echo "Nenhum JTS ou tipo de aplicativo foi especificado.  Para fazer upgrade do JTS ou do aplicativo, execute um dos comandos a seguir:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Use -help para uma descrição completa dos comandos acima."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2 não é um JTS ou tipo de aplicativo válido.  Para fazer upgrade do JTS ou do aplicativo, execute um dos comandos a seguir:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Use -help para uma descrição completa dos comandos acima."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "Valor ausente para o parâmetro $2."
echo "Use -help para obter uma descrição completa dos parâmetros."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "O diretório $3, especificado para o parâmetro $2, não existe ou não é válido."
echo "Use -help para obter uma descrição completa dos parâmetros."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "O diretório $3 especificado para o parâmetro $2 deve ser uma caminho absoluto."
echo "Use -help para obter uma descrição completa dos parâmetros."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "O arquivo $3, especificado para o parâmetro $2, não existe ou não é válido."
echo "Use -help para obter uma descrição completa dos parâmetros."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3 é um valor inválido para o parâmetro $2."
echo "Use -help para obter uma descrição completa dos parâmetros."
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2 é um parâmetro desconhecido."
echo "Use -help para obter uma descrição completa dos parâmetros."
echo ""
;;


# Extrinsic verification
# ======================

MISSING_HOME_PARAM )
echo ""
echo "Parâmetro $2 do diretório inicial ausente."
echo "Use -help para obter uma descrição completa dos parâmetros."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "O diretório $2 não existe ou não é válido."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "Não é possível localizar o comando repotools do aplicativo '$2'."
echo ""
echo "Verifique se o parâmetro -oldApplicationHome '$3' está apontando para o diretório de configuração do servidor antigo, por exemplo, 'JazzInstallRoot/server/conf'."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "Não é possível localizar o comando repotools do aplicativo '$2'."
echo ""
echo "Verifique se o parâmetro -oldApplicationHome '$3' está apontando para o diretório de configuração do servidor antigo, por exemplo, 'JazzInstallRoot/server/conf', e se o parâmetro jtsContextRoot '$4' está correto."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "Não é possível localizar o arquivo de configuração '$2'."
echo ""
echo "Verifique se o parâmetro -oldApplicationHome '$3' está apontando para o diretório de configuração do servidor antigo, por exemplo, 'JazzInstallRoot/server/conf'."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "Não é possível localizar o arquivo de configuração '$2'."
echo ""
echo "Verifique se o parâmetro -oldApplicationHome '$3' está apontando para o diretório de configuração do servidor antigo, por exemplo, 'JazzInstallRoot/server/conf', e se o parâmetro jtsContextRoot '$4' está correto."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "Não é possível localizar o comando repotools do aplicativo '$2'."
echo ""
echo "Verifique se o parâmetro -newApplicationHome '$3' está apontando para o novo diretório de configuração do servidor de aplicativos, por exemplo, 'JazzInstallRoot/server/conf', e se o parâmetro applicationContextRoot '$4' está correto."
echo "Se você estiver fazendo upgrade de uma liberação anterior, assegure-se de que tenha selecionado as raízes de contexto corretas.  Por exemplo, se estiver usando o Installation Manager, você deverá selecionar a opção de raiz de contexto $5 no painel "Opções de Raiz de Contexto".  Se tiver selecionado, acidentalmente, uma opção diferente, você deverá reinstalar o produto com a opção de raiz de contexto $5."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "Não é possível localizar o arquivo de configuração '$2'."
echo ""
echo "Verifique se o parâmetro -newApplicationHome '$3' está apontando para o novo diretório de configuração do servidor JTS, por exemplo, 'JazzInstallRoot/server/conf', e se o parâmetro applicationContextRoot '$4' está correto."
echo "Se você estiver fazendo upgrade de uma liberação anterior, assegure-se de que tenha selecionado as raízes de contexto corretas.  Por exemplo, se estiver usando o Installation Manager, você deverá selecionar a opção de raiz de contexto $5 no painel "Opções de Raiz de Contexto".  Se tiver selecionado, acidentalmente, uma opção diferente, você deverá reinstalar o produto com a opção de raiz de contexto $5."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "Não é possível localizar o comando JTS repotools '$2'."
echo ""
echo "Verifique se o parâmetro -oldJTSHome '$3' está apontando para o diretório de configuração antigo do servidor JTS, por exemplo, 'JazzInstallRoot/server/conf', e se o parâmetro jtsContextRoot '$4' está correto."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "Não é possível localizar o arquivo de configuração '$2'."
echo ""
echo "Verifique se o parâmetro -oldJTSHome '$3' está apontando para o diretório de configuração antigo do servidor JTS, por exemplo, 'JazzInstallRoot/server/conf', e se o parâmetro jtsContextRoot '$4' está correto."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "Não é possível localizar o comando JTS repotools '$2'."
echo ""
echo "Verifique se o parâmetro -newJTSHome '$3' está apontando para o novo diretório de configuração do servidor JTS, por exemplo, 'JazzInstallRoot/server/conf', e se o parâmetro jtsContextRoot '$4' está correto."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "Não é possível localizar o arquivo de configuração '$2'."
echo ""
echo "Verifique se o parâmetro -newJTSHome '$3' está apontando para o novo diretório de configuração do servidor JTS, por exemplo, 'JazzInstallRoot/server/conf', e se o parâmetro jtsContextRoot '$4' está correto."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "Um arquivo tar que contenha dados 2.x é necessário para o upgrade de $2."
echo "Use -help para obter uma descrição completa dos parâmetros."
echo ""
;;


# **********************
# * Execution messages *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    Upgrade do JTS    ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    Upgrade do CCM    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===   Upgrade do GC  ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    Upgrade do QM    ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    Upgrade do RM    ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "Verificando a versão antiga do aplicativo RM... "
;;

RM_DISPLAY_OLD_VERSION )
echo "A versão antiga do aplicativo RM é '$2'"
;;

# *********************
# * First step switch *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "Última execução falhou na etapa inicial..."
;;

LAST_STEP_FAILED )
echo ""
echo "Última execução falhou na etapa $2..."
echo "Deseja reiniciar o upgrade a partir desta etapa ou de uma anterior?"
;;

ALREADY_RUN )
echo ""
echo "O upgrade já foi feito e concluído com sucesso..."
echo "Deseja reiniciar um novo a partir de uma etapa específica?"
;;

LAST_STEP_PASSED )
echo ""
echo "Última execução foi interrompida com sucesso na etapa $2..."
echo "Deseja reiniciar o upgrade a partir da etapa $3 atual ou de uma anterior?"
;;

ENTER_NEXT_STEP )
echo ""
echo "Insira o número da etapa [$2-$3] a partir da qual você deseja reiniciar o upgrade ou [Enter] para Cancelar:"
;;

INTEGER_STEP_NUMBER )
echo ""
echo "'$2' não é um número. Insira um número de etapa válido."
;;

INVALID_STEP_NUMBER )
echo ""
echo "'$2' é um número de etapa inválido. Insira um número de etapa válido."
;;

MAX_STEP_NUMBER )
echo ""
echo "A última etapa é a etapa $2, portanto, não é possível reiniciar o upgrade na etapa $3."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "A etapa $2 não foi executada ainda, portanto, não é possível reiniciar o upgrade na etapa $3."
;;


# **********************
# * Messages for Steps *
# **********************

STEP_0_IBMi )
echo "Etapa 0: Eliminar tabelas"
echo "-------------------"
;;

STEP_0 )
echo "Etapa 0: Atualizar arquivos de configuração"
echo "---------------------------"
;;

STEP_1_ADD )
echo "Etapa 1: Incluir tabelas"
echo "------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "Etapa $2: Reconstruir índices de texto"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "Etapa $2: Recriar índices de consulta e procura"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "Etapa $2: Mesclar LPA com JTS"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "Etapa $2: Corrigir a URL frontal de áreas de armazenamento LPA"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "Etapa $2: Remover LPA amigo do RM"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "Etapa 2: Atualizar esquema de data warehouse"
echo "-------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "Etapa $2: Finalizar aplicativo RM"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "Etapa $2: Finalizar o aplicativo JTS"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "Etapa $2: Reindexar o aplicativo RM"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "A atualização $2 falhou na etapa $3.  Corrija o problema e execute o script novamente começando na etapa $3."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "A atualização $2 foi bem-sucedida.  Você pode atualizar quaisquer aplicativos em seu ambiente agora."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "A porção offline do upgrade do RM foi bem-sucedida. Você pode agora iniciar os servidores em sua implementação."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "A parte offline do upgrade do RM foi bem-sucedida. Há uma etapa restante"
echo "necessária para concluir a migração, mas ela requer que todos os servidores"
echo "vinculados ao RM (como RTC, RQM, JRS, GC) estejam online. Quando adequado, torne visível"
echo "todos os servidores (incluindo o RM). É recomendável que você efetue login em cada servidor"
echo "e assegure-se de que eles estejam funcionando corretamente. Em seguida, execute este comando:"
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "A atualização $2 foi bem-sucedida.  Você pode agora iniciar os servidores em sua implementação."
echo ""
;;

# *******************************
# * Messages while running step *
# *******************************

STEP_DIR_CMD )
echo ""
echo "Diretório: $2"
echo "Comando:"
;;

ENTER_STEP_ACTION )
echo "Insira [E] para executar esta etapa, [S] para ignorá-la ou pressione [Enter] para cancelar a execução do script:"
;;

INVALID_STEP_ACTION )
echo ""
echo "'$2' é uma entrada inválida, somente 'E', 'S' ou 'Enter' são permitidos"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "Um editor vi será aberto para permitir que você verifique o arquivo teamserver.properties $2."
echo "Verifique se a raiz de URI Público denotada pela propriedade com.ibm.team.repository.server.webapp.url está correta."
echo "Verifique se as propriedades do banco de dados estão corretas."
echo "Quando concluído, salve as mudanças se houver alguma e feche o editor para continuar a execução do script."
echo ""
echo "Consulte o tópico 'Fazendo upgrade do Rational solution for CLM' da documentação do produto"
echo "para obter informações sobre como configurar corretamente cada propriedade."
;;

PAUSE )
echo ""
echo "Insira [C] para continuar a execução ou pressione [Enter] para cancelar a execução do script:"
;;

INVALID_PAUSE_ACTION )
echo ""
echo "'$2' é uma entrada inválida, somente 'C' ou 'Enter' são permitidos"
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "Copiando índices de texto de '$2' para '$3'."
echo "Isso pode levar vários minutos..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "Copiando índices de consulta e procura de '$2' para '$3'." 
echo "Isso pode levar vários minutos..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "Falha ao copiar índices de texto de '$2' para '$3'."
echo "Verifique a propriedade com.ibm.team.fulltext.indexLocation"
echo "definida no arquivo teamserver.properties."
echo "Copie manualmente os índices de texto para este diretório"
echo "ou execute repotools -rebuildTextIndices para recriá-los."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "O arquivo $NEW_APP_PARENT_DIR/RM_APP.ID não existe"
echo "Crie este arquivo com a linha única que contém o ID do Aplicativo do RM"
echo "e tente novamente."
echo ""
;;

# *****************************************
# * Messages for Public URIs verification *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERRO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Não há nenhuma URI Pública em"
echo "$3,"
echo "portanto, o upgrade não pode ser iniciado."
echo ""
echo "Deve haver um URI Público neste arquivo definido conforme a seguir:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "A propriedade de URI Público com.ibm.team.repository.server.webapp.url deve estar presente no arquivo teamserver.properties."
echo "Inclua a propriedade no arquivo teamserver.properties da instalação antiga e configure o valor para ser a raiz do URI que todos os clientes usam para acessar o servidor."
echo "A raiz do URI Público é essencial para o funcionamento adequado de sua nova instalação. A atualização não será concluída com sucesso sem esta propriedade.  "
echo "Para obter mais informações, consulte o tópico da documentação do produto em 'Planejando URIs'."
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERRO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Todas as URIs Públicas definidas em"
echo "$3,"
echo "possuem linhas de comentários, portanto, o upgrade não pode ser iniciado."
echo ""
echo "Deveria ter um URI Público não comentado neste arquivo definido conforme a seguir:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "A propriedade de URI Público com.ibm.team.repository.server.webapp.url deve estar presente no arquivo teamserver.properties."
echo "Inclua a propriedade no arquivo teamserver.properties da instalação antiga e configure o valor para ser a raiz do URI que todos os clientes usam para acessar o servidor."
echo "A raiz do URI Público é essencial para o funcionamento adequado de sua nova instalação. A atualização não será concluída com sucesso sem esta propriedade."
echo "Para obter mais informações, consulte o tópico da documentação do produto em 'Planejando URIs'."
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "A raiz de contexto do JTS está configurada como '$2'."
echo "A raiz de contexto do aplicativo está configurada como '$3'."
echo "As raízes de contexto do jts e do aplicativo não podem ser iguais."
echo ""
;;

esac

}
