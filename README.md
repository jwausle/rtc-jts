```
# To use it, first create a data container:
docker run --name rtc_server jwaulse/rtc-server:6.0.0 /bin/true

# Then run the RTC server:
docker run --rm --volumes-from rtc_server -p 9443:9443 jwaulse/rtc-server:6.0.0
```

Thanks @tg9541 :)

## After start 

```
browse "https://docker-host:9443/jts"

user: ADMIN
password: ADMIN

# enjoy :)
```

![logo](http://i.stack.imgur.com/1SdDm.png)


## Tag:first and Tag:6.0.0

-    from '/rtc-server/properties/version/JTS-build.properties'

```
# build version properties for JTS

buildIdPrefix=RJF
buildId=RJF-I20150519-1056
				
product.release.label=6.0
product.iteration.label=

product.release.filename.version=6.0.0.0--RJF-I20150519-1056
product.release.artifact.version=6.0.0.RJF-I20150519-1056-r60-

```

# DockerFile:6.0.0

````
FROM ubuntu

MAINTAINER jwausle

WORKDIR /
COPY . /rtc-server
RUN touch /rtc-server/server/tomcat/logs/catalina.out

EXPOSE 9443 9080 9009
VOLUME /rtc-server

CMD /rtc-server/server/server.startup & tailf rtc-server/server/tomcat/logs/catalina.out
```

# License [www.ibm.com/license](https://www.ibm.com/developerworks/community/wikis/home?lang=en#!/wiki/Wf61c250e5213_4e83_a3b6_599be5c8649d/page/International%20License%20Agreement%20for%20Evaluation%20of%20Programs)
``` 
Two license agreements are presented below.

1. IBM International License Agreement for Evaluation of Programs
2. IBM International Program License Agreement

If Licensee is obtaining the Program for purposes of productive use (other than evaluation, testing, trial "try or buy," or demonstration): By clicking on the "Accept" button below, Licensee accepts the IBM International Program License Agreement, without modification.

If Licensee is obtaining the Program for the purpose of evaluation, testing, trial "try or buy," or demonstration (collectively, an "Evaluation"): By clicking on the "Accept" button below, Licensee accepts both (i) the IBM International License Agreement for Evaluation of Programs (the "Evaluation License"), without modification; and (ii) the IBM International Program License Agreement (the "IPLA"), without modification.

The Evaluation License will apply during the term of Licensee's Evaluation.

The IPLA will automatically apply if Licensee elects to retain the Program after the Evaluation (or obtain additional copies of the Program for use after the Evaluation) by entering into a procurement agreement (e.g., the IBM International Passport Advantage or the IBM Passport Advantage Express agreements).

The Evaluation License and the IPLA are not in effect concurrently; neither modifies the other; and each is independent of the other.

The complete text of each of these two license agreements follow.



LICENSE INFORMATION

The Programs listed below are licensed under the following License Information terms and conditions in addition to the Program license terms previously agreed to by Client and IBM. If Client does not have previously agreed to license terms in effect for the Program, the IBM International License Agreement for Evaluation of Programs (Z125-5543-05) applies.

Program Name: IBM Rational Change and Configuration Management application 6.0
Program Number: Evaluation

Evaluation Period

The evaluation period begins on the date that Licensee agrees to the terms of this Agreement and ends after 60 days.

Supporting Programs

The Program is licensed as a multi-product package and includes the Supporting Programs identified below. Licensee is authorized to install and use such Supporting Programs only to support Licensee's use of the Principal Program under this Agreement and within the limits of the Proofs of Entitlement for the Program (unless broader rights are provided elsewhere in this License Information document). The phrase "to support Licensee's use" would include only those uses that are necessary or otherwise directly related to a licensed use of the Principal Program or another Supporting Program. The Supporting Programs may not be used for any other purpose. Licensee is not authorized to transfer or remarket the Supporting Programs separate from the Principal Program. A Supporting Program may be accompanied by license terms, and those terms, if any, apply to Licensee's use of that Supporting Program. In the event of conflict, the terms in this License Information document supersede the Supporting Program's terms. When Licensee's right to use the Program expires or terminates, Licensee must discontinue use, destroy or promptly return all copies of the Supporting Programs to the party from whom Licensee acquired the Program. If Licensee downloaded the Supporting Programs, Licensee should contact the party from whom Licensee acquired the Program. If Licensee wishes to license the Supporting Programs for any use beyond the limits set forth above, please contact an IBM Sales Representative or the party from whom Licensee acquired the Program to obtain the appropriate license.

The following are Supporting Programs licensed with the Program:
IBM Installation Manager and Packaging Utility for the Rational Software Development Platform 1.8.2.1
IBM Rational Reporting for Document Generation 1.3

Separately Licensed Code

The provisions of this paragraph do not apply to the extent they are held to be invalid or unenforceable under the law that governs this license. Each of the components listed below is considered "Separately Licensed Code". IBM Separately Licensed Code is licensed to Licensee under the terms of the applicable third party license agreement(s) set forth in the NON_IBM_LICENSE file(s) that accompanies the Program. Notwithstanding any of the terms in the Agreement, or any other agreement Licensee may have with IBM, the terms of such third party license agreement(s) governs Licensee's use of all Separately Licensed Code unless otherwise noted below.

Future Program updates or fixes may contain additional Separately Licensed Code. Such additional Separately Licensed Code and related licenses are listed in another NON_IBM_LICENSE file that accompanies the Program update or fix. Licensee acknowledges that Licensee has read and agrees to the license agreements contained in the NON_IBM_LICENSE file(s). If Licensee does not agree to the terms of these third party license agreements, Licensee may not use the Separately Licensed Code.

For Programs acquired under the International Program License Agreement ("IPLA") or International Program License Agreement for Non Warranted Program ("ILAN") and Licensee is the original licensee of the Program, if Licensee does not agree with the third party license agreements, Licensee may return the Program in accordance with the terms of, and within the specified time frames stated in, the "Money-back Guarantee" section of the IPLA or ILAN IBM Agreement.

Note: Notwithstanding any of the terms in the third party license agreement, the Agreement, or any other agreement Licensee may have with IBM:
(a) IBM provides this Separately Licensed Code to Licensee WITHOUT WARRANTIES OF ANY KIND;
(b) IBM DISCLAIMS ANY AND ALL EXPRESS AND IMPLIED WARRANTIES AND CONDITIONS INCLUDING, BUT NOT LIMITED TO, THE WARRANTY OF TITLE, NON-INFRINGEMENT OR INTERFERENCE AND THE IMPLIED WARRANTIES AND CONDITIONS OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, WITH RESPECT TO THE SEPARATELY LICENSED CODE;
(c) IBM is not liable to Licensee, and will not defend, indemnify, or hold Licensee harmless for any claims arising from or related to the Separately Licensed Code; and
(d) IBM is not liable for any direct, indirect, incidental, special, exemplary, punitive or consequential damages including, but not limited to, lost data, lost savings, and lost profits, with respect to the Separately Licensed Code.

Notwithstanding these exclusions, in Germany and Austria, IBM's warranty and liability for the Separately Licensed Code is governed only by the respective terms applicable for Germany and Austria in IBM license agreements.

Note: IBM may provide limited support for some Separately Licensed Code. If such support is available, the details and any additional terms related to such support will be set forth in the License Information document.

The following are Separately Licensed Code:
Gentium Basic Fonts v1.1

Source Components and Sample Materials

The Program may include some components in source code form ("Source Components") and other materials identified as Sample Materials. Licensee may copy and modify Source Components and Sample Materials for internal use only provided such use is within the limits of the license rights under this Agreement, provided however that Licensee may not alter or delete any copyright information or notices contained in the Source Components or Sample Materials. IBM provides the Source Components and Sample Materials without obligation of support and "AS IS", WITH NO WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING THE WARRANTY OF TITLE, NON-INFRINGEMENT OR NON-INTERFERENCE AND THE IMPLIED WARRANTIES AND CONDITIONS OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

Program-unique Terms

The functionality of the Program may only be accessed through product license keys. Such product license keys permit access to a prescribed set of Program functionality and may not be used outside of defined parameters. Refer to product documentation for further information pertaining to the functionality enabled by each product license key. 




LICENSE INFORMATION

The Programs listed below are licensed under the following License Information terms and conditions in addition to the Program license terms previously agreed to by Client and IBM. If Client does not have previously agreed to license terms in effect for the Program, the IBM International Program License Agreement (Z125-3301-14) applies.

Program Name: IBM Rational Change and Configuration Management application 6.0
Program Number: Tool

As described in the International Program License Agreement ("IPLA") and this License Information, IBM grants Licensee a limited right to use the Program. This right is limited to the level of Authorized Use, such as a Processor Value Unit ("PVU"), a Value Unit ("VU"), or other specified level of use, paid for by Licensee as evidenced in the Proof of Entitlement. Licensee's use may also be limited to a specified machine, or only as a Supporting Program, or subject to other restrictions. As Licensee has not paid for all of the economic value of the Program, no other use is permitted without the payment of additional fees. In addition, as stated in the IPLA, Licensee is not authorized to use the Program to provide commercial IT services to any third party, to provide commercial hosting or timesharing, or to sublicense, rent, or lease the Program unless expressly provided for in the applicable agreements under which Licensee obtains authorizations to use the Program. Additional rights may be available to Licensee subject to the payment of additional fees or under different or supplementary terms. IBM reserves the right to determine whether to make such additional rights available to Licensee.

Program's specifications can be found in the collective Description and Technical Information sections of the Program's Announcement Letters.

Supporting Programs

The Program is licensed as a multi-product package and includes the Supporting Programs identified below. Licensee is authorized to install and use such Supporting Programs only to support Licensee's use of the Principal Program under this Agreement and within the limits of the Proofs of Entitlement for the Program (unless broader rights are provided elsewhere in this License Information document). The phrase "to support Licensee's use" would include only those uses that are necessary or otherwise directly related to a licensed use of the Principal Program or another Supporting Program. The Supporting Programs may not be used for any other purpose. Licensee is not authorized to transfer or remarket the Supporting Programs separate from the Principal Program. A Supporting Program may be accompanied by license terms, and those terms, if any, apply to Licensee's use of that Supporting Program. In the event of conflict, the terms in this License Information document supersede the Supporting Program's terms. When Licensee's right to use the Program expires or terminates, Licensee must discontinue use, destroy or promptly return all copies of the Supporting Programs to the party from whom Licensee acquired the Program. If Licensee downloaded the Supporting Programs, Licensee should contact the party from whom Licensee acquired the Program. If Licensee wishes to license the Supporting Programs for any use beyond the limits set forth above, please contact an IBM Sales Representative or the party from whom Licensee acquired the Program to obtain the appropriate license.

The following are Supporting Programs licensed with the Program:
IBM Installation Manager and Packaging Utility for the Rational Software Development Platform 1.8.2.1
IBM Rational Reporting for Document Generation 1.3

Development Tool

This Program is designed to aid in the development of software applications and systems. Licensee is solely responsible for the applications and systems that it develops by using this Program and assumes all risk and responsibility therefor.

Components Used for Establishing Required Entitlements

When determining the number of entitlements required for Licensee's installation or use of the Program, the installation or use of only the following Program components are taken into consideration. In other words, Licensee may install and use Program components other than those listed below, under the license terms, but only the listed components are used to determine the number of entitlements required for the Program.

Jazz Team Server

Separately Licensed Code
...
``` 

