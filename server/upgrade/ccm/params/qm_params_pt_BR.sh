#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  © Copyright IBM Corporation 2006, 2014. Todos os Direitos Reservados.
#
#  Nota sobre Direitos Restritos para Usuários do Governo dos Estados Unidos:
#  Uso, duplicação ou divulgação restritos pelo documento GSA ADP Schedule Contract
#  com a IBM Corporation.
#  *******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8


# #############################################################
# #
# # Definir as variáveis de ambiente correspondentes aos
# # parâmetros de script qm_upgrade.sh e seus valores padrão
# #
# #===========================================================
# #
# # Este arquivo é lido no início da execução do script
# # qm_upgrade.sh. Ele configura uma variável de ambiente
# # por parâmetro válido com um valor padrão predefinido.
# #
# # Usuários podem desejar modificar o valor padrão para
# # ativar o script qm_upgrade.sh com seus próprios valores
# # se precisar inserir o parâmetro e seu
# # valor correspondente manualmente na linha de comandos.
# #
# # AVISO:
# # Nem todas as variáveis precisam ser configuradas para todo
# # aplicativo.  Leia cada comentário cuidadosamente antes de modificar
# # o valor.
# #
# #############################################################

# Parâmetro: -oldApplicationHome
# Uso: -oldApplicationHome <dir path>
# Descrição:
# 	Caminho completo para o diretório inicial do aplicativo na instalação antiga.
# Padrão:
# 	<none>
# Restrições:
#  - este é um parâmetro obrigatório
#  - <dir path> deve ser um diretório existente terminado com 'server/conf'
#    por exemplo. /Jazz/IBM/RQM_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Parâmetro: -applicationContextRoot
# Uso: -applicationContextRoot <root>
# Descrição:
# 	Raiz de contexto do aplicativo.
# Padrão:
# 	qm
# Restrições:
#  - <root> deve ser um nome de diretório válido único (ou seja, sem barra no início)
#
APPLICATION_CONTEXT_ROOT=

# Parâmetro: -oldApplicationVersion
# Uso: -oldApplicationVersion <version>
# Descrição:
# 	A versão que está sendo atualizada.  Por padrão, isso é
#  determinado executando repotools -version com relação ao aplicativo antigo.
# Padrão:
# 	<none>
# Restrições:
#  - deve ser uma sequência completa de versões
#    por exemplo, 3.0.0 ou 3.0.1
#
OLD_APPLICATION_VERSION=

# Parâmetro: -updateTomcatFiles
# Uso: -updateTomcatFiles <yes | no>
# Descrição:
# 	Se os arquivos de configuração do tomcat serão atualizados.
# Padrão:
# 	yes
# Restrições:
#  - Os únicos valores válidos são 'yes' e 'no'
#
UPDATE_TOMCAT_FILES=yes

# Parâmetro: -oldTomcatHome
# Uso: -oldTomcatHome <dir path>
# Descrição:
# 	Caminho completo para o diretório-raiz do Tomcat na instalação antiga.
# Padrão:
# 	<none>
# Restrições:
#  - deve ser um diretório existente
#
OLD_TOMCAT_HOME=

# Parâmetro: -newApplicationHome
# Uso: -newApplicationHome <dir path>
# Descrição:
# 	Caminho para o diretório inicial do Aplicativo na nova instalação.
# Padrão:
# 	conf
# Restrições:
#  - Somente aceito para upgrade do RTC, QM e RM
#  - Quando aceito, este é um parâmetro obrigatório
#  - <dir path> deve ser um diretório existente terminado em 'server/conf'
#    ex.: /Jazz/IBM/RQM_3.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parâmetro: -newJTSHome
# Uso: -newJTSHome <dir path>
# Descrição:
# 	Caminho completo para o diretório inicial do JTS no JTS que a nova instalação irá usar.
# Padrão:
# 	O novo diretório inicial do aplicativo
# Restrições:
#  - <dir path> deve ser um diretório existente terminado em 'server/conf'
#    ex.: /Jazz/IBM/RQM_3.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# Parâmetro: -jtsContextRoot
# Uso: -jtsContextRoot <root>
# Descrição:
# 	Raiz de contexto do servidor JTS.
# Padrão:
# 	jts
# Restrições:
#  - <root> deve ser um nome de diretório único válido (por exemplo, sem barra inicial)
#
JTS_CONTEXT_ROOT=jts

# Parâmetro: -newApplicationTomcatHome
# Uso: -newApplicationTomcatHome <dir path>
# Descrição:
# 	Caminho para o diretório-raiz do Tomcat do Aplicativo na nova instalação.
# Padrão:
# 	<none>
#
NEW_TOMCAT_HOME=

# Parâmetro: -newJTSTomcatHome
# Uso: -newJTSTomcatHome <dir path>
# Descrição:
# 	Caminho para o diretório-raiz do Tomcat do JTS no JTS que a nova instalação irá usar.
# Padrão:
# 	<none>
#
NEW_JTS_TOMCAT_HOME=

# Parâmetro: -noPrompt
# Uso: -noPrompt
# Descrição:
# 	Não avisar antes de criar ou modificar as tabelas
# Padrão:
# 	<none>
# Restrições:
#  - Os únicos valores válidos são empty ou 'noPrompt'
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# Parâmetro: -noVerify
# Uso: -noVerify
# Descrição:
# 	Não executar a verificação de arquivos teamserver.properties.
# Padrão:
# 	<none>
# Restrições:
#  - os únicos valores válidos são vazio ou 'noVerify'
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Parâmetro: -noStepPrompt
# Uso: -noStepPrompt
# Descrição:
# 	Não avisar antes de executar uma etapa.
# Padrão:
#   false
# Restrições:
#  - Os únicos valores válidos são 'true' ou 'false'
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Parâmetro: -noEditor
# Uso: -noEditor
# Descrição:
#   Não abra um editor nos arquivos teamserver.properties.
# Padrão:
#   false
# Restrições:
#  - Os únicos valores válidos são 'true' ou 'false' ou vazio
#
# NO_EDITOR=false
NO_EDITOR=false
