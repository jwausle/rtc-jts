#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2015. Todos os direitos reservados.
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
# # parâmetros de script gc_upgrade.sh e seus valores padrão
# #
# #===========================================================
# #
# # Este arquivo é lido no início da execução do script
# # rm_upgrade.sh. Ele configura uma variável de ambiente
# # por parâmetro válido com um valor padrão predefinido.
# #
# # Usuários podem desejar modificar o valor padrão para
# # ativar o script gc_upgrade.sh com seus próprios valores
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
# 	Caminho completo para o diretório inicial do aplicativo na instalação 3.0.1
# Padrão:
# 	<none>
# Restrições:
#  - este é um parâmetro obrigatório
#  - <dir path> deve ser um diretório existente terminado com 'server/conf'
#    por exemplo, /QIBM/UserData/JazzTeamServer301Backup/server/conf
#
OLD_APPLICATION_HOME=

# Parâmetro: -applicationContextRoot
# Uso: -applicationContextRoot <root>
# Descrição:
# 	Raiz de contexto de aplicativos do servidor 3.0.1.
# Padrão:
# 	gc
# Restrições:
#  - <root> deve ser um nome de diretório válido único (ou seja, sem barra no início)
#
APPLICATION_CONTEXT_ROOT=

# Parâmetro: -oldApplicationVersion
# Uso: -oldApplicationVersion <version>
# Descrição:
# 	A versão 3.0.x que está sendo atualizada.  Por padrão, isso é
#  determinado executando repotools -version com relação ao aplicativo antigo.
# Padrão:
# 	<none>
# Restrições:
#  - deve ser uma sequência de versões completa
#    por exemplo, 3.0.0 ou 3.0.1
#
OLD_APPLICATION_VERSION=

# Parâmetro: -updateTomcatFiles
# Uso: -updateTomcatFiles <yes | no>
# Descrição:
# 	Se os arquivos de configuração do tomcat serão atualizados.
# Padrão:
# 	no
# Restrições:
#  - Os únicos valores válidos são 'yes' e 'no'
#
UPDATE_TOMCAT_FILES=no

# Parâmetro: -oldTomcatHome
# Uso: -oldTomcatHome <dir path>
# Descrição:
# 	Caminho completo para o diretório raiz do Tomcat na instalação 3.0.1.
# Padrão:
# 	<none>
# Restrições:
#  - Deve ser um diretório existente
#
OLD_TOMCAT_HOME=

# Parâmetro: -newApplicationHome
# Uso: -newApplicationHome <dir path>
# Descrição:
# 	Caminho para o diretório inicial do Aplicativo na instalação 4.0.
# Padrão:
# 	conf
# Restrições:
#  - somente aceito para upgrade do RTC, QM, GC e RM
#  - quando aceito, este é um parâmetro obrigatório
#  - <dir path> deve ser um diretório existente terminado em 'server/conf'
#    por exemplo, /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parâmetro: -newJTSHome
# Uso: -newJTSHome <dir path>
# Descrição:
# 	Caminho completo para o diretório inicial do JTS na instalação 4.0.
# Padrão:
# 	O novo diretório inicial do aplicativo
# Restrições:
#  - <dir path> deve estar em um diretório existente terminado em 'server/conf'
#    por exemplo, /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# Parâmetro: -jtsContextRoot
# Uso: -jtsContextRoot <root>
# Descrição:
# 	Raiz de contexto do servidor JTS 4.0.
# Padrão:
# 	jts
# Restrições:
#  - <root> deve ser um nome de diretório único válido (por exemplo, sem barra inicial)
#
JTS_CONTEXT_ROOT=jts

# Parâmetro: -newApplicationTomcatHome
# Uso: -newApplicationTomcatHome <dir path>
# Descrição:
# 	Caminho para o diretório raiz do Aplicativo Tomcat na instalação 4.0.
# Padrão:
# 	<none>
#
NEW_TOMCAT_HOME=

# Parâmetro: -newJTSTomcatHome
# Uso: -newJTSTomcatHome <dir path>
# Descrição:
# 	Caminho para o diretório raiz do JTS Tomcat na instalação 4.0.
# Padrão:
# 	<none>
#
NEW_JTS_TOMCAT_HOME=

# Parâmetro: -ignoreJTSVersionCheck
# Uso: -ignoreJTSVersionCheck
# Descrição:
# 	Não tente verificar se a versão do aplicativo
#   é compatível com a versão do Jazz Team Server localizada em newJTSHome.
# Padrão:
# 	<none>
# Restrições:
#  - os únicos valores válidos são vazio ou 'ignoreJTSVersionCheck'
#
IGNORE_JTS_VERSION_CHECK=

# Parâmetro: -noPrompt
# Uso: -noPrompt
# Descrição:
# 	Não avisar antes de criar ou modificar as tabelas
# Padrão:
# 	noPrompt
# Restrições:
#  - Os únicos valores válidos são vazio ou 'noPrompt'
#
# NO_PROMPT=
NO_PROMPT=noPrompt

# Parâmetro: -noVerify
# Uso: -noVerify
# Descrição:
# 	Não executar a verificação de arquivos teamserver.properties.
# Padrão:
#   noVerify
# Restrições:
#  - Os únicos valores válidos são vazio ou 'noVerify'
#
# NO_VERIFY=
NO_VERIFY=noVerify

# Parâmetro: -noStepPrompt
# Uso: -noStepPrompt
# Descrição:
# 	Não avisar antes de executar uma etapa.
# Padrão:
# 	false
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
#  - Os únicos valores válidos são 'true' ou 'false'
#
# NO_EDITOR=false
NO_EDITOR=false
