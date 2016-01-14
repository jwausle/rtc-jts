#!/bin/sh
# *******************************************************************************
#  Materiais Licenciados - Propriedade da IBM
#  (c) Copyright IBM Corporation 2006, 2014. Todos os Direitos Reservados.
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
# # parâmetros de rm_upgrade.sh e seus valores padrão
# #
# #===========================================================
# #
# # Este arquivo é lido no início da execução do script
# # rm_upgrade.sh. Ele configura uma variável de ambiente
# # por parâmetro válido com um valor padrão predefinido.
# #
# # Usuários podem desejar modificar o valor padrão para
# # ativar o script rm_upgrade.sh com seus próprios valores
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
#    por exemplo, /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Parâmetro: -applicationContextRoot
# Uso: -applicationContextRoot <root>
# Descrição:
# 	Raiz de contexto do aplicativo.
# Padrão:
# 	<none>
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
#    por exemplo, 5.0.0 ou 5.0.1
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

# Parâmetro: -oldApplicationTomcatHome
# Uso: -oldApplicationTomcatHome <dir path>
# Descrição:
# 	Caminho completo para o diretório raiz do Tomcat do Aplicativo na instalação antiga.
# Padrão:
# 	<none>
# Restrições:
#  - Aceito somente para o upgrade do RM
#  - Deve estar em um diretório existente
#
OLD_TOMCAT_HOME=

# Parâmetro: -oldJTSTomcatHome
# Uso: -oldJTSTomcatHome <dir path>
# Descrição:
# 	Caminho completo para o diretório raiz do Tomcat do JTS na instalação antiga.
# Padrão:
# 	<none>
# Restrições:
#  - Aceito somente para upgrade do RM
#  - Deve estar em um diretório existente
#
OLD_JTS_TOMCAT_HOME=

# Parâmetro: -newApplicationHome
# Uso: -newApplicationHome <dir path>
# Descrição:
# 	Caminho para o diretório inicial do Aplicativo na nova instalação.
# Padrão:
# 	conf
# Restrições:
#  - somente aceito para upgrade do RTC, QM e RM
#  - quando aceito, este é um parâmetro obrigatório
#  - <dir path> deve ser um diretório existente terminado em 'server/conf'
#    e.g. /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parâmetro: -newJTSHome
# Uso: -newJTSHome <dir path>
# Descrição:
# 	Caminho completo para o diretório inicial do JTS no JTS que a nova instalação irá usar.
# Padrão:
# 	O novo diretório inicial do aplicativo
# Restrições:
#  - <dir path> deve estar em um diretório existente terminado em 'server/conf'
#
NEW_JTS_HOME=

# Parâmetro: -newJTSContextRoot
# Uso: -newJTSContextRoot <root>
# Descrição:
# 	Raiz de contexto do novo servidor JTS.
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

# Parâmetro: -overwrite
# Uso: -overwrite
# Descrição:
# 	Forçar a sobrescrição (ex. sempre usar overwrite=yes) ao executar qualquer comando repotools
# Padrão:
# 	<none>
# Restrições:
#  - Os únicos valores válidos são vazio ou 'overwrite=yes'
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# Parâmetro: -noVerify
# Uso: -noVerify
# Descrição:
# 	Não executar nenhuma verificação (ex. sempre usar noVerify) ao executar quaisquer comandos repotools                                                                                                    # Padrão: # 	<none>
# Restrições:
#  - Os únicos valores válidos são vazio ou 'noVerify'
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Parâmetro: -noStepPrompt
# Uso: -noStepPrompt
# Descrição:
# 	Não avisar antes de cada etapa de upgrade
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
#  - Os únicos valores válidos são 'true' ou 'false' ou vazio
#
# NO_EDITOR=false
NO_EDITOR=false


# Parâmetro: -db.jdbc.location
# Uso: -db.jdbc.location <JDBC_URL>
# Descrição:
# 	O local do JDBC para o banco de dados do RM. (Necessário somente ao mover de 4.x para 5.x)
#
#		Exemplos:
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		NOTA:
#			Nos sistemas *-nix, vários caracteres (como: |  &  ;  <  >  (  )  $  `  \  "  '  <space>  <tab>  <newline>)
#			requerem caracteres de escape com uma barra invertida. 
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# Padrão:
# 	<none>
# Restrições:
#  - Aceito apenas para upgrade do RM de 4.x
#
DB_JDBC_LOCATION_VALUE=

# Parâmetro: -db.jdbc.password
# Uso: -db.jdbc.password <JDBC_PASSWORD>
# Descrição:
# 	A senha (texto simples ou criptografada) que será substituída se "{password}" aparecer na URL do JDBC.
# Padrão:
# 	<none>
# Restrições:
#  - Deve ser especificada se a URL do JDBC para o banco de dados RM contiver {password}
#
DB_JDBC_PASSWORD_VALUE=

# Parâmetro: -db.db2i.schema.name
# Uso: -db.db2i.schema.name <SCHEMA_NAME>
# Descrição:
# 	O nome do esquema do BD DB2 Interactive.
# Padrão:
# 	<none>
# Restrições:
#  - deve ser especificado usando o tipo de banco de dados DB2i.
#
DB_DB2I_SCHEMA_NAME_VALUE=

# Parâmetro: -db.db2.dsn.dbname
# Uso: -db.db2.dsn.dbname <DSN_DBNAME>
# Descrição:
# 	O nome do DB DB2Z DSN.
# Padrão:
# 	<none>
# Restrições:
#  - deve ser especificado usando o tipo de banco de dados DB2z.
#
DB_DB2_DSN_DBNAME_VALUE=

# Parâmetro: -db.schemaPrefix
# Uso: -db.schemaPrefix <SCHEMA_PREFIX>
# Descrição:
# 	O prefixo do esquema do DB.
# Padrão:
# 	<none>
# Restrições:
#  - deve ser especificado usando o tipo de banco de dados DB2z.
#
DB_SCHEMA_PREFIX_VALUE=

# Parâmetro: -oldJTSHome
# Uso: -oldJTSHome <dir path>
# Descrição:
# 	Caminho completo para o diretório inicial do JTS na instalação antiga.
# Padrão:
# 	<none>
# Restrições:
#  - <dir path> deve ser um diretório existente terminado por 'server/conf'
#  - Válido somente para upgrades do RM e JTS
#
OLD_JTS_HOME=

# Parâmetro: -lpaContextRoot
# Uso: -lpaContextRoot <root>
# Descrição:
# 	A raiz de contexto de LPA
# Padrão:
# 	admin
# Restrições:
#  - <root> deve ser um nome de diretório único válido (isto é, sem barra inicial)
#
LPA_CONTEXT_ROOT=admin
