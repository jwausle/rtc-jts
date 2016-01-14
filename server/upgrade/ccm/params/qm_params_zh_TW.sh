#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  © Copyright IBM Corporation 2006, 2014. All Rights Reserved.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************
# NLS_MESSAGEFORMAT_NONE
# NLS_ENCODING=UTF-8


# #############################################################
# #
# # 定義對應至 qm_upgrade.sh Script
# # 參數的環境變數及其預設值
# #
# #===========================================================
# #
# # 開始執行 qm_upgrade.sh Script 時，會
# # 讀取這個檔案。它會利用預先定義的預設值，
# # 針對每個有效的參數來設定一個環境變數。
# #
# # 使用者可能會想修改預設值，以他們本身
# # 的值來啟動 qm_upgrade.sh Script，而
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
#    例如：/Jazz/IBM/RQM_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# 參數：-applicationContextRoot
# 用法：-applicationContextRoot <root>
# 說明：
# 	應用程式環境定義根目錄。
# 預設值：
# 	qm
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
#    例如：3.0.0 或 3.0.1
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

# 參數：-oldTomcatHome
# 用法：-oldTomcatHome <dir path>
# 說明：
# 	舊安裝架構中 Tomcat 根目錄的完整路徑。
# 預設值：
# 	<無>
# 限制：
#  - 必須是現有的目錄
#
OLD_TOMCAT_HOME=

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
#    例如：/Jazz/IBM/RQM_3.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# 參數：-newJTSHome
# 用法：-newJTSHome <dir path>
# 說明：
# 	JTS 中新安裝架構將使用的 JTS 起始目錄的完整路徑。
# 預設值：
# 	新應用程式起始目錄
# 限制：
#  - <dir path> 必須是現有目錄，且結尾是 'server/conf'
#    例如 /Jazz/IBM/RQM_3.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# 參數：-jtsContextRoot
# 用法：-jtsContextRoot <root>
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

# 參數：-noPrompt
# 用法：-noPrompt
# 說明：
# 	在建立或修改表格之前不先提示
# 預設值：
# 	<無>
# 限制：
#  - 唯一的有效值是空的或 'noPrompt'
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# 參數：-noVerify
# 用法：-noVerify
# 說明：
# 	不執行 teamserver.properties 檔驗證。
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
# 	在執行步驟之前不先提示。
# 預設值：
# 	      false
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
