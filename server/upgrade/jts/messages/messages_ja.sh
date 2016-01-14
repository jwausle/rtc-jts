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
echo "app_upgrade スクリプトを直接実行しないでください。  JTS またはアプリケーションをアップグレードするには、次のいずれかのコマンドを実行します。"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "上記コマンドの詳細については、-help を使用してください。"
;;

INVALID_START_DIR )
echo ""
echo "-help パラメーターを使用する場合を除き、$2 スクリプトは $3 から実行してください"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "ファイル「$2」には、アップグレード・スクリプト用のパラメーター値が含まれています。"
echo "デフォルト・パラメーター値のいずれかを変更する必要がある場合は、これらのファイルを編集するか、アップグレード・スクリプトのコマンド行引数としてそれらのパラメーター値を指定できます。"
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "以下のファイルのセットには、アプリケーションまたは JTS アップグレード用のデフォルト・パラメーター値が含まれています。  デフォルト・パラメーター値のいずれかを変更する必要がある場合は、これらのファイルを編集するか、アップグレード・スクリプトのコマンド行引数としてそれらのパラメーター値を指定できます。"
echo "- CCM アップグレード: $2/params/ccm_params$3.sh"
echo "- GC アップグレード:  $2/params/gc_params$3.sh"
echo "- QM アップグレード:  $2/params/qm_params$3.sh"
echo "- RM アップグレード:  $2/params/rm_params$3.sh"
echo "- JTS アップグレード: $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Parameters verification messages *
# ************************************

# Intrinsic verification
# ======================

MISSING_APP_TYPE )
echo ""
echo "JTS またはアプリケーション・タイプが指定されていません。  JTS またはアプリケーションをアップグレードするには、次のいずれかのコマンドを実行します。"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "上記コマンドの詳細については、-help を使用してください。"
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2 は有効な JTS またはアプリケーション・タイプではありません。  JTS またはアプリケーションをアップグレードするには、次のいずれかのコマンドを実行します。"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "上記コマンドの詳細については、-help を使用してください。"
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "パラメーター $2 の値が欠落しています。"
echo "パラメーターの詳細については、-help を使用してください。"
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "$2 パラメーターに指定されたディレクトリー $3 は存在しないか、または無効です。"
echo "パラメーターの詳細については、-help を使用してください。"
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "$2 パラメーターに指定されたディレクトリー $3 は絶対パスでなければなりません。"
echo "パラメーターの詳細については、-help を使用してください。"
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "$2 パラメーターに指定されたファイル $3 は存在しないか、または無効です。"
echo "パラメーターの詳細については、-help を使用してください。"
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3 は、$2 パラメーターには無効な値です。"
echo "パラメーターの詳細については、-help を使用してください。"
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2 は不明なパラメーターです。"
echo "パラメーターの詳細については、-help を使用してください。"
echo ""
;;


# Extrinsic verification
# ======================

MISSING_HOME_PARAM )
echo ""
echo "ホーム・ディレクトリー・パラメーター $2 が欠落しています。"
echo "パラメーターの詳細については、-help を使用してください。"
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "ディレクトリー $2 は存在しないか、または無効です。"
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "アプリケーション repotools コマンド「$2」が見つかりません。"
echo ""
echo "-oldApplicationHome パラメーター「$3」が、古いサーバー構成ディレクトリー (例えば「JazzInstallRoot/server/conf」) を指していることを確認してください。"
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "アプリケーション repotools コマンド「$2」が見つかりません。"
echo ""
echo "-oldApplicationHome パラメーター「$3」が、古いサーバー構成ディレクトリー (例えば「JazzInstallRoot/server/conf」) を指しており、jtsContextRoot パラメーター「$4」が正しいことを確認してください。"
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "構成ファイル「$2」が見つかりません。"
echo ""
echo "-oldApplicationHome パラメーター「$3」が、古いサーバー構成ディレクトリー (例えば「JazzInstallRoot/server/conf」) を指していることを確認してください。"
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "構成ファイル「$2」が見つかりません。"
echo ""
echo "-oldApplicationHome パラメーター「$3」が、古いサーバー構成ディレクトリー (例えば「JazzInstallRoot/server/conf」) を指しており、jtsContextRoot パラメーター「$4」が正しいことを確認してください。"
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "アプリケーション repotools コマンド「$2」が見つかりません。"
echo ""
echo "-newApplicationHome パラメーター「$3」が、新規アプリケーション・サーバー構成ディレクトリー (例えば「JazzInstallRoot/server/conf」) を指しており、applicationContextRoot パラメーター「$4」が正しいことを確認してください。"
echo "旧リリースからアップグレードしている場合には、正しいコンテキスト・ルートを選択していることを確認してください。  例えば、Installation Manager を使用している場合には、「コンテキスト・ルート・オプション」パネルで $5 のコンテキスト・ルート・オプションを選択する必要があります。  誤って別のオプションを選択した場合は、$5 のコンテキスト・ルート・オプションを使用して製品を再インストールしてください。"
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "構成ファイル「$2」が見つかりません。"
echo ""
echo "-newApplicationHome パラメーター「$3」が、新規 JTS サーバー構成ディレクトリー (例えば「JazzInstallRoot/server/conf」) を指しており、applicationContextRoot パラメーター「$4」が正しいことを確認してください。"
echo "旧リリースからアップグレードしている場合には、正しいコンテキスト・ルートを選択していることを確認してください。  例えば、Installation Manager を使用している場合には、「コンテキスト・ルート・オプション」パネルで $5 のコンテキスト・ルート・オプションを選択する必要があります。  誤って別のオプションを選択した場合は、$5 のコンテキスト・ルート・オプションを使用して製品を再インストールしてください。"
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "JTS repotools コマンド「$2」が見つかりません。"
echo ""
echo "-oldJTSHome パラメーター「$3」が、古い JTS サーバー構成ディレクトリー (例えば「JazzInstallRoot/server/conf」) を指しており、jtsContextRoot パラメーター「$4」が正しいことを確認してください。"
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "構成ファイル「$2」が見つかりません。"
echo ""
echo "-oldJTSHome パラメーター「$3」が、古い JTS サーバー構成ディレクトリー (例えば「JazzInstallRoot/server/conf」) を指しており、jtsContextRoot パラメーター「$4」が正しいことを確認してください。"
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "JTS repotools コマンド「$2」が見つかりません。"
echo ""
echo "-newJTSHome パラメーター「$3」が、新規 JTS サーバー構成ディレクトリー (例えば「JazzInstallRoot/server/conf」) を指しており、jtsContextRoot パラメーター「$4」が正しいことを確認してください。"
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "構成ファイル「$2」が見つかりません。"
echo ""
echo "-newJTSHome パラメーター「$3」が、新規 JTS サーバー構成ディレクトリー (例えば「JazzInstallRoot/server/conf」) を指しており、jtsContextRoot パラメーター「$4」が正しいことを確認してください。"
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "$2 のアップグレードには、2.x データを含む tar ファイルが必要です。"
echo "パラメーターの詳細については、-help を使用してください。"
echo ""
;;


# **********************
# * Execution messages *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    JTS アップグレード   ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    CCM アップグレード    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    GC アップグレード   ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    QM アップグレード   ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    RM アップグレード   ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "RM の古いアプリケーション・バージョンを確認中..."
;;

RM_DISPLAY_OLD_VERSION )
echo "RM の古いアプリケーション・バージョンは「$2」です"
;;

# *********************
# * First step switch *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "最後の実行が初期ステップで失敗しました..."
;;

LAST_STEP_FAILED )
echo ""
echo "最後の実行がステップ $2 で失敗しました..."
echo "このステップまたは前のステップからアップグレードを再開しますか?"
;;

ALREADY_RUN )
echo ""
echo "アップグレードは既に実行され、正常に完了しました..."
echo "特定のステップから新規アップグレードを再開しますか?"
;;

LAST_STEP_PASSED )
echo ""
echo "最後の実行がステップ $2 で正常に停止しました..."
echo "現在のステップ $3 または前のステップからアップグレードを再開しますか?"
;;

ENTER_NEXT_STEP )
echo ""
echo "アップグレードを再開するステップの番号 [$2-$3] を入力してください。キャンセルする場合は [Enter] キーを押してください:"
;;

INTEGER_STEP_NUMBER )
echo ""
echo "「$2」は番号ではありません。 有効なステップ番号を入力してください。"
;;

INVALID_STEP_NUMBER )
echo ""
echo "「$2」は無効なステップ番号です。 有効なステップ番号を入力してください。"
;;

MAX_STEP_NUMBER )
echo ""
echo "最後のステップはステップ $2 です。したがって、ステップ $3 からアップグレードを再開することはできません。"
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "ステップ $2 がまだ実行されていないので、ステップ $3 からアップグレードを再開することはできません。"
;;


# **********************
# * Messages for Steps *
# **********************

STEP_0_IBMi )
echo "ステップ 0: 表を除去します"
echo "-------------------"
;;

STEP_0 )
echo "ステップ 0: 構成ファイルを更新します"
echo "------------------------------------"
;;

STEP_1_ADD )
echo "ステップ 1: 表を追加します"
echo "--------------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "ステップ $2: テキスト索引を再ビルドします"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "ステップ $2: 照会索引および検索索引を再作成します"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "ステップ $2: LPA を JTS にマージします"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "ステップ $2: LPA ストレージ域のフロント・サイド URL を修正します"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "ステップ $2: RM から LPA フレンドを削除します"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "ステップ 2: データウェアハウス・スキーマをアップグレードします"
echo "--------------------------------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "ステップ $2: RM アプリケーションをファイナライズします"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "ステップ $2: JTS アプリケーションをファイナライズします"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "ステップ $2: RM アプリケーションを再索引付けします"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "$2 のアップグレードがステップ $3 で失敗しました。  問題を訂正してから、スクリプトをステップ $3 から再実行してください。"
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "$2 のアップグレードが正常に完了しました。  これで、ご使用環境にあるどのアプリケーションもアップグレードできます。"
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "RM アップグレードのオフライン部分が正常に完了しました。  ご使用のデプロイメントでサーバーを始動することができます。"
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "RM アップグレードのオフライン部分が正常に完了しました。マイグレーションの完了には"
echo "残り 1 ステップが必要ですが、それには RM にリンクするすべてのサーバー"
echo "(RTC、RQM、JRS、GC など) がオンラインであることが必要です。都合のいい時に、"
echo "すべてのサーバー (RM を含む) を立ち上げてください。各サーバーにログインして"
echo "それらが適切に作動していることを確認することが推奨されます。その後以下のコマンドを実行します。"
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "$2 のアップグレードが正常に完了しました。  ご使用のデプロイメントでサーバーを始動することができます。"
echo ""
;;

# *******************************
# * Messages while running step *
# *******************************

STEP_DIR_CMD )
echo ""
echo "ディレクトリー: $2"
echo "コマンド:"
;;

ENTER_STEP_ACTION )
echo "このステップを実行するには [E] キー、このステップをスキップするには [S] キー、スクリプトの実行をキャンセルするには [Enter] キーを押してください:"
;;

INVALID_STEP_ACTION )
echo ""
echo "「$2」は無効な入力です。許可されているのは「E」、「S」、または「Enter」のみです。"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "vi エディターが開いたら、$2 teamserver.properties ファイルを確認します。"
echo "com.ibm.team.repository.server.webapp.url プロパティーによって示されたパブリック URI ルートが正しいことを確認してください。"
echo "データベース・プロパティーが正しいことを確認してください。"
echo "完了したら、行った変更があれば保存し、エディターを閉じてスクリプトの実行を続行します。"
echo ""
echo "各プロパティーを正しく構成する方法に関する情報については、"
echo "製品資料の『Rational solution for CLM のアップグレード』トピックを参照してください。"
;;

PAUSE )
echo ""
echo "実行を続行する場合は [C] キー、スクリプトの実行をキャンセルする場合は [Enter] キーを押してください。"
;;

INVALID_PAUSE_ACTION )
echo ""
echo "'$2' は無効な入力です。許可されているのは「C」と「Enter」のみです。"
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "テキスト索引を「$2」から「$3」にコピーします。"
echo "これには数分かかる場合があります..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "照会索引と検索索引を「$2」から「$3」にコピーします。"
echo "これには数分かかる場合があります..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "テキスト索引を「$2」から「$3」にコピーできませんでした。"
echo "teamserver.properties ファイルで com.ibm.team.fulltext.indexLocation プロパティーが"
echo "定義されていることを確認してください。"
echo "テキスト索引を手動でこのディレクトリーにコピーするか、"
echo "repotools -rebuildTextIndices を実行してテキスト索引を再ビルドしてください。"
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "ファイル $NEW_APP_PARENT_DIR/RM_APP.ID が存在しません"
echo "RM アプリケーション ID を含む単一行でこのファイルを作成して、"
echo "再試行してください。"
echo ""
;;

# *****************************************
# * Messages for Public URIs verification *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! エラー !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "$3 に"
echo "パブリック URI が定義されていないため、"
echo "アップグレードを開始できません。"
echo ""
echo "このファイルには、以下のように定義されたパブリック URI が 1 つ必要です。"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "パブリック URI プロパティー com.ibm.team.repository.server.webapp.url が、teamserver.properties ファイルに指定されている必要があります。"
echo "このプロパティーを旧インストール済み環境の teamserver.properties ファイルに追加し、すべてのクライアントがサーバーにアクセスするために使用する URI ルートになるように値を設定してください。"
echo "パブリック URI ルートは、新規インストール済み環境が正しく機能するために不可欠です。 このプロパティーがないと、アップグレードは正常に行われません。  "
echo "詳しくは、製品資料の「URI の計画」に関するトピックを参照してください。"
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! エラー !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "$3 に"
echo "定義されているすべてのパブリック URI が"
echo "コメント化されているため、アップグレードを開始できません。"
echo ""
echo "このファイルには、以下のように定義された、コメント化されていないパブリック URI が 1 つ必要です。"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "パブリック URI プロパティー com.ibm.team.repository.server.webapp.url が、teamserver.properties ファイルに指定されている必要があります。"
echo "このプロパティーを旧インストール済み環境の teamserver.properties ファイルに追加し、すべてのクライアントがサーバーにアクセスするために使用する URI ルートになるように値を設定してください。"
echo "パブリック URI ルートは、新規インストール済み環境が正しく機能するために不可欠です。 このプロパティーがないと、アップグレードは正常に行われません。"
echo "詳しくは、製品資料の「URI の計画」に関するトピックを参照してください。"
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "JTS のコンテキスト・ルートが '$2' に設定されています。"
echo "アプリケーションのコンテキスト・ルートが '$3' に設定されています。"
echo "jts とアプリケーションのコンテキスト・ルートを同じにすることはできません。"
echo ""
;;

esac

}
