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
# Yükseltmeyle otomatikleştirilmiş komut dosyası tarafından görüntülenen iletilerin görüntülendiği dosya.
#
# ################################################################################


# *********************
# * İletiler işlevi   *
# *********************
messages() {

case $1 in 

# *********************************
# * Başlangıç doğrulama iletileri *
# *********************************

INVALID_LAUNCH )
echo ""
echo "app_upgrade komut dosyasını doğrudan yürütmeyin.  JTS ya da uygulamayı yükseltmek için şu komutlardan birini çalıştırın:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Yukarıdaki komutların tam açıklaması için -help komutunu kullanın."
;;

INVALID_START_DIR )
echo ""
echo "-help parametresinin kullanıldığı zamanlar dışında, $2 komut dosyası $3 dizininden çalıştırılmalıdır"
echo ""
;;


SHOW_PARAM_FILE_NAME )
echo ""
echo "'$2' dosyası, yükseltme komut dosyası için parametre değerlerini içeriyor."
echo "Varsayılan parametre değerlerinden herhangi birini değiştirmeniz gerekirse bu dosyaları düzenleyebilir ya da yükseltme komut dosyalarına komut satırı bağımsız değişkenleri olarak parametre değerlerini belirtebilirsiniz."
echo ""
;;

SHOW_PARAM_FILE_NAMES_LIST )
echo ""
echo "Aşağıdaki dosya kümesi bir uygulama ya da JTS yükseltmesi için varsayılan parametre değerlerini içerir.  Varsayılan parametre değerlerinden herhangi birini değiştirmeniz gerekirse bu dosyaları düzenleyebilir ya da yükseltme komut dosyalarına komut satırı bağımsız değişkenleri olarak parametre değerlerini belirtebilirsiniz."
echo "- CCM yükseltmesi:  $2/params/ccm_params$3.sh"
echo "- GC yükseltmesi:  $2/params/gc_params$3.sh"
echo "- QM yükseltmesi:  $2/params/qm_params$3.sh"
echo "- RM yükseltmesi:  $2/params/rm_params$3.sh"
echo "- JTS yükseltmesi:  $2/params/jts_params$3.sh"
echo ""
;;


# ************************************
# * Parametre doğrulama iletileri    *
# ************************************

# Öntanımlı doğrulama
# ======================

MISSING_APP_TYPE )
echo ""
echo "Bir JTS ya da uygulama tipi belirtilmedi.  JTS ya da uygulamayı yükseltmek için şu komutlardan birini çalıştırın:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Yukarıdaki komutların tam açıklaması için -help komutunu kullanın."
echo ""
;;

INVALID_APP_TYPE )
echo ""
echo "$2, geçerli bir JTS ya da uygulama tipi değil.  JTS ya da uygulamayı yükseltmek için şu komutlardan birini çalıştırın:"
echo "    ccm_upgrade"
echo "    gc_upgrade"
echo "    jts_upgrade"
echo "    qm_upgrade"
echo "    rm_upgrade"
echo "Yukarıdaki komutların tam açıklaması için -help komutunu kullanın."
echo ""
;;

MISSING_PARAM_VALUE )
echo ""
echo "$2 parametresi için değer eksik."
echo "Parametrelerin tam açıklaması için -help komutunu kullanın."
echo ""
;;

INVALID_PARAM_DIR )
echo ""
echo "$2 parametresi için belirtilen $3 dizini yok ya da geçerli değil."
echo "Parametrelerin tam açıklaması için -help komutunu kullanın."
echo ""
;;

RELATIVE_PARAM_DIR )
echo ""
echo "$2 parametresi için belirtilen $3 dizini mutlak bir yol olmalıdır."
echo "Parametrelerin tam açıklaması için -help komutunu kullanın."
echo ""
;;

INVALID_PARAM_FILE )
echo ""
echo "$2 parametresi için belirtilen $3 dosyası yok ya da geçersiz."
echo "Parametrelerin tam açıklaması için -help komutunu kullanın."
echo ""
;;

INVALID_PARAM_VALUE )
echo ""
echo "$3, $2 parametresi için geçersiz bir değer."
echo "Parametrelerin tam açıklaması için -help komutunu kullanın."
echo ""
;;

INVALID_PARAM )
echo ""
echo "$2, bilinmeyen bir parametre."
echo "Parametrelerin tam açıklaması için -help komutunu kullanın."
echo ""
;;


# Öntanımsız doğrulama
# ======================

MISSING_HOME_PARAM )
echo ""
echo "$2 ana dizin parametresi eksik."
echo "Parametrelerin tam açıklaması için -help komutunu kullanın."
echo ""
;;

DIR_NOT_FOUND )
echo ""
echo "$2 dizini yok ya da geçerli değil."
echo ""
;;

CMD_NOT_FOUND_2X_APP )
echo ""
echo "'$2' uygulama repotools komutu bulunamıyor."
echo ""
echo "'$3' -oldApplicationHome parametresinin eski sunucu yapılandırma dizinini (örneğin, 'JazzInstallRoot/server/conf') gösterdiğini doğrulayın."
echo ""
;;

CMD_NOT_FOUND_OLD_APP )
echo ""
echo "'$2' uygulama repotools komutu bulunamıyor."
echo ""
echo "'$3' -oldApplicationHome parametresinin eski sunucu yapılandırma dizinini (örneğin, 'JazzInstallRoot/server/conf') gösterdiğini ve '$4' jtsContextRoot parametresinin doğru olduğunu doğrulayın."
echo ""
;;

TSP_NOT_FOUND_2X_APP )
echo ""
echo "'$2' yapılandırma dosyası bulunamıyor."
echo ""
echo "'$3' -oldApplicationHome parametresinin eski sunucu yapılandırma dizinini (örneğin, 'JazzInstallRoot/server/conf') gösterdiğini doğrulayın."
echo ""
;;

TSP_NOT_FOUND_OLD_APP )
echo ""
echo "'$2' yapılandırma dosyası bulunamıyor."
echo ""
echo "'$3' -oldApplicationHome parametresinin eski sunucu yapılandırma dizinini (örneğin, 'JazzInstallRoot/server/conf') gösterdiğini ve '$4' jtsContextRoot parametresinin doğru olduğunu doğrulayın."
echo ""
;;

CMD_NOT_FOUND_NEW_APP )
echo ""
echo "'$2' uygulama repotools komutu bulunamıyor."
echo ""
echo "'$3' -newApplicationHome parametresinin yeni uygulama sunucusu yapılandırma dizinini (örneğin, 'JazzInstallRoot/server/conf') gösterdiğini ve '$4' applicationContextRoot parametresinin doğru olduğunu doğrulayın."
echo "Önceki bir sürümden yükseltiyorsanız, doğru bağlam köklerini seçtiğinizden emin olun.  Örneğin Installation Manager kullanılıyorsa, "Context Root Options" panosunda 2.x bağlam kökü seçeneğini belirlemelisiniz.  Yanlışlıkla farklı bir seçenek belirlerseniz, $5 bağlam kökü seçeneğiyle ürünü yeniden kurmalısınız."
echo ""
;;

TSP_NOT_FOUND_NEW_APP )
echo ""
echo "'$2' yapılandırma dosyası bulunamıyor."
echo ""
echo "'$3' -newApplicationHome parametresinin yeni JTS sunucusu yapılandırma dizinini (örneğin, 'JazzInstallRoot/server/conf') gösterdiğini ve '$4' applicationContextRoot parametresinin doğru olduğunu doğrulayın."
echo "Önceki bir sürümden yükseltiyorsanız, doğru bağlam köklerini seçtiğinizden emin olun.  Örneğin Installation Manager kullanılıyorsa, "Context Root Options" panosunda 2.x bağlam kökü seçeneğini belirlemelisiniz.  Yanlışlıkla farklı bir seçenek belirlerseniz, $5 bağlam kökü seçeneğiyle ürünü yeniden kurmalısınız."
echo ""
;;

CMD_NOT_FOUND_OLD_JTS )
echo ""
echo "'$2' JTS repotools komutu bulunamıyor."
echo ""
echo "'$3' -oldJTSHome parametresinin eski JTS sunucusu yapılandırma dizinini (örneğin, 'JazzInstallRoot/server/conf') gösterdiğini ve '$4' jtsContextRoot parametresinin doğru olduğunu doğrulayın."
echo ""
;;

TSP_NOT_FOUND_OLD_JTS )
echo ""
echo "'$2' yapılandırma dosyası bulunamıyor."
echo ""
echo "'$3' -oldJTSHome parametresinin eski JTS sunucusu yapılandırma dizinini (örneğin, 'JazzInstallRoot/server/conf') gösterdiğini ve '$4' jtsContextRoot parametresinin doğru olduğunu doğrulayın."
echo ""
;;

CMD_NOT_FOUND_NEW_JTS )
echo ""
echo "'$2' JTS repotools komutu bulunamıyor."
echo ""
echo "'$3' -newJTSHome parametresinin yeni JTS sunucusu yapılandırma dizinini (örneğin, 'JazzInstallRoot/server/conf') gösterdiğini ve '$4' jtsContextRoot parametresinin doğru olduğunu doğrulayın."
echo ""
;;

TSP_NOT_FOUND_NEW_JTS )
echo ""
echo "'$2' yapılandırma dosyası bulunamıyor."
echo ""
echo "'$3' -newJTSHome parametresinin yeni JTS sunucusu yapılandırma dizinini (örneğin, 'JazzInstallRoot/server/conf') gösterdiğini ve '$4' jtsContextRoot parametresinin doğru olduğunu doğrulayın."
echo ""
;;

MISSING_IMPORT_FROM_FILE )
echo ""
echo "$2 yükseltmesi için 2.x verilerini içeren bir tar dosyası gereklidir."
echo "Parametrelerin tam açıklaması için -help komutunu kullanın."
echo ""
;;


# **********************
# * Yürütme iletileri  *
# **********************

BANNER_jts )
echo ""
echo ""
echo "============================================="
echo "===    JTS Yükseltmesi    ==="
echo "============================================="
echo ""
;;

BANNER_ccm )
echo ""
echo ""
echo "============================================="
echo "===    CCM Yükseltmesi    ==="
echo "============================================="
echo ""
;;

BANNER_gc )
echo ""
echo ""
echo "============================================"
echo "===    GC Yükseltmesi    ==="
echo "============================================"
echo ""
;;

BANNER_qm )
echo ""
echo ""
echo "============================================"
echo "===    QM Yükseltmesi   ==="
echo "============================================"
echo ""
;;

BANNER_rm )
echo ""
echo ""
echo "============================================"
echo "===    RM Yükseltmesi    ==="
echo "============================================"
echo ""
;;

RM_CHECK_OLD_VERSION )
echo "RM eski uygulama sürümü denetleniyor..."
;;

RM_DISPLAY_OLD_VERSION )
echo "RM eski uygulama sürümü: '$2'"
;;

# *********************
# * İlk adım anahtarı *
# *********************

INITIAL_STEP_FAILED )
echo ""
echo "İlk adımda son yürütme başarısız oldu..."
;;

LAST_STEP_FAILED )
echo ""
echo "$2 adımında son yürütme  başarısız oldu..."
echo "Bu adımdan ya da önceki bir adımdan yükseltmeyi yeniden başlatmak istiyor musunuz?"
;;

ALREADY_RUN )
echo ""
echo "Yükseltme zaten bitti ve başarıyla tamamlandı..."
echo "Belirli bir adımdan yeni bir adımı yeniden başlatmak istiyor musunuz?"
;;

LAST_STEP_PASSED )
echo ""
echo "$2 adımında son yürütme başarıyla durduruldu..."
echo "Yürürlükteki $3 adımından ya da önceki bir adımdan yükseltmeyi yeniden başlatmak istiyor musunuz?"
;;

ENTER_NEXT_STEP )
echo ""
echo "Yükseltmeyi yeniden başlatmak istediğiniz adım numarasını [$2-$3] girin ya da İptal etmek için [Enter] tuşuna basın:"
;;

INTEGER_STEP_NUMBER )
echo ""
echo "'$2' bir üye değil. Lütfen geçerli bir adım numarası girin."
;;

INVALID_STEP_NUMBER )
echo ""
echo "'$2', geçersiz bir adım numarasıdır. Lütfen geçerli bir adım numarası girin."
;;

MAX_STEP_NUMBER )
echo ""
echo "Son adım, $2 adımıdır; bu nedenle $3 adımından yükseltmeyi yeniden başlatamazsınız."
;;

NUM_MAX_STEP_NUMBER )
echo ""
echo "$2 adımı henüz çalıştırılmadı; bu nedenle $3 adımından yükseltmeyi yeniden başlatamazsınız."
;;


# ***********************
# *Adımlar için İletiler*
# ***********************

STEP_0_IBMi )
echo "Adım 0: Tabloları bırakın"
echo "-------------------"
;;

STEP_0 )
echo "Adım 0: Yapılandırma dosyalarını güncelleyin"
echo "---------------------------"
;;

STEP_1_ADD )
echo "Adım 1: Tablolar ekleyin"
echo "------------------"
;;

FULL_TEXT_INDICES_STEP )
echo "Adım $2: Metin dizinlerini yeniden oluşturun"
echo "----------------------------"
;;

JFS_INDICES_STEP )
echo "Step $2: Sorgu ve arama dizinlerini yeniden yaratın"
echo "-----------------------------------------"
;;

JTS_MERGE_LPA_JTS_STEP )
echo "Adım $2: LPA'yı JTS ile birleştirin"
echo "-----------------------------------------"
;;

JTS_FIX_LPA_FRONTSIDE_URLS_STEP )
echo "Adım $2: LPA depolama alanlarının ön taraf URL'sini düzeltin"
echo "-----------------------------------------"
;;

RM_REMOVE_LPA_FRIEND_STEP )
echo "Adım $2: RM'den LPA Arkadaşını kaldırın"
echo "-----------------------------------------"
;;

STEP_2_UPGRADE_DATA_WAREHOUSE )
echo "Adım 2: Veri ambarı şemasını yükseltin"
echo "-------------------------------------"
;;

RM_APPLICATION_FINALIZE )
echo ""
echo "Adım $2: RM uygulamasını sonlandırın"
echo "-------------------------------"
;;

JTS_APPLICATION_FINALIZE )
echo ""
echo "Adım $2: JTS uygulamasını sonlandırın"
echo "-------------------------------"
;;

RM_REINDEX_ALL )
echo ""
echo "Adım $2: RM uygulamasının dizinini yeniden oluşturun"
echo "--------------------------------"
;;

OVERALL_MIGRATION_FAILED )
echo ""
echo "$3 adımında $2 yükseltmesi başarısız oldu.  Sorunu düzeltin ve $3 adımından başlayarak komut dosyasını yeniden çalıştırın."
echo "" 
;;

OVERALL_MIGRATION_SUCCESS_JTS )
echo ""
echo "$2 yükseltmesi başarılı oldu.  Şimdi ortamınızda herhangi bir uygulamayı yükseltebilirsiniz."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM )
echo ""
echo "RM yükseltmesinin çevrimdışı kısmı başarılı oldu. Şimdi konuşlandırmanızda sunucuları başlatabilirsiniz."
echo ""
;;

OVERALL_MIGRATION_SUCCESS_RM_FROM_V4 )
echo ""
echo "RM yükseltmesinin çevrimdışı kısmı başarılı oldu. Geçişi sona erdirmek için"
echo "geriye tek bir adım kaldı, ancak bu adım RM uygulamasına bağlanan tüm"
echo "sunucuların (RTC, RQM, JRS, GC gibi) çevrimiçi olmasını gerektiriyor. Uygunsa, "
echo "bütün sunucuları (RM dahil) açın. Her bir sunucuda oturum açmanız ve bunların"
echo "doğru çalıştığından emin olmanız gerekir. Daha sonra şu komutu çalıştırın:"
echo ""
messages STEP_DIR_CMD $2
echo "    $RM_BACKLINKS_CMD"
echo ""
;;


OVERALL_MIGRATION_SUCCESS_CCM_QM )
echo ""
echo "$2 yükseltmesi başarılı oldu.  Şimdi konuşlandırmanızda sunucuları başlatabilirsiniz."
echo ""
;;

# *****************************************
# * Çalışma adımı sırasında çıkan iletiler*
# *****************************************

STEP_DIR_CMD )
echo ""
echo "Dizin: $2"
echo "Komut:"
;;

ENTER_STEP_ACTION )
echo "Bu adımı yürütmek için [E] girin, atlamak için [S] girin ya da komut dosyası yürütmeyi iptal etmek için [Enter] tuşuna basın:"
;;

INVALID_STEP_ACTION )
echo ""
echo "'$2', geçersiz bir giriş; yalnızca 'E', 'S' ya da 'Enter' girişine izin verilir"
echo ""
;;

EDIT_TEAMSERVER_PROPERTIES )
echo ""
echo "$2 teamserver.properties dosyasını doğrulamanız için vi düzenleyicisi açılacak."
echo "com.ibm.team.repository.server.webapp.url özelliği tarafından belirtilen Genel URI kökünün doğru olduğundan emin olun."
echo "Veritabanı özelliklerinin doğru olduğundan emin olun."
echo "İşleminiz bittiğinde, varsa değişikliklerinizi kaydedin ve komut dosyası yürütmeye devam etmek için düzenleyiciyi kapatın."
echo ""
echo "Her bir özelliğin nasıl uygun şekilde yapılandırılacağına ilişkin bilgi için"
echo "Ürün belgelerinde 'CLM için Rational çözümünü yükseltme' başlıklı konuya başvurun."
;;

PAUSE )
echo ""
echo "Yürütmeye devam etmek için [C] girin ya da komut dosyası yürütmesini iptal etmek için [Enter] tuşuna basın:"
;;

INVALID_PAUSE_ACTION )
echo ""
echo "'$2' geçersiz bir giriş; yalnızca 'C' ya da 'Enter' girişine izin verilir"
echo ""
;;

COPY_TXT_INDICES_INPROGRESS )
echo ""
echo "'$2' içinden '$3' içine metin dizinleri kopyalanıyor."
echo "Bu birkaç dakika sürebilir..."
echo ""
;;

COPY_JFS_INDICES_INPROGRESS )
echo ""
echo "'$2' içinden '$3' içine sorgu ve arama dizinleri kopyalanıyor." 
echo "Bu birkaç dakika sürebilir..."
echo ""
;;

COPY_INDICES_FAILED )
echo ""
echo "Metin dizinleri '$2' konumundan '$3' konumuna kopyalanamadı."
echo "teamserver.properties dosyasında tanımlanan"
echo "com.ibm.team.fulltext.indexLocation özelliğini doğrulayın."
echo "Bu dizine metin dizinlerini el ile kopyalayın"
echo "ya da yeniden oluşturmak için -rebuildTextIndices repotools komutunu çalıştırın."
echo ""
;;

RM_APP_ID_NOEXIST )
echo ""
echo "$NEW_APP_PARENT_DIR/RM_APP.ID dosyası yok"
echo "Bu dosyayı, RM Uygulama Tanıtıcısını içeren tek bir satırla oluşturun"
echo "ve yeniden deneyin."
echo ""
;;

# *************************************************
# * Genel URI doğrulaması sırasında çıkan iletiler*
# *************************************************

MISSING_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! HATA !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "$3 içinde tanımlanmış bir Genel URI"
echo "olmadığından"
echo "yükseltme başlatılamıyor."
echo ""
echo "Bu dosyada aşağıdaki gibi tanımlanmış tek bir Genel URI olmalıdır:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "teamserver.properties dosyasında com.ibm.team.repository.server.webapp.url Genel URI özelliği mevcut olmalıdır."
echo "Özelliği eski kuruluşun teamserver.properties dosyasına ekleyin ve değeri tüm istemcilerin sunucuya erişmek için kullandığı URI kökü olarak ayarlayın."
echo "Genel URI kökü, yeni kuruluşunuzun uygun çalışması için önemlidir. Bu özellik olmadan yükseltme başarılı olamaz.  "
echo "Daha fazla bilgi için, 'URI'lerinizi planlama' başlığında ürün belgelerine bakın."
echo ""
;;

COMMENTED_PUBLIC_URI )
echo ""
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! HATA !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "$3 içinde tanımlanmış tüm Genel URI'ler"
echo "geçersiz"
echo "kılındığından yükseltme başlatılamıyor."
echo ""
echo "Bu dosyada aşağıdaki gibi tanımlanmış tek bir geçersiz kılınmamış Genel URI olmalıdır:"
echo "https\://hostname.example.com\:port/$2"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "teamserver.properties dosyasında com.ibm.team.repository.server.webapp.url Genel URI özelliği mevcut olmalıdır."
echo "Özelliği eski kuruluşun teamserver.properties dosyasına ekleyin ve değeri tüm istemcilerin sunucuya erişmek için kullandığı URI kökü olarak ayarlayın."
echo "Genel URI kökü, yeni kuruluşunuzun uygun çalışması için önemlidir. Bu özellik olmadan yükseltme başarılı olamaz."
echo "Daha fazla bilgi için, 'URI'lerinizi planlama' başlığında ürün belgelerine bakın."
echo ""
;;

CONTEXT_ROOTS_CANNOT_BE_EQUAL )
echo ""
echo "JTS için bağlam kökü, '$2' olarak ayarlandı."
echo "Uygulama için bağlam kökü, '$3' olarak ayarlandı."
echo "jts ve uygulama için bağlam kökü aynı olamaz."
echo ""
;;

esac

}
