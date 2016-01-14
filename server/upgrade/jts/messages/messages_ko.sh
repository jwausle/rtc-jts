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
# 업그레이드 자동 스크립트에서 표시하는 메시지 파일
#
# ################################################################################


# *********************
# * 메시지 함수       *
# *********************
messages() {

case $1 in 

# *********************************
# * 초기 검증 메시지              *
# *********************************

INVALID_LAUNCH )
echo ""
echo "app_upgrade 스크립트를 직접 실행하지 마십시오. JTS 또는 애플리케이션을 업그레이드하려면 다음 명령 중 하나를 실행하십시오."
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "위 명령의 전체 설명을 보려면 -help를 사용하십시오."
;;

INVALID_START_DIR )
echo ""
echo "-help 매개변수를 사용 중인 경우를 제외하고 $3에서 $2 스크립트를 실행해야 합니다."
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "'$2' 파일에 업그레이드 스크립트의 매개변수값이 들어 있습니다."
echo "기본 매개변수값 중 하나를 수정해야 할 경우, 이 파일을 편집하거나 매개변수값을 업그레이드 스크립트에 대한 명령행 인수로 지정할 수 있습니다."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "다음 파일 세트에 애플리케이션 또는 JTS 업그레이드에 대한 기본 매개변수값이 들어 있습니다.  기본 매개변수값 중 하나를 수정해야 할 경우, 이 파일을 편집하거나 매개변수값을 업그레이드 스크립트에 대한 명령행 인수로 지정할 수 있습니다."
echo "- CCM 업그레이드: $2/params/ccm_params$3.sh"
echo "- GC 업그레이드:  $2/params/gc_params$3.sh"
echo "- QM 업그레이드:  $2/params/qm_params$3.sh"
echo "- RM 업그레이드:  $2/params/rm_params$3.sh"
echo "- JTS 업그레이드: $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * 매개변수 검증 메시지             *
# ************************************

# 내부 검증
# ======================

MISSING_APP_TYPE )
echo ""
echo "JTS 또는 애플리케이션 유형이 지정되지 않았습니다.  JTS 또는 애플리케이션을 업그레이드하려면 다음 명령 중 하나를 실행하십시오."
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "위 명령의 전체 설명을 보려면 -help를 사용하십시오."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2는 올바른 JTS 또는 애플리케이션 유형이 아닙니다.  JTS 또는 애플리케이션을 업그레이드하려면 다음 명령 중 하나를 실행하십시오."
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "위 명령의 전체 설명을 보려면 -help를 사용하십시오."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "$2 매개변수의 값이 누락되었습니다."
echo "매개변수에 대한 전체 설명을 보려면 -help를 사용하십시오."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "$2 매개변수에 대해 지정된 $3 디렉토리가 존재하지 않거나 올바르지 않습니다."
echo "매개변수에 대한 전체 설명을 보려면 -help를 사용하십시오."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "$2 매개변수에 대해 지정된 $3 디렉토리는 절대 경로여야 합니다."
echo "매개변수에 대한 전체 설명을 보려면 -help를 사용하십시오."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "$2 매개변수에 대해 지정된 $3 파일이 존재하지 않거나 올바르지 않습니다."
echo "매개변수에 대한 전체 설명을 보려면 -help를 사용하십시오."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3은 $2 매개변수에 올바르지 않은 값입니다."
echo "매개변수에 대한 전체 설명을 보려면 -help를 사용하십시오."
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2은(는) 알 수 없는 매개변수입니다."
echo "매개변수에 대한 전체 설명을 보려면 -help를 사용하십시오."
echo ""
;;


# 외부 검증
# ======================

MISSING_HOME_PARAM )
echo ""
echo "$2 홈 디렉토리 매개변수가 누락되었습니다."
echo "매개변수에 대한 전체 설명을 보려면 -help를 사용하십시오."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "$2 디렉토리가 존재하지 않거나 올바르지 않습니다."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "애플리케이션 repotools 명령 '$2'을(를) 찾을 수 없습니다."
echo ""
echo "-oldApplicationHome 매개변수 '$3'이(가) 이전 서버 구성 디렉토리(예: 'JazzInstallRoot/server/conf')를 지정하는지 확인하십시오."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "애플리케이션 repotools 명령 '$2'을(를) 찾을 수 없습니다."
echo ""
echo "-oldApplicationHome 매개변수 '$3'이(가) 이전 서버 구성 디렉토리(예: 'JazzInstallRoot/server/conf')를 지정하는지와 jtsContextRoot 매개변수 '$4'이(가) 올바른지 확인하십시오."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "구성 파일 '$2'을(를) 찾을 수 없습니다."
echo ""
echo "-oldApplicationHome 매개변수 '$3'이(가) 이전 서버 구성 디렉토리(예: 'JazzInstallRoot/server/conf')를 지정하는지 확인하십시오."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "구성 파일 '$2'을(를) 찾을 수 없습니다."
echo ""
echo "-oldApplicationHome 매개변수 '$3'이(가) 이전 서버 구성 디렉토리(예: 'JazzInstallRoot/server/conf')를 지정하는지와 jtsContextRoot 매개변수 '$4'이(가) 올바른지 확인하십시오."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "애플리케이션 repotools 명령 '$2'을(를) 찾을 수 없습니다."
echo ""
echo "-newApplicationHome 매개변수 '$3'이(가) 새 서버 구성 디렉토리(예: 'JazzInstallRoot/server/conf')를 지정하는지와 applicationContextRoot 매개변수 '$4'이(가) 올바른지 확인하십시오."
echo "이전 릴리스에서 업그레이드하는 경우 올바른 컨텍스트 루트를 선택했는지 확인하십시오. 예를 들어, 설치 관리자를 사용하는 경우 "컨텍스트 루트 옵션" 패널에서 $5 컨텍스트 루트 옵션을 선택해야 합니다. 실수로 다른 옵션을 선택한 경우 $5 컨텍스트 루트 옵션으로 제품을 다시 설치해야 합니다."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "구성 파일 '$2'을(를) 찾을 수 없습니다."
echo ""
echo "-newApplicationHome 매개변수 '$3'이(가) 새 JTS 서버 구성 디렉토리(예: 'JazzInstallRoot/server/conf')를 지정하는지와 applicationContextRoot 매개변수 '$4'이(가) 올바른지 확인하십시오."
echo "이전 릴리스에서 업그레이드하는 경우 올바른 컨텍스트 루트를 선택했는지 확인하십시오. 예를 들어, 설치 관리자를 사용하는 경우 "컨텍스트 루트 옵션" 패널에서 $5 컨텍스트 루트 옵션을 선택해야 합니다. 실수로 다른 옵션을 선택한 경우 $5 컨텍스트 루트 옵션으로 제품을 다시 설치해야 합니다."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "JTS repotools 명령 '$2'을(를) 찾을 수 없습니다."
echo ""
echo "-oldJTSHome 매개변수 '$3'이(가) 이전 JTS 서버 구성 디렉토리(예: 'JazzInstallRoot/server/conf')를 지정하는지와 jtsContextRoot 매개변수 '$4'이(가) 올바른지 확인하십시오."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "구성 파일 '$2'을(를) 찾을 수 없습니다."
echo ""
echo "-oldJTSHome 매개변수 '$3'이(가) 이전 JTS 서버 구성 디렉토리(예: 'JazzInstallRoot/server/conf')를 지정하는지와 jtsContextRoot 매개변수 '$4'이(가) 올바른지 확인하십시오."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "JTS repotools 명령 '$2'을(를) 찾을 수 없습니다."
echo ""
echo "-newJTSHome 매개변수 '$3'이(가) 새 JTS 서버 구성 디렉토리(예: 'JazzInstallRoot/server/conf')를 지정하는지와 jtsContextRoot 매개변수 '$4'이(가) 올바른지 확인하십시오."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "구성 파일 '$2'을(를) 찾을 수 없습니다."
echo ""
echo "-newJTSHome 매개변수 '$3'이(가) 새 JTS 서버 구성 디렉토리(예: 'JazzInstallRoot/server/conf')를 지정하는지와 jtsContextRoot 매개변수 '$4'이(가) 올바른지 확인하십시오."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "$2 업그레이드를 위해 2.x 데이터를 포함하는 tar 파일이 필요합니다."
echo "매개변수에 대한 전체 설명을 보려면 -help를 사용하십시오."
echo ""
;;


# **********************
# * 실행 메시지        *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    JTS 업그레이드    ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    CCM 업그레이드    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    GC 업그레이드    ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    QM 업그레이드    ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    RM 업그레이드    ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "RM 이전 애플리케이션 버전을 검사하는 중..."
;;

RM_DISPLAY_OLD_VERSION )
echo "RM 이전 애플리케이션 버전은 '$2'입니다."
;;

# *********************
# * 첫 번째 단계 전환 *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "마지막 실행이 초기 단계에서 실패했습니다..."
;;

LAST_STEP_FAILED )
echo ""
echo "마지막 실행이 $2단계에서 실패했습니다..."
echo "이 단계 또는 이전 단계에서 업그레이드를 다시 시작하시겠습니까?"
;;

ALREADY_RUN )
echo ""
echo "업그레이드가 이미 실행되어 성공적으로 완료되었습니다..."
echo "특정 단계에서 새 업그레이드를 다시 시작하시겠습니까?"
;;

LAST_STEP_PASSED )
echo ""
echo "마지막 실행이 $2단계에서 성공적으로 중지되었습니다..."
echo "현재 단계인 $3단계 또는 이전 단계에서 업그레이드를 다시 시작하시겠습니까?"
;;

ENTER_NEXT_STEP )
echo ""
echo "업그레이드를 다시 시작할 단계 번호 [$2-$3]을(를) 입력하거나 [Enter]를 눌러 취소하십시오."
;;

INTEGER_STEP_NUMBER )
echo ""
echo "'$2'은(는) 숫자가 아닙니다. 올바른 단계 번호를 입력하십시오."
;;

INVALID_STEP_NUMBER )
echo ""
echo "'$2'은(는) 올바르지 않은 단계 번호입니다. 올바른 단계 번호를 입력하십시오."
;;

MAX_STEP_NUMBER )
echo ""
echo "마지막 단계가 $2단계이므로 $3단계에서 업그레이드를 다시 시작할 수 없습니다."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "$2 단계가 아직 실행되지 않았으므로 $3 단계에서 업그레이드를 다시 시작할 수 없습니다."
;;


# **********************
# * 단계 메시지        *
# **********************

STEP_0_IBMi )
echo "0단계: 테이블 삭제"
echo "-------------------"
;;

STEP_0 )
echo "0단계: 구성 파일 업데이트"
echo "-------------------------"
;;

STEP_1_ADD )
echo "1단계: 테이블 추가"
echo "------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "$2단계: 텍스트 색인 다시 빌드"
echo "-----------------------------"
;;

JFS_INDICES_STEP )
echo "$2단계: 조회 및 검색 색인 다시 작성"
echo "-----------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "$2단계: LPA를 JTS에 병합"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "단계 $2: LPA 저장 공간 영역의 프론트 사이드 URL 수정"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "단계 $2: RM에서 LPA 동반자 제거"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "단계 2: 데이터 웨어하우스 스키마 업그레이드"
echo "-------------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "$2단계: RM 애플리케이션 완료"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "$2단계: JTS 애플리케이션 완료"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "$2단계: RM 애플리케이션 재색인화"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "$2 업그레이드가 단계 $3에서 실패했습니다.  문제점을 정정하고 단계 $3부터 스크립트를 다시 실행하십시오."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "$2 업그레이드에 성공했습니다.  이제 사용자 환경에서 모든 애플리케이션을 업그레이드할 수 있습니다."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "RM의 오프라인 부분 업그레이드에 성공했습니다.  이제 사용자 배치에서 서버를 시작할 수 있습니다."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "RM의 오프라인 부분 업그레이드에 성공했습니다. 마이그레이션을 완료하는 데"
echo "필요한 한 단계가 남아 있지만 RM에 링크된 모든 서버(예: RTC, RQM, JRS, GC)가"
echo "온라인 상태여야 합니다. 편의에 따라 모든 서버를"
echo "중지하십시오(RM 포함). 각 서버에 로그인하고 정상적으로 작동 중인지"
echo "확인하는 것이 좋습니다. 그러고 나서 다음 명령을 실행하십시오."
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "$2 업그레이드에 성공했습니다.  이제 사용자 배치에서 서버를 시작할 수 있습니다."
echo ""
;;

# *******************************
# * 단계 실행 중  메시지              *
# *******************************

STEP_DIR_CMD )
echo ""
echo "디렉토리: $2"
echo "명령:"
;;

ENTER_STEP_ACTION )
echo "[E]를 입력하여 이 단계를 실행하거나 [S]를 입력하여 이 단계를 건너뛰거나 [Enter]를 눌러 스크립트 실행을 취소하십시오."
;;

INVALID_STEP_ACTION )
echo ""
echo "'$2'은(는) 올바르지 않은 항목입니다. 'E', 'S' 또는 'Enter'만 허용됩니다."
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "$2 teamserver.properties 파일을 확인할 수 있도록 vi 편집기가 열립니다."
echo "com.ibm.team.repository.server.webapp.url 특성으로 표시된 공용 URI 루트가 올바른지 확인하십시오."
echo "데이터베이스 특성이 올바른지 확인하십시오."
echo "완료되면 변경사항이 있으면 저장하고 스크립트 실행을 계속하려면 편집기를 닫으십시오."
echo ""
echo "각 특성을 올바르게 구성하는 방법에 대한 정보는 제품 문서의"
echo "'CLM에 대한 Rational 솔루션 업그레이드' 주제를 참조하십시오."
;;

PAUSE )
echo ""
echo "실행을 계속하려면 [C]를 입력하거나 스크립트 실행을 취소하려면 [Enter]를 누르십시오."
;;

INVALID_PAUSE_ACTION )
echo ""
echo "'$2'은(는) 올바르지 않은 항목입니다. 'C' 또는 'Enter'만 허용됩니다."
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "'$2'에서 '$3'(으)로 텍스트 색인 복사 중."
echo "이 작업은 몇 분 정도 걸릴 수 있습니다."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "'$2'에서 '$3'(으)로 조회 및 검색 색인 복사 중."
echo "이 작업은 몇 분 정도 걸릴 수 있습니다."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "'$2'에서 '$3'(으)로 텍스트 색인을 복사하는 데 실패했습니다."
echo "com.ibm.team.fulltext.indexLocation 특성이"
echo "teamserver.properties 파일에 정의되었는지 확인하십시오."
echo "이 디렉토리에 텍스트 색인을 수동으로 복사하거나"
echo "repotools -rebuildTextIndices를 실행하여 해당 색인을 다시 빌드하십시오."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "$NEW_APP_PARENT_DIR/RM_APP.ID 파일이 존재하지 않습니다."
echo "RM 애플리케이션 ID가 포함된 단일 행으로 이 파일을 작성하고"
echo "다시 시도하십시오."
echo ""
;;

# *****************************************
# * 공용 URI 검증 메시지                  *
# *****************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 오류 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "$3에 정의된 공용 URI가"
echo "없으므로"
echo "업그레이드를 시작할 수 없습니다."
echo ""
echo "이 파일에 다음과 같이 정의된 공유 URI가 하나 있어야 합니다."
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "공용 URI 특성 com.ibm.team.repository.server.webapp.url이 teamserver.properties 파일에 지정되어 있어야 합니다."
echo "특성을 이전 설치의 teamserver.properties 파일에 추가하고 모든 클라이언트가 서버 연결에 사용하는 URI 루트를 값으로 설정하십시오."
echo "공용 URI 루트는 새 설치가 제대로 작동하는 데 필수입니다. 이 특성을 지정하지 않으면 업그레이드가 성공하지 않습니다. "
echo "자세한 정보는 제품 문서 주제, 'URI 계획'을 참조하십시오."
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 오류 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "$3에 정의된 모든 공용 URI가"
echo "주석처리되므로"
echo "업그레이드를 시작할 수 없습니다."
echo ""
echo "이 파일에 다음과 같이 정의된 주석처리되지 않은 하나의 공용 URI가 있어야 합니다."
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "공용 URI 특성 com.ibm.team.repository.server.webapp.url이 teamserver.properties 파일에 지정되어 있어야 합니다."
echo "특성을 이전 설치의 teamserver.properties 파일에 추가하고 모든 클라이언트가 서버 연결에 사용하는 URI 루트를 값으로 설정하십시오."
echo "공용 URI 루트는 새 설치가 제대로 작동하는 데 필수입니다. 특성을 지정하지 않으면 업그레이드가 성공하지 않습니다."
echo "자세한 정보는 제품 문서 주제, 'URI 계획'을 참조하십시오."
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "JTS에 대한 컨텍스트 루트가 '$2'(으)로 설정되었습니다."
echo "애플리케이션에 대한 컨텍스트 루트가 '$3'(으)로 설정되었습니다."
echo "JTS와 애플리케이션에 대한 컨텍스트 루트는 같을 수 없습니다."
echo ""
;;

esac

}
