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
# # Определите переменные среды, соответствующие параметрам
# # сценария gc_upgrade.sh, и их значения по умолчанию
# #
# #===========================================================
# #
# # Этот файл считывается в начале каждого выполнения сценария
# # gc_upgrade.sh. Для каждого допустимого параметра он
# # инициализирует переменную среды предопределенным
# # значением по умолчанию.
# #
# # Пользователям может потребоваться изменить значение по
# # умолчанию, чтобы запускать gc_upgrade.sh со своими
# # значениями, не вводя параметр и его значение вручную
# # в командной строке.
# #
# # ПРЕДУПРЕЖДЕНИЕ:
# # Для некоторых приложений требуется указывать не все
# # переменные.  Внимательно ознакомьтесь с комментарием
# # перед изменением значения.
# #
# #############################################################

# Параметр: -oldApplicationHome
# Формат: -oldApplicationHome <путь-к-каталогу>
# Описание:
# 	Полный путь к домашнему каталогу приложения в экземпляре версии 3.0.1.
# Значение по умолчанию:
# 	<нет>
# Ограничения:
#  - это обязательный параметр
#  - <путь к каталогу> должен задавать существующий каталог и оканчиваться на 'server/conf'
#    например: /QIBM/UserData/JazzTeamServer301Backup/server/conf
#
OLD_APPLICATION_HOME=

# Параметр: -applicationContextRoot
# Формат: -applicationContextRoot <корневой-контекст>
# Описание:
# 	Корневой контекст приложения сервера версии 3.0.1.
# Значение по умолчанию:
# 	gc
# Ограничения:
#  - <корневой-контекст> должен быть коротким именем каталога (без начальной косой черты)
#
APPLICATION_CONTEXT_ROOT=

# Параметр: -oldApplicationVersion
# Формат: -oldApplicationVersion <версия>
# Описание:
#	Обновляемая версия 3.0.x.  По умолчанию она
# определяется командой repotools -version, выполняемой с прежним приложением.
# Значение по умолчанию:
# 	<нет>
# Ограничения:
#  - необходимо указать полную строку версии
#    например: 3.0.0 или 3.0.1
#
OLD_APPLICATION_VERSION=

# Параметр: -updateTomcatFiles
# Формат: -updateTomcatFiles <yes | no>
# Описание:
# 	Разрешает/запрещает обновление файлов конфигурации Tomcat.
# Значение по умолчанию:
# 	no
# Ограничения:
#  - Допустимы только значения 'yes' и 'no'
#
UPDATE_TOMCAT_FILES=no

# Параметр: -oldTomcatHome
# Формат: -oldTomcatHome <путь-к-каталогу>
# Описание:
# 	Полный путь к корневому каталогу Tomcat в экземпляре версии 3.0.1.
# Значение по умолчанию:
# 	<нет>
# Ограничения:
#  - Должен задавать существующий каталог
#
OLD_TOMCAT_HOME=

# Параметр: -newApplicationHome
# Формат: -newApplicationHome <путь-к-каталогу>
# Описание:
# 	Путь к домашнему каталогу приложения в установке версии 4.0.
# Значение по умолчанию:
# 	conf
# Ограничения:
#  - Допустим только при обновлении RTC, QM, GC и RM
#  - Если допустим, то является обязательным
#  - <путь-к-каталогу> должен существовать и оканчиваться на 'server/conf',
#    например: /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Параметр: -newJTSHome
# Формат: -newJTSHome <путь-к-каталогу>
# Описание:
# 	Полный путь к домашнему каталогу JTS в экземпляре версии 4.0.
# Значение по умолчанию:
# 	Домашний каталог нового приложения
# Ограничения:
#  - <путь к каталогу> должен существовать и оканчиваться на 'server/conf'
#    например: /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# Параметр: -jtsContextRoot
# Формат: -jtsContextRoot <корень>
# Описание:
# 	Корневой контекст сервера JTS 4.0.
# Значение по умолчанию:
# 	jts
# Ограничения:
#  - <корневой-контекст> должен быть коротким именем каталога (без начальной косой черты)
#
JTS_CONTEXT_ROOT=jts

# Параметр: -newApplicationTomcatHome
# Формат: -newApplicationTomcatHome <путь-к-каталогу>
# Описание:
# 	Путь к корневому каталогу Tomcat приложения в экземпляре версии 4.0.
# Значение по умолчанию:
# 	<нет>
#
NEW_TOMCAT_HOME=

# Параметр: -newJTSTomcatHome
# Формат: -newJTSTomcatHome <путь-к-каталогу>
# Описание:
# 	Путь к корневому каталогу Tomcat JTS в экземпляре версии 4.0.
# Значение по умолчанию:
# 	<нет>
#
NEW_JTS_TOMCAT_HOME=

# Параметр: -ignoreJTSVersionCheck
# Формат: -ignoreJTSVersionCheck
# Описание:
# 	Не проверять, совместима ли версия приложения с версией
#   сервера Jazz Team Server, расположенной в newJTSHome.
# Значение по умолчанию:
# 	<нет>
# Ограничения:
#  - Допустимо только значение 'ignoreJTSVersionCheck' или пустое значение
#
IGNORE_JTS_VERSION_CHECK=

# Параметр: -noPrompt
# Формат: -noPrompt
# Описание:
# 	Не спрашивать перед созданием или изменением таблиц
# Значение по умолчанию:
# 	noPrompt
# Ограничения:
#  - Допустимо только значение 'noPrompt' и пустое значение
#
# NO_PROMPT=
NO_PROMPT=noPrompt

# Параметр: -noVerify
# Формат: -noVerify
# Описание:
# 	Не выполнять проверку файлов teamserver.properties.
# Значение по умолчанию:
#   noVerify
# Ограничения:
#  - Допустимо только значение 'noVerify' и пустое значение
#
# NO_VERIFY=
NO_VERIFY=noVerify

# Параметр: -noStepPrompt
# Формат: -noStepPrompt
# Описание:
# 	Не выводить запрос перед выполнением шага.
# Значение по умолчанию:
# 	false
# Ограничения:
#  - Допустимы только значения 'true' и 'false'
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Параметр: -noEditor
# Формат: -noEditor
# Описание:
#   Не открывать редактор для файлов teamserver.properties.
# Значение по умолчанию:
#   false
# Ограничения:
#  - Допустимы только значения 'true' и 'false'
#
# NO_EDITOR=false
NO_EDITOR=false
