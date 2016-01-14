#!/bin/sh
# *******************************************************************************
#  Licensed Materials - Property of IBM
#  (c) Copyright IBM Corporation 2011, 2015. All Rights Reserved.
#
#  Note to U.S. Government Users Restricted Rights:
#  Use, duplication or disclosure restricted by GSA ADP Schedule
#  Contract with IBM Corp.
#  *******************************************************************************

# ################################################################################
#
# File for messages displayed by the upgrade automated scripts.
#
# ################################################################################


# *********************
# * Messages function *
# *********************
messages() {

case $1 in 

# *********************************
# * Initial verification messages *
# *********************************

INVALID_LAUNCH )
echo ""
echo "請勿直接執行 app_upgrade Script。如果要升級 JTS 或應用程式，請執行下列其中一個指令："
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "如需上述指令的完整說明，請使用 -help。"
;;

INVALID_START_DIR )
echo ""
echo "除非您正在使用 -help 參數，否則必須從 $3 來執行 $2 Script"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "'$2' 檔包含升級 Script 的參數值。"
echo "如果您需要修改任何預設參數值，您可以編輯這些檔案，也可以在升級 Script 的指令行引數中指定這些參數值。"
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "下列檔案集包含應用程式或 JTS 升級的預設參數值。如果您需要修改任何預設參數值，您可以編輯這些檔案，也可以在升級 Script 的指令行引數中指定這些參數值。"
echo "- CCM upgrade: $2/params/ccm_params$3.sh"
echo "- GC upgrade:  $2/params/gc_params$3.sh"
echo "- QM upgrade:  $2/params/qm_params$3.sh"
echo "- RM upgrade:  $2/params/rm_params$3.sh"
echo "- JTS upgrade: $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Parameters verification messages *
# ************************************

# Intrinsic verification
# ======================

MISSING_APP_TYPE )
echo ""
echo "未指定 JTS 或應用程式類型。如果要升級 JTS 或應用程式，請執行下列其中一個指令："
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "如需上述指令的完整說明，請使用 -help。"
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2 不是有效的 JTS 或應用程式類型。如果要升級 JTS 或應用程式，請執行下列其中一個指令："
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "如需上述指令的完整說明，請使用 -help。"
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "遺漏參數 $2 的值。"
echo "如需完整的參數說明，請使用 -help。"
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "指定給 $2 參數的 $3 目錄不存在或者無效。"
echo "如需完整的參數說明，請使用 -help。"
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "指定給 $2 參數的 $3 目錄必須是絕對路徑。"
echo "如需完整的參數說明，請使用 -help。"
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "指定給 $2 參數的 $3 檔不存在或者無效。"
echo "如需完整的參數說明，請使用 -help。"
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3 是 $2 參數的無效值。"
echo "如需完整的參數說明，請使用 -help。"
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2 為不明參數。"
echo "如需完整的參數說明，請使用 -help。"
echo ""
;;


# Extrinsic verification
# ======================

MISSING_HOME_PARAM )
echo ""
echo "遺漏起始目錄參數 $2。"
echo "如需完整的參數說明，請使用 -help。"
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "$2 目錄不存在或者無效。"
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "找不到應用程式 repotools 指令 '$2'。"
echo ""
echo "請驗證 -oldApplicationHome 參數 '$3' 指向舊的伺服器配置目錄，例如 'JazzInstallRoot/server/conf'。"
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "找不到應用程式 repotools 指令 '$2'。"
echo ""
echo "請驗證 -oldApplicationHome 參數 '$3' 指向舊的伺服器配置目錄（例如 'JazzInstallRoot/server/conf'），且 jtsContextRoot 參數 '$4' 正確。"
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "找不到配置檔 '$2'。"
echo ""
echo "請驗證 -oldApplicationHome 參數 '$3' 指向舊的伺服器配置目錄，例如 'JazzInstallRoot/server/conf'。"
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "找不到配置檔 '$2'。"
echo ""
echo "請驗證 -oldApplicationHome 參數 '$3' 指向舊的伺服器配置目錄（例如 'JazzInstallRoot/server/conf'），且 jtsContextRoot 參數 '$4' 正確。"
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "找不到應用程式 repotools 指令 '$2'。"
echo ""
echo "請驗證 -newApplicationHome 參數 '$3' 指向新的應用程式伺服器配置目錄（例如 'JazzInstallRoot/server/conf'），且 applicationContextRoot 參數 '$4' 正確。"
echo "如果您是從舊版升級，請確定您選取的環境定義根目錄正確。比方說，如果使用 Installation Manager，在「環境定義根目錄選項」畫面中，您必須選取 $5 環境定義根目錄選項。如果您不慎選取不同的選項，則必須使用 $5 環境定義根目錄選項來重新安裝產品。"
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "找不到配置檔 '$2'。"
echo ""
echo "請驗證 -newApplicationHome 參數 '$3' 指向新的 JTS 伺服器配置目錄（例如 'JazzInstallRoot/server/conf'），且 applicationContextRoot 參數 '$4' 正確。"
echo "如果您是從舊版升級，請確定您選取的環境定義根目錄正確。比方說，如果使用 Installation Manager，在「環境定義根目錄選項」畫面中，您必須選取 $5 環境定義根目錄選項。如果您不慎選取不同的選項，則必須使用 $5 環境定義根目錄選項來重新安裝產品。"
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "找不到 JTS repotools 指令 '$2'。"
echo ""
echo "請驗證 -oldJTSHome 參數 '$3' 指向舊的 JTS 伺服器配置目錄（例如 'JazzInstallRoot/server/conf'），且 jtsContextRoot 參數 '$4' 正確。"
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "找不到配置檔 '$2'。"
echo ""
echo "請驗證 -oldJTSHome 參數 '$3' 指向舊的 JTS 伺服器配置目錄（例如 'JazzInstallRoot/server/conf'），且 jtsContextRoot 參數 '$4' 正確。"
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "找不到 JTS repotools 指令 '$2'。"
echo ""
echo "請驗證 -newJTSHome 參數 '$3' 指向新的 JTS 伺服器配置目錄（例如 'JazzInstallRoot/server/conf'），且 jtsContextRoot 參數 '$4' 正確。"
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "找不到配置檔 '$2'。"
echo ""
echo "請驗證 -newJTSHome 參數 '$3' 指向新的 JTS 伺服器配置目錄（例如 'JazzInstallRoot/server/conf'），且 jtsContextRoot 參數 '$4' 正確。"
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "$2 的升級需要含有 2.x 資料的 TAR 檔。"
echo "如需完整的參數說明，請使用 -help。"
echo ""
;;


# **********************
# * Execution messages *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    JTS 升級    ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    CCM 升級    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    GC 升級    ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    QM 升級    ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    RM 升級    ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "正在檢查 RM 舊應用程式版本..."
;;

RM_DISPLAY_OLD_VERSION )
echo "RM 舊應用程式版本是 '$2'"
;;

# *********************
# * First step switch *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "前次執行失敗於起始步驟..."
;;

LAST_STEP_FAILED )
echo ""
echo "前次執行失敗於步驟 $2..."
echo "您想從這個步驟或前一個步驟重新開始升級？"
;;

ALREADY_RUN )
echo ""
echo "已順利完成升級..."
echo "您想從特定步驟重新開始新的升級嗎？"
;;

LAST_STEP_PASSED )
echo ""
echo "前次執行已順利停止於步驟 $2..."
echo "您想從現行步驟 $3 或前一個步驟重新開始升級嗎？"
;;

ENTER_NEXT_STEP )
echo ""
echo "請輸入步驟編號 [$2-$3]，以便從該處重新開始升級，或是按下 [Enter] 鍵來取消："
;;

INTEGER_STEP_NUMBER )
echo ""
echo "'$2' 不是數字。請輸入有效的步驟編號。"
;;

INVALID_STEP_NUMBER )
echo ""
echo "'$2' 是無效的步驟編號。請輸入有效的步驟編號。"
;;

MAX_STEP_NUMBER )
echo ""
echo "最後一個步驟是步驟 $2，因此您無法在步驟 $3 重新開始升級。"
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "步驟 $2 尚未執行，因此您無法在步驟 $3 重新開始升級。"
;;


# **********************
# * Messages for Steps *
# **********************

STEP_0_IBMi )
echo "步驟 0：捨棄表格"
echo "-------------------"
;;

STEP_0 )
echo "步驟 0：更新配置檔"
echo "---------------------------"
;;

STEP_1_ADD )
echo "步驟 1：新增表格"
echo "------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "步驟 $2：重建文字索引"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "步驟 2 $2：重建查詢並搜尋索引"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "步驟 $2：將 LPA 合併至 JTS"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "步驟 $2：修正 LPA 儲存區的前端 URL"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "步驟 $2：將 LPA 夥伴從 RM 移除"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "步驟 2：升級資料倉儲綱目"
echo "-------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "步驟 $2：終結 RM 應用程式"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "步驟 $2：終結 JTS 應用程式"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "步驟 $2：重新編製 RM 應用程式的索引"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "$2 升級失敗於步驟 $3。請更正問題，並從步驟 $3 開始重新執行 Script。"
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "$2 升級成功。現在，您可以在環境中升級任何應用程式。"
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "RM 升級作業的離線部分已成功。現在，您可以啟動部署中的伺服器。"
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "RM 升級作業的離線部分已成功。另需執行一個"
echo "步驟，才能完成移轉，但是鏈結至 RM 的所有伺服器"
echo "（例如 RTC、RQM、JRS、GC）必須都在線上。如果方便，請啟動"
echo "所有伺服器（包括 RM）。建議您登入每一部伺服器"
echo "並確定它們運作正常。然後執行下列指令："
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "$2 升級成功。現在，您可以啟動部署中的伺服器。"
echo ""
;;

# *******************************
# * Messages while running step *
# *******************************

STEP_DIR_CMD )
echo ""
echo "目錄：$2"
echo "指令："
;;

ENTER_STEP_ACTION )
echo "輸入 [E] 執行這個步驟、輸入 [S] 跳過它，或按下 [Enter] 鍵取消執行 Script："
;;

INVALID_STEP_ACTION )
echo ""
echo "'$2' 輸入無效，只接受 'E'、'S' 或 'Enter'"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "將開啟 vi 編輯器，讓您驗證 $2 teamserver.properties 檔。"
echo "驗證 com.ibm.team.repository.server.webapp.url 內容所表示的「公用 URI 根目錄」無誤。"
echo "驗證資料庫內容無誤。"
echo "當完成時，請儲存您的變更（若有的話），並且關閉編輯器，繼續執行 Script。"
echo ""
echo "請參閱產品說明文件的「升級 Rational CLM 解決方案」主題，"
echo "以取得如何適當配置每一個內容的相關資訊。"
;;

PAUSE )
echo ""
echo "輸入 [C] 繼續執行，或按下 [Enter] 鍵取消執行 Script："
;;

INVALID_PAUSE_ACTION )
echo ""
echo "'$2' 輸入無效，只接受 'C' 或 'Enter'"
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "正在將文字索引從 '$2' 複製到 '$3'。"
echo "可能需要數分鐘..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "正在將查詢和搜尋索引從 '$2' 複製到 '$3'。"
echo "可能需要數分鐘..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "無法將文字索引從 '$2' 複製到 '$3'。"
echo "請驗證定義在 teamserver.properties 檔中的"
echo "com.ibm.team.fulltext.indexLocation 內容。"
echo "請手動將文字索引複製到這個目錄，"
echo "或執行 repotools -rebuildTextIndices 來重建文字索引。"
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "$NEW_APP_PARENT_DIR/RM_APP.ID 檔不存在"
echo "請建立這個檔案，其中只有一行，包含 RM 應用程式 ID，"
echo "然後再試一次。"
echo ""
;;

# *****************************************
# * Messages for Public URIs verification *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 錯誤 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "$3 中未定義任何"
echo "「公用 URI」，"
echo "因此無法開始升級。"
echo ""
echo "這個檔案中必須定義一個「公用 URI」，如以下所示："
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "「公用 URI」內容 com.ibm.team.repository.server.webapp.url 必須存在於 teamserver.properties 檔中。"
echo "請在舊安裝架構的 teamserver.properties 檔中新增內容，並將值設為所有用戶端用來呼叫到伺服器的 URI 根目錄。"
echo "為了讓新安裝架構適當運作，務必要提供「公用 URI 根目錄」。若無這個內容，升級將不會成功。"
echo "如需相關資訊，請參閱產品說明文件中的「規劃 URI」主題。"
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 錯誤 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "定義在 $3 中的所有"
echo "「公用 URI」皆已註銷，"
echo "因此無法開始升級。"
echo ""
echo "此檔案中應有一個未註解的「公用 URI」定義如下："
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "「公用 URI」內容 com.ibm.team.repository.server.webapp.url 必須存在於 teamserver.properties 檔中。"
echo "請在舊安裝架構的 teamserver.properties 檔中新增內容，並將值設為所有用戶端用來呼叫到伺服器的 URI 根目錄。"
echo "為了讓新安裝架構適當運作，務必要提供「公用 URI 根目錄」。若無這個內容，升級將不會成功。"
echo "如需相關資訊，請參閱產品說明文件中的「規劃 URI」主題。"
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "JTS 的環境定義根目錄設為 '$2'。"
echo "應用程式的環境定義根目錄設為 '$3'。"
echo "JTS 和應用程式的環境定義根目錄不能相同。"
echo ""
;;

esac

}
