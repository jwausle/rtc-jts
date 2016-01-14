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
# # rm_upgrade.sh 스크립트 매개변수에 해당하는 환경 변수 및
# # 해당 변수의 기본값 정의
# #
# #===========================================================
# #
# # 이 파일은 rm_upgrade.sh 스크립트 실행
# # 시작 시에 읽습니다. 파일은 사전정의된 기본값을 사용하여 올바른
# # 매개변수당 하나의 환경 변수를 설정합니다.
# #
# # 사용자는 매개변수 및 해당 값을 명령행에서 직접
# # 입력하지 않고 자체 기본값을 사용하여
# # rm_upgrade.sh 스크립트를 실행하기 위해
# # 기본값을 수정할 수 있습니다.
# #
# # 경고:
# # 모든 애플리케이션에 대해 모든 변수를
# # 설정할 필요는 없습니다. 값을 수정하기 전에
# # 각 주석을 주의깊게 읽으십시오.
# #
# #############################################################

# 매개변수: -oldApplicationHome
# 사용법: -oldApplicationHome <dir path>
# 설명:
# 	이전 설치에서 애플리케이션 홈 디렉토리의 전체 경로입니다.
# 기본값:
# 	<none>
# 제한조건:
#  - 이것은 필수 매개변수입니다.
#  - <dir path>는 'server/conf'로 끝나는 기존 디렉토리여야 합니다.
#    예: /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# 매개변수: -applicationContextRoot
# 사용법: -applicationContextRoot <root>
# 설명:
# 	애플리케이션 컨텍스트 루트입니다.
# 기본값:
# 	<none>
# 제한조건:
#  - <root>는 올바른 디렉토리 단일 이름(즉, 선행 슬래시 없는)이어야 합니다.
#
APPLICATION_CONTEXT_ROOT=

# 매개변수: -oldApplicationVersion
# 사용법: -oldApplicationVersion <version>
# 설명:
# 	업그레이드 중인 버전입니다.  기본적으로 이는 이전
#   애플리케이션에 대하여 repotools -version을 실행하여 판별됩니다.
# 기본값:
# 	<none>
# 제한조건:
#  - 완전한 버전 문자열이여야 합니다.
#    예: 5.0.0 또는 5.0.1
#
OLD_APPLICATION_VERSION=

# 매개변수: -updateTomcatFiles
# 사용법: -updateTomcatFiles <yes | no>
# 설명:
# 	Tomcat 구성 파일을 업데이트할지 여부입니다.
# 기본값:
# 	yes
# 제한조건:
#  - 'yes' 및 'no'만 올바른 값입니다.
#
UPDATE_TOMCAT_FILES=yes

# 매개변수: -oldApplicationTomcatHome
# 사용법: -oldApplicationTomcatHome <dir path>
# 설명:
# 	이전 설치에서 애플리케이션 Tomcat 루트 디렉토리의 전체 경로입니다.
# 기본값:
# 	<none>
# 제한조건:
#  - RM 업그레이드에만 허용됩니다.
#  - 기존 디렉토리여야 합니다.
#
OLD_TOMCAT_HOME=

# 매개변수: -oldJTSTomcatHome
# 사용법: -oldJTSTomcatHome <dir path>
# 설명:
# 	이전 설치에서 JTS Tomcat 루트 디렉토리의 전체 경로입니다.
# 기본값:
# 	<none>
# 제한조건:
#  - RM 업그레이드에만 허용됩니다.
#  - 기존 디렉토리여야 합니다.
#
OLD_JTS_TOMCAT_HOME=

# 매개변수: -newApplicationHome
# 사용법: -newApplicationHome <dir path>
# 설명:
# 	새 설치에서 애플리케이션 홈 디렉토리의 경로입니다.
# 기본값:
# 	conf
# 제한조건:
#  - RTC, QM, RM 업그레이드에만 허용됩니다.
#  - 허용된 경우, 이 값은 필수 매개변수입니다.
#  - <dir path>는 'server/conf'로 끝나는 기존 디렉토리여야 합니다.
#    예: /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# 매개변수: -newJTSHome
# 사용법: -newJTSHome <dir path>
# 설명:
# 	새 설치에서 사용하게 될 JTS의 JTS 홈 디렉토리 경로입니다.
# 기본값:
# 	새 애플리케이션 홈 디렉토리
# 제한조건:
#  - <dir path>는 'server/conf'로 끝나는 기존 디렉토리여야 합니다.
#
NEW_JTS_HOME=

# 매개변수: -newJTSContextRoot
# 사용법: -newJTSContextRoot <root>
# 설명:
# 	새로운 JTS 서버의 컨텍스트 루트입니다.
# 기본값:
# 	jts
# 제한조건:
#  - <root>는 올바른 디렉토리 단일 이름(즉, 선행 슬래시 없는)이어야 합니다.
#
JTS_CONTEXT_ROOT=jts

# 매개변수: -newApplicationTomcatHome
# 사용법: -newApplicationTomcatHome <dir path>
# 설명:
# 	새 설치에서 애플리케이션 Tomcat 루트 디렉토리의 경로입니다.
# 기본값:
# 	<none>
#
NEW_TOMCAT_HOME=

# 매개변수: -newJTSTomcatHome
# 사용법: -newJTSTomcatHome <dir path>
# 설명:
# 	새 설치에서 사용하게 될 JTS의 JTS Tomcat 루트 디렉토리 경로입니다.
# 기본값:
# 	<none>
#
NEW_JTS_TOMCAT_HOME=

# 매개변수: -overwrite
# 사용법: -overwrite
# 설명:
# 	repotools 명령을 실행하는 중에 겹쳐쓰기를 수행합니다(overwrite=yes를 항상 사용할 경우).
# 기본값:
# 	<none>
# 제한조건:
#  - 공백 또는 'overwrite=yes'만 올바른 값입니다.
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# 매개변수: -noVerify
# 사용법: -noVerify
# 설명:
# 	repotools 명령을 실행하는 중에 검증을 수행하지 않습니다(noVerify를 항상 사용할 경우).
# 기본값:
# 	<none>
# 제한조건:
#  - 공백 또는 'noVerify'만 올바른 값입니다.
#
# NO_VERIFY=noVerify
NO_VERIFY=

# 매개변수: -noStepPrompt
# 사용법: -noStepPrompt
# 설명:
# 	각 업그레이드 단계 전에 프롬프트를 표시하지 않습니다.
# 기본값:
# 	false
# 제한조건:
#  - 'true' 또는 'false'만 올바른 값입니다.
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# 매개변수: -noEditor
# 사용법: -noEditor
# 설명:
#   teamserver.properties 파일을 편집기로 열지 않습니다.
# 기본값:
#   false
# 제한조건:
#  - 'true' 또는 'false' 또는 공백만 올바른 값입니다.
#
# NO_EDITOR=false
NO_EDITOR=false

# 매개변수: -db.jdbc.location
# 사용법: -db.jdbc.location <JDBC_URL>
# 설명:
# 	RM 데이터베이스의 JDBC 위치입니다. (4.x에서 5.x로 이동할 때만 필요)
#
#		예:
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		참고:
#			*-nix 시스템의 많은 문자(예: |  &  ;  <  >  (  )  $  `  \  "  '  <space>  <tab>  <newline>)에서
#			이스케이프 시 백슬래시를 사용해야 합니다.
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# 기본값:
# 	<none>
# 제한조건:
#  - 4.x에서 RM 업그레이드에만 허용됩니다.
#
DB_JDBC_LOCATION_VALUE=

# 매개변수: -db.jdbc.password
# 사용법: -db.jdbc.password <JDBC_PASSWORD>
# 설명:
# 	"{password}"가 JDBC url에 표시될 경우 대체되는 비밀번호(평문 또는 암호화된 텍스트)입니다.
# 기본값:
# 	<none>
# 제한조건:
#  - RM 데이터베이스에 대한 JDBC URL에 {password}가 포함된 경우 지정되어야 합니다.
#
DB_JDBC_PASSWORD_VALUE=

# 매개변수: -db.db2i.schema.name
# 사용법: -db.db2i.schema.name <SCHEMA_NAME>
# 설명:
# 	DB2i DB 스키마 이름입니다.
# 기본값:
# 	<none>
# 제한조건:
#  - DB2i 데이터베이스 유형을 사용하여 지정되어야 합니다.
#
DB_DB2I_SCHEMA_NAME_VALUE=

# 매개변수: -db.db2.dsn.dbname
# 사용법: -db.db2.dsn.dbname <DSN_DBNAME>
# 설명:
# 	DB2Z DSN DB 이름입니다.
# 기본값:
# 	<none>
# 제한조건:
#  - DB2z 데이터베이스 유형을 사용하여 지정되어야 합니다.
#
DB_DB2_DSN_DBNAME_VALUE=

# 매개변수: -db.schemaPrefix
# 사용법: -db.schemaPrefix <SCHEMA_PREFIX>
# 설명:
# 	DB 스키마 접두부입니다.
# 기본값:
# 	<none>
# 제한조건:
#  - DB2z 데이터베이스 유형을 사용하여 지정되어야 합니다.
#
DB_SCHEMA_PREFIX_VALUE=

# 매개변수: -oldJTSHome
# 사용법: -oldJTSHome <dir path>
# 설명:
# 	이전 설치에서 JTS 홈 디렉토리의 전체 경로입니다.
# 기본값:
# 	<none>
# 제한조건:
#  - <dir path>는 'server/conf'로 끝나는 기존 디렉토리여야 합니다.
#  - RM 및 JTS 업그레이드에만 올바른 값입니다.
#
OLD_JTS_HOME=

# 매개변수: -lpaContextRoot
# 사용법: -lpaContextRoot <root>
# 설명:
# 	LPA 컨텍스트 루트입니다.
# 기본값:
# 	admin
# 제한조건:
#  - <root>는 올바른 디렉토리 단일 이름(즉, 선행 슬래시 없는)이어야 합니다.
#
LPA_CONTEXT_ROOT=admin
