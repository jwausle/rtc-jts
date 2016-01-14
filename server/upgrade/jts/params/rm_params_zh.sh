#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2006, 2014. All Rights Reserved.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8


# #############################################################
# #
# # 定义与 rm_upgrade.sh 脚本参数相对应的环境变量及其缺省值
# #
# #
# #===========================================================
# #
# # 在开始执行 rm_upgrade.sh 脚本时，请阅读本文件。
# # 将为每个有效参数设置一个环境变量，并提供预定义的缺省值。
# #
# #
# # 用户可能希望修改缺省值，以便使用他们自己的值来
# # 启动 rm_upgrade.sh 脚本，
# # 而不必在命令行中手动输入参数及其相应值。
# #
# #
# # 警告：
# # 并不需要为每个应用程序都设置所有变量。
# # 在修改值之前，请仔细阅读每条注释。
# #
# #
# #############################################################

# 参数：-oldApplicationHome
# 用法：-oldApplicationHome <dir path>
# 描述：
# 	旧安装中的应用程序主目录的完整路径。
# 缺省值：
# 	<无>
# 约束：
#  - 这是一个必需参数
#  - <dir path> 必须是以“server/conf”结尾的现有目录
#    例如 /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# 参数：-applicationContextRoot
# 用法：-applicationContextRoot <root>
# 描述：
# 	应用程序上下文根。
# 缺省值：
# 	<无>
# 约束：
#  - <root> 必须是有效的目录单名（即，没有前导斜杠）
#
APPLICATION_CONTEXT_ROOT=

# 参数：-oldApplicationVersion
# 用法：-oldApplicationVersion <version>
# 描述：
# 	要升级的版本。缺省情况下，通过对旧的应用程序运行
#  repotools -version 来确定此版本。
# 缺省值：
# 	<无>
# 约束：
#  - 应该是完整的版本字符串
#    例如 5.0.0 或 5.0.1
#
OLD_APPLICATION_VERSION=

# 参数：-updateTomcatFiles
# 用法：-updateTomcatFiles <yes | no>
# 描述：
# 	表明是否更新 tomcat 配置文件。
# 缺省值：
# 	yes
# 约束：
#  - 有效值只有“yes”和“no”
#
UPDATE_TOMCAT_FILES=yes

# 参数：-oldApplicationTomcatHome
# 用法：-oldApplicationTomcatHome <dir path>
# 描述：
# 	旧安装中的应用程序 Tomcat 根目录的完整路径。
# 缺省值：
# 	<无>
# 约束：
#  - 只有 RM 升级才接受
#  - 必须是一个现有目录
#
OLD_TOMCAT_HOME=

# 参数：-oldJTSTomcatHome
# 用法：-oldJTSTomcatHome <dir path>
# 描述：
# 	旧安装中的 JTS Tomcat 根目录的完整路径。
# 缺省值：
# 	<无>
# 约束：
#  - 只有 RM 升级才接受
#  - 必须是一个现有目录
#
OLD_JTS_TOMCAT_HOME=

# 参数：-newApplicationHome
# 用法：-newApplicationHome <dir path>
# 描述：
# 	新安装中的应用程序主目录的路径。
# 缺省值：
# 	conf
# 约束：
#  - 只有对 RTC、QM 和 RM 进行升级时才接受此参数
#  - 接受此参数时，这是一个必需参数
#  - <dir path> 必须是以“server/conf”结尾的现有目录
#    例如 /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# 参数：-newJTSHome
# 用法：-newJTSHome <dir path>
# 描述：
# 	新安装将使用的 JTS 中 JTS 主目录的完整路径。
# 缺省值：
# 	新的应用程序主目录
# 约束：
#  - <dir path> 必须是以“server/conf”结尾的现有目录
#
NEW_JTS_HOME=

# 参数：-newJTSContextRoot
# 用法：-newJTSContextRoot <root>
# 描述：
# 	新 JTS 服务器的上下文根。
# 缺省值：
# 	jts
# 约束：
#  - <root> 必须是有效的目录单名（即，没有前导斜杠）
#
JTS_CONTEXT_ROOT=jts

# 参数：-newApplicationTomcatHome
# 用法：-newApplicationTomcatHome <dir path>
# 描述：
# 	新安装中的应用程序 Tomcat 根目录的路径。
# 缺省值：
# 	<无>
#
NEW_TOMCAT_HOME=

# 参数：-newJTSTomcatHome
# 用法：-newJTSTomcatHome <dir path>
# 描述：
# 	新安装将使用的 JTS 中 JTS Tomcat 根目录的路径。
# 缺省值：
# 	<无>
#
NEW_JTS_TOMCAT_HOME=

# 参数：-overwrite
# 用法：-overwrite
# 描述：
# 	执行任何 repotools 命令时都强制覆盖（即，始终使用 overwrite=yes）
# 缺省值：
# 	<无>
# 约束：
# - 有效值只有“overwrite=yes”或者为空
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# 参数：-noVerify
# 用法：-noVerify
# 描述：
# 	执行任何 repotools 命令时都不执行任何验证（即，始终使用 noVerify）
# 缺省值：
# 	<无>
# 约束：
#  - 有效值只有“noVerify”或者为空
#
# NO_VERIFY=noVerify
NO_VERIFY=

# 参数：-noStepPrompt
# 用法：-noStepPrompt
# 描述：
# 	在执行每个升级步骤之前都不提示
# 缺省值：
# 	false
# 约束：
#  - 有效值只有“true”或“false”
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false


# 参数：-noEditor
# 用法：-noEditor
# 描述：
#   不要用编辑器打开 teamserver.properties 文件。
# 缺省值：
#   false
# 约束：
#  - 有效值只有“true”和“false”或者为空
#
# NO_EDITOR=false
NO_EDITOR=false


# 参数：-db.jdbc.location
# 用法：-db.jdbc.location <JDBC_URL>
# 描述：
# 	RM 数据库的 JDBC 位置。（只有在从 4.x 移到 5.x 时需要）
#
#		示例：
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		注意：
#			在 *-nix 系统中，许多字符（例如：|  &  ;  <  >  (  )  $  `  \  "  '  <space>  <tab>  <newline>）
#			需要反斜杠分开。
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# 缺省值：
# 	<无>
# 约束：
#  - 仅当 RM 从 4.x 升级时才接受
#
DB_JDBC_LOCATION_VALUE=

# 参数：-db.jdbc.password
# 用法：-db.jdbc.password <JDBC_PASSWORD>
# 描述：
# 	密码（明文或加密），“{password}”出现在 JDBC URL 中时将替换。
# 缺省值：
# 	<无>
# 约束：
#  - RM 数据库的 JDBC URL 中包含 {password} 时必须指定
#
DB_JDBC_PASSWORD_VALUE=


# 参数：-db.db2i.schema.name
# 用法：-db.db2i.schema.name <SCHEMA_NAME>
# 描述：
# 	DB2i 数据库模式名称。
# 缺省值：
# 	<无>
# 约束：
#  - 必须使用 DB2i 数据库类型指定。
#
DB_DB2I_SCHEMA_NAME_VALUE=

# 参数：-db.db2.dsn.dbname
# 用法：-db.db2.dsn.dbname <DSN_DBNAME>
# 描述：
# 	DB2Z DSN 数据库名称。
# 缺省值：
# 	<无>
# 约束：
#  - 必须使用 DB2z 数据库类型指定。
#
DB_DB2_DSN_DBNAME_VALUE=

# 参数：-db.schemaPrefix
# 用法：-db.schemaPrefix <SCHEMA_PREFIX>
# 描述：
# 	数据库模式前缀。
# 缺省值：
# 	<无>
# 约束：
#  - 必须使用 DB2z 数据库类型指定。
#
DB_SCHEMA_PREFIX_VALUE=


# 参数：-oldJTSHome
# 用法：-oldJTSHome <dir path>
# 描述：
# 	旧安装中的 JTS 主目录的完整路径。
# 缺省值：
# 	<无>
# 约束：
#  - <dir path> 必须是以“server/conf”结尾的现有目录
#  - 仅对于 RM 和 JTS 升级有效
#
OLD_JTS_HOME=

# 参数：-lpaContextRoot
# 用法：-lpaContextRoot <root>
# 描述：
# 	LPA 上下文根
# 缺省值：
# 	admin
# 约束：
#  - <root> 必须是有效的目录单名（即，没有前导斜杠）
#
LPA_CONTEXT_ROOT=admin
