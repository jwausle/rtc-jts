#!/bin/sh
# *******************************************************************************
#  Materiales bajo licencia - Propiedad de IBM
#  © Copyright IBM Corporation 2006, 2014. Reservados todos los derechos.
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
# # parámetros del script jts_upgrade.sh y sus valores
# # predeterminados.
# #===========================================================
# #
# # Este archivo se lee al comienzo de la ejecución del
# # script jts_upgrade.sh. Define una variable de entorno por
# # cada parámetro válido con un valor predeterminado.
# #
# # Es posible que los usuarios deseen modificar el valor predeterminado
# # para lanzar el script jts_upgrade.sh con sus propios valores
# # sin tener que especificar de forma manual el parámetro y su
# # valor correspondiente en la línea de mandatos.
# #
# # AVISO:
# # No es necesario definir todas las variables para cada
# # aplicación.  Lea cada comentario detenidamente antes de modificar
# # el valor.
# #
# #############################################################

# Parámetro: -oldJTSHome
# Uso: -oldJTSHome <vía acceso dir>
# Descripción:
# 	Vía de acceso completa al directorio de inicio de JTS en la instalación anterior.
#  Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - <vía acceso dir> debe ser un directorio existente que termine en 'server/conf'
#  - Solo válido para actualizaciones de RM y JTS
#
OLD_JTS_HOME=

# Parámetro: -jtsContextRoot
# Uso: -jtsContextRoot <raíz>
# Descripción:
# 	La raíz de contexto de JTS
# Valor predeterminado:
# 	jts
# Restricciones:
#  - <raíz> debe ser un nombre único de directorio válido (es decir, sin ninguna barra inclinada inicial)
#
JTS_CONTEXT_ROOT=jts

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

# # Parámetro: -oldJTSVersion
# Uso: -oldJTSVersion <versión>
# Descripción:
# 	La versión de JTS que se está actualizando.  De forma predeterminada,
#   esto se determina ejecutando repotools -version en el JTS anterior.
#  Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - debe ser una serie de versión completa
#    por ej. 3.0.0 o 3.0.1
#
OLD_JTS_VERSION=

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

# Parámetro: -oldTomcatHome
# Uso: -oldTomcatHome <vía acceso dir>
# Descripción:
# 	Vía de acceso completa al directorio raíz de Tomcat en la instalación anterior.
#  Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Debe ser un directorio existente
#
OLD_TOMCAT_HOME=

# Parámetro: -newJTSHome
# Uso: -newJTSHome <vía acceso dir>
# Descripción:
# 	Vía de acceso al directorio de configuración de servidor JTS de la nueva instalación.
# Valor predeterminado:
# 	conf
# Restricciones:
#  - <vía acceso dir> debe ser un directorio existente que termine en 'server/conf'
#
NEW_JTS_HOME="$START_DIR/conf"

# Parámetro: -newTomcatHome
# Uso: -newTomcatHome <vía acceso dir>
# Descripción:
# 	Vía de acceso al directorio de inicio de Tomcat de la nueva instalación.
#  Valor predeterminado:
# 	<ninguno>
#
NEW_TOMCAT_HOME=

# Parámetro: -noPrompt
# Uso: -noPrompt
# Descripción:
# 	No mostrar solicitud antes de crear o modificar las tablas
# Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Los únicos valores válidos son en blanco o 'noPrompt'
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# Parámetro: -noVerify
# Uso: -noVerify
# Descripción:
# 	No realizar verificación de los archivos teamserver.properties.
#  Valor predeterminado:
# 	<ninguno>
# Restricciones:
#  - Los únicos valores válidos están vacíos o son 'noVerify'
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Parámetro: -noStepPrompt
# Uso: -noStepPrompt
# Descripción:
# 	No mostrar solicitud antes de ejecutar un paso.
# Valor predeterminado:
#   false
# Restricciones:
#  - Los únicos valores válidos son 'true' o 'false'
#
# NO_STEP_PROMPT=true
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
