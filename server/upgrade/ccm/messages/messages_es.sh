#!/bin/sh
# *******************************************************************************
#  Materiales bajo licencia - Propiedad de IBM
#  (c) Copyright IBM Corporation 2011, 2015. Reservados todos los derechos.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************

# ################################################################################
#
# Archivo de los mensajes que muestran los scripts automáticos de actualización.
#
# ################################################################################


# *********************
# * Función de mensajes *
# *********************
messages() {

case $1 in 

# ************************************
# * Mensajes de verificación inicial *
# ************************************

INVALID_LAUNCH )
echo ""
echo "No ejecute el script app_upgrade directamente.  Para actualizar JTS o la aplicación, ejecute uno de los siguientes mandatos:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Utilice -help para obtener una descripción completa de los mandatos anteriores."
;;

INVALID_START_DIR )
echo ""
echo "Salvo cuando se utiliza el parámetro -help, el script $2 no se puede ejecutar desde $3"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "El archivo '$2' contiene los valores de parámetro del script de actualización."
echo "Si necesita modificar alguno de los valores de parámetro predeterminados, puede editar estos archivos o puede especificar los valores de parámetro como argumentos de línea de mandatos en los scripts de actualización."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "El siguiente conjunto de archivos contiene valores de parámetro predeterminados para un aplicación o actualización de JTS.  Si necesita modificar alguno de los valores de parámetro predeterminados, puede editar estos archivos o puede especificar los valores de parámetro como argumentos de línea de mandatos en los scripts de actualización."
echo "- CCM upgrade: $2/params/ccm_params$3.sh"
echo "- GC upgrade:  $2/params/gc_params$3.sh"
echo "- QM upgrade:  $2/params/qm_params$3.sh"
echo "- RM upgrade:  $2/params/rm_params$3.sh"
echo "- JTS upgrade: $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Mensajes de verificación de parámetros *
# ************************************

# Verificación intrínseca
# ======================

MISSING_APP_TYPE )
echo ""
echo "No se ha especificado JTS ni ningún tipo de aplicación.  Para actualizar JTS o la aplicación, ejecute uno de los siguientes mandatos:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Utilice -help para obtener una descripción completa de los mandatos anteriores."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2 no es un JTS o un tipo de aplicación válido.  Para actualizar JTS o la aplicación, ejecute uno de los siguientes mandatos:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Utilice -help para obtener una descripción completa de los mandatos anteriores."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "Falta un valor para el parámetro $2."
echo "Utilice -help para obtener una descripción completa de los parámetros."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "El directorio $3 especificado para el parámetro $2 no existe o no es válido."
echo "Utilice -help para obtener una descripción completa de los parámetros."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "El directorio $3 especificado para el parámetro $2 debe ser una vía de acceso absoluta."
echo "Utilice -help para obtener una descripción completa de los parámetros."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "El archivo $3 especificado para el parámetro $2 no existe o no es válido."
echo "Utilice -help para obtener una descripción completa de los parámetros."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3 es un valor no válido para el parámetro $2."
echo "Utilice -help para obtener una descripción completa de los parámetros."
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2 es un parámetro desconocido."
echo "Utilice -help para obtener una descripción completa de los parámetros."
echo ""
;;


# Verificación extrínseca
# ======================

MISSING_HOME_PARAM )
echo ""
echo "Falta el parámetro $2 del directorio de inicio."
echo "Utilice -help para obtener una descripción completa de los parámetros."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "El directorio $2 no existe o no es válido."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "No se puede encontrar el mandato repotools de aplicación '$2'."
echo ""
echo "Compruebe que el parámetro oldApplicationHome '$3' señala al directorio de configuración del servidor antiguo; por ejemplo, 'JazzInstallRoot/server/conf'."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "No se puede encontrar el mandato repotools de JTS '$2'."
echo ""
echo "Compruebe que el parámetro -oldApplicationHome '$3' señala al antiguo directorio de configuración del servidor; por ejemplo, 'JazzInstallRoot/server/conf' y que el parámetro jtsContextRoot '$4' es correcto."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "No se puede encontrar el archivo de configuración '$2'."
echo ""
echo "Compruebe que el parámetro oldApplicationHome '$3' señala al directorio de configuración del servidor antiguo; por ejemplo, 'JazzInstallRoot/server/conf'."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "No se puede encontrar el archivo de configuración '$2'."
echo ""
echo "Compruebe que el parámetro -oldApplicationHome '$3' señala al antiguo directorio de configuración del servidor; por ejemplo, 'JazzInstallRoot/server/conf' y que el parámetro jtsContextRoot '$4' es correcto."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "No se puede encontrar el mandato repotools de JTS '$2'."
echo ""
echo "Compruebe que el parámetro -newApplicationHome '$3' señala al nuevo directorio de configuración del servidor; por ejemplo, 'JazzInstallRoot/server/conf' y que el parámetro applicationContextRoot '$4' es correcto."
echo "Si va a realizar una actualización desde un release anterior, asegúrese de que ha seleccionado las raíces de contexto correctas.  Por ejemplo, si utiliza Gestor de instalación, debe seleccionar la opción de raíz de contexto $5 en el panel "Opciones de raíz de contexto".  Si ha seleccionado por accidente una opción diferente, debe volver a instalar el producto con la opción de raíz de contexto $5."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "No se puede encontrar el archivo de configuración '$2'."
echo ""
echo "Compruebe que el parámetro -newApplicationHome '$3' señala al nuevo directorio de configuración del servidor JTS; por ejemplo, 'JazzInstallRoot/server/conf' y que el parámetro applicationContextRoot '$4' es correcto."
echo "Si va a realizar una actualización desde un release anterior, asegúrese de que ha seleccionado las raíces de contexto correctas.  Por ejemplo, si utiliza Gestor de instalación, debe seleccionar la opción de raíz de contexto $5 en el panel "Opciones de raíz de contexto".  Si ha seleccionado por accidente una opción diferente, debe volver a instalar el producto con la opción de raíz de contexto $5."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "No se puede encontrar el mandato repotools de JTS '$2'."
echo ""
echo "Compruebe que el parámetro oldJTSHome '$3' señala al antiguo directorio de configuración del servidor JTS; por ejemplo, 'JazzInstallRoot/server/conf' y que el parámetro jtsContextRoot '$4' es correcto."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "No se puede encontrar el archivo de configuración '$2'."
echo ""
echo "Compruebe que el parámetro oldJTSHome '$3' señala al antiguo directorio de configuración del servidor JTS; por ejemplo, 'JazzInstallRoot/server/conf' y que el parámetro jtsContextRoot '$4' es correcto."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "No se puede encontrar el mandato repotools de JTS '$2'."
echo ""
echo "Compruebe que el parámetro -newJTSHome '$3' señala al nuevo directorio de configuración del servidor JTS; por ejemplo, 'JazzInstallRoot/server/conf' y que el parámetro jtsContextRoot '$4' es correcto."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "No se puede encontrar el archivo de configuración '$2'."
echo ""
echo "Compruebe que el parámetro -newJTSHome '$3' señala al nuevo directorio de configuración del servidor JTS; por ejemplo, 'JazzInstallRoot/server/conf' y que el parámetro jtsContextRoot '$4' es correcto."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "Falta el archivo tar que contiene los datos de la versión 2.x necesarios para actualizar $2."
echo "Utilice -help para obtener una descripción completa de los parámetros."
echo ""
;;


# **********************
# * Mensajes de ejecución *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    Actualización de JTS               ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    Actualización de CCM               ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    Actualización de CG               ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    Actualización de QM     ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    Actualización de RM     ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "Comprobando la versión de aplicación anterior de RM..."
;;

RM_DISPLAY_OLD_VERSION )
echo "La versión de aplicación anterior de RM es '$2'"
;;

# *********************
# * Conmutar primer paso *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "La última ejecución falló en el paso inicial..."
;;

LAST_STEP_FAILED )
echo ""
echo "La última ejecución falló en el paso $2..."
echo "¿Desea reiniciar la actualización desde este paso o desde otro anterior?"
;;

ALREADY_RUN )
echo ""
echo "La actualización se ha realizado y ha finalizado satisfactoriamente..."
echo "¿Desea iniciar una nueva a partir de un determinado paso?"
;;

LAST_STEP_PASSED )
echo ""
echo "La última ejecución se detuvo satisfactoriamente en el paso $2..."
echo "¿Desea reiniciar la actualización desde el paso $3 actual o desde otro anterior?"
;;

ENTER_NEXT_STEP )
echo ""
echo "Especifique el número de paso [$2-$3] desde el que desee reiniciar la actualización o pulse la tecla [Intro] para cancelar:"
;;

INTEGER_STEP_NUMBER )
echo ""
echo "'$2' no es un número. Especifique un número de paso válido."
;;

INVALID_STEP_NUMBER )
echo ""
echo "'$2' no es un número de paso válido. Especifique un número de paso válido."
;;

MAX_STEP_NUMBER )
echo ""
echo "El último paso es $2; por lo tanto, no podrá reiniciar la actualización en el paso $3."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "El paso $2 no se ha ejecutado todavía; por lo tanto, no podrá reiniciar la actualización en el paso $3."
;;


# **********************
# * Mensajes de pasos  *
# **********************

STEP_0_IBMi )
echo "Paso 0: descartar tablas"
echo "-------------------"
;;

STEP_0 )
echo "Paso 0: Actualizar archivos de configuración"
echo "---------------------------"
;;

STEP_1_ADD )
echo "Paso 1: Añadir tablas"
echo "------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "Paso $2: Volver a crear índices de texto"
echo "----------------------------------------"
;;

JFS_INDICES_STEP )
echo "Paso $2: Volver a crear índices de consulta y búsqueda"
echo "------------------------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "Paso $2: Fusionar LPA con JTS"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "Paso $2: Corregir el URL frontal de las áreas de almacenamiento LPA"
echo "-------------------------------------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "Paso $2: Eliminar amigo LPA de RM"
echo "---------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "Paso 2: Actualizar esquema de depósito de datos"
echo "-----------------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "Paso $2: Finalizar aplicación RM"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "Paso $2: Finalizar aplicación JTS"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "Paso $2: Reindexar aplicación RM"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "La actualización $2 falló en el paso $3.  Corrija el problema y vuelva a ejecutar el script comenzando por el paso $3."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "La actualización $2 ha sido satisfactoria.  Ahora podrá actualizar las aplicaciones en su entorno."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "La parte fuera de línea de la actualización de RM ha sido satisfactoria. Ahora podrá iniciar los servidores del despliegue."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "La parte fuera de línea de la actualización de RM ha sido satisfactoria. Queda un"
echo "paso necesario para finalizar la migración, pero necesita que todos los servidores"
echo "que enlazan con RM (como RTC, RQM, JRS, GC) estén en línea. Cuando haga falta, abra"
echo "todos los servidores (incluido RM). Se recomienda iniciar sesión en cada servidor"
echo "y asegurarse de que funcionan correctamente. A continuación, ejecute el mandato siguiente:"
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "La actualización $2 ha sido satisfactoria.  Ahora podrá iniciar los servidores del despliegue."
echo ""
;;

# *****************************************
# * Mensajes mientras se ejecuta un paso  *
# *****************************************

STEP_DIR_CMD )
echo ""
echo "Directorio: $2"
echo "Mandato:"
;;

ENTER_STEP_ACTION )
echo "Especifique [E] para ejecutar este paso, [S] para omitirlo o pulse [Intro] para cancelar la ejecución del script:"
;;

INVALID_STEP_ACTION )
echo ""
echo "'$2' no es una entrada válida; solo se permiten 'E', 'S' o 'Intro'"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "Se abrirá un editor vi para permitirle verificar el archivo teamserver.properties de $2."
echo "Verifique que la raíz del URI público indicada por la propiedad com.ibm.team.repository.server.webapp.url es correcta."
echo "Verifique que las propiedades de la base de datos son correctas."
echo "Cuando haya finalizado, guarde los cambios, si hay alguno, y cierre el editor para continuar ejecutando el script."
echo ""
echo "Consultar el tema 'Actualización de la solución Rational para CLM' de la documentación del producto"
echo "para obtener información sobre cómo configurar correctamente cada propiedad".
;;

PAUSE )
echo ""
echo "Escriba [C] para proseguir la ejecución o pulse [Intro] para cancelar la ejecución del script:"
;;

INVALID_PAUSE_ACTION )
echo ""
echo "'$2' no es una entrada válida; solo se permiten 'C' o 'Intro'"
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "Copiar los índices de texto de '$2' a '$3'."
echo "Esta operación puede tardar unos minutos..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS)
echo ""
echo "Copiar índices de búsqueda y consulta de '$2' a '$3'." 
echo "Esta operación puede tardar unos minutos..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "No se han podido copiar los índices de '$2' a '$3'."
echo "Compruebe que la propiedad com.ibm.team.fulltext.indexLocation"
echo "se haya definido en el archivo teamserver.properties."
echo "Copie manualmente los índices de texto en este directorio o"
echo "ejecute repotools -rebuildTextIndices para volver a crearlos."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "El archivo $NEW_APP_PARENT_DIR/RM_APP.ID no existe"
echo "Cree este archivo con la única línea que contiene el ID de aplicación de RM"
echo "e inténtelo de nuevo."
echo ""
;;

# *****************************************
# * Mensajes de verificación de URI públicos *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "No hay ningún URI público definido en"
echo "$3,"
echo "por lo que no se puede iniciar la actualización."
echo ""
echo "Debe haber un URI público en este archivo definido de la forma siguiente:"
echo "https\://nombrehost.ejemplo.com\:puerto/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "La propiedad del URI público com.ibm.team.repository.server.webapp.url debe estar presente en el archivo teamserver.properties."
echo "Añada la propiedad al archivo de instalación teamserver.properties anterior y defina el valor para que sea la raíz de URI que utilicen todos los clientes para localizar el servidor."
echo "La raíz de URI público es básica para el correcto funcionamiento de su instalación nueva. La actualización no se realizará correctamente sin esta propiedad.  "
echo "Para obtener más información, consulte el tema de la documentación del producto sobre 'Planificación de sus URIs'".
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "Todos los URI públicos definidos en"
echo "$3,"
echo "se han comentado, por lo tanto, no se puede iniciar la actualización."
echo ""
echo "Debe haber un URI público no de comentario en este archivo definido de la forma siguiente:"
echo "https\://nombrehost.ejemplo.com\:puerto/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "La propiedad del URI público com.ibm.team.repository.server.webapp.url debe estar presente en el archivo teamserver.properties."
echo "Añada la propiedad al archivo de instalación teamserver.properties anterior y defina el valor para que sea la raíz de URI que utilicen todos los clientes para localizar el servidor."
echo "La raíz de URI público es básica para el correcto funcionamiento de su instalación nueva. La actualización no se realizará correctamente sin esta propiedad."
echo "Para obtener más información, consulte el tema de la documentación del producto sobre 'Planificación de sus URIs'".
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "La raíz de contexto del JTS está establecida en '$2'."
echo "La raíz de contexto de la aplicación está establecida en '$3'."
echo "La raíz de contexto de JTS y la aplicación no puede ser la misma."
echo ""
;;

esac

}
