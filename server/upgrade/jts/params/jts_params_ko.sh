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
# # jts_upgrade.sh 스크립트 매개변수에 해당하는 환경 변수 및
# # 해당 변수의 기본값 정의
# #
# #===========================================================
# #
# # 이 파일은 jts_upgrade.sh 스크립트 실행
# # 시작 시에 읽습니다. 파일은 사전정의된 기본값을 사용하여 올바른
# # 매개변수당 하나의 환경 변수를 설정합니다.
# #
# # 사용자는 매개변수 및 해당 값을 명령행에서 직접
# # 입력하지 않고 자체 기본값을 사용하여
# # jts_upgrade.sh 스크립트를 실행하기 위해
# # 기본값을 수정할 수 있습니다.
# #
# # 경고:
# # 모든 애플리케이션에 대해 모든 변수를
# # 설정할 필요는 없습니다. 값을 수정하기 전에
# # 각 주석을 주의깊게 읽으십시오.
# #
# #############################################################

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

# 매개변수: -jtsContextRoot
# 사용법: -jtsContextRoot <root>
# 설명:
# 	JTS 컨텍스트 루트입니다.
# 기본값:
# 	jts
# 제한조건:
#  - <root>는 올바른 디렉토리 단일 이름(즉, 선행 슬래시 없는)이어야 합니다.
#
JTS_CONTEXT_ROOT=jts

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


# 매개변수: -oldJTSVersion
# 사용법: -oldJTSVersion <version>
# 설명:
# 	업그레이드 중인 JTS 버전입니다. 기본적으로
#   이는 이전 JTS에 대하여 repotools -version을 실행하여 판별됩니다.
# 기본값:
# 	<none>
# 제한조건:
#  - 완전한 버전 문자열이여야 합니다.
#    예: 3.0.0 또는 3.0.1
#
OLD_JTS_VERSION=

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

# 매개변수: -oldTomcatHome
# 사용법: -oldTomcatHome <dir path>
# 설명:
# 	이전 설치에서 Tomcat 루트 디렉토리의 전체 경로입니다.
# 기본값:
# 	<none>
# 제한조건:
#  - 기존 디렉토리여야 합니다.
#
OLD_TOMCAT_HOME=

# 매개변수: -newJTSHome
# 사용법: -newJTSHome <dir path>
# 설명:
# 	새 설치에서 JTS 서버 구성 디렉토리의 경로입니다.
# 기본값:
# 	conf
# 제한조건:
#  - <dir path>는 'server/conf'로 끝나는 기존 디렉토리여야 합니다.
#
NEW_JTS_HOME="$START_DIR/conf"

# 매개변수: -newTomcatHome
# 사용법: -newTomcatHome <dir path>
# 설명:
# 	새 설치에서 Tomcat 홈 디렉토리의 경로입니다.
# 기본값:
# 	<none>
#
NEW_TOMCAT_HOME=

# 매개변수: -noPrompt
# 사용법: -noPrompt
# 설명:
# 	테이블을 작성 또는 수정하기 전에 프롬프트를 표시하지 않습니다.
# 기본값:
# 	<none>
# 제한조건:
#  - 공백 또는 'noPrompt'만 올바른 값입니다.
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# 매개변수: -noVerify
# 사용법: -noVerify
# 설명:
# 	teamserver.properties 파일 검증을 수행하지 않습니다.
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
# 	단계를 실행하기 전에 프롬프트를 표시하지 않습니다.
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