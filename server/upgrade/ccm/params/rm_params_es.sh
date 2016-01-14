#!/bin/sh
# *******************************************************************************
#  Materiales bajo licencia - Propiedad de IBM
#  (c) Copyright IBM Corporation 2006, 2014. Reservados todos los derechos.
#
#  Nota sobre los derechos restringidos de los usuarios del Gobierno de EE.UU:
#  Utilización, duplicación o divulgación restringidas por el GSA ADP Schedule
#  Contract con IBM Corp.
#  *******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8


# #############################################################
# #
# # Defina las variables de entorno correspondientes a los
# # parámetros del script rm_upgrade.sh y sus valores
# # predeterminados.
# #===========================================================
# #
# # Este archivo se lee al comienzo de la ejecución del
# # script rm_upgrade.sh. Define una variable de entorno por
# # cada parámetro válido con un valor predeterminado.
# #
# # Es posible que los usuarios deseen modificar el valor predeterminado
# # para lanzar el script rm_upgrade.sh con sus propios valores
# # sin tener que especificar de forma manual el parámetro y su
# # valor correspondiente en la línea de mandatos.
# #
# # AVISO:
# # No es necesario definir todas las variables para cada
# # aplicación.  Lea cada comentario detenidamente antes de modificar
# # el valor.
# #
# #############################################################

# Parámetro: -oldApplicationHome
# Uso: -oldApplicationHome <vía acceso dir>
# Descripción:
# 	Vía de acceso completa al directorio de inicio de la aplicación en la instalación anterior.
#  Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - es un parámetro obligatorio
#  - <vía acceso dir> debe ser un directorio existente que termine en 'server/conf'
#    por ej. /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Parámetro: -applicationContextRoot
# Uso: -applicationContextRoot <raíz>
# Descripción:
# 	Raíz de contexto de aplicación.
#  Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - <raíz> debe ser un nombre único de directorio válido (por ejemplo, sin ninguna barra inclinada inicial)
#
APPLICATION_CONTEXT_ROOT=

# Parámetro: -oldApplicationVersion
# Uso: -oldApplicationVersion <versión>
# Descripción:
# 	La versión que se está actualizando.  De forma predeterminada, se
#   determina ejecutando repotools -version en la aplicación anterior.
# Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - debe ser una serie de versión completa
#    por ej. 5.0.0 o 5.0.1
#
OLD_APPLICATION_VERSION=

# Parámetro: -updateTomcatFiles
# Uso: -updateTomcatFiles <yes | no>
# Descripción:
# 	Si deben actualizarse los archivos de configuración tomcat.
# Valor predeterminado:
# 	yes
# Restricciones:
#  - Los únicos valores válidos son 'yes' y 'no'
#
UPDATE_TOMCAT_FILES=yes

# Parámetro: -oldApplicationTomcatHome
# Uso: -oldApplicationTomcatHome <vía acceso dir>
# Descripción:
# 	Vía de acceso completa al directorio raíz Tomcat de la aplicación en la instalación anterior.
# Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Solo se acepta para la actualización de RM
#  - Debe ser un directorio existente
OLD_TOMCAT_HOME=

# Parámetro: -oldJTSTomcatHome
# Uso: -oldJTSTomcatHome <vía acceso dir>
# Descripción:
# 	Vía de acceso completa al directorio raíz de Tomcat de JTS en la instalación anterior.
# Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Solo se acepta para la actualización de RM
#  - Debe ser un directorio existente
#
OLD_JTS_TOMCAT_HOME=

# Parámetro: -newApplicationHome
# Uso: -newApplicationHome <vía acceso dir>
# Descripción:
# 	Vía de acceso al directorio de inicio de la aplicación de la nueva instalación.
# Valor predeterminado:
# 	conf
# Restricciones:
#  - Solo se acepta en actualizaciones RTC, QM y RM
#  - Cuando se acepta, es un parámetro obligatorio
#  - <vía acceso dir> debe ser un directorio existente que termine en 'server/conf'
#    por ej. /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parámetro: -newJTSHome
# Uso: -newJTSHome <vía acceso dir>
# Descripción:
# 	Vía de acceso completa al directorio de inicio de JTS del JTS que la nueva instalación utilizará.
# Valor predeterminado:
# 	El nuevo directorio de inicio de aplicación
# Restricciones:
#  - <vía acceso dir> debe ser un directorio existente que termine en 'server/conf'
#
NEW_JTS_HOME=

# Parámetro: -newJTSContextRoot
# Uso: -newJTSContextRoot <raíz>
# Descripción:
# 	Raíz de contexto del nuevo servidor JTS.
# Valor predeterminado:
# 	jts
# Restricciones:
#  - <raíz> debe ser un nombre único de directorio válido (por ejemplo, sin ninguna barra inclinada inicial)
#
JTS_CONTEXT_ROOT=jts

# Parámetro: -newApplicationTomcatHome
# Uso: -newApplicationTomcatHome <vía acceso dir>
# Descripción:
# 	Vía de acceso al directorio raíz de Tomcat de la aplicación de la nueva instalación.
# Valor predeterminado:
# 	<ninguno>
#
NEW_TOMCAT_HOME=

# Parámetro: -newJTSTomcatHome
# Uso: -newJTSTomcatHome <vía acceso dir>
# Descripción:
# 	Vía de acceso al directorio raíz de Tomcat de JTS del JTS que la nueva instalación utilizará.
#  Valor predeterminado:
# 	<ninguno>
#
NEW_JTS_TOMCAT_HOME=

# Parámetro: -overwrite
# Uso: -overwrite
# Descripción:
# 	Forzar la sobrescritura (es decir, utilizar siempre overwrite=yes) mientras se ejecutan mandatos repotools
# Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Los únicos valores válidos son en blanco u 'overwrite=yes'
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# Parámetro: -noVerify
# Uso: -noVerify
# Descripción:
# 	No efectúa verificación (es decir, utiliza siempre noVerify) al ejecutar mandatos repotools
# Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Los únicos valores válidos están vacíos o son 'noVerify'
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Parámetro: -noStepPrompt
# Uso: -noStepPrompt
# Descripción:
# 	No solicitar antes de cada paso de actualización
# Valor predeterminado:
# 	false
# Restricciones:
#  - Los únicos valores válidos son 'true' o 'false'
#
# NO_PROMPT=true
NO_STEP_PROMPT=false

# Parámetro: -noEditor
# Uso: -noEditor
# Descripción:
#   No abrir un editor en los archivos teamserver.properties.
# Valor predeterminado:
#   false
# Restricciones:
#  - Los únicos valores válidos son 'true' o 'false'
#
# NO_EDITOR=false
NO_EDITOR=false


# Parámetro: -db.jdbc.location
# Uso: -db.jdbc.location <JDBC_URL>
# Descripción:
# 	Ubicación JDBC de la base de datos de RM. (Solo se necesita al pasar de la versión 4.x a la 5.x)
#
#		Ejemplos:
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		TENGA EN CUENTA:
#			En sistemas *-nix, es necesario escapar muchos caracteres (como: |  &  ;  <  >  (  )  $  `  \  "  '  <espacio>  <tabulación>  <nueva línea>)
#			con una barra inclinada invertida. 
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Solo se aceptan para la actualización de RM desde 4.x
#
DB_JDBC_LOCATION_VALUE=

# Parámetro: -db.jdbc.password
# Uso: -db.jdbc.password <CONTRASEÑA_JDBC>
# Descripción:
# 	Contraseña (texto sin formato o cifrado) que se sustituirá si aparece "{password}" en el URL de JDBC. 
# Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Se debe especificar si el URL de JDBC para la base de datos de RM contiene {password}
#
DB_JDBC_PASSWORD_VALUE=

# Parámetro: -db.db2i.schema.name
# Uso: -db.db2i.schema.name <SCHEMA_NAME>
# Descripción:
# 	El nombre de esquema de la base de datos DB2i.
# Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Debe especificarse utilizando el tipo de base de datos DB2i. 
#
DB_DB2I_SCHEMA_NAME_VALUE=

# Parámetro: -db.db2.dsn.dbname
# Uso: -db.db2.dsn.dbname <DSN_DBNAME>
# Descripción:
# 	El nombre de base de datos DSN de DB2Z.
# Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Debe especificarse utilizando el tipo de base de datos DB2z. 
#
DB_DB2_DSN_DBNAME_VALUE=

# Parámetro: -db.schemaPrefix
# Uso: -db.schemaPrefix <SCHEMA_PREFIX>
# Descripción:
# 	El prefijo de esquema de base de datos. 
# Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Debe especificarse utilizando el tipo de base de datos DB2z. 
#
DB_SCHEMA_PREFIX_VALUE=

# Parámetro: -oldJTSHome
# Uso: -oldJTSHome <vía acceso dir>
# Descripción:
# 	Vía de acceso completa al directorio de inicio de JTS en la instalación anterior.
# valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - <vía acceso dir> debe ser un directorio existente terminado en 'server/conf'
#  - Sólo válido para actualizaciones de RM y JTS
#
OLD_JTS_HOME=

# Parámetro: -lpaContextRoot
# Uso: -lpaContextRoot <raíz>
# Descripción:
# 	La raíz de contexto de LPA
# Valor predeterminado:
# 	admin
# Restricciones:
#  - <raíz> debe ser un nombre único de directorio válido (es decir, sin ninguna barra inclinada inicial)
#
LPA_CONTEXT_ROOT=admin
