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
# # jts upgrade.sh komut dosyasının parametrelerine karşılık gelen
# # ortam değişkenlerini ve bunların varsayılan değerlerini tanımlayın
# #
# #===========================================================
# #
# # Bu dosya, jts upgrade.sh komut dosyası yürütmesinin
# # başında okunur. Önceden tanımlı bir varsayılan
# # değer ile geçerli parametreye göre bir ortam değişkenini ayarlar.
# #
# # Kullanıcılar, komut satırında parametreyi ve karşılık
# # gelen değerini el ile girmek zorunda kalmadan kendi değerleriyle
# # jts_upgrade.sh komut dosyasını başlatmak için
# # varsayılan değeri değiştirmek isteyebilir.
# #
# # UYARI:
# # Her uygulama için bazı değişkenlerin ayarlanması
# # gerekmez.  Değeri değiştirmeden önce her bir açıklamayı
# # dikkatlice okuyun.
# #
# #############################################################

# Parametre: -oldJTSHome
# Kullanım: -oldJTSHome <dizin yolu>
# Açıklama:
# 	Eski kurulumdaki JTS ana dizininin tam yolu.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - <dizin yolu>, 'server/conf' ile biten var olan bir dizin olmalıdır
#  - Yalnızca RM ve JTS yükseltmeleri için geçerlidir
#
OLD_JTS_HOME=

# Parametre: -jtsContextRoot
# Kullanım: -jtsContextRoot <kök>
# Açıklama:
# 	JTS bağlam kökü
# Varsayılan:
# 	jts
# Kısıtlamalar:
#  - <kök> geçerli bir dizin tek adı olmalıdır (başka bir deyişle, başında eğik çizgi olmamalıdır)
#
JTS_CONTEXT_ROOT=jts

# Parametre: -lpaContextRoot
# Kullanım: -lpaContextRoot <kök>
# Açıklama:
# LPA bağlam kökü
# Varsayılan:
# 	admin
# Kısıtlamalar:
#  - <kök> geçerli bir dizin tek adı olmalıdır (başka bir deyişle, başında eğik çizgi olmamalıdır)
#
LPA_CONTEXT_ROOT=admin

# Parametre: -oldJTSVersion
# Kullanım: -oldJTSVersion <sürüm>
# Açıklama:
# 	Yükseltilen JTS'nin sürümü.  Varsayılan olarak bu, eski JTS sürümüne karşı repotools -version çalıştırılarak belirlenir.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - tam bir sürüm dizgisi olmalıdır
#    örn. 3.0.0 veya 3.0.1
#
OLD_JTS_VERSION=

# Parametre: -updateTomcatFiles
# Kullanım: -updateTomcatFiles <yes | no>
# Açıklama:
# 	Tomcat yapılandırma dosyalarının güncellenip güncellenmeyeceği.
# Varsayılan:
# 	yes
# Kısıtlamalar:
#  - Geçerli değerler yalnızca 'yes' ve 'no' değerleridir
#
UPDATE_TOMCAT_FILES=yes

# Parametre: -oldTomcatHome
# Kullanım: -oldTomcatHome <dizin yolu>
# Açıklama:
# 	Eski kurulumdaki Tomcat ana dizininin tam yolu.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - Var olan bir dizin olmalıdır
#
OLD_TOMCAT_HOME=

# Parametre: -newJTSHome
# Kullanım: -newJTSHome <dizin yolu>
# Açıklama:
# 	Yeni kurulumun JTS sunucusu yapılandırma dizini yolu.
# Varsayılan:
# 	conf
# Kısıtlamalar:
#  - <dizin yolu>, 'server\conf' ile biten bir var olan dizin olmalıdır
#
NEW_JTS_HOME="$START_DIR/conf"

# Parametre: -newTomcatHome
# Kullanım: -newTomcatHome <dizin yolu>
# Açıklama:
# 	Yeni kurulumun Tomcat sunucusu yapılandırma giriş dizininin yolu.
# Varsayılan:
# 	<yok>
#
NEW_TOMCAT_HOME=

# Parametre: -noPrompt
# Kullanım: -noPrompt
# Açıklama:
# 	Tablolar yaratılmadan ya da değiştirilmeden önce sorulmasın
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - Geçerli değerler yalnızca boş ve 'noPrompt' değerleridir
#
# NO_PROMPT=noPrompt
NO_PROMPT=

# Parametre: -noVerify
# Kullanım: -noVerify
# Açıklama:
# 	Teamserver.özellikleri dosya doğrulaması gerçekleştirme.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - Geçerli değerler yalnızca boş ve 'noVerify' değerleridir
#
# NO_VERIFY=noVerify
NO_VERIFY=

# Parametre: -noStepPrompt
# Kullanım: -noStepPrompt
# Açıklama:
# 	Bir adımı yürütmeden önce sorma.
# Varsayılan:
# 	false
# Kısıtlamalar:
#  - Geçerli değerler yalnızca 'true' veya 'false' değerleridir
#
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Parametre: -noEditor
# Kullanım: -noEditor
# Açıklama:
#   Teamserver özellikleri dosyalarında bir düzenleyici açma.
# Varsayılan:
#   false
# Kısıtlamalar:
#  - Geçerli değerler yalnızca 'true' veya 'false' değerleri ya da boş değerdir
#
# NO_EDITOR=false
NO_EDITOR=false
