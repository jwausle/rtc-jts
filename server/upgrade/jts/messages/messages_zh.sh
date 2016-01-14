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
echo "请勿直接执行 app_upgrade 脚本。要对 JTS 或应用程序进行升级，请运行下列其中一个命令："
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "使用 -help 可以获得有关上述命令的完整描述。"
;;

INVALID_START_DIR )
echo ""
echo "除了使用 -help 参数时之外，必须从 $3 运行 $2 脚本"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "文件“$2”中包含升级脚本的参数值。"
echo "如果您需要修改任何缺省参数值，那么可以编辑这些文件，也可以指定参数值作为升级脚本的命令行参数。"
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "下面这一组文件包含用于应用程序或 JTS 升级的缺省参数值。如果您需要修改任何缺省参数值，那么可以编辑这些文件，也可以指定参数值作为升级脚本的命令行参数。"
echo "- CCM 升级：$2/params/ccm_params$3.sh"
echo "- GC 升级：$2/params/gc_params$3.sh"
echo "- QM 升级：$2/params/qm_params$3.sh"
echo "- RM 升级：$2/params/rm_params$3.sh"
echo "- JTS 升级：$2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Parameters verification messages *
# ************************************

# Intrinsic verification
# ======================

MISSING_APP_TYPE )
echo ""
echo "未指定 JTS 或应用程序类型。要对 JTS 或应用程序进行升级，请运行下列其中一个命令："
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "使用 -help 可以获得有关上述命令的完整描述。"
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2 不是有效的 JTS 或应用程序类型。要对 JTS 或应用程序进行升级，请运行下列其中一个命令："
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "使用 -help 可以获得有关上述命令的完整描述。"
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "缺少参数 $2 的值。"
echo "请使用 -help 以获取关于参数的完整描述。"
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "为参数 $2 指定的目录 $3 不存在或者无效。"
echo "请使用 -help 以获取关于参数的完整描述。"
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "为参数 $2 指定的目录 $3 必须是一个绝对路径。"
echo "请使用 -help 以获取关于参数的完整描述。"
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "为参数 $2 指定的文件 $3 不存在或者无效。"
echo "请使用 -help 以获取关于参数的完整描述。"
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "对于参数 $2，$3 是无效值。"
echo "请使用 -help 以获取关于参数的完整描述。"
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2 是未知参数。"
echo "请使用 -help 以获取关于参数的完整描述。"
echo ""
;;


# Extrinsic verification
# ======================

MISSING_HOME_PARAM )
echo ""
echo "缺少主目录参数 $2。"
echo "请使用 -help 以获取关于参数的完整描述。"
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "目录 $2 不存在或者无效。"
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "找不到应用程序 repotools 命令“$2”。"
echo ""
echo "请确认 -oldApplicationHome 参数“$3”指向旧的服务器配置目录，例如“JazzInstallRoot/server/conf”。"
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "找不到应用程序 repotools 命令“$2”。"
echo ""
echo "请确认 -oldApplicationHome 参数“$3”指向旧的服务器配置目录（例如，“JazzInstallRoot/server/conf”）并且 jtsContextRoot parameter“$4”正确。"
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "找不到配置文件“$2”。"
echo ""
echo "请确认 -oldApplicationHome 参数“$3”指向旧的服务器配置目录，例如“JazzInstallRoot/server/conf”。"
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "找不到配置文件“$2”。"
echo ""
echo "请确认 -oldApplicationHome 参数“$3”指向旧的服务器配置目录（例如，“JazzInstallRoot/server/conf”）并且 jtsContextRoot parameter“$4”正确。"
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "找不到应用程序 repotools 命令“$2”。"
echo ""
echo "请验证 -newApplicationHome 参数“$3”是否指向新的应用程序服务器配置目录（例如，“JazzInstallRoot/server/conf”）并且 applicationContextRoot 参数“$4”是否正确。"
echo "如果您正在从先前发行版进行升级，请确保您选择的上下文根正确。例如，如果使用 Installation Manager，那么必须在“上下文根选项”面板上选择 $5 上下文根选项。如果您意外选择了另一个选项，那么必须使用 $5 上下文根选项来重新安装本产品。"
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "找不到配置文件“$2”。"
echo ""
echo "请验证 -newApplicationHome 参数“$3”是否指向新的 JTS 服务器配置目录（例如，“JazzInstallRoot/server/conf”）并且 applicationContextRoot 参数“$4”是否正确。"
echo "如果您正在从先前发行版进行升级，请确保您选择的上下文根正确。例如，如果使用 Installation Manager，那么必须在“上下文根选项”面板上选择 $5 上下文根选项。如果您意外选择了另一个选项，那么必须使用 $5 上下文根选项来重新安装本产品。"
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "找不到 JTS repotools 命令“$2”。"
echo ""
echo "请确认 -oldJTSHome 参数“$3”指向旧的 JTS 服务器配置目录（例如，“JazzInstallRoot/server/conf”）并且 jtsContextRoot parameter“$4”正确。"
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "找不到配置文件“$2”。"
echo ""
echo "请确认 -oldJTSHome 参数“$3”指向旧的 JTS 服务器配置目录（例如，“JazzInstallRoot/server/conf”）并且 jtsContextRoot parameter“$4”正确。"
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "找不到 JTS repotools 命令“$2”。"
echo ""
echo "请确认 -newJTSHome 参数“$3”指向新的 JTS 服务器配置目录（例如，“JazzInstallRoot/server/conf”）并且 jtsContextRoot parameter“$4”正确。"
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "找不到配置文件“$2”。"
echo ""
echo "请确认 -newJTSHome 参数“$3”指向新的 JTS 服务器配置目录（例如，“JazzInstallRoot/server/conf”）并且 jtsContextRoot parameter“$4”正确。"
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "需要具备包含 2.x 数据的 tar 文件才能进行 $2 升级。"
echo "请使用 -help 以获取关于参数的完整描述。"
echo ""
;;


# **********************
# * Execution messages *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    JTS 升级    ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    CCM 升级    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    GC 升级    ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    QM 升级    ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    RM 升级    ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "正在检查 RM 的旧应用程序版本..."
;;

RM_DISPLAY_OLD_VERSION )
echo "RM 的旧应用程序版本为“$2”"
;;

# *********************
# * First step switch *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "上次执行时，在执行初始步骤时失败..."
;;

LAST_STEP_FAILED )
echo ""
echo "上次执行时，在执行步骤 $2 时失败..."
echo "要重新开始从此步骤或前一步骤进行升级吗？"
;;

ALREADY_RUN )
echo ""
echo "已进行升级并且已成功完成..."
echo "要从特定步骤重新开始新的升级吗？"
;;

LAST_STEP_PASSED )
echo ""
echo "上次执行已成功在步骤 $2 停止..."
echo "要重新开始从当前步骤 $3 或前一步骤进行升级吗？"
;;

ENTER_NEXT_STEP )
echo ""
echo "请输入您想要从其重新开始进行升级的步骤编号 [$2-$3]，或者按 [Enter] 键以取消："
;;

INTEGER_STEP_NUMBER )
echo ""
echo "“$2”不是编号。请输入有效的步骤编号。"
;;

INVALID_STEP_NUMBER )
echo ""
echo "“$2”是无效的步骤编号。请输入有效的步骤编号。"
;;

MAX_STEP_NUMBER )
echo ""
echo "最后一个步骤是步骤 $2，因此您不能从步骤 $3 重新开始进行升级。"
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "步骤 $2 尚未运行，因此您不能从步骤 $3 重新开始进行升级。"
;;


# **********************
# * Messages for Steps *
# **********************

STEP_0_IBMi )
echo "步骤 0：废弃表"
echo "-------------------"
;;

STEP_0 )
echo "步骤 0：更新 config 文件"
echo "---------------------------"
;;

STEP_1_ADD )
echo "步骤 1：添加表"
echo "------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "步骤 $2：重建文本索引"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "步骤 $2：重新创建查询和搜索索引"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "步骤 $2：将 LPA 合并至 JTS"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "步骤 $2：修正 LPA 存储区的前端 URL"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "步骤 $2：从 RM 中除去 LPA 友元"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "步骤 2：升级数据仓库模式"
echo "-------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "步骤 $2：完成 RM 应用程序"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "步骤 $2：完成 JTS 应用程序"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "步骤 $2：对 RM 应用程序重建索引"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "进行 $2 升级时在步骤 $3 失败。请解决问题，然后从步骤 $3 开始再次运行此脚本。"
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "$2 升级成功。现在，您可以对您所在环境中的任何应用程序进行升级。"
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "RM 升级的脱机部分已成功。您现在可以在部署中启动服务器。"
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "RM 升级的脱机部分已成功。完成迁移还需要完成一个余下步骤，"
echo "但此步骤要求所有链接至 RM 的服务器（例如 RTC、RQM、JRS 和 GC）"
echo "都处于联机状态。方便时，请启动所有"
echo "服务器（包括 RM）。建议登录每个服务器并确保它们正常工作。"
echo "然后运行以下命令："
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "$2 升级已成功。您现在可以在部署中启动服务器。"
echo ""
;;

# *******************************
# * Messages while running step *
# *******************************

STEP_DIR_CMD )
echo ""
echo "目录：$2"
echo "命令："
;;

ENTER_STEP_ACTION )
echo "输入 [E] 将执行此步骤，输入 [S] 将跳过此步骤，或者按 [Enter] 以取消执行脚本："
;;

INVALID_STEP_ACTION )
echo ""
echo "“$2”是无效条目，只允许为“E”、“S”或者“Enter”"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "vi 编辑器将打开以允许您验证 $2 teamserver.properties 文件。"
echo "请确认由 com.ibm.team.repository.server.webapp.url 属性表示的公用 URI 根正确。"
echo "请验证数据库属性是否正确。"
echo "验证完毕之后，如果进行了变更，请保存变更，然后关闭此编辑器以继续执行此脚本。"
echo ""
echo "请参阅产品文档的“对 Rational solution for CLM 进行升级”主题"
echo "以了解有关如何正确配置每个属性的信息。"
;;

PAUSE )
echo ""
echo "请输入 [C] 以继续执行，或者按 [Enter] 键以取消执行此脚本："
;;

INVALID_PAUSE_ACTION )
echo ""
echo "“$2”是无效条目，只允许为“C”或者“Enter”"
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "正将“$2”中的文本索引复制到“$3”。"
echo "这可能需要几分钟..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "正将“$2”中的查询和搜索索引复制到“$3”。"
echo "这可能需要几分钟..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "未能将文本索引从“$2”复制到“$3”。"
echo "验证在 teamserver.properties 文件中"
echo "定义的 com.ibm.team.fulltext.indexLocation 属性。"
echo "手动将文本索引复制到此目录"
echo "或者运行 repotools -rebuildTextIndices 以重新构建文本索引。"
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "文件 $NEW_APP_PARENT_DIR/RM_APP.ID 不存在"
echo "请创建此文件并将 RM 应用程序标识单列为一行，"
echo "然后重试。"
echo ""
;;

# *****************************************
# * Messages for Public URIs verification *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 错误 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "未在"
echo "$3 中定义公用 URI，"
echo "因此无法启动升级。"
echo ""
echo "此文件中必须有一个按如下所示定义的公用 URI："
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "teamserver.properties 文件中必须存在公用 URI 属性 com.ibm.team.repository.server.webapp.url。"
echo "将此属性添加到旧安装的 teamserver.properties 文件，并将值设置为所有客户机用来访问服务器的 URI 根。"
echo "公用 URI 根对于新安装的正常运行非常重要。没有此属性，升级将不会成功。"
echo "有关更多信息，请参阅有关“规划 URI”的产品文档主题。"
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 错误 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "已将 $3 中定义的"
echo "所有公用 URI 注释掉，"
echo "因此，无法开始进行升级。"
echo ""
echo "此文件中应当有一个按如下所示定义且已取消注释的公用 URI："
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "teamserver.properties 文件中必须存在公用 URI 属性 com.ibm.team.repository.server.webapp.url。"
echo "将此属性添加到旧安装的 teamserver.properties 文件，并将值设置为所有客户机用来访问服务器的 URI 根。"
echo "公用 URI 根对于新安装的正常运行非常重要。没有此属性，升级将不会成功。"
echo "有关更多信息，请参阅有关“规划 URI”的产品文档主题。"
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "JTS 的上下文根设置为“$2”。"
echo "应用程序的上下文根设置为：'$3'。"
echo "JTS 与应用程序的上下文根不得相同。"
echo ""
;;

esac

}
