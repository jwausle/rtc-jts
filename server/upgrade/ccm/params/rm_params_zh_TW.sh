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
# # 定義對應至 rm_upgrade.sh Script
# # 參數的環境變數及其預設值
# #
# #===========================================================
# #
# # 開始執行 rm_upgrade.sh Script 時，會
# # 讀取這個檔案。它會利用預先定義的預設值，
# # 針對每個有效的參數來設定一個環境變數。
# #
# # 使用者可能會想修改預設值，以他們本身
# # 的值來啟動 rm_upgrade.sh Script，而
# # 不必在指令行中手動輸入參數及其對應的
# # 值。                                    
# #
# # 警告：
# # 對每一個應用程式來說，並非所有的變數
# # 都需要設定。修改值之前，請仔細閱讀每
# # 一則註解。
# #
# #############################################################

# 參數：-oldApplicationHome
# 用法：-oldApplicationHome <dir path>
# 說明：
# 	舊安裝架構中應用程式起始目錄的完整路徑。
# 預設值：
# 	<無>
# 限制：
#  - 這是必要參數
#  - <dir path> 必須是現有目錄，且結尾是 'server/conf'
#    例如：/Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# 參數：-applicationContextRoot
# 用法：-applicationContextRoot <root>
# 說明：
# 	應用程式環境定義根目錄。
# 預設值：
# 	<無>
# 限制：
#  - <root> 必須是有效的目錄單一名稱（例如，沒有前導斜線）
#
APPLICATION_CONTEXT_ROOT=

# 參數：-oldApplicationVersion
# 用法：-oldApplicationVersion <version>
# 說明：
# 	要升級的版本。依預設，這是透過
#   對舊的應用程式執行 repotools -version 來判斷。
# 預設值：
# 	<無>
# 限制：
#  - 應為完整的版本字串
#    例如：5.0.0 或 5.0.1
#
OLD_APPLICATION_VERSION=

# 參數：-updateTomcatFiles
# 用法：-updateTomcatFiles <yes | no>
# 說明：
# 	是否更新 Tomcat 配置檔。
# 預設值：
# 	yes
# 限制：
#  - 唯一有效值是 'yes' 和 'no'
#
UPDATE_TOMCAT_FILES=yes

# 參數：-oldApplicationTomcatHome
# 用法：-oldApplicationTomcatHome <dir path>
# 說明：
# 	舊安裝架構中應用程式 Tomcat 根目錄的完整路徑。
# 預設值：
# 	<無>
# 限制：
#  - 必須是 RM 升級作業，才會接受這個參數
#  - 必須是現有的目錄
#
OLD_TOMCAT_HOME=

# 參數：-oldJTSTomcatHome
# 用法：-oldJTSTomcatHome <dir path>
# 說明：
# 	舊安裝架構中 JTS Tomcat 根目錄的完整路徑。
# 預設值：
# 	<無>
# 限制：
#  - 必須是 RM 升級作業，才會接受這個參數
#  - 必須是現有的目錄
#
OLD_JTS_TOMCAT_HOME=

# 參數：-newApplicationHome
# 用法：-newApplicationHome <dir path>
# 說明：
# 	新安裝架構中應用程式起始目錄的路徑。
# 預設值：
# 	conf
# 限制：
#  - 必須是 RTC、QM 和 RM 升級作業，才會接受此參數
#  - 當接受時，這是必要參數
#  - <dir path> 必須是現有目錄，且結尾是 'server/conf'
#    例如：/Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# 參數：-newJTSHome
# 用法：-newJTSHome <dir path>
# 說明：
# 	新安裝架構將使用之 JTS 中 JTS 起始目錄的完整路徑。
# 預設值：
# 	新應用程式起始目錄
# 限制：
#  - <dir path> 必須是現有目錄，且結尾是 'server/conf'
#
NEW_JTS_HOME=

# 參數：-newJTSContextRoot
# 用法：-newJTSContextRoot <root>
# 說明：
# 	JTS 伺服器的環境定義根目錄。
# 預設值：
# 	jts
# 限制：
#  - <root> 必須是有效的目錄單一名稱（例如，沒有前導斜線）
#
JTS_CONTEXT_ROOT=jts

# 參數：-newApplicationTomcatHome
# 用法：-newApplicationTomcatHome <dir path>
# 說明：
# 	新安裝架構中應用程式 Tomcat 根目錄的路徑。
# 預設值：
# 	<無>
#
NEW_TOMCAT_HOME=

# 參數：-newJTSTomcatHome
# 用法：-newJTSTomcatHome <dir path>
# 說明：
# 	JTS 中新安裝架構將使用的 JTS Tomcat 根目錄的路徑。
# 預設值：
# 	<無>
#
NEW_JTS_TOMCAT_HOME=

# 參數：-overwrite
# 用法：-overwrite
# 說明：
# 	執行任何 repotools 指令時強制改寫（例如，一律使用 overwrite=yes）
# 預設值：
# 	<無>
# 限制：
#  - 唯一的有效值是空的或 'overwrite=yes'
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# 參數：-noVerify
# 用法：-noVerify
# 說明：
# 	執行任何 repotools 指令時，不進行任何驗證（例如，一律使用 noVerify）
# 預設值：
# 	<無>
# 限制：
#  - 唯一的有效值是空的或 'noVerify'
#
# NO_VERIFY=noVerify
NO_VERIFY=

# 參數：-noStepPrompt
# 用法：-noStepPrompt
# 說明：
# 	在執行每個升級步驟之前不先提示
# 預設值：
# 	false
# 限制：
#  - 唯一的有效值是 'true' 或 'false'
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false


# 參數：-noEditor
# 用法：-noEditor
# 說明：
#   不使用編輯器開啟 teamserver.properties 檔。
# 預設值：
#   false
# 限制：
#  - 唯一的有效值是 'true' 或 'false' 或空白
#
# NO_EDITOR=false
NO_EDITOR=false


# 參數：-db.jdbc.location
# 用法：-db.jdbc.location <JDBC_URL>
# 說明：
# 	RM 資料庫的 JDBC 位置。（從 4.x 移到 5.x 時才需要）
#
#		範例：
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		附註：
#			On *-nix 系統，許多字元（像是： |  &  ;  <  >  (  )  $  `  \  "  '  <space>  <tab>  <newline>）
#			需要跳出反斜線。
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# 預設值：
# 	<無>
# 限制：
#  - 必須從 4.x 升級 RM 作業，才會接受這個參數
#
DB_JDBC_LOCATION_VALUE=

# 參數：-db.jdbc.password
# 用法：-db.jdbc.password <JDBC_PASSWORD>
# 說明：
# 	如果 "{password}" 出現在 JDBC URL，將會以密碼（純文字或已加密）代替。
# 預設值：
# 	<無>
# 限制：:
#  - 如果 RM 資料庫的 JDBC URLJDBC URL 包含 {password}，則必須指定。
#
DB_JDBC_PASSWORD_VALUE=


# 參數：-db.db2i.schema.name
# 用法：-db.db2i.schema.name <SCHEMA_NAME>
# 說明：
# 	DB2i 資料庫綱目名稱。
# 預設值：
# 	<無>
# 限制：
#  - 指定時必須使用 DB2i 資料庫類型。
#
DB_DB2I_SCHEMA_NAME_VALUE=

# 參數：-db.db2.dsn.dbname
# 用法：-db.db2.dsn.dbname <DSN_DBNAME>
# 說明：
# 	DB2Z DSN 資料庫名稱。
# 預設值：
# 	<無>
# 限制：
#  - 指定時必須使用 DB2z 資料庫類型。
#
DB_DB2_DSN_DBNAME_VALUE=

# 參數：-db.schemaPrefix
# 用法：-db.schemaPrefix <SCHEMA_PREFIX>
# 說明：
# 	資料庫綱目字首。
# 預設值：
# 	<無>
# 限制：
#  - 指定時必須使用 DB2z 資料庫類型。
#
DB_SCHEMA_PREFIX_VALUE=


# 參數：-oldJTSHome
# 用法：-oldJTSHome <dir path>
# 說明：
# 	舊安裝架構中 JTS 起始目錄的完整路徑。
# 預設值：
# 	<無>
# 限制：
#  - <dir path> 必須是現有目錄，且結尾是 'server/conf'
#  - 僅適用於 RM 和 JTS 升級作業
#
OLD_JTS_HOME=

# 參數：-lpaContextRoot
# 用法：-lpaContextRoot <root>
# 說明：
# 	LPA 環境定義根目錄
# 預設值：
# 	admin
# 限制：
#  - <root> 必須是有效的目錄單一名稱（例如，沒有前導斜線）
#
LPA_CONTEXT_ROOT=admin
