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
# # 定义与 jts_upgrade.sh 脚本参数相对应的环境变量及其缺省值
# #
# #
# #===========================================================
# #
# # 在开始执行 jts_upgrade.sh 脚本时，请阅读本文件。
# # 将为每个有效参数设置一个环境变量，并提供预定义的缺省值。
# #
# #
# # 用户可能希望修改缺省值，以便使用他们自己的值来
# # 启动 jts_upgrade.sh 脚本，
# # 而不必在命令行中手动输入参数及其相应值。
# #
# #
# # 警告：
# # 并不需要为每个应用程序都设置所有变量。
# # 在修改值之前，请仔细阅读每条注释。
# #
# #
# #############################################################

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

# 参数：-jtsContextRoot
# 用法：-jtsContextRoot <root>
# 描述：
# 	JTS 上下文根
# 缺省值：
# 	jts
# 约束：
#  - <root> 必须是有效的目录单名（即，没有前导斜杠）
#
JTS_CONTEXT_ROOT=jts

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

# 参数：-oldJTSVersion
# 用法：-oldJTSVersion <version>
# 描述：
# 	要升级的 JTS 的版本。缺省情况下，通过对旧 JTS 运行
#  Reptools -version 来确定此版本。
# 缺省值：
# 	<无>
# 约束：
#  - 应该是完整的版本字符串
#    例如 3.0.0 或 3.0.1
#
OLD_JTS_VERSION=

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

# 参数：-oldTomcatHome
# 用法：-oldTomcatHome <dir path>
# 描述：
# 	旧安装中的 Tomcat 根目录的完整路径。
# 缺省值：
# 	<无>
# 约束：
#  - 必须是现有目录
#
OLD_TOMCAT_HOME=

# 参数：-newJTSHome
# 用法：-newJTSHome <dir path>
# 描述：
# 	新安装的 JTS 服务器配置目录的路径。
# 缺省值：
# 	conf
# 约束：
#  - <dir path> 必须是以“server/conf”结尾的现有目录
#
NEW_JTS_HOME="$START_DIR/conf"

# 参数：-newTomcatHome
# 用法：-newTomcatHome <dir path>
# 描述：
# 	新安装的 Tomcat 主目录的路径。
# 缺省值：
# 	<无>
#
NEW_TOMCAT_HOME=

# 参数：-noPrompt
# 用法：-noPrompt
# 描述：
# 	在创建或修改表之前不提示
# 缺省值：
# 	<无>
# 约束：
#  - 有效值只有“noPrompt”或者为空
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# 参数：-noVerify
# 用法：-noVerify
# 描述：
# 	不对 teamserver.properties 文件执行验证。
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
# 	执行步骤之前不提示。
# 缺省值：
#   false
# 约束：
#  - 有效值只有“true”和“false”
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
