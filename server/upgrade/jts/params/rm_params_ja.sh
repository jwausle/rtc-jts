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
# # rm_upgrade.sh スクリプト・パラメーターに対応する環境変数、
# # およびそのデフォルト値の定義
# #
# #===========================================================
# #
# # このファイルは、rm_upgrade.sh スクリプトの実行開始時に
# # 読み取られます。このファイルで、有効なパラメーターごと
# # に、1 つの環境変数と定義済みのデフォルト値が設定されます。
# #
# # ユーザーは、デフォルト値を変更して rm_upgrade.sh スクリ
# # プトを独自の値で起動することもできます。そうすれば、コ
# # マンド行でパラメーターとそれに対応する値を手動で入力す
# # る必要はありません。
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
# 	旧インストール済み環境でのアプリケーション・ホーム・ディレクトリーの絶対パス。
# デフォルト:
# 	<なし>
# 制約:
#  - これは必須パラメーターです
#  - <ディレクトリー・パス> は「server/conf」で終わる既存のディレクトリーでなければなりません
#    例: /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# パラメーター: -applicationContextRoot
# 使用法: -applicationContextRoot <ルート>
# 説明:
# 	アプリケーション・コンテキスト・ルート。
# デフォルト:
# 	<なし>
# 制約:
#  - <ルート> は有効な単一のディレクトリー名 (つまり前にスラッシュがないもの) でなければなりません。
#
APPLICATION_CONTEXT_ROOT=

# パラメーター: -oldApplicationVersion
# 使用法: -oldApplicationVersion <バージョン>
# 説明:
# 	アップグレードするバージョン。デフォルトでは、古いアプリケーションに対して
#     repotools -version を実行する操作でこの値が判別されます。
# デフォルト:
# 	<なし>
# 制約:
#  - 完全なバージョン・ストリング
#    (5.0.0 や 5.0.1 など) にしてください
#
OLD_APPLICATION_VERSION=

# パラメーター: -updateTomcatFiles
# 使用法: -updateTomcatFiles <yes | no>
# 説明:
# 	Tomcat 構成ファイルを更新するかどうか。
# デフォルト:
# 	yes
# 制約:
#  - 有効な値は「yes」および「no」のみです。
#
UPDATE_TOMCAT_FILES=yes

# パラメーター: -oldApplicationTomcatHome
# 使用法: -oldApplicationTomcatHome <ディレクトリー・パス>
# 説明:
# 	旧インストール済み環境でのアプリケーション Tomcat ルート・ディレクトリーの絶対パス。
# デフォルト:
# 	<なし>
# 制約:
#  - RM アップグレードの場合のみ受諾されます
#  - 既存のディレクトリーでなければなりません
#
OLD_TOMCAT_HOME=

# パラメーター: -oldJTSTomcatHome
# 使用法: -oldJTSTomcatHome <ディレクトリー・パス>
# 説明:
# 	旧インストール済み環境での JTS Tomcat ルート・ディレクトリーの絶対パス。
# デフォルト:
# 	<なし>
# 制約:
#  - RM アップグレードの場合のみ受諾されます
#  - 既存のディレクトリーでなければなりません
#
OLD_JTS_TOMCAT_HOME=

# パラメーター: -newApplicationHome
# 使用法: -newApplicationHome <ディレクトリー・パス>
# 説明:
# 	新規インストール済み環境でのアプリケーション・ホーム・ディレクトリーへのパス。
# デフォルト:
# 	conf
# 制約:
#  - RTC、QM、および RM のアップグレードの場合のみ受諾されます
#  - 受諾された場合、これは必須パラメーターとなります
#  - <ディレクトリー・パス> は「server/conf」で終わる既存のディレクトリーでなければなりません
#    例: /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# パラメーター: -newJTSHome
# 使用法: -newJTSHome <ディレクトリー・パス>
# 説明:
# 	新規インストール済み環境で使用される、JTS 内の JTS ホーム・ディレクトリーの絶対パス。
# デフォルト:
# 	新規アプリケーション・ホーム・ディレクトリー
# 制約:
#  - <ディレクトリー・パス> は「server/conf」で終わる既存のディレクトリーでなければなりません
#
NEW_JTS_HOME=

# パラメーター: -newJTSContextRoot
# 使用法: -newJTSContextRoot <ルート>
# 説明:
# 	新規 JTS サーバーのコンテキスト・ルート。
# デフォルト:
# 	jts
# 制約:
#  - <ルート> は有効な単一のディレクトリー名 (つまり前にスラッシュがないもの) でなければなりません
#
JTS_CONTEXT_ROOT=jts

# パラメーター: -newApplicationTomcatHome
# 使用法: -newApplicationTomcatHome <ディレクトリー・パス>
# 説明:
# 	新規インストール済み環境でのアプリケーション Tomcat ルート・ディレクトリーへのパス。
# デフォルト:
# 	<なし>
#
NEW_TOMCAT_HOME=

# パラメーター: -newJTSTomcatHome
# 使用法: -newJTSTomcatHome <ディレクトリー・パス>
# 説明:
# 	新規インストール済み環境で使用される、JTS 内の JTS Tomcat ルート・ディレクトリーへのパス。
# デフォルト:
# 	<なし>
#
NEW_JTS_TOMCAT_HOME=

# パラメーター: -overwrite
# 使用法: -overwrite
# 説明:
# 	repotools コマンドの実行中、強制的に上書きします (つまり、常時 overwrite=yes を使用)。
# デフォルト:
# 	<なし>
# 制約:
#  - 有効な値は空、または「overwrite=yes」のみです
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# パラメーター: -noVerify
# 使用法: -noVerify
# 説明:
# 	repotools コマンドの実行中、検証を実行しません (つまり、常時 noVerify を使用)。
# デフォルト:
# 	<なし>
# 制約:
#  - 有効な値は空、または「noVerify」のみです
#
# NO_VERIFY=noVerify
NO_VERIFY=

# パラメーター: -noStepPrompt
# 使用法: -noStepPrompt
# 説明:
# 	各アップグレード・ステップの前にプロンプトを出しません
# デフォルト:
# 	false
# 制約:
#  - 有効な値は「true」または「false」のみです
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

# パラメーター: -db.jdbc.location
# 使用法: -db.jdbc.location <JDBC URL>
# 説明:
# 	RM データベースの JDBC ロケーション。(4.x から 5.x へ移行する場合のみ必要)
#
#		例:
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		注:
#			Unix 系システムでは、(|  &  ;  <  >  (  )  $  `  \  "  '  <space>  <tab>  <newline> など)
#			多くの文字を円記号でエスケープする必要があります。
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# デフォルト:
# 	<なし>
# 制約:
#  - RM を 4.x からアップグレードする場合のみ受諾されます
#
DB_JDBC_LOCATION_VALUE=

# パラメーター: -db.jdbc.password
# 使用法: -db.jdbc.password <JDBC パスワード>
# 説明:
# 	JDBC URL に「{password}」が現れた場合に置換される (プレーン・テキストまたは暗号化された) パスワード。
# デフォルト:
# 	<なし>
# 制約:
#  - RM データベースの JDBC URL に {password} が含まれている場合は指定しなければなりません
#
DB_JDBC_PASSWORD_VALUE=


# パラメーター: -db.db2i.schema.name
# 使用法: -db.db2i.schema.name <スキーマ名>
# 説明:
# 	DB2i DB スキーマ名。
# デフォルト:
# 	<なし>
# 制約:
#  - DB2i データベース・タイプを使用して指定しなければなりません。
#
DB_DB2I_SCHEMA_NAME_VALUE=

# パラメーター: -db.db2.dsn.dbname
# 使用法: -db.db2.dsn.dbname <DSN DB 名>
# 説明:
# 	DB2Z DSN DB 名。
# デフォルト:
# 	<なし>
# 制約:
#  - DB2z データベース・タイプを使用して指定しなければなりません。
#
DB_DB2_DSN_DBNAME_VALUE=

# パラメーター: -db.schemaPrefix
# 使用法: -db.schemaPrefix <スキーマ接頭部>
# 説明:
# 	DB スキーマの接頭部。
# デフォルト:
# 	<なし>
# 制約:
#  - DB2z データベース・タイプを使用して指定しなければなりません。
#
DB_SCHEMA_PREFIX_VALUE=


# パラメーター: -oldJTSHome
# 使用法: -oldJTSHome <ディレクトリー・パス>
# 説明:
# 	旧インストール済み環境での JTS ホーム・ディレクトリーの絶対パス。
# デフォルト:
# 	<なし>
# 制約:
#  - <ディレクトリー・パス> は、「server/conf」で終わる既存のディレクトリーでなければなりません。
#  - RM と JTS のアップグレードの場合にのみ有効です
#
OLD_JTS_HOME=

# パラメーター: -lpaContextRoot
# 使用法: -lpaContextRoot <ルート>
# 説明:
# 	LPA コンテキスト・ルート。
# デフォルト:
# 	admin
# 制約:
#  - <ルート> は有効な単一のディレクトリー名 (前にスラッシュがないもの) でなければなりません。
#
LPA_CONTEXT_ROOT=admin
