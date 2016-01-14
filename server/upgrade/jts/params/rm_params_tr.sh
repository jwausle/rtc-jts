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
# # rm_upgrade.sh komut dosyası parametrelerine karşılık gelen
# # ortam değişkenlerini ve bunların varsayılan değerlerini tanımlayın
# #
# #===========================================================
# #
# # Bu dosya, rm_upgrade.sh komut dosyası yürütmesinin
# # başında okunur. Önceden tanımlı bir varsayılan
# # değer ile geçerli parametreye göre bir ortam değişkenini ayarlar.
# #
# # Kullanıcılar, komut satırına parametreyi ve karşılık
# # gelen değerini girmek zorunda kalmadan kendi değerleriyle
# # rm_upgrade.sh komut dosyasını başlatmak için
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
# 	Eski kurulumdaki uygulama ana dizininin tam yolu.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - bu zorunlu bir parametredir
#  - <dizin yolu>, 'server/conf' ile biten var olan bir dizin olmalıdır
#    örn. /Jazz/IBM/RRC_3.x/jazz/server/conf
#
OLD_APPLICATION_HOME=

# Parametre: -applicationContextRoot
# Kullanım: -applicationContextRoot <kök>
# Açıklama:
# 	Uygulama bağlam kökü.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - <kök>, geçerli bir dizin tek adı olmalıdır (başka bir deyişle başında eğik çizgi olmamalıdır)
#
APPLICATION_CONTEXT_ROOT=

# Parametre: -oldApplicationVersion
# Kullanım: -oldApplicationVersion <sürüm>
# Açıklama:
# 	Yükseltilen sürüm.  Varsayılan olarak bu,
#   eski uygulamaya karşı karşı repotools -version çalıştırılarak belirlenir.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - tam bir sürüm dizgisi olmalıdır
#    örn. 5.0.0 ya da 5.0.1
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
UPDATE_TOMCAT_FILES=yes

# Parametre: -oldApplicationTomcatHome
# Kullanım: -oldApplicationTomcatHome <dizin yolu>
# Açıklama:
# 	Eski kurulumdaki Application Tomcat kök dizininin tam yolu.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - Yalnızca RM yükseltmesi için kabul edilir
#  - Var olan bir dizin olmalıdır
#
OLD_TOMCAT_HOME=

# Parametre: -oldJTSTomcatHome
# Kullanım: -oldJTSTomcatHome <dizin yolu>
# Açıklama:
# 	Eski kurulumdaki JTS Tomcat kök dizininin tam yolu.
# Varsayılan:
# 	<yok>
#  Kısıtlamalar:
#  - Yalnızca RM yükseltmesi için kabul edilir
#  - Var olan bir dizin olmalıdır
#
OLD_JTS_TOMCAT_HOME=

# Parametre: -newApplicationHome
# Kullanım: -newApplicationHome <dizin yolu>
# Açıklama:
# 	Yeni kurulumun Application giriş dizininin yolu.
# Varsayılan:
# 	conf
# Kısıtlamalar:
#  - Yalnızca RTC, QM ve RM yükseltmesi için kabul edilir
#  - Kabul edildiğinde bu bir zorunlu parametredir
#  - <dizin yolu>, 'server/conf' ile biten bir var olan dizin olmalıdır #    örn. /Jazz/IBM/RRC_4.0/JazzTeamServer/server/conf
#
NEW_APPLICATION_HOME="$START_DIR/conf"

# Parametre: -newJTSHome
# Kullanım: -newJTSHome <dizin yolu>
# Açıklama:
# 	Yeni kurulumun kurulumun kullanacağı JTS'deki JTS home kök dizininin yolu.
# Varsayılan:
# 	Yeni uygulama ana dizini
# Kısıtlamalar:
#  - <dizin yolu>, 'server/conf' ile biten bir var olan dizin olmalıdır
#
NEW_JTS_HOME=

# Parametre: -newJTSContextRoot
# Kullanım: -newJTSContextRoot <kök>
# Açıklama:
# 	Yeni JTS sunucusunun bağlam kökü.
# Varsayılan:
# 	jts
# Kısıtlamalar:
#  - <kök>, geçerli bir dizin tek adı olmalıdır (başka bir deyişle başında eğik çizgi olmamalıdır)

#
JTS_CONTEXT_ROOT=jts

# Parametre: -newApplicationTomcatHome
# Kullanım: -newApplicationTomcatHome <dizin yolu>
# Açıklama:
# 	Yeni kurulumun Application Tomcat kök dizininin yolu.
# Varsayılan:
# 	<yok>
#
NEW_TOMCAT_HOME=

# Parametre: -newJTSTomcatHome
# Kullanım: -newJTSTomcatHome <dizin yolu>
# Açıklama:
# 	Yeni kurulumun kurulumun kullanacağı JTS'deki JTS Tomcat kök dizininin yolu.
# Varsayılan:
# 	<yok>
#
NEW_JTS_TOMCAT_HOME=

# Parametre: -overwrite
# Kullanım: -overwrite
# Açıklama:
# 	Herhangi bir repotools komutu yürütürken üzerine yazmaya zorla (başka bir deyişle her zaman overwrite=yes kullan)
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - Geçerli değerler yalnızca boş ya da 'overwrite=yes' değeridir
#
# OVERWRITE=overwrite=yes
OVERWRITE=

# Parametre: -noVerify
# Kullanım: -noVerify
# Açıklama:
# 	Herhangi bir repotools komutu yürütürken herhangi bir doğrulama gerçekleştirme (başka bir deyişle, her zaman noVerify kullan)
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
# 	Her yükseltme adımından önce sorulmasın
# Varsayılan:
# 	false
# Kısıtlamalar:
#  - Geçerli değerler yalnızca 'true' ya da 'false' değeridir #
# NO_STEP_PROMPT=true
NO_STEP_PROMPT=false

# Parametre: -noEditor
# Kullanım: -noEditor
# Açıklama:
#   teamserver.properties dosyalarında bir düzenleyici açma.
# Varsayılan:
#   false
# Kısıtlamalar:
#  - Geçerli değerler yalnızca 'true' veya 'false' değerleri ya da boş değerdir
#
# NO_EDITOR=false
NO_EDITOR=false


# Parametre: -db.jdbc.location
# Kullanım: -db.jdbc.location <JDBC_URL>
# Açıklama:
# 	RM veritabanı için JDBC konumu. (Yalnızca 4.x'ten 5.x'e geçişe gereklidir)
#
#		Örnekler:
#			DB2 		//localhost:50000/RM_DB:user=db2admin;password={password};
#			DB2i 		//hostname;hold statements=true;metadata source=1;user=rmDBuser;password={password};
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433;databaseName=RM_DB;user=rmDBuser;password={password};
#			DERBY		conf/rm/derby/repositoryDB
#
#		NOT:
#			*-nix sistemlerinde, pek çok karakter (örneğin: |  &  ;  <  >  (  )  $  `  \  "  '  <space>  <tab>  <newline>)
#			ters eğik çizgiyle kaçış gerektirir.
#		
#			DB2 		//localhost:50000/RM_DB:user=db2admin\;password={password}\;
#			DB2i 		//hostname;hold\ statements=true\;metadata\ source=1\;user=rmDBuser\;password={password}\;
#			ORACLE		thin:rmDBuser/{password}@//oracleserver.example.com:1521/RM_DB
#			SQLSERVER	//localhost:1433\;databaseName=RM_DB\;user=rmDBuser\;password={password}\;
#			DERBY		conf/rm/derby/repositoryDB	
# Varsayılan:
# 	<yok> =Kısıtlamalar:
#  - Yalnızca 4.x'den RM yükseltmesi için kabul edilir
#
DB_JDBC_LOCATION_VALUE=

# Parametre: -db.jdbc.password
# Kullanım: -db.jdbc.password <JDBC_PASSWORD>
# Açıklama:
# 	"{password}" JDBC url biçiminde görünürse yerine geçecek parola (düz metin ya da şifreli).
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - RM veritabanı JDBC URL'si {password} içeriyorsa belirtilmelidir
#
DB_JDBC_PASSWORD_VALUE=

# Parametre: -db.db2i.schema.name
# Kullanım: -db.db2i.schema.name <SCHEMA_NAME>
# Açıklama:
# 	DB2i DB Şema Adı.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - DB2i veritabanı tipi kullanılarak belirtilmelidir.
#
DB_DB2I_SCHEMA_NAME_VALUE=

# Parametre: -db.db2.dsn.dbname
# Kullanım: -db.db2.dsn.dbname <DSN_DBNAME>
# Açıklama:
# 	DB2Z DSN DB Adı.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - DB2z veritabanı tipi kullanılarak belirtilmelidir.
#
DB_DB2_DSN_DBNAME_VALUE=

# Parametre: -db.schemaPrefix
# Kullanım: -db.schemaPrefix <SCHEMA_PREFIX>
# Açıklama:
# 	DB Şema Öneki.
# Varsayılan:
# 	<yok>
# Kısıtlamalar:
#  - DB2z veritabanı tipi kullanılarak belirtilmelidir.
#
DB_SCHEMA_PREFIX_VALUE=


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
