<%@ page language="java" %>
<jsp:useBean id="donationTotal" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />


                            <SCRIPT LANGUAGE="JavaScript">
                            <!--
                            var flashinstalled = 0;
                            var flashversion = 0;
                            MSDetect = "false";
                            if (navigator.plugins && navigator.plugins.length)
                            {
                                x = navigator.plugins["Shockwave Flash"];
                                if (x)
                                {
                                    flashinstalled = 2;
                                    if (x.description)
                                    {
                                        y = x.description;
                                        flashversion = y.charAt(y.indexOf('.')-1);
                                    }
                                }
                                else
                                    flashinstalled = 1;
                                if (navigator.plugins["Shockwave Flash 2.0"])
                                {
                                    flashinstalled = 2;
                                    flashversion = 2;
                                }
                            }
                            else if (navigator.mimeTypes && navigator.mimeTypes.length)
                            {
                                x = navigator.mimeTypes['application/x-shockwave-flash'];
                                if (x && x.enabledPlugin)
                                    flashinstalled = 2;
                                else
                                    flashinstalled = 1;
                            }
                            else
                                MSDetect = "true";

                            // -->
                            </SCRIPT>

                            <SCRIPT LANGUAGE="VBScript">

                            on error resume next

                            If MSDetect = "true" Then
                                For i = 2 to 6
                                    If Not(IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash." & i))) Then

                                    Else
                                        flashinstalled = 2
                                        flashversion = i
                                    End If
                                Next
                            End If

                            If flashinstalled = 0 Then
                                flashinstalled = 1
                            End If

                            </SCRIPT>

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <A href="/tc?&module=CRPFStatic&d1=crpf&d2=crpf_rules_prizes" target="_top"><img src="/i/events/crpf03/promo_crpf_tshirt.gif" alt="Earn a t-shirt!" width="170" height="128" border="0"></A><br />

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <A href="/reg/index.jsp" target="_top"><img src="/i/events/crpf03/promo_tc_member.gif" alt="Become a TopCoder member" width="170" height="63" border="0"></A><br />

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />


            <rsc:iterator list="<%=donationTotal%>" id="info">
                <SCRIPT language="JavaScript">
                <!--
                     if (flashinstalled>1){
                             document.write('<object type="application/x-shockwave-flash" data="/i/events/crpf03/crpf_meter.swf" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="170" height=300 border="0" salign="Top" id="myFlash" >');
                             document.write('<PARAM NAME=movie VALUE="/i/events/crpf03/crpf_meter.swf?currentTotal=<rsc:item row="<%=info%>" name="amount" format="0.00"/>">');
                             document.write('<PARAM NAME=quality VALUE="high">');
                             document.write('<PARAM NAME=bgcolor VALUE="#FFFFFF">');
                             document.write('<embed src="/i/events/crpf03/crpf_meter.swf?currentTotal=<rsc:item row="<%=info%>" name="amount" format="0.00"/>&flashContentURL=flash_content/flash_content.html&altContentURL=upgrade_flash/upgrade_flash.html&contentVersion=6&contentMajorRevision=0&contentMinorRevision=79&allowFlashAutoInstall=false" quality=high width=170 height=300 border="0" salign="Top" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" name="myFlash" swLiveConnect="true" ></embed>');
                             document.write('</object>');
                     }
                     // -->
                  </SCRIPT>
             </rsc:iterator>

                            <SCRIPT LANGUAGE="JavaScript">
                            <!--
                            if (flashinstalled<2){
                               document.write('<a href="http://www.macromedia.com/go/getflashplayer"><img src="/i/getflash.gif" width="15" heigh="15" border="0" hspace="2"></a>To view the graphical analysis, please install the latest Macromedia Flash <a href="http://www.macromedia.com/go/getflashplayer">plugin</a>.');
                            }
                            // -->
                            </SCRIPT>

            <img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />

            <p><br/></p>
