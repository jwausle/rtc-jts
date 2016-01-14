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
# # gc_upgrade.sh スクリプト・パラメーターに対応する環境変数、
# # およびそのデフォルト値の定義
# #
# #===========================================================
# #
# # このファイルは、gc_upgrade.sh スクリプトの実行開始時に
# # 読み取られます。このファイルで、有効なパラメーターごと
# # に、1 つの環境変数と定義済みのデフォルト値が設定されます。
# #
# # ユーザーは、デフォルト値を変更して gc_upgrade.sh スク
# # リプトを独自の値で起動することもできます。そうすれば、
# # コマンド行でパラメーターとそれに対応する値を手動で入力
# # する必要はありません。
# #
# # 警告:
# # すべてのアプリケーションにすべての変数を設定する必要は
# # ありません。値を変更する前に、それぞれのコメントを注意
# # 深くお読みください。
# #
# #############################################################

# パラメーター: -oldApplicationHome
# 使用法: -oldApplicationHome <ディレクトリー・パス>
# 説明:
# 	3.0.1 インストール済み環境のアプリケーション・ホーム・ディレクトリーへの絶対パス。
# デフォルト:
# 	<なし>
# 制約:
#  - これは必須パラメーターです
#  - <ディレクトリー・パス> は「server/conf」で終わる既存のディレクトリーでなければなりません
#    例: /QIBM/UserData/JazzTeamServer301Backup/server/conf
#
OLD_APPLICATION_HOME=

# パラメーター: -applicationContextRoot
# 使用法: -applicationContextRoot <ルート>
# 説明:
# 	3.0.1 サーバーのアプリケーション・コンテキスト・ルート。
# デフォルト:
# 	gc
# 制約:
#  - <ルート> は有効な単一のディレクトリー名 (つまり前にスラッシュがないもの) でなければなりません
#
APPLICATION_CONTEXT_ROOT=

# パラメーター: -oldApplicationVersion
# 使用法: -oldApplicationVersion <バージョン>
# 説明:
# 	アップグレードする 3.0.x バージョン。デフォルトでは、古いアプリケーションに対して
#     repotools -version を実行する操作でこの値が判別されます。
# デフォルト:
# 	<なし>
# 制約:
#  - 完全なバージョン・ストリング
#    (3.0.0 や 3.0.1 など) にしてください
#
OLD_APPLICATION_VERSION=

# パラメーター: -updateTomcatFiles
# 使用法: -updateTomcatFiles <yes | no>
# 説明:
# 	Tomcat 構成ファイルを更新するかどうか。
# デフォルト:
# 	no
# 制約:
#  - 有効な値は「yes」および「no」のみです。
#
UPDATE_TOMCAT_FILES=no

# パラメーター: -oldTomcatHome
# 使用法: -oldTomcatHome <ディレクトリー・パス>
# 説明:
# 	3.0.1 インストール済み環境での Tomcat ルート・ディレクトリーの絶対パス。
# デフォルト:
# 	<なし>
# 制約:
#  - 既存のディレクトリーでなければなりません
#
OLD_TOMCAT_HOME=

# パラメーター: -newApplicationHome
# 使用法: -newApplicationHome <ディレクトリー・パス>
# 説明:
# 	4.0 インストール済み環境のアプリケーション・ホーム・ディレクトリーへのパス。
# デフォルト:
# 	conf
# 制約:
#  - RTC、QM、GC、および RM のアップグレードの場合のみ受諾されます
#  - 受諾された場合、これは必須パラメーターとなります
#  - <ディレクトリー・パス> は「server/conf」で終わる既存のディレクトリーでなければなりません
#    例: /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# パラメーター: -newJTSHome
# 使用法: -newJTSHome <ディレクトリー・パス>
# 説明:
# 	4.0 インストール済み環境の JTS ホーム・ディレクトリーへの絶対パス。
# デフォルト:
# 	新規アプリケーション・ホーム・ディレクトリー
# 制約:
#  - <ディレクトリー・パス> は「server/conf」で終わる既存のディレクトリーでなければなりません
#    例: /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# パラメーター: -jtsContextRoot
# 使用法: -jtsContextRoot <ルート>
# 説明:
# 	4.0 JTS サーバーのコンテキスト・ルート。
# デフォルト:
# 	jts
# 制約:
#  - <ルート> は有効な単一のディレクトリー名 (つまり前にスラッシュがないもの) でなければなりません
#
JTS_CONTEXT_ROOT=jts

# パラメーター: -newApplicationTomcatHome
# 使用法: -newApplicationTomcatHome <ディレクトリー・パス>
# 説明:
# 	4.0 インストール済み環境のアプリケーション Tomcat ルート・ディレクトリーへのパス。
# デフォルト:
# 	<なし>
#
NEW_TOMCAT_HOME=

# パラメーター: -newJTSTomcatHome
# 使用法: -newJTSTomcatHome <ディレクトリー・パス>
# 説明:
# 	4.0 インストール済み環境の JTS Tomcat ルート・ディレクトリーへのパス。
# デフォルト:
# 	<なし>
#
NEW_JTS_TOMCAT_HOME=

# パラメーター: -ignoreJTSVersionCheck
# 使用法: -ignoreJTSVersionCheck
# 説明:
# 	アプリケーションのバージョンが newJTSHome にある Jazz Team Server
#   のバージョンと互換性があることを確認しません。
# デフォルト:
# 	<なし>
# 制約:
#  - 有効な値は空、または「ignoreJTSVersionCheck」のみです
#
IGNORE_JTS_VERSION_CHECK=

# パラメーター: -noPrompt
# 使用法: -noPrompt
# 説明:
# 	表を作成または変更する前にプロンプトを出しません。
# デフォルト:
# 	noPrompt
# 制約:
#  - 有効な値は空または「noPrompt」のみです。
#
# NO_PROMPT=
NO_PROMPT=noPrompt

# パラメーター: -noVerify
# 使用法: -noVerify
# 説明
# 	teamserver.properties ファイルの検査を実行しません。
# デフォルト:
# 	noVerify
# 制約:
#  - 有効な値は空または「noVerify」のみです。
#
# NO_VERIFY=
NO_VERIFY=noVerify

# パラメーター: -noStepPrompt
# 使用法: -noStepPrompt
# 説明:
# 	ステップを実行する前にプロンプトを出しません。
# デフォルト:
# 	false
# 制約:
#  - 有効な値は「true」および「false」のみです。
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# パラメーター: -noEditor
# 使用法: -noEditor
# 説明:
#   teamserver.properties ファイルに対してエディターを開かない。
# デフォルト:
# 	false
# 制約:
#  - 有効な値は「true」および「false」のみです。
#
# NO_EDITOR=false
NO_EDITOR=false
