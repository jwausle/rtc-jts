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
# # gc upgrade.sh komut dosyasının parametrelerine karşılık gelen
# # ortam değişkenlerini ve bunların varsayılan değerlerini tanımlayın
# #
# #===========================================================
# #
# # Bu dosya, gc upgrade.sh komut dosyası yürütmesinin
# # başında okunur. Önceden tanımlı bir varsayılan
# # değer ile geçerli parametreye göre bir ortam değişkenini ayarlar.
# #
# # Kullanıcılar, komut satırına parametreyi ve karşılık
# # gelen değerini girmek zorunda kalmadan kendi değerleriyle
# # gc_upgrade.sh komut dosyasını başlatmak için
# # varsayılan değeri değiştirmek isteyebilir.
# #
# # UYARI:
# # Her uygulama için bazı değişkenlerin ayarlanması
# # gerekmez.  Değeri değiştirmeden önce her bir açıklamayı
# # dikkatlice okuyun.
# #
# #############################################################

# Parametre: -oldApplicationHome
# Kullanım: -oldApplicationHome <dizin yolu>
# Açıklama:
# 	3.0.1 sunucusundaki uygulama ana dizininin tam yolu.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - bu zorunlu bir parametredir
#  - <dizin yolu>, 'server/conf' ile biten var olan bir dizin olmalıdır
#    örn. /QIBM/UserData/JazzTeamServer301Backup/server/conf
#
OLD_APPLICATION_HOME=

# Parametre: -applicationContextRoot
# Kullanım: -applicationContextRoot <kök>
# Açıklama:
# 	3.0.1 sunucusunun açıklama bağlam kökü.
# Varsayılan:
# 	gc
# Kısıtlamalar:
#  - <kök>, geçerli bir dizin tek adı olmalıdır (başka bir deyişle başında eğik çizgi olmamalıdır)#
APPLICATION_CONTEXT_ROOT=

# Parametre: -oldApplicationVersion
# Kullanım: -oldApplicationVersion <sürüm>
# Açıklama:
# 	Yükseltilen 3.0.x sürümü.  Varsayılan olarak bu,
#   eski uygulamaya karşı karşı repotools -version çalıştırılarak belirlenir.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - tam bir sürüm dizgisi olmalıdır
#    örn. 3.0.0 veya 3.0.1
#
OLD_APPLICATION_VERSION=

# Parametre: -updateTomcatFiles
# Kullanım: -updateTomcatFiles <yes | no>
# Açıklama:
# 	Tomcat yapılandırma dosyalarının güncellenip güncellenmeyeceği.
# Varsayılan:
# 	yes
# Kısıtlamalar:
#  - Geçerli değerler yalnızca 'yes' ve 'no' değerleridir
#
UPDATE_TOMCAT_FILES=no

# Parametre: -oldTomcatHome
# Kullanım: -oldTomcatHome <dizin yolu>
# Açıklama:
# 	3.0.1 kurulumdaki Tomcat kök dizininin tam yolu.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - Var olan bir dizin olmalıdır
#
OLD_TOMCAT_HOME=

# Parametre: -newApplicationHome
# Kullanım: -newApplicationHome <dizin yolu>
# Açıklama:
# 	4.0 kurulumunun Application giriş dizininin yolu.
# Varsayılan:
# 	conf
# Kısıtlamalar:
#  - Yalnızca RTC, QM ve RM yükseltmesi için kabul edilir
#  - Kabul edildiğinde bu bir zorunlu parametredir
#  - <dizin yolu>, 'server/conf' ile biten bir var olan dizin olmalıdır #    örn. /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parametre: -newJTSHome
# Kullanım: -newJTSHome <dizin yolu>
# Açıklama:
# 	4.0 kurulumundaki JTS ana dizininin tam yolu.
# Varsayılan:
# 	Yeni uygulama ana dizini
# Kısıtlamalar:
#  - <dir path>, 'server/conf' ile biten bir var olan dizin olmalıdır
#    örn. /Jazz/IBM/GC_6.0/JazzTeamServer/server/conf
#
NEW_JTS_HOME=

# Parametre: -jtsContextRoot
# Kullanım: -jtsContextRoot <kök>
# Açıklama:
# 	4.0 JTS sunucusunun bağlam kökü.
# Varsayılan:
# 	jts
# Kısıtlamalar:
#  - <kök>, geçerli bir dizin tek adı olmalıdır (başka bir deyişle başında eğik çizgi olmamalıdır)

#
JTS_CONTEXT_ROOT=jts

# Parametre: -newApplicationTomcatHome
# Kullanım: -newApplicationTomcatHome <dizin yolu>
# Açıklama:
# 	4.0 kurulumunun Application Tomcat kök dizininin yolu.
# Varsayılan:
# 	<yok>
#
NEW_TOMCAT_HOME=

# Parametre: -newJTSTomcatHome
# Kullanım: -newJTSTomcatHome <dizin yolu>
# Açıklama:
# 	4.0 kurulumunda JTS Tomcat kök dizininin yolu.
# Varsayılan:
# 	<yok>
#
NEW_JTS_TOMCAT_HOME=

# Parametre: -ignoreJTSVersionCheck
# Kullanım: -ignoreJTSVersionCheck
# Açıklama:
# 	Açıklama sürümünün newJTSHome konumundaki Jazz Team Server
#   ile uyumlu olduğunu doğrulama girişiminde bulunma.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - Geçerli değerler yalnızca boş ve 'ignoreJTSVersionCheck' değerleridir

#
IGNORE_JTS_VERSION_CHECK=

# Parametre: -noPrompt
# Kullanım: -noPrompt
# Açıklama:
# 	Tablolar yaratılmadan ya da değiştirilmeden önce sorulmasın
# Varsayılan:
# 	noPrompt
# Kısıtlamalar:
#  - Geçerli değerler yalnızca boş ya da 'noPrompt' değeridir
#
# NO_PROMPT=
NO_PROMPT=noPrompt

# Parametre: -noVerify
# Kullanım: -noVerify
# Açıklama:
# 	teamserver.properties dosya doğrulaması gerçekleştirme.
# Varsayılan:
# 	noVerify
# Kısıtlamalar:
#  - Geçerli değerler yalnızca boş veya 'noVerify' değerleridir
#
# NO_VERIFY=
NO_VERIFY=noVerify

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
#   teamserver.properties dosyalarında bir düzenleyici açma.
# Varsayılan:
# 	false
# Kısıtlamalar:
#  - Geçerli değerler yalnızca 'true' veya 'false' değerleridir
#
# NO_EDITOR=false
NO_EDITOR=false
